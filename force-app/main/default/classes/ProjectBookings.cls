public class ProjectBookings {
    
    public static void projectbooking(list<ProjectBooking__c> blist, Map <Id,ProjectBooking__c> oldmap){
    list<Account> lsttoupdate= new list<Account>();
        if(blist.size()>0){
            set<id> accids=new set<id>();
            for(ProjectBooking__c pp:blist){
                if(oldmap!=null && oldmap.size()>0){
                            // update context when Stage changes
                    if((pp.Stage__c =='Inactive'&&oldmap.get(pp.id).Stage__c!='Inactive')|| 
                       //update booking Amount 
                        (pp.Booking_Amount__c!=oldmap.get(pp.id).Booking_Amount__c))
                        {
                            accids.add(pp.Object_Project_Account__c);// look up relationship API
                        }//update in case project bookings gets reparented
                    if(pp.object_project_account__c!=oldmap.get(pp.id).object_project_account__c){
                        
                        // current parent record
                        accids.add(pp.Object_Project_Account__c);
                        // previous parent record
                        accids.add(oldmap.get(pp.id).Object_Project_Account__c);
                    }
                           else{
                     // insert, delete, undelete context
                    accids.add(pp.Object_Project_Account__c);
                }
            }
        
        
        }
            if(accids.size()>0){
                // Why are we writing SOQL query on Account? 
                // We are writing SOQL on Account becoz we are calculating Sum_of_Active_Booking__c on account object.
                // Why are we writing inner join? The inner join needs to be written to access Stage__c field. 
                list<account> lstacc=[select id,Sum_of_Active_Booking__c,(select id,Stage__c,Booking_Amount__c from ProjectBookings__r)from Account where id in:accids];
                for(Account ac:lstacc){
                    decimal sum=0;
                    // Why are we writing ProjectBooking__c pb:ac.ProjectBookings__r? Is it
                    for(ProjectBooking__c pb:ac.ProjectBookings__r){
                        if(pb.Stage__c=='In Progress' ||pb.Stage__c=='Planned'){
                            if(pb.Booking_Amount__c!=null){
                                sum=sum+pb.Booking_Amount__c;
                            }
                        }
                    }
                   ac.Sum_of_Active_Booking__c =sum;
                   lsttoupdate.add(ac);
                }
                if(lsttoupdate.size()>0){
                    update lsttoupdate;
                }
            }
        

     }
   }


}