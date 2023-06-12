component{

    function saveUser(string username, string email, string password, string phoneNumber){
        //check whether the user exists
        var userExist = getUser(arguments.email).RecordCount();

        if( userExist eq 0 ){
        try{
          local.sql="INSERT INTO userlist (username, password,phoneNumber, email) VALUES(:username,:password,:phoneNumber,:email)"
          local.params={
            username={value:arguments.username,cfsqltype:"CF_SQL_VARCHAR"},
            password={value:arguments.password,cfsqltype:"CF_SQL_VARCHAR"},
            phoneNumber={value:arguments.phoneNumber,cfsqltype:"CF_SQL_VARCHAR"},
            email={value:arguments.email,cfsqltype:"CF_SQL_VARCHAR"}
          }
          queryExecute(local.sql, local.params);
          return 1;
        }catch(error){
          return 2;
        }
        }else{
          return 0;
        }
    }

    function getUser(string email){
        local.sql ="SELECT username, email,password,phoneNumber,role FROM userlist WHERE email=(:email)";
        local.params = {email={value:arguments.email,cfsqltype:"CF_SQL_VARCHAR"}};
        var result = queryExecute(local.sql,local.params);
        return result;
    }
    
    function doLogin(string email , string password){
        local.sql = "SELECT username, email,password,phoneNumber,role FROM userlist WHERE email=(:email) AND password=(:password)";
        local.params={
            email={value:arguments.email,cfsqltype:"CF_SQL_VARCHAR"},
            password={value:arguments.password,cfsqltype:"CF_SQL_VARCHAR"}
        };
        local.result = queryExecute(local.sql,local.params);
        return local.result;
    }
    function getAllUsers(){
        local.sql ="SELECT username, email,password,phoneNumber FROM userlist WHERE role=0";
        var result = queryExecute(local.sql);
        return result;
    }
    function removeUser(string email){
        local.sql ="DELETE FROM userlist WHERE email=(:email)";
        local.params={
            email={value:arguments.email,cfsqltype:"CF_SQL_VARCHAR"}
        };
        local.result = queryExecute(local.sql,local.params);
    }
}