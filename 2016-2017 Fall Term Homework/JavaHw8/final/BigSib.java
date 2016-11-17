//Jonathan Quang
//APCS1 pd5
//HW8 -- On the Origins of a BigSib/Constructors/modify BigSib to fit the new constructors
//2016-09-24


public class BigSib {

    public String helloMsg;
    public BigSib(String beginGreet) {
	setHelloMsg(beginGreet);
    }
    
    
 
	//since Greet mentions the function setHelloMsg, we gotta make a function for it
	//it appears that setHelloMsg only needs to set the variable helloMsg to whatever string input
    public void setHelloMsg( String newMsg) {
	helloMsg = newMsg;
    }
	
	//Accepts a string to construct the greet message from while referencing helloMsg
    public String greet (String name) {
	helloMsg += " "; 
	helloMsg += name;
	return helloMsg;
    }

}
