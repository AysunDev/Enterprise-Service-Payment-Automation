public class ParentDueDatePaymentNotification implements  Schedulable {
    
    public void execute(SchedulableContext SC){       
        
      List<Payment__c> duePayments = [SELECT Id, Due_Date__c, Paid_Amount__c, Parent__c,Total_Amount__c FROM Payment__c
                                      WHERE Due_Date__c = NEXT_N_DAYS:3 AND Payment_Status__c != 'Paid'];

       for (Payment__c paymnt : duePayments) {
        Parent__c relatedParent =[SELECT Id, Guardian_Email__c, Guardian_Name__c FROM Parent__c WHERE  Id =: paymnt.Parent__c];
        

        string emailBody = '</head><body><table width="100%" cellpadding="0" cellspacing="0" border="0"><tr><td align="center"><table cellpadding="0" cellspacing="0" border="0" style="width: 600px;"><tr><td align="center" bgcolor="#ffffff" style="padding: 40px 0 30px 0;"><img src="https://example.com/logo.png" alt="Logo" width="200"></td></tr><tr><td align="center" bgcolor="#ffffff" style="padding: 40px 30px 30px 30px;"><h2 style="font-family: Arial, sans-serif; color: #333333; margin: 0;">Upcoming Payment Notification</h2></td></tr><tr><td bgcolor="#ffffff" style="padding: 30px 30px 20px 30px;"><p style="font-family: Arial, sans-serif; font-size: 14px; color: #333333; margin: 0;">Dear relatedParent.,</p><p style="font-family: Arial, sans-serif; font-size: 14px; color: #333333; margin: 0;">This is to remind you about the upcoming payment for your  education program. The payment is due on '  + Payment__c.Due_Date__c +'.</p><p style="font-family: Arial, sans-serif; font-size: 14px; color: #333333; margin: 0;">Payment Details:</p><ul style="font-family: Arial, sans-serif; font-size: 14px; color: #333333; margin: 0; padding-left: 20px;"><li>Amount:' + Payment__c.Total_Amount__c+ ' </li><li>Payment Method: [Payment Method]</li><li>Reference Number: [Reference Number]</li></ul><p style="font-family: Arial, sans-serif; font-size: 14px; color: #333333; margin: 0;">If you have already made the payment, please disregard this reminder.</p><p style="font-family: Arial, sans-serif; font-size: 14px; color: #333333; margin: 0;">If you have any questions or need further assistance, please feel free to contact our support team at [Contact Email/Phone Number].</p><p style="font-family: Arial, sans-serif; font-size: 14px; color: #333333; margin: 0;">Thank you for your prompt attention to this matter.</p><p style="font-family: Arial, sans-serif; font-size: 14px; color: #333333; margin: 0;">Best regards,</p><p style="font-family: Arial, sans-serif; font-size: 14px; color: #333333; margin: 0;">[Your Name]</p></td></tr></table></td></tr></table></body></html>';
       
          System.debug(relatedParent.Guardian_Email__c);
        EmailUtility.sendMail( relatedParent.Guardian_Email__c, 'You have upcoming payment', emailBody);
    
    }
    }
}