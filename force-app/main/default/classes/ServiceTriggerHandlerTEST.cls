@isTest
public with sharing class ServiceTriggerHandlerTEST {
    @isTest public static void testA(){
        //yeni servis ekliyorum boylece trigger calismis oluyor
        TestUtility.TestRecords('Monthly');
        TestUtility.TestRecords('Yearly');
        
    }
   
}