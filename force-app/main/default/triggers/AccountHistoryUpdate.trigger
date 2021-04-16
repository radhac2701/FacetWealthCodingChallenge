trigger AccountHistoryUpdate on Account (after update) {
    //02-26 (Friday) #1 assignment
    
    if(trigger.isafter&&trigger.isupdate){
        
        list<Account_History__c> Ahlist = new List<Account_History__c> ();
       
        for(Account a : trigger.new){
            if(a.Name!=trigger.oldmap.get(a.id).Name){
                
                Account_History__c AH = new Account_History__c();
                AH.ObjectAccount__c=a.id;
                AH.Name_of_Field__c = 'Name';
                AH.Old_Field_Value__c = trigger.oldmap.get(a.id).Name;
                AH.New_Field_Value__c = a.Name;
                AH.Date_Happened__c  = a.LastModifiedDate.date();
                AH.Name = a.Name;
                //AH.Date_Happened__c = a.
                   Ahlist.add(AH); 
                    }
            
            if(a.Phone!=trigger.oldmap.get(a.id).Phone){
                
                Account_History__c AH = new Account_History__c();
                AH.ObjectAccount__c = a.Id;
                AH.Name_of_Field__c = 'Phone';
                AH.Old_Field_Value__c = trigger.oldmap.get(a.Id).Phone;
                AH.New_Field_Value__c = a.Phone;
                AH.Date_Happened__c = a.LastModifiedDate.date();
                AH.Name = a.Name;
                Ahlist.add(AH);
                
               }
            
            if(a.Email__c != trigger.oldmap.get(a.id).Email__c){
                Account_History__c AH = new Account_History__c();
                AH.ObjectAccount__c = a.Id;
                AH.Name_of_Field__c = 'Email';
                AH.Old_Field_Value__c = trigger.oldmap.get(a.Id).Email__c;
                AH.New_Field_Value__c = a.Email__c;
                AH.Date_Happened__c = a.LastModifiedDate;
                AH.Name = a.Name;
                Ahlist.add(AH);
                
            }
               if(a.BillingStreet!=trigger.oldmap.get(a.id).BillingStreet){
                Account_History__c AH = new Account_History__c();
                AH.ObjectAccount__c=a.id;
                AH.Name_of_Field__c = 'BillingStreet';
                AH.Old_Field_Value__c = trigger.oldmap.get(a.id).BillingStreet;
                AH.New_Field_Value__c = a.BillingStreet;
                AH.Date_Happened__c = a.LastModifiedDate.date();
                   AH.Name = a.Name;
                AhList.add(AH);
            }
            if(a.BillingCity!=trigger.oldmap.get(a.id).BillingCity){
                Account_History__c AH = new Account_History__c();
                AH.ObjectAccount__c=a.id;
                AH.Name_of_Field__c = 'BillingCity';
                AH.Old_Field_Value__c = trigger.oldmap.get(a.id).BillingCity;
                AH.New_Field_Value__c = a.BillingCity;
                AH.Date_Happened__c = a.LastModifiedDate;
                AH.Name = a.Name;
                AhList.add(AH);
            }
            if(a.BillingState!=trigger.oldmap.get(a.id).BillingState){
                Account_History__c AH = new Account_History__c();
                AH.ObjectAccount__c=a.id; 
                AH.Name_of_Field__c = 'BillingState';
                AH.Old_Field_Value__c = trigger.oldmap.get(a.id).BillingState;
                AH.New_Field_Value__c = a.BillingState;
                AH.Date_Happened__c = a.LastModifiedDate.date();
                AH.Name = a.Name;
                AhList.add(AH);
            }
            if(a.BillingCountry!=trigger.oldmap.get(a.id).BillingCountry){
                Account_History__c AH = new Account_History__c();
                AH.ObjectAccount__c=a.id;
                AH.Name_of_Field__c = 'BillingCountry';
                AH.Old_Field_Value__c = trigger.oldmap.get(a.id).BillingCountry;
                AH.New_Field_Value__c = a.BillingCountry;
                AH.Date_Happened__c = a.LastModifiedDate.date();
                AH.Name = a.Name;
                AhList.add(AH);
            }
            if(a.BillingPostalCode!=trigger.oldmap.get(a.id).BillingPostalCode){
                Account_History__c AH = new Account_History__c();
                AH.ObjectAccount__c=a.id;
                AH.Name_of_Field__c = 'BillingPostalCode';
                AH.Old_Field_Value__c = trigger.oldmap.get(a.id).BillingPostalCode;
                AH.New_Field_Value__c = a.BillingPostalCode;
                AH.Date_Happened__c = a.LastModifiedDate.date();
                AH.Name = a.Name;
                AhList.add(AH);
            }
            
        }
        if(AHList.size()>0){
        insert AHList;
        }
    }
}