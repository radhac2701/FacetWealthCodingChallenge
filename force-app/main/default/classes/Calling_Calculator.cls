public class Calling_Calculator {
    
    public void call(){
        Calculator c = new Calculator();
        String add = 'This method is going to add two numbers ' + c.add(10, 5);
        String sub = 'This method is going to subtract two number' + c.sub(10, 5);
        String divide = 'This method is going to divide two numbers' + c.divide(10, 5);
        String multiply = 'This method is going to multiply two numbers' + c.multiply(10, 5);
        String percent = 'This method is going to take percentage of two numbers' + c.percent(10, 5);
        System.debug(add);
        System.debug(sub);
        System.debug(divide);
        System.debug(multiply); 
        System.debug(percent); 
       // System.debug(modulus); 
       // not part of the assignment
        String me = ' Rem'+c.myMethod(223,6); 
        System.debug('Remainder: '+ me);
        
        
        
        
        
    }

}