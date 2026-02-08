global class APILogDeleteBatchable implements Database.Batchable<sObject> {    
    global Database.QueryLocator start(Database.BatchableContext BC){        
        String query='SELECT Id from API_Log__c';
        return Database.getQueryLocator( query);
    }
    
    global void execute(Database.BatchableContext BC, List<API_Log__c> logList){
        
        delete logList;
    }
    
    global void finish (Database.BatchableContext BC){    
        
    }
}