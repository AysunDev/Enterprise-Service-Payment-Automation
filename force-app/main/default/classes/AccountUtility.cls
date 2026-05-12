public with sharing class AccountUtility {
    public static Account GetAccountById(string accId) {
        Account acc=[SELECT Id FROM Account WHERE Id=:accId];
        //null check
        if (acc != null) {
            return acc;
        }else{
         return null;
        }
    }
    public static Account GetAccountByName(string accName) {
        Account acc=[SELECT Id, Name FROM Account WHERE Name=:accName];
        if (acc != null) {
            return acc;
        }else{
         return null;
        }
    }
    public static List<Account> GetAllAccount() {
        List<Account> acc=[SELECT Id, Name, Active__c FROM Account];
        if (acc.size() != 0) { 
            return acc;
        }else{
         return null;
        }
    }
    public static List<Account> GetInActiveAccounts() {
        List<Account> acc=[SELECT Id, Active__c FROM Account WHERE Active__c = 'No'];
        if (acc.size() != 0) {
            return acc;
        }else{
         return null;
        }
    }
    public static List<Account> GetActiveAccount() {
        List<Account> acc=[SELECT Id, Active__c FROM Account WHERE Active__c = 'Yes'];
        if (acc.size() != 0) {
            return acc;
        }else{
         return null;
        }
    }
    public static List<Account> GetAccountWithContact() {
        List<Account> acc=[SELECT Id FROM Account WHERE Id IN (SELECT AccountId FROM Contact)];
        if (acc.size() != 0) {
            return acc;
        }else{
         return null;
        }
    }
    public static List<Account> GetAccountWithoutContact() {
        List<Account> acc=[SELECT Id FROM Account WHERE Id NOT IN (SELECT AccountId FROM Contact)];
        if (acc.size() != 0) {
            return acc;
        }else{
         return null;
        }
    }
    public static void UpdateRatingOfAccounts(string Rating) {
        List<Account> acc=[SELECT Id FROM Account WHERE Rating != : Rating];
        for (Account ac : acc) {
            ac.Rating = Rating;  
        }
        update acc;
        
    }
}