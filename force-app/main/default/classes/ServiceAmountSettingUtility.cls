public class ServiceAmountSettingUtility {
    public static decimal  GetServiceAmountByPackType(string srvpackage) {
        
            List<Service_Amount_Settings__mdt> srvcList = [SELECT Id, Amount__c,Package__c 
            FROM Service_Amount_Settings__mdt 
            WHERE Package__c =:srvpackage ];

                if (srvcList.isEmpty()) {
                    
                return srvcList[0].Amount__c;

                }else {

                return 0.00;

                }

                
            }
       
    }