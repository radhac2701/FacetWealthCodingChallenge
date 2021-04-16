trigger BillingAddressToShippingAddress02_25 on Account (before insert, before update) {
    // This code will also work when we edit -- update -- an existing record becasue of before update as trigger event
    // This code is only working when a record gets inserted not working when updating a record
// Whenever any account record is inserted, if you are passing Billing address then populate in shipping address
    List<Account> aclist = new List<Account>();
        for(Account ac: trigger.new){
            if(ac.BillingStreet !=null && ac.BillingCity != null && ac.BillingState != null && ac.BillingPostalCode != null){
                ac.ShippingStreet = ac.BillingStreet;
                ac.ShippingCity = ac.BillingCity;
                ac.ShippingState = ac.BillingState;
                ac.ShippingPostalCode = ac.BillingPostalCode;
                
            }
       
    }
    if(aclist.size()>0){

        insert aclist;
        
        
    }
    
    
}