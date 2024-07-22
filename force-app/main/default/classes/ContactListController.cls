public class ContactListController {

    @auraEnabled
    public static List<Contact> getContacts(String recordId){
            List<Contact> contactsList = [SELECT Id, Name, Email, Phone, Department FROM Contact WHERE AccountId =: recordId];
         	return contactsList;
    }
    
}