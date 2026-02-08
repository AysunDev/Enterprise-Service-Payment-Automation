public class PaymentInstallmentsSettingUtility {
    public static integer NumberOfInstallments(String plan) {
        Payment_Installments_Setting__mdt pIs = [SELECT Discount__c, Number_of_Installments__c, Payments_Starts_on__c, 	Plan__c
                                                 FROM Payment_Installments_Setting__mdt pIs WHERE Plan__c= :plan ];

        return integer.valueOf(pIs.Number_of_Installments__c);

    }
    public static integer discount(String plan) {
        Payment_Installments_Setting__mdt pIs = [SELECT Discount__c, Number_of_Installments__c, Payments_Starts_on__c, 	Plan__c
                                                 FROM Payment_Installments_Setting__mdt pIs WHERE Plan__c= :plan ];

        return integer.valueOf(pIs.Discount__c);

    }

    public static string paymentsStartsOn(String plan) {
        Payment_Installments_Setting__mdt pIs = [SELECT Discount__c, Number_of_Installments__c, Payments_Starts_on__c, 	Plan__c
                                             FROM Payment_Installments_Setting__mdt pIs WHERE Plan__c= :plan ];

    return pIs.Payments_Starts_on__c;

}
}