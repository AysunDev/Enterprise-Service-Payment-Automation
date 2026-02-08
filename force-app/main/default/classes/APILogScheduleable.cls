public class APILogScheduleable implements  Schedulable {
    
    public void execute(SchedulableContext SC){       
        
        Database.executeBatch(new APILogDeleteBatchable(), 5);

    }
}