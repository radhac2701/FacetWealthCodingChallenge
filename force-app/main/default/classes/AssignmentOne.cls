public class AssignmentOne {
  
    public static void firstMethod(){
    
Account Acc = New Account();
Acc.Name = 'PINGUS LLC';
Acc.ParentID = '0015x0000297Uuu';
Acc.AccountNumber = '186';
Acc.Site = 'www.pingus.com';
Acc.AnnualRevenue = 1000000.25;
Acc.Doll__c = '312.19';
Acc.Light__c = 'Lightn';
Acc.Rating = 'Warm';
Acc.Description = 'I am updating the record from the developer console';
Acc.NumberOfEmployees =  190;
Acc.Fax = '7993939412';
Acc.Phone  = '6784912341';
Acc.BillingStreet= '123 Main Street';
 Acc.BillingCity = 'McKinney';
Acc.BillingCountry = 'USA';    
 Acc.YearStarted ='2015';       
 Acc.ShippingCity = 'Atlanta';
 Acc.ShippingStreet = '123 Peachtree Road';
 Acc.ShippingCountry = 'USA';  
 Acc.Type = 'Prospect';   
insert Acc;
system.debug('Account inserted '+ Acc);
System.debug(Acc.Name + ' '+Acc.AccountNumber + ' '+ Acc.Site + ' '+Acc.AnnualRevenue);

        
        
/*Acc.BillingAddress = '123 Main Street';
        Acc.BillingCity ='McKinney';
        Acc.BillingCountry = 'USA';
        Acc.BillingPostalCode ='75071';*/
Contact Con = new contact();
con.AccountId = '0015x0000297WmX';
con.AssistantName = 'Assistant 2';
Con.AssistantPhone = '123456789';
Con.Birthdate 	= date.newInstance(2001,02,15);
Con.Email		= 'abc@def.com';
con.Fax			= '123456789';
Con.Title		= 'Raaaa';
Con.firstname	= 'Raj';
con.Lastname	= 'Gud';
con.Bank__c     = 'Chase';
con.See__c      = TRUE;
con.Languages__c = 'English, Spanish,Hindi,Telugu';
//Con.Support_First_Name__c = 'Support One';
//Con.Support_Last_Name__c = 'Support Last';
Con.MobilePhone = '122564789';
con.OtherPhone	= '258741369';
//Con.CurrencyIsoCode		= 'USD';
con.LeadSource		= 'Web';
Con.Level__c	= 'Primary';
        con.MailingStreet = '1450 N redbud Blvd, Suite #2';
        con.MailingCity = 'McKinney';
        con.MailingState = 'TX';
        con.MailingPostalCode = '75001';
Insert Con;
system.debug('inserted contact is '+ Con);
       
 Opportunity Opp = new Opportunity();
opp.Name		= 'Opp one';
Opp.StageName	= 'Value Proposition';
Opp.Amount		=100.50;
Opp.CloseDate	= Date.newInstance(2021,05,10);
Opp.Accountid	='0015x0000297WmX';
Opp.Order_Name__c= 'a095x0000117Yi3';
Opp.IsPrivate	= False;
Opp.OrderNumber__c	= '12345';
Opp.Age_above_59__c = FALSE;
Opp.Description	= ' This is new description';
opp.Type		='New Customer';
Opp.LeadSource	= 'Other';
Opp.NextStep	= 'ABC';
Opp.Probability	=  60;
Opp.TrackingNumber__c	= '12345';
Opp.DeliveryInstallationStatus__c	= 'Completed';
Opp.MainCompetitors__c	= 'Amazon';
Opp.CurrentGenerators__c	= 'ABC';
Opp.Branch__c = 'Arlington';
Opp.Contract_Type__c = 'New';         
Insert Opp;
System.debug('Inserted new Opportunity'+ Opp);


       

    }
     public static void secondMethod(){
        Case cas = New Case();
        cas.Status = 'New';
        cas.Origin = 'Phone';
        cas.Reason = 'Other';
       // cas.IsClosedOnCreate = TRUE;
       // cas.ContactEmail = 'case@gmail.com';
       // cas.ContactFax = '7701923595';
       // cas.ContactMobile = '6843822944';
        cas.Description = 'I am writing the description';
        cas.IsEscalated = FALSE;
        cas.Comments = 'I am inside of internal comments';
        cas.Priority = 'High';
        cas.Subject = 'Subject name is console developer';
        cas.ContactId ='003f200002RhzsL';
        cas.AccountId = '001f200001b0wd8';
        cas.AssetId = '02i5x00000ctFFC';
        cas.SuppliedEmail = 'suppliedemail@email.com';
        cas.SuppliedPhone = '1800299434';
        cas.SuppliedCompany = 'Supplied Company';
        cas.Type = 'Mechanical';
        cas.Write_Any_Comments__c = 'I am wiriting any commments for this case ';
        //cas.IsClosed =TRUE;
        insert cas;
        
         
        
    }
    
    
    
    
}