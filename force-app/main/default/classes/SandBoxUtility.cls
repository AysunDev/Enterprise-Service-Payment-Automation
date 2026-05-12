public with sharing class SandBoxUtility {
    public static void CleanOrg1() {

        delete [SELECT Id FROM Parent__c];
        delete [SELECT Id FROM Children__c];
        delete [SELECT Id FROM Service__c];
        delete [SELECT Id FROM Payment__c];
        delete [SELECT Id FROM Income__c];
        delete [SELECT Id FROM Expense__c];

    }
    public static void CleanOrg2() {

        delete [SELECT Id FROM Parent__c LIMIT 1000];
        delete [SELECT Id FROM Children__c LIMIT 1000];
        delete [SELECT Id FROM Service__c LIMIT 1000];
        delete [SELECT Id FROM Payment__c LIMIT 1000];
        delete [SELECT Id FROM Income__c LIMIT 1000];
        delete [SELECT Id FROM Expense__c LIMIT 1000];

    }
        public static void CleanOrg3() {

        List<Parent__c> pr =  [SELECT Id FROM Parent__c];
        List<Children__c> cl =  [SELECT Id FROM Children__c];
        List<Service__c> sr =  [SELECT Id FROM Service__c];
        List<Payment__c> py =  [SELECT Id FROM Payment__c];
        List<Income__c> inc =  [SELECT Id FROM Income__c];
        List<Expense__c> ex =  [SELECT Id FROM Expense__c];

        if (pr.size() >0) {
            delete pr;
        }
        if (cl.size() >0) {
            delete cl;
        }
        if (sr.size() >0) {
            delete sr;
        }
        if (py.size() >0) {
            delete py;
        }
        if (inc.size() >0) {
            delete inc;
        }
        if(ex.size() >0) {
            delete ex;
        }

    }
    public static void CleanOrg4() {

        List<SObject> pr =  [SELECT Id FROM Parent__c WHERE CreatedDate < LAST_N_DAYS:3];
        List<SObject> cl =  [SELECT Id FROM Children__c WHERE CreatedDate < LAST_N_DAYS:3];
        List<SObject> sr =  [SELECT Id FROM Service__c WHERE CreatedDate < LAST_N_DAYS:3];
        List<SObject> py =  [SELECT Id FROM Payment__c WHERE CreatedDate < LAST_N_DAYS:3];
        List<SObject> inc =  [SELECT Id FROM Income__c WHERE CreatedDate < LAST_N_DAYS:3];
        List<SObject> ex =  [SELECT Id FROM Expense__c WHERE CreatedDate < LAST_N_DAYS:3];

        List<SObject> allRecords = new  List<SObject>();
        allRecords.addAll(pr);
        allRecords.addAll(cl);
        allRecords.addAll(sr);
        allRecords.addAll(py);
        allRecords.addAll(inc);
        allRecords.addAll(ex);

        if (allRecords.size() >0) {
            delete allRecords;
            
        }
}
}