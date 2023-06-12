component extends=framework.one {
   this.ormsettings.cfclocation = expandPath( "model/" );
   this.datasource="eshop";
   variables.framework ={
     reloadApplicationOnEveryRequest =true
   } 
   
}