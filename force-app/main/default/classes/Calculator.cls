public class Calculator {
    
    public Integer a;
    public Integer b;
   
    
    public Integer add(Integer a, Integer b){
     Integer  sum = a+b;
        return sum;
    }
    public Integer sub(Integer a,Integer b){
       Integer  diff= a-b;
        return diff;
    }
    
    public Integer multiply(Integer a, Integer b){
        Integer mu = a*b;
        return mu;
    }
    public Integer divide(Integer a, Integer b){
        integer div = a/b;
        return div;
    }
    
    public Decimal percent(Integer a, Integer b){
       Integer per = (a/b) * 100;
         return per;
    }
    // Not part of assignment
    public Integer myMethod(Integer num, Integer divisor){
        
       // Integer modu = a - (a / b) * b;
       // return modu;
       
        Integer re = divisor/num;
            Integer modu = divisor - (re*num);
        
        return modu;
       /* 
        Integer i = 1; 
        Integer product = 0; 
        while (product <= num) { 
            product = divisor * i; 
            i++; 
        } 
  
        // return remainder 
        return num - (product - divisor); */
    } 
        
}