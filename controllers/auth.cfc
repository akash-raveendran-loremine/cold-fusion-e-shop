component accessors=true {
    property name='userService' setter=true getter=true;

    public any function init (fw) {
         variables.fw = fw;
         return this;
    }
    
    public void function signup(rc){
         var httpMethod = CGI.REQUEST_METHOD;
         if (httpMethod eq "POST") {
            // Handle POST request
            rc.userDetails = variables.userService.saveUser(rc.username, rc.email, rc.password, rc.phoneNumber);
            if(rc.userDetails eq 1){
                variables.fw.redirect(action="auth.login");
            }else if(rc.userDetails eq 2){
                rc.message = ["Database Error Query can't be executed"];
                variables.fw.redirect(action="auth.signup",preserve='message');
            }else{
                rc.message = ["Email exist already!!! Try with another email"];
                variables.fw.redirect(action="auth.signup",preserve='message');
            }
        }
    }
    
    public void function login(rc){
        var httpMethod = CGI.REQUEST_METHOD;
         if (httpMethod eq "POST") {
            // Handle POST request
            rc.userDetails = variables.userService.doLogin(rc.email, rc.password);
            if(rc.userDetails.RecordCount() eq 1 && rc.userDetails.role eq 1){
                session.auth.isLoggedIn = true;
                session.role = "admin";
                variables.fw.redirect(action="admin.default");
            }else if(rc.userDetails.RecordCount() eq 1){
                session.auth.isLoggedIn = true;
                session.role = "user";
                session.userEmail = rc.userDetails.email;
                variables.fw.redirect(action="main.home");
            }else{
                rc.message = ["Login Failed !!! Invalid Credentials"];
                variables.fw.redirect(action="auth.login",preserve="message");
            }
        }
    }

    public void function logout(rc){
        session.auth.isLoggedIn = false;
        session.role = "";
        structdelete(session,"userEmail");
        rc.message = ["Logged out successfully !!!"];
        variables.fw.redirect(action="auth.login",preserve="message");
    }
   
}