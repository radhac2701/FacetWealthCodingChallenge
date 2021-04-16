public class PrimaryContactCannotBeDeleted {
    
    // this is a helper class
    public static void deleteCheck(list<contact> lstcon){
        System.debug(lstcon);
        if(lstcon.size()>0){
            for(Contact c: lstcon){
                //  Primary_Contact is checkbox data type and since if(condition)
                if(c.Primary_Contact__c){
                    c.adderror('Primary Contact can not be deleted');
                }
            }
        }
    }

}