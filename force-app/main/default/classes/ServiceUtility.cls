public with sharing class ServiceUtility {
    public static Service__c getServiceById(String serviceId) {
       Service__c relatedService = [SELECT Id, Total_Amount__c, Remaining_Amount__c, Total_Paid_Amount__c 
                                    FROM Service__c WHERE Id = :serviceId];

        return relatedService;
    }
}