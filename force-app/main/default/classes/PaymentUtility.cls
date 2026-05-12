public with sharing class PaymentUtility {



    public static Decimal calculateTotalAmount(Payment__c payment, Service__c service) {

        Decimal srvcAmount = ServiceAmountSettingUtility.GetServiceAmountByPackType(service.Package__c);
 
        Decimal addSubFee = AdditionalSubjectSettingsUtility.GetAmountBySubject(service.Additional_Subjects__c);
      
        Children__c paymntOwner = ChildUtility.getChild(service.Child__c);
       
        Decimal chldDiscnt = ChildDiscountConfigsUtility.CalculateChildDiscount(paymntOwner.Order__c);
       
        Decimal TotalPayment = srvcAmount + addSubFee;
         
        Decimal DiscountedAmount = TotalPayment - TotalPayment * chldDiscnt /100;
      

       return DiscountedAmount;

}
public static void FinalPayment(List<Payment__c> paymentList) {

    for (Payment__c payment : paymentList) {
        Decimal PaymentPercentage = PaymentMethodSettingUtility.GetServiceChargeByPaymentMethod(Payment.Payment_Method__c);
        Decimal PaymentFee = payment.Total_Amount__c * PaymentPercentage / 100;
        Decimal PaymentTaxPercentage = TaxSettingUtility.DefaultTax();
        Decimal TaxAmount = payment.Total_Amount__c * PaymentTaxPercentage / 100;

        Decimal LateFee = 0.00;

        if (payment.Due_Date__c < payment.Payment_Date__c) {
            LateFee = payment.Total_Amount__c * 0.1;
        }

        Decimal PaidAmount = payment.Total_Amount__c + TaxAmount + LateFee + PaymentFee;

        //********** Assignment *******//
        payment.Tax_Amount__c = TaxAmount;
        payment.Late_Fee__c = LateFee;
        payment.Payment_Fee__c = PaymentFee;
        payment.Paid_Amount__c = PaidAmount;

        if(String.isBlank(payment.Transaction_ID__c)){
                
            String TransactionId = generateTransactionID();
            
            Boolean status = transactionIdIsUnique(TransactionId);
            
            if(status){
                payment.Transaction_ID__c =TransactionId;
            }
            else {
                TransactionId = generateTransactionID();
                payment.Transaction_ID__c =TransactionId;
            }
            
        }
        
    }
    }

public static String generateTransactionID(){
        
    String charSet = '0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ';
    
    String TransactionID =''; 
    
    for(Integer i=0; i<16; i++){ 
      
        Integer randomIndex = Math.mod(Math.round(Math.random() * 250), charSet.length());
        
        TransactionID += charSet.subString(randomIndex, randomIndex+1);        
    }
    return TransactionID;
    
}

public static Boolean transactionIdIsUnique(String TId){
    
    List<Payment__c> TIDList = [SELECT Transaction_ID__c FROM Payment__c WHERE Transaction_ID__c =: TId];
    
    if(TIDList.size() != 0){
        return false;
    }
    else {
        return true;
    }
    
}



}