public class NetworthController 
{
	@AuraEnabled
    public static list<Form_Data__c> getData()
    {
        return [SELECT Id, Name, Balance__c, Type__c FROM Form_Data__c ORDER BY CreatedDate DESC];
    }
    @AuraEnabled
    public static list<Form_Data__c> deleteRecord(Id recordId)
    {
        delete [SELECT Id, Name, Balance__c, Type__c FROM Form_Data__c WHERE Id =: recordId];
        return getData();
    }
}