// public with sharing class ChildUtility {
//     public static Children__c getChild(Id chldId ) {
//         List<Children__c> childList = [SELECT Id,Order__c FROM Children__c WHERE Id=: chldId];
//         if(!childList.isEmpty()){
//             return childList[0];
//         }else {
//             return null;
//         }

//     }
// }
public with sharing class ChildUtility {
    public static Children__c getChild(Id chldId) {
       
            List<Children__c> childList = [SELECT Id, Order__c FROM Children__c WHERE Id = :chldId];
            if (!childList.isEmpty()) {
                return childList[0];
            } else {
                return null;
            }
    }
}