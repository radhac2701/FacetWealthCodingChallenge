public class AssignmentThird {

    
    public static void firstMethod(){
    
        
      List <String> strlist = New List<String> ();
        strlist.add('a');
        strlist.add('b');
        strlist.add('c');
        strlist.add('d');
        strlist.add('e');
        strlist.add('f');
        strlist.add(5,'f1');
        strlist.add(3,'z');
       // strlist.add('f');
        
        System.debug(strlist + 'size' + strlist.size());
        
        List <String> strlist1 = new List<String> ();
        strlist1.add('g');
        strlist1.add('h');
        strlist.addAll(strlist1);
        System.debug(strlist + 'size'+ strlist.size());
        Set <String> strset = New Set<String>();
        strset.add('j');
        strset.add('k');
        strset.add('l');
        strlist.addAll(strset);
        System.debug(strlist + 'size'+ strlist.size());
        
        List <String> stri = strlist.clone();
        
        
        
        //Boolean isEmpty = name.isEmpty();
        strlist.clear();
        
        
        
        
        
   /*     
        
        
     // first question Delete the records using SOQL AND UNDELETE statements using SOQL
        
        Account acc = new Account();
        acc = [Select id from Account where Name = 'Delete'];
        delete acc;
        
     undelete [Select id from Account where Isdeleted = TRUE ALL ROWS]; */
        
    }
}