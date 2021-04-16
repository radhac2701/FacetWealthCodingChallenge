trigger RatingAndBillingAddress02_25 on Account (before insert, before update) {

    // custom field call Rating - cold , warm, hot -
    // if cold - some european country - popluate billing address
    // if hot - South Africa address - popluate billing address
    // if warm - USA - - popluate billing address
    list<Account> acclist = New List<Account>();
    for (Account a: trigger.new){
    
      
        if(a.Rating__c == 'Cold'){
            
            a.BillingStreet = '10 Downing Street';
            a.BillingCity = 'London';
            a.BillingPostalCode = 'SW1A 2AA';
            a.BillingCountry = 'UK';
        }
        if(a.Rating__c =='Warm'){
            a.BillingStreet = '123 Main Street';
            a.BillingCity = 'McKinney';
            a.BillingPostalCode = '75015';
            a.BillingCountry = 'TX';
            
        }
        if(a.Rating__c =='Hot'){ 
            a.BillingStreet = '120 Plein St';
            a.BillingCity = 'Cape Town';
            a.BillingPostalCode = '8000';
            a.BillingCountry = 'SA';
           }
            

    }
    if(acclist.size()>0){
        insert acclist;
    }
}