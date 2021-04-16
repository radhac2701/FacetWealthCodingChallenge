trigger Booking on ProjectBooking__c (after insert, after update, after delete, after undelete) {
    
    if(trigger.isAfter){
        if(trigger.isInsert){
            ProjectBookings.projectbooking(trigger.new, null);
            
        }
        if(trigger.isUpdate){
            ProjectBookings.projectbooking(trigger.new,trigger.oldmap);
            
        }
        if(trigger.isDelete){
            ProjectBookings.projectbooking(trigger.old,null);
        }
        if(trigger.isUndelete){
            ProjectBookings.projectbooking(trigger.new, null);
            
        }
    }
    

}