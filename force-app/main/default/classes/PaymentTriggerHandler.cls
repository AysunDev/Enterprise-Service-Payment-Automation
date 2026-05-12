public  class PaymentTriggerHandler {


    public static void CreateNewIncome(List<Payment__c> paymentList){
        
        List<String> successLogs = new List<String>();
        List<String> errorLogs = new List<String>();
        
        try {
            List<Income__c> newIncomes = new List<Income__c>();
        
        for(Payment__c payment : paymentList){
            
            if(payment.Payment_Status__c =='Paid'){
                
                Income__c newIncome = new Income__c();
                newIncome.Amount__c = payment.Paid_Amount__c;
                newIncome.Income_Date__c = payment.Payment_Date__c;
                newIncome.Payment__c= payment.Id;
                
                newIncomes.add(newIncome);

            }

        }
        insert newIncomes;
            
            successLogs.add(newIncomes.size() + ' new incomes created.');
            
            successLogs.add('New Incomes created successfully.');
            
            APILogUtility.SuccessLog('PaymentTriggerHandler', successLogs);
        }
        
        catch(Exception e){
            errorLogs.add('New Incomes could not be created.');
            APILogUtility.ErrorLog('PaymentTriggerHandler',errorLogs);
        }
    }
    public static void updateTotalPaidAmount(List<Payment__c> paymentList){

        List<Service__c> serviceList = new   List<Service__c>();

        for (Payment__c payment : paymentList) {
           Service__c relatedService = ServiceUtility.getServiceById(payment.Service__c);
           relatedService.Total_Amount__c =+ payment.Paid_Amount__c;  
           serviceList.add(relatedService);    
        }

    
        update serviceList;
 
     }
     

}