public with sharing class AdditionalSubjectSettingsUtility {
    public static Decimal GetAmountBySubject(String sbjctName) {
        List<Additional_Subject_Settings__mdt> getSubjectList =[SELECT Id,Amount__c, Label 
                                                                FROM Additional_Subject_Settings__mdt 
                                                                WHERE Label=:sbjctName];
        if (getSubjectList.size() != 0) {
            return getSubjectList[0].Amount__c;
            
        }else {
            return null;
        }

    }
}