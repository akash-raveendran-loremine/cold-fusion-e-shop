component accessors =true output=false{

    function buyFromCart(string userEmail){
        
        //get all the products from cart using useremail
        local.sql="SELECT P.productID, C.quantity,C.quantity * P.productPrice AS totalPrice,customerEmail  FROM cart C JOIN productlist P ON C.productID=P.productID WHERE C.customerEmail=(:customerEmail)";
        local.params={
            customerEmail={value:arguments.userEmail,cfsqltype:"CF_SQL_VARCHAR"}
        };
        var cartList = queryExecute(local.sql, local.params);

        //inserts all the products from cart into orders table
        local.paramsList = "";
        for( var i = 1;i<=cartList.recordCount;i++){
            local.paramsList = local.paramsList & "(#cartList['productID'][i]#,'#cartList['customerEmail'][i]#',#cartList['quantity'][i]#,#cartList['totalPrice'][i]#)";
            if(i != cartList.recordCount){
                local.paramsList = local.paramsList & ",";
            }
        }
        local.sql = "INSERT INTO orders (productID,customerEmail,quantity,totalPrice) VALUES #local.paramsList#";
        queryExecute(local.sql);
            
        //update every products quantity
        local.paramsList = ""
        for (var i = 1; i <= cartList.recordCount; i++) {
            local.paramsList= local.paramsList & "#cartList['productID'][i]#";
            if(i != cartList.recordCount){
                local.paramsList = local.paramsList & ",";
            }
        }
        local.sql = "UPDATE productlist SET quantity=quantity - 1 WHERE productID IN (#local.paramsList#)";
        queryExecute(local.sql,local.params);

        //remove cart
        local.sql = "DELETE FROM cart WHERE customerEmail=(:customerEmail)"
        local.params={
            customerEmail={value:arguments.userEmail,cfsqltype:"CF_SQL_VARCHAR"}
        };
        queryExecute(local.sql,local.params);
    }
    function getUserOrders(string customerEmail){
        local.sql="SELECT P.categoryID, O.quantity,P.productID,P.productName,P.productDescription, P.productPrice ,O.quantity * P.productPrice AS totalPrice ,O.status FROM orders O JOIN productlist P ON O.productID=P.productID WHERE O.customerEmail=(:customerEmail) ORDER BY O.orderID DESC"
        local.params={
            customerEmail={value:arguments.customerEmail,cfsqltype:"CF_SQL_VARCHAR"}
        }
        return queryExecute(local.sql, local.params);
    }
    function buySingleProduct(numeric productID,string userEmail){
        local.sql="SELECT productPrice AS totalPrice  FROM productlist  WHERE productID=(:productID)";
        local.params={
            productID={value:arguments.productID,cfsqltype:"CF_SQL_INTEGER"}
        };
        var product = queryExecute(local.sql, local.params);

        local.sql = "INSERT INTO orders (productID,customerEmail,totalPrice) VALUES (:productID,:customerEmail,:totalPrice)";
        local.params={
            productID={value:arguments.productID,cfsqltype:"CF_SQL_INTEGER"},
            totalPrice={value:product.totalPrice,cfsqltype:"CF_SQL_INTEGER"},
            customerEmail={value:arguments.userEmail,cfsqltype:"CF_SQL_VARCHAR"}
        };
        queryExecute(local.sql,local.params);
    }
    public query function getAllOrders(){
        //abort;
        local.sql="SELECT P.categoryID, O.quantity,P.productID,P.productName,P.productDescription, P.productPrice ,O.quantity * P.productPrice AS totalPrice ,O.status,O.orderID FROM orders O JOIN productlist P ON O.productID=P.productID  ORDER BY O.orderID DESC";
        local.res = queryExecute(local.sql);
        return local.res;
    }
    public void function changeOrderStatus(numeric orderID,string status){
        local.sql = "UPDATE orders SET status = (:status) WHERE orderID = (:orderID)";
        local.params = {
            orderID={value:arguments.orderID, cfsqltyp:'CF_SQL_INTEGER'},
            status={value:arguments.status, cfsqltyp:'CF_SQL_VARCHAR'}
        };
        queryExecute(local.sql,local.params);
    }
    public function getOrdersCount(string customerEmail){
        local.sql="SELECT COUNT(*) as cnt FROM  orders WHERE  customerEmail=:customerEmail"
        local.params={
            customerEmail={value:arguments.customerEmail,cfsqltype:"CF_SQL_VARCHAR"}
        }
        return queryExecute(local.sql, local.params).cnt;
    }
}