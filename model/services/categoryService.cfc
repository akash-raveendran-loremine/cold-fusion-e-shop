component {

    function addCategory(string categoryName){
        local.sql = "INSERT INTO categorylist (categoryName) VALUES (:categoryName)";
        local.params = {
            categoryName={value:arguments.categoryName,cfsqltype:"CF_SQL_VARCHAR"}
        };
        queryExecute(local.sql,local.params)
    }
    function getAllCategories(){
        local.sql = "SELECT * FROM categorylist"
        var result = queryExecute(local.sql);
        return result;
    }
    function deleteCategory(numeric categoryID){
        local.sql = "DELETE FROM categorylist WHERE categoryID =(:categoryID)";
        local.params = {
            categoryID = {value:arguments.categoryID,cfsqltype:"CF_SQL_INTEGER"}
        }
        queryExecute(local.sql,local.params);
    }
    function updateCategory(numeric categoryID, string categoryName){
        local.sql = "UPDATE categorylist SET categoryName=(:categoryName) WHERE categoryID =(:categoryID)";
        local.params = {
            categoryName = {value:arguments.categoryName,cfsqltype:"CF_SQL_VARCHAR"},
            categoryID = {value:arguments.categoryID,cfsqltype:"CF_SQL_INTEGER"}
        }
        queryExecute(local.sql, local.params)
    }
}