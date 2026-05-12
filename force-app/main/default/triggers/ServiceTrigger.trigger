trigger ServiceTrigger on Service__c (before insert, before update, after insert, after update) {

    Trigger_Handler_Config__mdt TriggerConfig = TriggerHandlerConfigUtility.getTriggerHandlerConfig('Service Trigger');
    
    if (trigger.isInsert && trigger.isAfter && TriggerConfig.After_Insert__c== true) {

        ServiceTriggerHandler.insertServiceTriggerHandler(trigger.new);

        if(TriggerConfig.NotifyAdmin__c){
            EmailUtility.sendMail('aysundoslu78@gmail.com', 'Notice', 'The father email has been updated.');
        }  
        
    }
    if(trigger.isInsert && trigger.isBefore || trigger.isUpdate && trigger.isBefore){
        CustomValidationRules.serviceValidationRule(trigger.new);

    }

}