public with sharing class ValidationRuleConfigUtility {
    
    public static ValidationRuleConfig__mdt	getVrConfig() {

      List<ValidationRuleConfig__mdt> VRConfig = [SELECT Id, All__c, GardenRelationship__c, Order__c,	Parent__c, Child__c, Plan__c, Package__c, Payment_Status__c	 FROM ValidationRuleConfig__mdt ];

          if (VRConfig.size() != 0){
            return VRConfig[0];
          }else {
            return null;
          }
    }
          
}