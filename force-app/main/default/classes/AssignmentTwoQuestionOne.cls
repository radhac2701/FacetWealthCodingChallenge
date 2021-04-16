public class AssignmentTwoQuestionOne {
    public static void firstMethod(){
     Contact con = [SELECT id from Contact where LastName = 'Katta' limit 1];
       Account acc = [Select id from Account where AccountNumber = '10876'Limit 1];
        con.AccountId =acc.id;
        update con;
        
System.debug('My udpdated contact is associated with account ' + con.AccountId);
        

Account Acc1 = [select name from Account where accountnumber = '10876' AND Name = 'UpdateAssignment1'];
system.debug('Retrived new account is '+ Acc1);
Acc1.Phone = '1111111111';
Update Acc1;

       
Account Acc2 = [select Id, name, Accountnumber, Phone from Account where accountnumber = '10876' Limit 1];
system.debug('Retrived new account is '+ Acc2);
Contact Con1 = [select name  from contact where name = 'Lead six Last six'];
system.debug('Retrived new Contact is '+ Con);
Con1.accountId = Acc2.id;
Update con1;
Opportunity Opp1 = [select name  from Opportunity where name = 'Opp one'];
system.debug('Retrived new Contact is '+ Opp1);
Opp1.accountId = Acc2.id;
Update Opp1;
Case CA = [select CaseNumber  from Case where CaseNumber = '00001132'];
system.debug('Retrived new Contact is '+ CA);
CA.accountId = Acc.id;
Update CA;

    }
    

}