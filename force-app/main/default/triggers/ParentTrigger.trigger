trigger ParentTrigger on Parent__c (before insert, before update, after insert, after update) {
    if(trigger.isInsert && trigger.isBefore){
        
       ParentTriggerHandler.UpdateParent(Trigger.new);
    }
    if(trigger.isUpdate && trigger.isBefore){
        
        ParentTriggerHandler.UpdateParent(Trigger.new);
     }
     if(trigger.isInsert && trigger.isBefore || trigger.isUpdate && trigger.isBefore){
        ParentTriggerHandler.UpdateParent(trigger.new);
     }
     if(trigger.isInsert && trigger.isBefore || trigger.isUpdate && trigger.isBefore){
      CustomValidationRules.validateField(trigger.new);
}
}