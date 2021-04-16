public class Test1 {

   
    public static void roughNotes(){
        
         Set<Id> set2 = new Set<id>();// This set is adding the IDs of Account which is parent to Contact
List <Contact> conlist = [Select id,LastName, AccountId from Contact where Department ='Salesforce Lab'];

for(Contact con: conlist){
    
    System.debug('Inside contact');
    if(con.AccountId!= null)
    set2.add(con.AccountId);// adding the parent object i.e. account's ids
        System.debug('Display ids of Account in set2 where Account=Shiva ' + set2);
    
}
List <Account> newacclist = New list<Account>();
           if(!set2.isEmpty()){
    
    List<Account> acc1 =[Select id from Account where id in: set2];
    for(Account acc: acc1){
        acc.Rating = 'Hot';
        acc.Industry = 'Not for Profit';
        System.debug('Account list where Account name is Shiva '+ acc);
        newacclist.add(acc);
                           }
    if(!newacclist.isEmpty()){
        Update newacclist;
       system.debug(newacclist);
    }
                             }

    }
}