public with sharing class APILogUtility {
    public static void ErrorLog( string APIName, List<string> logMessage ) {
        API_Log__c log = new API_Log__c();
        log.API_Name__c = APIName;
        log.Log_Message__c= String.join(logMessage,';' );
        log.Is_Error__c= true;
         insert log;

    }
    public static void SuccessLog(string APIName, List<string> logMessage){
        API_Log__c log =new API_Log__c();
        log.API_Name__c= APIName;
        log.Log_Message__c =  String.join(logMessage,';' );
        log.Is_Error__c = False;
        insert log;
    }
}