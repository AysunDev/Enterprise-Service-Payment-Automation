public  class ParentTriggerHandler {
    public static void UpdateParent(List<Parent__c> parents) {
        for (Parent__c prnt : parents) {
            if (prnt.Guardian_Relationship__c=='Father') {
                 prnt.Guardian_Name__c=prnt.Father_Full_Name__c;
                 prnt.Guardian_Mobile__c=prnt.Father_Mobile__c;
                 prnt.Guardian_BirthDate__c=prnt.Father_Birthdate__c;
                prnt.Guardian_Phone__c= prnt.Father_Phone__c;
                 prnt.Guardian_Email__c=prnt.Father_Email__c;
                
            }else if (prnt.Guardian_Relationship__c=='Mother') {
                prnt.Guardian_Name__c=prnt.Mother_Full_Name__c;
                 prnt.Guardian_Mobile__c=prnt.Mother_Mobile__c;
                 prnt.Guardian_BirthDate__c=prnt.Mother_Birthdate__c;
                prnt.Guardian_Phone__c= prnt.Mother_Phone__c;
                 prnt.Guardian_Email__c=prnt.Mother_Email__c;
            }

    }
}


}