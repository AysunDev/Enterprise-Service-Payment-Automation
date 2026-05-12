public with sharing class PaymentMethodSettingUtility {
    public static Decimal GetServiceChargeByPaymentMethod(String method) {
        List<Payment_Method_Setting__mdt> paymentMethodList =[SELECT Id, Payment_Method__c, Service_Charges__c 
                                                              FROM Payment_Method_Setting__mdt 
                                                              WHERE Payment_Method__c =:method ];
          if (!paymentMethodList.isEmpty()) {
            return paymentMethodList.get(0).Service_Charges__c;
            
          }
          else {
            return 0.00;
          }                                                  
}
}