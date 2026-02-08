trigger AccountPracticeTrigger on Account (before update) { 
    for(Account acc : trigger.new){
        if(acc.Active__c== 'No'){
           ContactPractice.delContacts();   
        }
      
    }

}