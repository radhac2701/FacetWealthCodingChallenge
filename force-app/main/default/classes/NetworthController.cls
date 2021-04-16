public without sharing class NetworthController 
{
	@AuraEnabled
    public static list<Assets_And_Liabilities__c> getData()
    {
        return [SELECT Id, Name, Balance__c, Type__c FROM Assets_And_Liabilities__c ORDER BY CreatedDate DESC];
    }
    @AuraEnabled
    public static list<Assets_And_Liabilities__c> deleteRecord(Id recordId)
    {
        delete [SELECT Id, Name, Balance__c, Type__c FROM Assets_And_Liabilities__c WHERE Id =: recordId];
        return getData();
    }
}