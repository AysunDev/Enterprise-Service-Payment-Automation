trigger ChildrenTrigger on Children__c (before insert, before update, after insert, after update) {

  if(trigger.isInsert && trigger.isBefore || trigger.isUpdate && trigger.isBefore){
    CustomValidationRules.validateField(trigger.new);
  }
  if(trigger.isAfter && trigger.isInsert){
    ChildrenTriggerHandler.updateNumberOfChildrenOnInsert(trigger.new);
  }
      
  if(Trigger.isUpdate && Trigger.isAfter){
    ChildrenTriggerHandler.UpdateNumberofChildrenOnUpdate(Trigger.old, Trigger.new);
}

if(Trigger.isDelete && Trigger.isAfter){
    ChildrenTriggerHandler.UpdateNumberofChildrenOnInsert(Trigger.old);
}

if(Trigger.isUnDelete && Trigger.isAfter){
    ChildrenTriggerHandler.UpdateNumberofChildrenOnInsert(Trigger.new);
}

}