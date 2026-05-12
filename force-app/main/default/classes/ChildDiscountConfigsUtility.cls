public with sharing class ChildDiscountConfigsUtility {
    public static Decimal CalculateChildDiscount(string ordrOfchild) {
  
            List<Child_Discount_Config__mdt> childDiscList = [SELECT Id, Discount__c, Label FROM Child_Discount_Config__mdt 
                                                        WHERE Label =: ordrOfchild];
           if(childDiscList.size() != 0){
                return 0.00;
           }else {
            
                return childDiscList[0].Discount__c;
            
        }
       
    }
}