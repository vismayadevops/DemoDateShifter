@isTest
public class ContactListControllerTest {

    @isTest
    static void testGetContacts() {
        // Create test data - Account and related Contacts
        Account testAccount = new Account(Name = 'Test Account');
        insert testAccount;

        Contact testContact1 = new Contact(AccountId = testAccount.Id, 
                                           FirstName = 'John', 
                                           LastName = 'Doe',
                                           Email = 'john.doe@test.com',
                                           Phone = '1234567890',
                                           Department = 'Sales');
        Contact testContact2 = new Contact(AccountId = testAccount.Id, 
                                           FirstName = 'Jane', 
                                           LastName = 'Smith',
                                           Email = 'jane.smith@test.com',
                                           Phone = '9876543210',
                                           Department = 'Marketing');
        insert new List<Contact>{ testContact1, testContact2 };

        // Call the method to test
        Test.startTest();
        List<Contact> resultContacts = ContactListController.getContacts(testAccount.Id);
        Test.stopTest();

        // Verify the results
        System.assertEquals(2, resultContacts.size(), 'Expected two contacts');

        Contact resultContact1 = resultContacts[0];
        Contact resultContact2 = resultContacts[1];

        // Verify contact fields
        System.assertEquals('John Doe', resultContact1.Name, 'Unexpected contact name');
        System.assertEquals('john.doe@test.com', resultContact1.Email, 'Unexpected contact email');
        System.assertEquals('1234567890', resultContact1.Phone, 'Unexpected contact phone');
        System.assertEquals('Sales', resultContact1.Department, 'Unexpected contact department');

        System.assertEquals('Jane Smith', resultContact2.Name, 'Unexpected contact name');
        System.assertEquals('jane.smith@test.com', resultContact2.Email, 'Unexpected contact email');
        System.assertEquals('9876543210', resultContact2.Phone, 'Unexpected contact phone');
        System.assertEquals('Marketing', resultContact2.Department, 'Unexpected contact department');
    }
}