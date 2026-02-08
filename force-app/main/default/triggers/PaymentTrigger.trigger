trigger PaymentTrigger on Payment__c (before insert, before update, after insert, after update) {
           if(trigger.isBefore && trigger.isInsert || trigger.isBefore && trigger.isUpdate){

            CustomValidationRules.validateField(trigger.new);
            PaymentUtility.FinalPayment(trigger.new);
           }
               
    if(Trigger.isUpdate && Trigger.IsAfter){
        
        PaymentTriggerHandler.CreateNewIncome(Trigger.new);
           
        for(Payment__c payment : Trigger.new){
            if(payment.Payment_Status__c =='Paid'){
                Parent__c relatedParent = ParentUtility.GetParentById(payment.Parent__c);
                StaticResource sr = [SELECT Id, body FROM StaticResource WHERE Name='DueDateNotificationEmailTemplate' LIMIT 1];
                String emailBody = sr.Body.toString();
                String emailBody1 = emailBody.replace('$parentName$', relatedParent.Guardian_Name__c);
                String emailBody2 = emailBody1.replace('$totalAmount$', String.valueof(payment.Paid_Amount__c));
                String emailBody3 = emailBody2.replace('$dueDate$', String.valueof(payment.Due_Date__c)); 

               // EmailUtility.sendMail(relatedParent.Guardian_Email__c, 'You did a payment recently.', emailBody3);
            }
        }
        PaymentTriggerHandler.updateTotalPaidAmount(trigger.new);
    }
           
           
           
       }