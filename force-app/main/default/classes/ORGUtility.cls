public  class ORGUtility {
    public static void  DeletePayments() {
        List<Payment__c> paymentsToDelete = [SELECT Id FROM Payment__c];
        delete paymentsToDelete;
    }
    public static void  DeleteServices() {
        List<Service__c> serviceToDelete = [SELECT Id FROM Service__c];
        delete serviceToDelete;
    }
    public static void  DeleteChildren() {
        List<Children__c> childrenToDelete = [SELECT Id FROM Children__c];
        delete childrenToDelete;
    }
    public static void  DeleteParents() {
        List<Parent__c> parentToDelete = [SELECT Id FROM Parent__c];
        delete parentToDelete;
    }
    public static void  DeleteIncomes() {
        List<Income__c>incomesToDelete = [SELECT Id FROM Income__c];
        delete incomesToDelete;
    }
    public static void  DeleteExpenses() {
        List<Expense__c> expensesToDelete = [SELECT Id FROM Expense__c];
        delete expensesToDelete;
    }
    public static void  DeleteRevenues() {
        List<Revenue__c> revenuesToDelete = [SELECT Id FROM Revenue__c];
        delete revenuesToDelete;
    }
    public static void  DeleteAPILogs() {
        List<API_Log__c> apilogsToDelete = [SELECT Id FROM API_Log__c];
        delete apilogsToDelete;
    }
    public static void  DeleteInboundRecords() {
        List<Inbound_Record__c> inboundRecordsToDelete = [SELECT Id FROM Inbound_Record__c];
        delete inboundRecordsToDelete;
    }
    public static void  DeleteCases() {
        List<Case> casesToDelete = [SELECT Id FROM Case];
        delete casesToDelete;
    }
    public static void  DeleteAllRecords() {
        DeleteAllRecords();
    }
}