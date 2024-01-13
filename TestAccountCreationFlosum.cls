/**
  * Sample test class for use on a deployment.
  */
@isTest
public with sharing class TestAccountCreationFlosum {
    @isTest static void testAccountCreation() {
        System.debug('Started testing of account insertion.');
        Integer recordCount = 10;
        List<Account> newAccounts = new List<Account>();
        for (Integer i = 0 ; i < recordCount ; ++i) {
            Account acct = new Account(name='Test Account ' + String.valueOf(i));
            newAccounts.add(acct);
        }
        
        insert newAccounts;
        
        System.debug('Created test accounts. Querying for inserted records.');
        
        List<Account> myNewAccounts = [select Id, Name from Account LIMIT :recordCount + 10];
        System.assert(myNewAccounts != null, 'Failed to return queried test accounts collection.');
        System.assert(myNewAccounts.size() == recordCount, 'Queried accounts do not equal expected value: ' + String.valueOf(myNewAccounts.size()));
        
        System.debug('Completed testing of account insertion.');
    }
}
