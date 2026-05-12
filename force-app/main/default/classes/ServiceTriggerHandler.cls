public with sharing class ServiceTriggerHandler {

   

    public static void insertServiceTriggerHandler(List<Service__c> serviceList) { 
        List<String> successLogs = new List<String>();
        List<String> errorLogs = new List<String>();

    try {
        List<Payment__c> paymnts= new  List<Payment__c>();
    
        for (Service__c newService : serviceList) {
        
            if(newService.Plan__c=='Monthly'){
                integer numbr =PaymentInstallmentsSettingUtility.NumberOfInstallments('Monthly');
                string strtMonth = PaymentInstallmentsSettingUtility.paymentsStartsOn('Monthly');
                integer strtMonthIntgr =DateUtility.getMonthInNumber(strtMonth);
                integer endMonth = strtMonthIntgr+numbr;
                for (Integer i = strtMonthIntgr; i < endMonth; i++) {
                    Payment__c paymnt= new Payment__c();
                    paymnt.Parent__c= newService.Parent__c;
                    paymnt.Child__c=newService.Child__c;
                    paymnt.Service__c =newService.Id;
                    paymnt.Month_Paid__c=Datetime.newInstance(2024, i, 1).format('MMMM');
                    paymnt.Payment_Date__c= Date.newInstance(2024, i, 1);
                    paymnt.Total_Amount__c = PaymentUtility.calculateTotalAmount(paymnt, newService);
                    paymnt.Plan__c= 'Monthly';
                   paymnts.add(paymnt);
                }
            } else if (newService.Plan__c=='Yearly') {
                string strtMonth = PaymentInstallmentsSettingUtility.paymentsStartsOn('Yearly');
                Decimal dscnt = PaymentInstallmentsSettingUtility.discount('Yearly');
                Payment__c paymnt= new Payment__c();
                paymnt.Parent__c= newService.Parent__c;
                paymnt.Child__c=newService.Child__c;
                paymnt.Service__c=newService.Id;
                paymnt.Month_Paid__c=strtMonth;
                paymnt.Total_Amount__c = PaymentUtility.calculateTotalAmount(paymnt, newService);
                paymnt.Plan__c= 'Yearly';
                paymnts.add(paymnt);
            }
           insert paymnts; 
        }
          APILogUtility.SuccessLog('ServiceTriggerHandler', successLogs);
        
     
        } catch (Exception e){
            errorLogs.add(String.valueOf(e.getCause()));
            errorLogs.add(e.getMessage());
            errorLogs.add(string.valueOf(e.getLineNumber()));
            errorLogs.add(string.valueOf(e.getNumDml()));
            errorLogs.add(e.getStackTraceString());
            APILogUtility.ErrorLog('ServiceTriggerHandler', errorLogs);

        }

    }
}