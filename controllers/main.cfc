// This is the default controller file

component accessors=true {
    property sampleService;
    property productService;
    property cartService;
    property orderService;

    public any function init (fw) {
         variables.fw = fw;
         return this;
    }
    // checks whether a user is logged in for every other functions in the component and if not, redirects to the login page
    public any function before (fw) {
        if(structKeyExists(session, 'role')){
            if(session.auth.isLoggedIn != true || session.role != "user"){
                variables.fw.redirect(action="auth.login");
            }
        }else{
                variables.fw.redirect(action="auth.login");
        }
    }

    function default(struct rc ){
        if(session.role eq "admin" ){
            variables.fw.redirect(action="admin.default");
        }else if(session.role eq "user"){
            variables.fw.redirect(action="main.home");
        }else{
            variables.fw.redirect(action="auth.login");
        }
    }

    function home(rc){
        rc.allProducts = variables.productService.getAllProducts();
    }
    function addToCart(rc){
        rc.addTocart = variables.cartService.addToCart(rc.productID,session.userEmail);
        rc.message = ["Added to cart !!!"];
        variables.fw.redirect(action="main.cart",preserve="message");
    }
    function cart(){
        rc.userCart = variables.cartService.getUserCartProducts(session.userEmail);
        var netTotal = 0;
        // Get the number of products in the cart
        var rowCount = rc.userCart.recordCount;
        // Use a for loop to iterate over cart and find net total
        for (var i = 1; i <= rowCount; i++) {
            netTotal = netTotal + rc.userCart["totalPrice"][i]
        }
        rc.netTotal = netTotal;
    }
    function buyFromCart(rc){
        rc.order = variables.orderService.buyFromCart(session.userEmail);
        rc.message = ["order Placed !!!"];
        variables.fw.redirect(action="main.orders",preserve="message");
    }
    function orders(){
        rc.userOrders = variables.orderService.getUserOrders(session.userEmail);
    }
    function buySingleProduct(rc){
        rc.buySingleProduct = variables.orderService.buySingleProduct(rc.productID,session.userEmail);
        rc.message = ["order Placed !!!"];
        variables.fw.redirect(action="main.orders",preserve="message");
    }
    function removeProductFromCart(rc){
        rc.removeFromCart = variables.cartService.removeProductFromCart(rc.productID,session.userEmail)
        rc.message = ["Removed Item From cart !!!"];
        variables.fw.redirect(action="main.cart",preserve="message");
    }
    function incrementCartProduct(rc){
        rc.increment = variables.cartService.changeCartProductQuantity(rc.cartID,1);
        variables.fw.redirect(action="main.cart");
    }
    function decrementCartProduct(rc){
        rc.increment = variables.cartService.changeCartProductQuantity(rc.cartID,-1);
        variables.fw.redirect(action="main.cart");
    }
    function getCartCount(rc){
        rc.ajaxdata = variables.cartService.getCartCount(session.userEmail);
        variables.fw.renderData("json",rc.ajaxdata)
    }
    function getOrdersCount(rc){
        rc.ajaxdata = variables.orderService.getOrdersCount(session.userEmail);
        variables.fw.renderData("json",rc.ajaxdata)
    }
}