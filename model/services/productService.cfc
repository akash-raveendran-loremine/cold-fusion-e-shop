component {

    function addProduct(string productName,string productDescription,numeric productPrice,numeric categoryID,numeric quantity){
        local.sql="INSERT INTO productlist (productName, productDescription,productPrice, categoryID,quantity) VALUES(:productName,:productDescription,:productPrice,:categoryID,:quantity)"
          local.params={
            productName={value:arguments.productName,cfsqltype:"CF_SQL_VARCHAR"},
            productDescription={value:arguments.productDescription,cfsqltype:"CF_SQL_VARCHAR"},
            productPrice={value:arguments.productPrice,cfsqltype:"CF_SQL_INTEGER"},
            quantity={value:arguments.quantity,cfsqltype:"CF_SQL_INTEGER"},
            categoryID={value:arguments.categoryID,cfsqltype:"CF_SQL_INTEGER"}
          }
          queryExecute(local.sql, local.params);     
    }

    function getAllProducts(){
        local.sql = "SELECT p.productID,p.productName,p.productDescription,p.productPrice, p.quantity ,c.categoryID, c.categoryName FROM productlist p JOIN categorylist c ON  c.categoryID = p.categoryID";
        local.result = queryExecute(local.sql);
        return local.result;
    }

    function deleteProduct(numeric productID){
        local.sql = "DELETE FROM productlist WHERE productID =(:productID)";
        local.params = {
            productID = {value:arguments.productID,cfsqltype:"CF_SQL_INTEGER"}
        }
        queryExecute(local.sql,local.params);
    }

    function getSingleProduct(numeric productID){
        local.sql = "SELECT p.productID,p.productName,p.productDescription,p.productPrice, p.quantity ,c.categoryID, c.categoryName FROM productlist p JOIN categorylist c ON  c.categoryID = p.categoryID WHERE p.productID=(:productID)";
        local.params = {
            productID = {value:arguments.productID,cfsqltype:"CF_SQL_INTEGER"}
        }
        local.result = queryExecute(local.sql,local.params);
        return local.result;
    }

    function updateProduct(numeric productID,string productName,string productDescription,numeric productPrice,numeric categoryID,numeric quantity){
        local.sql="UPDATE productlist SET productName=(:productName), productDescription=(:productDescription),productPrice=(:productPrice), categoryID=(:categoryID),quantity=(:quantity) WHERE productID=(:productID)";
          local.params={
            productName={value:arguments.productName,cfsqltype:"CF_SQL_VARCHAR"},
            productDescription={value:arguments.productDescription,cfsqltype:"CF_SQL_VARCHAR"},
            productPrice={value:arguments.productPrice,cfsqltype:"CF_SQL_INTEGER"},
            quantity={value:arguments.quantity,cfsqltype:"CF_SQL_INTEGER"},
            categoryID={value:arguments.categoryID,cfsqltype:"CF_SQL_INTEGER"},
            productID = {value:arguments.productID,cfsqltype:"CF_SQL_INTEGER"}
          }
          queryExecute(local.sql, local.params);     
    }
    function getProductsByCategory(numeric categoryID){
        local.sql = "SELECT p.productID,p.productName,p.productDescription,p.productPrice, p.quantity ,c.categoryID, c.categoryName FROM productlist p JOIN categorylist c ON  c.categoryID = p.categoryID WHERE p.categoryID=(:categoryID)";
        local.params = {
            categoryID = {value:arguments.categoryID,cfsqltype:"CF_SQL_INTEGER"}
        }
        local.result = queryExecute(local.sql,local.params);
        return local.result;
    }
    function searchProducts(string productName){
        local.sql = "SELECT p.productID,p.productName,p.productDescription,p.productPrice, p.quantity ,c.categoryID, c.categoryName FROM productlist p JOIN categorylist c ON  c.categoryID = p.categoryID WHERE p.productName LIKE :productName '%'";
        local.params = {
            productName = {value:arguments.productName,cfsqltype:"CF_SQL_VARCHAR"}
        }
        local.result = queryExecute(local.sql,local.params);
        return local.result;
    }
}