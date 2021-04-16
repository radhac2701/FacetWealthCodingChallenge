trigger opportunityClassTrigger on Opportunity (after insert, after update, after delete, after undelete) {
    
    if(trigger.isAfter){
        if(trigger.isInsert){
            OpportunityHelper03_04.AccountRevenueCalculation(trigger.new,null);
        }
        if(trigger.isUpdate){
            OpportunityHelper03_04.AccountRevenueCalculation(trigger.new, trigger.oldMap);
        }
        if(trigger.isDelete){
            OpportunityHelper03_04.AccountRevenueCalculation(trigger.old, null);
            
        }
        if(trigger.isUndelete){
            OpportunityHelper03_04.AccountRevenueCalculation(trigger.new,null);
        }
    
    }

}