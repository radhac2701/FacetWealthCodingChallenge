public class Assignment5 {
    
    
    public static void ThridQuestion(){
        list <C__c> newclist1 = new list<C__c>();
        list <B__c> newblist1 = new list<B__c>();
        list <A__c> newalist1 = new list<A__c>();
        list<E__c> newelist1 = new list<E__c>();
        list<F__c> newflist1 = new list<F__c>();
        list <A__c> alist2 = [Select id, Name,FieldA1__c,FiledA2__c, 
                              ObjectB__r.FieldB1__c,ObjectB__r.FieldB2__c,ObjectB__r.ObjectC__r.FieldC1__c,
                             ObjectB__r.ObjectC__r.FieldC2__c, (Select id, name from Es__r), 
                              (Select id, name from Fs__r) from A__c limit 3];
        
        For(A__c alist3 : alist2){
            System.debug ('My A objects records are' + alist3);
            // updating A object Record
            alist3.FieldA1__c = 'First Name1';
            alist3.FiledA2__c = 'Last Name1';
            newalist1.add(alist3);
            
            // Updating B object Record
            
            System.debug ('My B objects records are' + alist3.ObjectB__r);
            
            alist3.ObjectB__r.FieldB1__c = 'Parent First Name1' ;
            alist3.ObjectB__r.FieldB2__c = 'Parent Last Name1';
            newblist1.add(alist3.ObjectB__r);
            //Updating C object record
            System.debug('My C objects records are ' + alist3.ObjectB__r.ObjectC__r);
            alist3.ObjectB__r.ObjectC__r.FieldC1__c = 'Grand Parent First Name1';
            alist3.ObjectB__r.ObjectC__r.FieldC2__c = 'Grand Parent Last Name1';
            newclist1.add(alist3.ObjectB__r.ObjectC__r);
            
            
            system.debug('My A Record is' + alist3);
    system.debug('My E object Record is' +alist3.Es__r);
    system.debug('My F records is'+alist3.Fs__r);
            for(E__c e : alist3.Es__r){
    system.debug('My E object Record is' +e);
        e.name = 'Ravan Bhrama';
        newelist1.add(e);
    }
    
    for(F__c f : alist3.Fs__r){
      system.debug('My F object Record is' +f); 
        f.name = 'Shri Ram';
        newflist1.add(f);
    }
     
    }
        if(!newalist1.isEmpty()){
            Update newalist1;
        }
        if(!newblist1.isEmpty()){
           Update newblist1; 
        }
        if(!newclist1.isEmpty()){
          Update newclist1;  
        }
        
        if(!newelist1.isEmpty()){
            Update newelist1;
        }
        if(!newflist1.isEmpty()){
            Update newflist1;
        }
        
        
    }
    public static void FirstQuestion(){
        list <C__c> newclist = new list<C__c>();
        list <B__c> newblist = new list<B__c>();
        list <A__c> newalist = new list<A__c>();
        list <A__c> alist = [Select id, Name,FieldA1__c,FiledA2__c, 
                              ObjectB__r.FieldB1__c,ObjectB__r.FieldB2__c,ObjectB__r.ObjectC__r.FieldC1__c,
                             ObjectB__r.ObjectC__r.FieldC2__c from A__c limit 3];
        For(A__c alist1 : alist){
            System.debug ('My A objects records are' + alist1);
            // updating A object Record
            alist1.FieldA1__c = 'First Name';
            alist1.FiledA2__c = 'Last Name';
            newalist.add(alist1);
            
            // Updating B object Record
            
            System.debug ('My B objects records are' + alist1.ObjectB__r);
            
            alist1.ObjectB__r.FieldB1__c = 'Parent First Name' ;
            alist1.ObjectB__r.FieldB2__c = 'Parent Last Name';
            newblist.add(alist1.ObjectB__r);
            //Updating C object record
            System.debug('My C objects records are ' + alist1.ObjectB__r.ObjectC__r);
            alist1.ObjectB__r.ObjectC__r.FieldC1__c = 'Grand Parent First Name';
            alist1.ObjectB__r.ObjectC__r.FieldC2__c = 'Grand Parent Last Name';
            newclist.add(alist1.ObjectB__r.ObjectC__r);
            
     
    }
        if(!newalist.isEmpty()){
            Update newalist;
        }
        if(!newblist.isEmpty()){
           Update newblist; 
        }
        if(!newclist.isEmpty()){
          Update newclist;  
        }
}
    public static void SecondQuestion(){
        list<E__c> newelist = new list<E__c>();
        list<F__c> newflist = new list<F__c>();
        list <A__c> allist = [Select id, name,FieldA1__c,FiledA2__c,
                             (Select id, name from Es__r), (Select id, name from Fs__r) from A__c];
        For(A__c alist1: allist){
            
    system.debug('My A Record is' + alist1);
    system.debug('My E object Record is' +alist1.Es__r);
    system.debug('My F records is'+alist1.Fs__r);
    for(E__c e : alist1.Es__r){
    system.debug('My E object Record is' +e);
        e.name = 'Ravan';
        newelist.add(e);
    }
    
    for(F__c f : alist1.Fs__r){
      system.debug('My F object Record is' +f); 
        f.name = 'Ram';
        newflist.add(f);
    }
}
        if(!newelist.isEmpty()){
            Update newelist;
        }
        if(!newflist.isEmpty()){
            Update newflist;
        }    
     }
        
    }