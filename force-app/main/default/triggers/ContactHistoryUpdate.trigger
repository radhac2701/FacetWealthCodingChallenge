trigger ContactHistoryUpdate on Contact (after update) {
    //02-26 (Friday) #2 assignment
      if(trigger.isafter&&trigger.isupdate){
        list<Contact_History__c> CHList = new List<Contact_History__c>();
        for(Contact c : trigger.new){
            if(c.Name!=trigger.oldmap.get(c.id).LastName){
                Contact_History__c CH = new Contact_History__c();
                CH.ObjectContact__c=c.id;
                CH.Name_of_Field__c = 'Name';
                CH.Old_Field_Value__c = trigger.oldmap.get(c.id).LastName;
                CH.New_Field_Value__c = c.LastName;
                CH.Date_Happened__c = c.LastModifiedDate.date();
                CHList.add(CH);
            }
            if(c.Phone!=trigger.oldmap.get(c.id).Phone){
                Contact_History__c CH = new Contact_History__c();
                CH.ObjectContact__c=c.id;
                CH.Name_of_Field__c = 'Phone';
                CH.Old_Field_Value__c = trigger.oldmap.get(c.id).Phone;
                CH.New_Field_Value__c = c.Phone;
                CH.Date_Happened__c= c.LastModifiedDate.date();
                CHList.add(CH);
            }
            if(c.Email!=trigger.oldmap.get(c.id).Email){
                Contact_History__c CH = new Contact_History__c();
                CH.ObjectContact__c=c.id;
                CH.Name_of_Field__c = 'Email';
                CH.Old_Field_Value__c = trigger.oldmap.get(c.id).Email;
                CH.New_Field_Value__c = c.Email;
                CH.Date_Happened__c = c.LastModifiedDate.date();
                CHList.add(CH);
            }
            if(CHList.size()>0){
        insert CHList;
        }
            
        }

}
}