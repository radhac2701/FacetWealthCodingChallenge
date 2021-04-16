public class LeadTriggerHelper03_10 {

                             public static void emailVerification(List<Lead> lstLead, Map<Id,Lead> oldMap){
        
                                if(lstLead!=null&& lstLead.size()>0){
                                  set<String> emailSet = new set<String>();
                                      for(Lead l: lstLead){
                                         if(oldMap!=null && oldMap.size()>0){
                                             if(l.email!=oldMap.get(l.Id).email){
                                                // l.email = lstLead.email??
                                                 emailSet.add(l.email); 
                                                                                }
                                                                            }
                                          else{
                                              emailSet.add(l.email);
                                              }
                                          
                                  }
                                    if(emailSet!=null && emailSet.size()>0){
                                        //lead email = 'test@abc.com'
                                        set<String> emailofUserandContact = new set<String>(); // Why are we using the same variable for contact and user?
                                        //List<User> lstUser = select id, Email from User where email =: emailset]; 
                                        //Rather than using User u: lstUser we are writing with the SOQL query
                                        for(User u: [select id,email from User where email =:emailSet]){
                                            emailofUserandContact.add(u.email);
                                        }
                                        for(Contact c:[select id,email from Contact where email =: emailSet]){
                                            emailofUserandContact.add(c.email);
                                        }
                                        if(emailofUserandContact!=null&& emailofUserandContact.size()>0){
                                            for(Lead l: lstLead){
                                                if(emailofUserandContact.contains(l.email)){
                                                    l.adderror('Duplicate email');
                                                }
                                            }
                                        }
                                    }
                                    
                              } 
        
                         }
                                  public static void leadConvert(List<Lead> lstlead){
                                    Map<Id,Lead> activeLeads = new Map<Id,Lead>();
                                    set<String> companyNumber = new set<String>();
                                    Map<String,Id> accMap = new Map<String,Id>();
                                    List<Account> accountsTocreate = new List<Account> ();
                                    List<Contact> contactsTocreate = new List<Contact> ();
                                         List <User> usersTocreate = new List<User>();
                                         Map<String,Id> emailAccMap = new Map<String,Id>();
                                         Map<String,Id> emailConMap = new Map<String,Id>();
                         for(lead l:lstlead){
                                             companyNumber.add(l.Company_Number__c);
                                            }
         List<Account> lstAcc = [select id, Company_Number__c from Account where Company_Number__c in:companyNumber];
                    if(lstAcc.size()>0){
                            for(Account a:lstacc){
                                                  accMap.put(a.Company_Number__c,a.Id);   
                                                 }
                            for(Lead l: lstlead) {
                                if(accMap.containskey(l.Company_Number__c)){
                                                    activeLeads.put(l.Id,l);
                                                                           }
                                                 }
                        for(Lead l: activeLeads.values()){
                            Account acc = new Account();
                            acc.Name = l.FirstName+l.LastName;
                            acc.Email__c = l.email;
                            acc.ParentId= accMap.get(l.Company_Number__c);
                            accountsTocreate.add(acc);
                                                         }
                        if(accountsTocreate.size()>0){
                            insert accountsTocreate;
                            for(Account a:accountsTocreate){
                                emailAccMap.put(a.Email__c,a.Id);
                                                           }
                            
                            for(Lead l:activeLeads.values()){
                                Contact con = new Contact();
                                con.FirstName =l.FirstName;
                                con.LastName =l.LastName;
                                con.Email = l.Email;
                                con.AccountId =emailAccMap.get(l.email);
                                contactsTocreate.add(con);
                                
                           
                                                             }
                            if(contactsTocreate.size()>0)
                                insert contactsTocreate;
                            for(Contact c: contactsTocreate){
                                emailConMap.put(c.Email,c.Id);
                                
                                                            }
                            //String contactString = JSON.serialize(contactsTocreate)
                            
                            
                                                     }
                        
                                        }
                     //set<id> leadsIds =activeLeads.keyset();
                     createUsers(activeLeads.keyset());
                     List <Database.LeadConvert> leadConverts = new List<Database.LeadConvert>();
                     LeadStatus convertStatus = [Select Id,Masterlabel, IsConverted from LeadStatus where  IsConverted = true limit 1];
                      for(Lead l:activeLeads.values()){
                            
                            Database.LeadConvert lc = new Database.LeadConvert();
                             lc.setLeadId(l.Id);
                             lc.setAccountId(emailAccMap.get(l.Email));
                              lc.setContactId(emailConMap.get(l.Email));
                             lc.setDoNotCreateOpportunity(true);
                             lc.setConvertedStatus(convertStatus.MasterLabel);
                             leadConverts.add(lc);
                      
                                                 }
                   if(!LeadConverts.isEmpty()){
                          List<Database.LeadConvertResult> lcr = Database.convertLead(leadConverts);
                                            }
         
         
            
        
                         }   
          
                    
              
//@future (callout = true)
@future
public static void createUsers(set<Id> leadIds){
    // public static void createUsers(List <Id> leadIds, String contactstring)
    //List<Contact> lstcon = (List<Contact>)Json.deserialize(contactstring, List<Contact>class);
    List<Lead> leadLst = [select id,FirstName,LastName,Email from lead where id in:leadIds];
    List<User>  usersToCreate = new List<User>();
    Profile objProfile = [select Id from Profile where Name = 'System Administrator' limit 1];
    for(Lead l:leadLst){
        User objUser = new User();
        objUser.FirstName =l.FirstName;
        objUser.LastName = l.LastName;
        String aliasname = l.FirstName.substring(0,3)+ l.LastName.substring(0,3);
        objUser.Alias = aliasname;
        objUser.Email = l.Email;
        objUser.ProfileId = objProfile.Id;
        objUser.TimeZoneSidKey = 'GMT';
        objUser.LanguageLocaleKey = 'en_US';
        objUser.EmailEncodingKey = 'UTF-8';
        objUser.LocaleSidKey ='en_US';
        usersToCreate.add(objUser);        
                       }
    if(usersTocreate.size()>0){
        insert usersToCreate;
                            }
    
   }

 }