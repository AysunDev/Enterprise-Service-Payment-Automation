public with sharing class CustomValidationRules {
   public static ValidationRuleConfig__mdt VrConfig =ValidationRuleConfigUtility.getVrConfig(); //this is class variable, static dedik cunku static methodlarda kullaniyoruz, public dedik ki ulasabilsin

    public static void serviceValidationRule(List<Service__c> srvList) {
        for (Service__c srvce : srvList) {

            // if (VrConfig.GardenRelationship__c) { // bu kodda sadece GardenRelationship__c secilmisse calisacak
               
   
            if(srvce.Parent__c == null&& VrConfig.Parent__c){
                srvce.Parent__c.addError('Parent must be selected');
            }
            if(srvce.Child__c == null&& VrConfig.Child__c){
                srvce.Child__c.addError('Child must be selected');
            }
            if(String.isBlank(srvce.Plan__c)&& VrConfig.Plan__c){
                srvce.Plan__c.addError('Plan must be selected');
            }
            if(String.isBlank(srvce.Package__c)&& VrConfig.Package__c){
                srvce.Plan__c.addError('Plan must be selected');
            }
            
        }

    }
    // //Normal Validation
// public static void validateField(List<Parent__c> parentList){
//     for (Parent__c parent : parentList) {
//         if(string.isBlank(parent.Guardian_Relationship__c)){
//           parent.addError('Guardian Relationship can not be blank'); //error  displays in  buttom of page
//           parent.Father_Full_Name__c.addError('Guardian Relationship can not be blank'); //error  displays in buttom

//         }
//    }
// }
    public static void validateField(List<Parent__c> parentList){
        for (Parent__c parent : parentList) {
            if(string.isBlank(parent.Guardian_Relationship__c)){

               // if (VrConfig.GardenRelationship__c) { // bu kodda sadece GardenRelationship__c secilmisse calisacak
               if (VrConfig.GardenRelationship__c || VrConfig.All__c){ // bu kod herhangi biri isaretliyse calisacak
              parent.addError('Guardian Relationship can not be blank'); //error  displays in  buttom of page
              parent.Father_Full_Name__c.addError('Guardian Relationship can not be blank'); //error  displays in buttom
    
            }
       }
       }
    }
    public static void validateField(List<Children__c> childs) {
        for (Children__c child : childs) {
            if (String.isBlank(child.Order__c)) {
                ValidationRuleConfig__mdt VrConfig =ValidationRuleConfigUtility.getVrConfig();
                if (VrConfig.Order__c || VrConfig.All__c){ // bu kod herhangi biri isaretliyse calisacak
                
            
                    child.Order__c.addError('Order can not be blank'); //error  displays in buttom
          
                  }
                
            }
            
        }

    }
    public static void validateField(List<Payment__c> payments) {
        for (Payment__c pymnt: payments) {
            if (String.isBlank(pymnt.Payment_Method__c) && pymnt.Payment_Status__c =='Paid') {
                ValidationRuleConfig__mdt VrConfig =ValidationRuleConfigUtility.getVrConfig();
                if (VrConfig.Payment_Status__c|| VrConfig.All__c){ // bu kod herhangi biri isaretliyse calisacak
                
            
                    pymnt.Payment_Method__c.addError('You must select Payment Method first'); //error  displays in buttom
          
                  }
                
            }
            
        }

    }
}