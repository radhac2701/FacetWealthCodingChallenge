import { LightningElement, track } from 'lwc';
import getData from '@salesforce/apex/NetworthController.getData';
import deleteRecord from '@salesforce/apex/NetworthController.deleteRecord';
import pubsub from 'c/pubsub' ; 

export default class NetworthTable extends LightningElement {
    get totalAssets(){
        var temp = 0;
        for(var i = 0; i < this.data.length; i++){
            if(this.data[i].Type__c == 'Asset'){
                temp = temp + this.data[i].Balance__c;
            }
        }
        return temp;
    }
    get totalLiabilities(){
        var temp = 0;
        for(var i = 0; i < this.data.length; i++){
            if(this.data[i].Type__c == 'Liability'){
                temp = temp + this.data[i].Balance__c;
            }
        }
        return temp;
    }
    get totalNetworth(){
        return this.totalAssets - this.totalLiabilities;
    }
    @track data = [];
    @track showLoader = false;
    
    @track columns = [
        { label: 'Type', fieldName: 'Type__c', type: 'text' },
        { label: 'Name', fieldName: 'Name', type: 'text' },
        { label: 'Balance', fieldName: 'Balance__c', type: 'currency' }, 
        {
            type: 'action',
            typeAttributes: { rowActions: [{ label: 'Delete', name: 'delete' }] },
        },       
    ];
    connectedCallback(){
        this.init();
        pubsub.register('refreshTable', this.handleEvent.bind(this));
    }
    handleEvent(messageFromEvt){
        console.log('handle..!');
        this.init();
    }
    init(){
        getData().then(result => {
            console.log('result..!', result);
            this.data = result;
        }).catch(errors => {
            console.log('errors..!', errors);
        })
    }
    handleRowAction(event){
        const actionName = event.detail.action.name;
        const row = event.detail.row;
        if (actionName == 'delete') {
            this.deleteRow(row);
        }
    }
    deleteRow(row){
        this.showLoader = true;
        console.log('row..!', row.Id);
        deleteRecord({
            'recordId' : row.Id
        }).then(result => {
            console.log('result..!', result);
            this.data = result;
            this.showLoader = false;
        }).catch(errors => {
            console.log('errors..!', errors);
            this.showLoader = false;
        })
    }
}