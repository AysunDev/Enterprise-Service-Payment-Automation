public class ContactPractice {
    public static void delContacts(){
        List<Contact> cons = [SELECT Id FROM Contact WHERE name like '%delete%' ];
        if(cons.size()>0){
            try{
                delete cons;
            }
            catch (exception e){
                system.debug('Something went wrong' + e.getmessage());
            }
        }
        
    }
    
}