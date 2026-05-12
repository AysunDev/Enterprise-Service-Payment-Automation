@isTest
public class TestUtilityTEST {
    
    @isTest
    static void TestA(){
        
        TestUtility.TestRecords();
        
    }
    
    
    @isTest
    static void TestB(){
        
        TestUtility.NTestRecords(10);
        
    }
    
    @isTest
    static void TestC(){
        
        Test.StartTest();
        TestUtility.NewParent1('Aysun Hanim','Mother');
        Test.StopTest();
        
        Parent__c AysunParent = [SELECT id, Father_Full_Name__c FROM Parent__c LIMIT 1];
        
        System.assertEquals('Aysun Hanim', AysunParent.Father_Full_Name__c);
        
        
        
    }
    
    @isTest
    static void TestD(){
        
        TestUtility.genarateRandomParentFromList();
        
    }
    
    @isTest
    static void TestE(){
        
        Parent__c newParent = TestUtility.NewParent();
        Children__c newChild = TestUtility.NewChild(newParent.Id);
        Service__c newService = TestUtility.NewService(newParent.Id, newChild.id );
        
        newService.Plan__c ='Yearly';
        
        update newService;
        
        
        TestUtility.NewPayments(newParent.Id, newChild.Id, newService.Id);
        
        
    }
    
}