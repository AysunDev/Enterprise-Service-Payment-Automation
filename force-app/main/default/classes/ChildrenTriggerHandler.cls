public with sharing class ChildrenTriggerHandler {
     public static void updateNumberOfChildrenOnInsert(List<Children__c> childList){
        Set<Id> gradeLevelIds = new Set<Id>();

        for (Children__c child : childList) {
            gradeLevelIds.add(child.Grade_Level__c);       
        }

        List<Grade_Level__c> gradeLevelList =[SELECT Id, Number_Of_Children__c, (SELECT Id FROM Children__r) 
                                              FROM Grade_Level__c 
                                              WHERE  Id IN :gradeLevelIds];

        for (Grade_Level__c grade : gradeLevelList) {
            grade.Number_of_Children__c = grade.Children__r.size();
        }
        update gradeLevelList;
 
     }
     public static void updateNumberOfChildrenOnUpdate(List<Children__c> oldChildren, List<Children__c> newChildren){
        
        Set<Id> gradeLevelIDs = new Set<Id>();
        
        for(Children__c oldChild : oldChildren){
            for(Children__c newChild : newChildren){
                if(oldChild.Grade_Level__c != newChild.Grade_Level__c){
                    gradeLevelIDs.add(oldChild.Grade_Level__c);
                    gradeLevelIDs.add(newChild.Grade_Level__c);
                }
            }
        }
        
        List<Grade_Level__c> gradeLevelList = [SELECT Id, Number_Of_Children__c, (SELECT Id FROM Children__r) 
                                                FROM Grade_Level__c WHERE Id IN :gradeLevelIDs];
        
        for(Grade_Level__c grade : gradeLevelList){
            grade.Number_of_Children__c = grade.Children__r.size();
        }
        update gradeLevelList;
    }
}