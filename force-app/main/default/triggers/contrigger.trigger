trigger contrigger on Contact (after insert, after update, after delete, after Undelete) {
  // March 1
    set<id>accids = new set<id>();
    if(trigger.isundelete|| trigger.isinsert || trigger.isupdate){
        for(contact a : trigger.new ){
        accids.add(a.Accountid);    
        }  
    }
    if(trigger.isupdate || trigger.isdelete){
        for(contact a:trigger.old){
            if(a.accountid!=null){
                accids.add(a.Accountid);
            } 
        }    
    }
    if(!accids.isEmpty()){
        List<account> acclist = [select id, Contact_Size__c,(select id from contacts)
                                from account where id in:accids];
        if(!acclist.isempty()){
            list<account> updateacclist=new list<account>();
            for(account acc:acclist){
            account objacc=new account(id = acc.id,Contact_Size__c=acc.contacts.size());
                updateacclist.add(objacc);
            }
                if(!updateacclist.isempty()){
                    update updateacclist;
                
            }
        }
    }
    
    
    
}