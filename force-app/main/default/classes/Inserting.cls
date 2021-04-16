public class Inserting {
         Account acc = New Account();
    public void AccountMethod(String K,String A, String B, String C, String D){
        Acc.Name = K;
        Acc.AccountSource = A;
        Acc.AccountNumber = B;
        Acc.BillingCity = C;
        Acc.BillingState = D;
       Insert Acc;
    }
    public void ContactMethod(String E, String F, String G){
        Contact con = New Contact();
        
        con.AccountId = acc.Id;
        con.Department = E;
        con.LastName =F;
        con.MailingState = G;
        Insert con;
      
    }
    
    public void OpportunityMethod(Boolean H, Date I,String J, String K){
      Opportunity opp = New Opportunity();
         opp.AccountId = Acc.Id;
         opp.IsPrivate = H;
         opp.CloseDate = I;
         opp.Name= J;
        opp.StageName = K;
        insert opp;
    
    }
    
    
    /*Account Acc= new Account();
    public  void AccountMethod(String K, string A, String B, string C,String D){
        Acc.Name = k;
        Acc.AccountSource = A;
        Acc.AccountNumber = B;
        Acc.BillingCity = C;
        Acc.BillingState = D;
        Insert Acc;
    }
    public void ContactMethod(String E, String F, String G){
        Contact con = new Contact();
        con.AccountId = acc.Id;
        Con.Department = E;
        Con.LastName = F;
        Con.MailingState = G;
        Insert con;
    }
    Public void opportunity(Boolean H, Date I, String J, string k){
        Opportunity opp = new Opportunity();
        opp.AccountId = Acc.id;
        opp.IsPrivate = H;
        Opp.CloseDate = I;
        Opp.Name = J;
        Opp.StageName = k;
        insert opp;
      
    }*/


}