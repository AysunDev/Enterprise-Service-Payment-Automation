public with sharing class TriggerHandlerConfigUtility {
    public static Trigger_Handler_Config__mdt getTriggerHandlerConfig(String label){

        List<Trigger_Handler_Config__mdt> configList =[SELECT id, After_Delete__c, After_Insert__c, After_Undelete__c, After_Update__c, Before_Delete__c,    
        Before_Insert__c,Before_Update__c, NotifyAdmin__c, Label FROM Trigger_Handler_Config__mdt WHERE Label =:label];
        
    if(configList.size() !=0){
        return configList.get(0);
    }
    else{
        return null;
    }
    }
}