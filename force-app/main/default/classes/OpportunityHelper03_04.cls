public class OpportunityHelper03_04 {
   
    //class code                                  //trigger.new                //trigger.old
    public static void AccountRevenueCalculation(List<Opportunity> lstopp, Map<Id,Opportunity> oldMap){
        List <Account> lstToUpdate = new List<Account>();
        if(lstopp.size()>0){
            set<Id> accids = new set<Id>();// Are we collecting ids of Account object's record?
            for(Opportunity o: lstopp){
                if(oldMap!= null &&oldMap.size()>0){
                    
                    // Now stage name is closed won and prevoisuly not closed won
                    if((o.stagename=='Closed Won'&& oldMap.get(o.Id).stagename !='Closed Won')||
                      //if amount is not equal previous amount
                       (o.Amount != oldMap.get(o.Id).Amount)||
                       // if reparented 
                       (o.AccountId != oldmap.get(o.Id).Accountid)||
                       // closed lost now.
                    (o.stagename == 'Closed Lost'&& oldMap.get(o.Id).stagename !='Closed Lost')){
                           accids.add(o.AccountId);
                       } 
                }
                    else {// reparenting opportunity record to another account record
                           accIds.add(o.AccountId);
                       }
                  }
                if(accids.size()>0){
                    List<Account>  lstacc = [select id,Booking_Last_Year__c,Booking_Current_Year__c,Booking_Last_to_last_Year__c,
                                             Pipeline_Amount__c,
                                             (select id, IsWon,IsClosed,Closedate,Amount from Opportunities) from Account where id in:accids];
                    for(Account a: lstacc){
                        
                        // resetting value to 0 before going to new account
                        Decimal currentyear = 0;
                        Decimal pipeline = 0;
                        Decimal lastyear = 0;
                        Decimal lastToLastYear = 0;
                        Integer cYear = system.today().Year();// not using Date
                        Integer lYear = system.today().addyears(-1).Year();
                        Integer llyear = system.today().addyears(-2).Year();
                        for(Opportunity o:a.Opportunities){
                            // open stage and amount is not null
                            if(o.IsClosed == false){
                                if(o.Amount != null){
                                    pipeline = pipeline+ o.Amount;
                                    system.debug(pipeline);
                                }
                            }
                                
                                if(o.IsWon == true){
                                    
                                    // current year based on condition
                                    if(o.CloseDate.year()== cyear){
                                        if(o.Amount != null){
                                            currentyear = currentyear + o.Amount;
                                            system.debug(currentyear);
                                        }
                                    }
                                    //last year based on condition
                                    if(o.CloseDate.year() == lyear){
                                        if(o.Amount != null){
                                            lastyear = lastyear + o.Amount;
                                            system.debug(lastyear);
                                            
                                        }
                                        // last to last year based on condition
                                        if(o.CloseDate.year() == llyear){
                                            if(o.Amount!= null){
                                                lastToLastYear = lastToLastYear +o.Amount;
                                                
                                              system.debug(lastToLastYear);
                                            }
                                        }
                          
                                    }
                                }
                        }
                            a.Booking_Current_Year__c = currentyear;
                            a.Booking_Last_Year__c = lastyear;
                            a.Booking_Last_to_last_Year__c = lastToLastYear;
                            a.Pipeline_Amount__c = pipeline;
                            lstToUpdate.add(a);
                    }
                    
                        if(lstToUpdate.size()>0){
                            update lstToUpdate;
                        }
                
            }     
        }
    }

}