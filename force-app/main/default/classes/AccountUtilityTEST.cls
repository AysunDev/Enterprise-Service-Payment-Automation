@isTest
public  class AccountUtilityTEST {
    @isTest
    public static void  TESTA() {
        Account acc = new Account();
        acc.Name = 'TEST ACCOUNT';
        acc.Rating = 'Hot';
        insert acc;
        AccountUtility.GetAccountById(acc.Id);
        AccountUtility.GetAccountByName(acc.Name);
        AccountUtility.GetAccountWithContact();
        AccountUtility.GetActiveAccount();
        AccountUtility.GetAccountWithoutContact();
        AccountUtility.GetInActiveAccounts();
        AccountUtility.GetAllAccount();
        AccountUtility.UpdateRatingOfAccounts('Cold');
    }
}