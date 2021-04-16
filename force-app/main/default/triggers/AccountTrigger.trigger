trigger AccountTrigger on Account (before insert) {
    list<account>lstacc=new list<account>();
    for(Account a:trigger.new){
        if(a.name == 'Bheem'){
            a.Phone = '4791234532';
        }
    }
    if(lstacc.size()>0){
        insert lstacc;
    }
}