public class BillingAddressUniqueAccountObject {
// March 2 Assignment Due on March 3 
// Throw error if billingaddress is not unique 
    public static void duplicaterule(List<Account> newList, Map<id,Account> oldmap){
        Map<string, Account> AccMap = new Map<string, account>();
        set<id> accids = new set<id>();
        
        // writing in sets to store the variables in keyvalue
        set<string> streetset = new set<string>();
        set<string> cityset = new set<string>();
        set<string> stateset = new set<string>();
        set<string> countryset = new set<string>();
        set<string> zipcodeset = new set<string>();
        if(oldmap == null){
            for(Account a : newList){
                streetset.add(a.BillingStreet);
                cityset.add(a.BillingCity);
                stateset.add(a.BillingState);
                countryset.add(a.BillingCountry);
                zipcodeset.add(a.BillingPostalCode);
                
                
            }
        }
        else{
            
            
               for(Account a : newList){
                    /* 
if(a.ID!=oldMap.get(a.Id).Id||a.BillingStreet!=oldMap.get(a.Id).BillingStreet 
                    ||a.BillingCity!=oldMap.get(a.Id).BillingCity ||a.BillingState!=oldMap.get(a.Id).BillingState
                      ||a.BillingCountry!= oldMap.get(a.Id).BillingCountry||a.BillingPostalCode!=oldMap.get(a.Id).BillingPostalCode)

 
                    */
                        
                   if(a.BillingStreet!=oldMap.get(a.Id).BillingStreet||a.BillingCity!=oldMap.get(a.Id).BillingCity 
                      ||a.BillingState!=oldMap.get(a.Id).BillingState
                      ||a.BillingCountry!= oldMap.get(a.Id).BillingCountry||a.BillingPostalCode!=oldMap.get(a.Id).BillingPostalCode)
                   {
                       
                streetset.add(a.BillingStreet);
                cityset.add(a.BillingCity);
                stateset.add(a.BillingState);
                countryset.add(a.BillingCountry);
                  zipcodeset.add(a.BillingPostalCode);}
                   }
            }
        
        List<Account> acclst = [select Id, BillingStreet,BillingCity,BillingState,BillingCountry,
                                BillingPostalCode from Account where BillingStreet in :streetset or BillingCity in :cityset 
                                or BillingState in :stateset or  BillingCountry in :countryset or BillingPostalCode in :zipcodeset ];
        if(acclst.size()>0){
            for(Account a : acclst){
                string keyval = a.BillingStreet+a.BillingCity+a.BillingState+a.BillingCountry+a.BillingPostalCode;
                AccMap.put(keyval,a);
            }
            for(Account acc : newList){
                string keyval = acc.BillingStreet+acc.BillingCity+acc.BillingState+acc.BillingCountry+acc.BillingPostalCode;
                if(AccMap.containskey(keyval)){
                    acc.addError('Address already exists, use different Address value');
                }
            }
        }
    }
}