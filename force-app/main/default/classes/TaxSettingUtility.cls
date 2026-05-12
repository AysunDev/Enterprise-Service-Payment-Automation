public  class TaxSettingUtility {
   
    public static decimal defaultTax() {
        List<Tax_Setting__mdt> TaxSetting = [SELECT Id, Label, Tax_Percentage__c FROM Tax_Setting__mdt];
        
        if (TaxSetting.size() != 0) {
            return TaxSetting[0].Tax_Percentage__c;
            
        }
        else {
            return null;
        }

    }
}