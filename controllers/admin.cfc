component accessors=true {

    property productService;
    property categoryService;
    property userService;
    property orderService;

    public any function init (fw) {
        variables.fw = fw;
        return this;
    }

    public any function before (fw) {
        if(structKeyExists(session, 'role')){
            if(session.auth.isLoggedIn != true || session.role != "admin"){
                variables.fw.redirect(action="auth.login");
            }
        }else{
                variables.fw.redirect(action="auth.login");
        }
    }

    public void function default(rc){
        if(structKeyExists(session, 'role')){
            if(session.role eq "admin" && session.auth.isLoggedIn eq true){
                rc.categoryList = variables.categoryService.getAllCategories();
                rc.allProducts = variables.productService.getAllProducts();
            }
            else if(session.role eq "user"){
                variables.fw.redirect(action="main.home");
            }
            else{
                variables.fw.redirect(action="auth.login");
            }
        }
        else{
                variables.fw.redirect(action="auth.login");
        }
    }
    public void function addProduct(rc){
        rc.categoryList = variables.categoryService.getAllCategories();
        var httpMethod = CGI.REQUEST_METHOD;
        if (httpMethod eq "POST") {
            // Handle POST request
            rc.product = variables.productService.addProduct(rc.productName, rc.productDescription, rc.productPrice, rc.categoryID,rc.quantity);
            rc.message = ["Successfully added Product"];
            variables.fw.redirect(action="admin.default",preserve='message');
        }
    }
    public void function addCategory(rc){
        var httpMethod = CGI.REQUEST_METHOD;
        if (httpMethod eq "POST") {
            // Handle POST request
            rc.category = variables.categoryService.addCategory(rc.categoryName);
            rc.message = ["Successfully added Category"];
            variables.fw.redirect(action="admin.categoryList",preserve='message');
        }
    }
    public void function categoryList(rc){
        rc.categoryList = variables.categoryService.getAllCategories();
    }
    public void function deleteCategory(rc){
        rc.id = rc.id;
        rc.deleted = variables.categoryService.deleteCategory(rc.id);
        rc.message = ["Successfully Deleted Category"];
        variables.fw.redirect(action="admin.categoryList",preserve='message');
    }
    public void function updateCategory(rc){
        var httpMethod = CGI.REQUEST_METHOD;
        if (httpMethod eq "POST") {
            rc.updated = variables.categoryService.updateCategory(rc.id, rc.categoryName);
            rc.message = ["Successfully Updated Category"];
            variables.fw.redirect(action="admin.categoryList",preserve='message');
        }
    }
    public void function deleteProduct(rc){
        rc.deleted = variables.productService.deleteProduct(rc.productID)
        rc.message = ["Successfully deleted product"];
        variables.fw.redirect(action="admin.default",preserve='message');
    }
    public void function updateProduct(rc){
        rc.categoryList = variables.categoryService.getAllCategories();
        rc.productDetails = variables.productService.getSingleProduct(rc.productID)
        var httpMethod = CGI.REQUEST_METHOD;
        if (httpMethod eq "POST") {
            rc.updateProduct = variables.productService.updateProduct(rc.productID,rc.productName, rc.productDescription, rc.productPrice, rc.categoryID,rc.quantity);
            rc.message = ["Successfully Updated product"];
            variables.fw.redirect(action="admin.default",preserve='message');
        }
    }
    public void function productsByCategory(rc){
        var httpMethod = CGI.REQUEST_METHOD;
        if (httpMethod eq "POST") {
            rc.categoryList = variables.categoryService.getAllCategories();
            rc.productsByCategory = variables.productService.getProductsBycategory(rc.categoryID);
            rc.category = rc.productsByCategory.getCell('categoryName')
        }
    }
    public void function searchProducts(rc){
        var httpMethod = CGI.REQUEST_METHOD;
        if (httpMethod eq "POST") {
            rc.categoryList = variables.categoryService.getAllCategories();
            rc.searchedProducts = variables.productService.searchProducts(rc.productName);
        }
    }
    public void function usersList(rc){
        rc.categoryList = variables.categoryService.getAllCategories();
        rc.usersList = variables.userService.getAllUsers();
    }
    public void function removeUser(rc){
        rc.categoryList = variables.categoryService.getAllCategories();
        rc.removeUser = variables.userService.removeUser(rc.email);
        rc.message = ["Successfully Removed User"];
        variables.fw.redirect(action="admin.usersList",preserve='message');
    }
    public void function allOrders(rc){
        //abort;
        rc.categoryList = variables.categoryService.getAllCategories();
        rc.allOrders = variables.orderService.getAllOrders();
    }
    public void function shipOrder(rc){
        rc.shipOrder = variables.orderService.changeOrderStatus(rc.orderID,"shipped");
        rc.message = ["Successfully Shipped Product"];
        variables.fw.redirect(action="admin.allOrders",preserve='message');
    }
    public void function cancelOrder(rc){
        rc.cancelOrder = variables.orderService.changeOrderStatus(rc.orderID,"cancelled");
        rc.message = ["Order Cancelled"];
        variables.fw.redirect(action="admin.allOrders",preserve='message');
    }
    
}