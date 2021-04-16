trigger BillingAddressUniqueOnAccountObject on Account (before insert, before update) {
    // Check for existing Billing address means billing street, city, state, zipcode, country 
    // and throw an error if any duplicate billing address is being inserted 
    // Write this trigger using helper class on Account object
    
    if(trigger.isbefore){
        if(trigger.isinsert){
            BillingAddressUniqueAccountObject.duplicaterule(trigger.new, Null);
        }
        if(trigger.isUpdate){
            BillingAddressUniqueAccountObject.duplicaterule(trigger.new, trigger.oldMap);
        }
      }
        
    
}