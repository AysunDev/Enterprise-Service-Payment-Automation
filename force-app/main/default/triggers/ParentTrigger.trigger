trigger ParentTrigger on Parent__c (before insert, before update, after insert, after update) {

    if (Trigger.isBefore) {
        ParentTriggerHandler.updateParent(Trigger.new);
        CustomValidationRules.validateField(Trigger.new);
    }
