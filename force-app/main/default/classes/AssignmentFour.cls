public class AssignmentFour {
    
    public static void FirstQuestionandSecondQuestion(){
    
    Set<id> set2 = new Set<id>();// This set is adding IDs from B object, which is Parent to Object A, to compare with child object A
list <B__c> lisB = [select id, Name from B__c limit 10];// retrieving object B or parent object ids
for(B__c bee : lisB ){
    set2.add(bee.id);  //adding the parent object's,B, ids 
    System.debug('Display set1' + set2);
    
}
//System.debug('Display set1' + set1);

list<A__c> newlisA = New list<A__c> ();
if(!set2.isEmpty()){
    list<A__c> lisA = [select id, Name from A__c where ObjectB__c in : set2];// ObjectB_c field name in object A. retriving child obj records
    for(A__c aList : lisA){
        aList.FieldA4Update__c = 'udpdated@hotmail.com';
        newlisA.add(aList);
        System.debug('My object A record is' + aList);
    }
    if(!newlisA.isEmpty()){
        Update newlisA;
    }
}


Set <id> set4 = new Set<id> ();
 list <B__c> lisB2 = [Select id, Name, ObjectC__c from B__c limit 10];
For (B__c bee2 : lisB2)
{
    if(bee2.ObjectC__c !=null)
    set4.add(bee2.ObjectC__c);// adding the IDs of C object which is parent to Object B.
}

List <C__c> lisC = [Select id, Name from C__c where id in : set4]; // we are comparing ids of the parent object C in the condition
List <C__c> newlisC = New list<C__c> (); // creating new list to update the Object C.

        // if condition is checking for ids of Object C which is parent to object B
        if(!set4.ISEmpty()) 
{
    
    For(C__c cList : lisC){
        cList.UpdateStatus__c = 'Updating the Status';
        newlisC.add(cList);
        System.debug('My object C record is' + cList);
        //cList
    }
    if(!newlisC.isEmpty()){
        Update newlisC;
    } 
   
}


    }
    
    public static void ThirdQuestion(){
        Set<id> set2a = new Set<id>();// This set is adding IDs from B object, which is Parent to Object A, to compare with child object A

        list <B__c> newlisB1 = New list<B__c>();
        
        Set <id> set4a = new Set<id> ();
 //list <B__c> lisB2b = [Select id, Name, ObjectC__c from B__c limit 10];
 list <B__c> lisB1 = [select id, Name,ObjectC__c from B__c limit 10];
                for(B__c bee2b : lisB1 ){
                                         set2a.add(bee2b.id);  
                                         if(bee2b.ObjectC__c != null)
                                         set4a.add(bee2b.ObjectC__c);
                                         bee2b.UpdateEmail__c = 'up@ask.com';
                                         newlisB1.add(bee2b);
                                         }
    System.debug('Display records of Obj B set2a ' + set2a);
    System.debug('Display records of Obj C set4a '+ set4a);
        
    

    if(!newlisB1.isEmpty()){
        Update newlisB1;
    }
    
        list <A__c> newAlist = New list<A__c> ();
        if(!set2a.isEmpty()){
            list <A__c> lisA1 = [Select id, name from A__c where ObjectB__c in: set2a];
                for(A__c lista : lisA1){
                    lista.FieldA4Update__c = 'updated2@hotmail.com';
                    newAlist.add(lista);
                    System.debug('My object A records is ' +lista);
                    
                }

        }
        if(!newAlist.isEmpty()){
            Update newAlist;
        } 
    
    List <C__c> newClis = New list<C__c> ();
    if(!set4a.isEmpty()){
        list <C__c> lisC  = [Select id, Name from C__c where id in : set4a];
        for(C__c listc1 : lisC){
            system.debug('My records in Object C'+ listc1);
            listc1.UpdateStatus__c = 'Updated the Status';
            newClis.add(listc1);
        }
        
    }
    if(!newClis.isEmpty()){
        Update newClis;
    }

    
    }
    
    public static void FourthQuestion(){
        Set<Id> set1 = new Set<Id>();// This set is adding the IDs of Contact which is parent to Cases
Set<Id> set2 = new Set<id>();
List <Contact> conlist = [Select id, name from Contact where LastName  = 'Naga'];


for(Contact con: conlist){
    set1.add(con.id);// adding the parent object i.e. Contact's ids
        System.debug('Display ids of Contact in set1 where lastname =Naga ' + set1);
    
}
List <Case> newcalist = New list<Case>();
if(!set1.isEmpty()){
    
    List<Case> cas1 = [select id, CaseNumber from Case where ContactId in: set1];
    for(Case ca: cas1){
        ca.Status = 'Working';
        ca.Subject = 'Writing Apex Code';
        System.debug('Case list where Contact name is Naga'+ ca);
        newcalist.add(ca);
        
    }
    if(!newcalist.isEmpty()){
        Update newcalist;
        //System.debug('Updated case record'+ newcalist.Status);// Why is it saying Variable does not exist: Status? 
    }
}
        
    }
    public static void FifthQuestion(){
        
        Set<Id> set2 = new Set<id>();// This set is adding the IDs of Account which is parent to Contact
List <Contact> conlist = [Select id, name, AccountId from Contact where Department ='Lab'];

for(Contact con: conlist){
    if(con.AccountId!= null)
    set2.add(con.AccountId);// adding the parent object i.e. Contact's ids
        System.debug('Display ids of Account in set2 where Account=Shiva ' + set2);
    
}
List <Account> newacclist = New list<Account>();
           if(!set2.isEmpty()){
    
    List<Account> acc1 =[Select id, Name from Account where id in: set2];
    for(Account acc: acc1){
        acc.Rating = 'Hot';
        acc.Industry = 'Not for Profit';
        System.debug('Account list where Account name is Shiva '+ acc);
        newacclist.add(acc);
                           }
    if(!newacclist.isEmpty()){
        Update newacclist;}
                             }
    
}
    
    public static void SixthMethod(){
        Set<Id> set1 = new Set<Id>();// This set is adding the IDs of Contact which is parent to Cases
Set<Id> set2 = new Set<id>();// This set is adding the IDs of Account which is parent to Contact
List <Contact> conlist = [Select id, name, AccountId from Contact where Department ='Lab' AND LastName ='Naga'];
List<Contact> newconlist = New list<Contact>();
          for(Contact con: conlist){
    set1.add(con.id);
    System.debug('Display ids of Contact in set1 where lastname =Naga ' + set1);
    if(con.AccountId!= null)
    set2.add(con.AccountId);// adding the parent object i.e. Contact's ids
    con.Department = 'Salesforce Lab';
    con.Phone = '6781230000';
        System.debug('Display ids of Account in set2 where Account=Shiva ' + set2);
    newconlist.add(con);
                                  }
    System.debug('Display record of Contact' + set1);
    System.debug('Display record of Account' + set2);
if(!newconlist.isEmpty()){
    Update newconlist;
}


List <Account> newacclist = New list<Account>();
if(!set2.isEmpty()){
    
    List<Account> acc1 =[Select id, Name from Account where id in: set2];
    for(Account acc: acc1){
        acc.Rating = 'Warm';
        acc.Industry = 'Healthcare';
        System.debug('Account list where Account name is Shiva '+ acc);
        newacclist.add(acc);
    }
    if(!newacclist.isEmpty()){
        Update newacclist;
    }
}



List <Case> newcalist = New list<Case>();
if(!set1.isEmpty()){
    
    List<Case> cas1 = [select id, CaseNumber from Case where ContactId in: set1];
    for(Case ca: cas1){
        ca.Status = 'Escalated';
        ca.Subject = 'Combined Apex Code';
        System.debug('Case list where Contact name is Naga'+ ca);
        newcalist.add(ca);
        
    }
    if(!newcalist.isEmpty()){
        Update newcalist;
        //System.debug('Combined Updated case record'+ newcalist.Status);
    }
}
    }
    
    
    }