component {

    function addToCart(numeric productID,string customerEmail){
        local.sql="INSERT INTO cart (productID, customerEmail) VALUES(:productID,:customerEmail)"
        local.params={
            productID={value:arguments.productID,cfsqltype:"CF_SQL_INTEGER"},
            customerEmail={value:arguments.customerEmail,cfsqltype:"CF_SQL_VARCHAR"}
        }
        queryExecute(local.sql, local.params);
    }
    
    function getUserCartProducts(string customerEmail){
        local.sql="SELECT C.cartID, P.categoryID, C.quantity,P.productID,P.productName,P.productDescription, P.productPrice ,C.quantity * P.productPrice AS totalPrice  FROM cart C JOIN productlist P ON C.productID=P.productID WHERE C.customerEmail=(:customerEmail)"
        local.params={
            customerEmail={value:arguments.customerEmail,cfsqltype:"CF_SQL_VARCHAR"}
        }
        return queryExecute(local.sql, local.params);
    }
    function removeProductFromCart(numeric productID,string customerEmail){
        local.sql = "DELETE FROM cart WHERE productID=(:productID) AND customerEmail=(:customerEmail)";
        local.params={
            customerEmail={value:arguments.customerEmail,cfsqltype:"CF_SQL_VARCHAR"},
            productID={value:arguments.productID,cfsqltype:"CF_SQL_INTEGER"}
        }
        queryExecute(local.sql, local.params);
    }
    function changeCartProductQuantity(numeric cartID,numeric  newQty){

        local.sql="UPDATE cart SET quantity = quantity + (:newQty) WHERE cartID=(:cartID)"
        local.params={
            cartID={value:arguments.cartID,cfsqltype:"CF_SQL_INTEGER"},
            newQty={value:arguments.newQty,cfsqltype:"CF_SQL_INTEGER"},
        }
        queryExecute(local.sql, local.params);
    }
}