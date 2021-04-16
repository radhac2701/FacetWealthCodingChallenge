public class Homework7Interest {
    public void UpdateSalAmt(){
    
        List<Consultant__c> conlist = [Select id, name,Salary__c,Performance__c from Consultant__c 
                                       where Created_Date__c < 2021-02-26];
                                       System.debug('Inside the vs code');
                                       System.debug('Inside the developer console');
                                       //year(Created_Date__c) < year(today())];
        List<Consultant__c> connewlist = New list<Consultant__c>();
        for(Consultant__c con: conlist){
            if(con.Performance__c == 'Excellent'){
                con.Salary__c = con.Salary__c+(con.Salary__c * 0.3);
                connewlist.add(con);
            }
            else if(con.Performance__c == 'Very Good'){
                con.Salary__c = con.Salary__c+(con.Salary__c * 0.2);
                connewlist.add(con);
            }
            else if(con.Performance__c == 'Good'){
                con.Salary__c = con.Salary__c+(con.Salary__c * 0.1);
                connewlist.add(con);
            }
            else if(con.Performance__c == 'Satisfied'){
                con.Salary__c = con.Salary__c+(con.Salary__c * 0.05);
                connewlist.add(con);
            }
            else if(con.Performance__c == 'Poor'){
                con.Salary__c = con.Salary__c;
                connewlist.add(con);
            }
            else if(con.Performance__c == 'Bad'){
                con.Salary__c = con.Salary__c -(con.Salary__c*0.20);
                connewlist.add(con);
            }
            
        }
        if(!connewlist.isEmpty()){
            Update connewlist;
        }
        
        
    }
}    
        
        
        
        
        /*list <Manchester_United_c> Manunewlist = new list <Manchester_United_c>();
        list<Manchester_United_c> Manulist =[select id,name,performancec,Salaryc from Manchester_Unitedc where Number_of_Kids_c >5  ];
        for(Manchester_United__c MANU : Manulist ){
            if(MANU.performance__c == 'Excellent'){
                MANU.Salary_c = MANU.Salaryc + 0.3* MANU.Salary_c;
            }
            else if(MANU.performance__c == 'Good'){
                MANU.Salary_c = MANU.Salaryc + 0.2* MANU.Salary_c;
            }
            else if(MANU.performance__c == 'sats'){
                MANU.Salary_c = MANU.Salaryc + 0.1*MANU.Salary_c;
            }
            else if(MANU.performance__c == 'poor'){
                MANU.Salary_c = MANU.Salary_c;
            }
            else if (MANU.performance__c == 'Bad'){
                MANU.Salary_c = MANU.Salaryc - 0.2*MANU.Salary_c;
            }
        }
        
        if(!Manunewlist.isempty()){
            update Manunewlist;
        }
    }*/