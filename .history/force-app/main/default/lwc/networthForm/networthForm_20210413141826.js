import { LightningElement, track } from 'lwc';
import pubsub from 'c/pubsub' ; 

export default class NetworthForm extends LightningElement {   
    @track showLoader = false; 
    connectedCallback(){

    }
    handleSubmit(event){
        event.preventDefault();       // stop the form from submitting
        var fields = event.detail.fields;
        this.template.querySelector('lightning-record-edit-form').submit(fields);
        this.showLoader = true;
     }
     handleSucess(event){
        const updatedRecord = event.detail.id;
        console.log('onsuccess: ', updatedRecord);
        pubsub.fire('refreshTable', {} );
        console.log('fired..!');
        this.showLoader = false;

        this.resetHelper();
     }
     handleReset(event) {
        this.resetHelper();
     }
    resetHelper(){
        const inputFields = this.template.querySelectorAll(
            'lightning-input-field'
        );
        if (inputFields) {
            inputFields.forEach(field => {
                field.reset();
            });
        }
    }
}