import { LightningElement,api,track } from 'lwc';
import getContacts from '@salesforce/apex/ContactListController.getContacts';

export default class ContactList extends LightningElement {

@api recordId;
@track contactList=[];
@track contactExists;

connectedCallback(){
    if(this.recordId != null && this.recordId!=''){
        this.getRelatedContacts();
        console.log(this.recordId);
    }
    
    
}

getRelatedContacts(){

    getContacts({recordId: this.recordId})
    .then(result => {
        this.contactList = result;
        if(result.length>0){
            this.contactExists = true;
        }else{
            this.contactExists=false;
        }
    })
    .catch(error => {
        console.log(error);
    });
    
}


}