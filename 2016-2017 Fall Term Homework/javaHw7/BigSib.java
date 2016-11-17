//Jonathan Quang
//APCS1 pd5
//HW7 -- On BigSib Individuality and the Elimination of Radio Fuzz/working with instances and variables/modify BigSib to fit new Greet.java
//2016-09-23


public class BigSib {

	//declares a public variable so that Greet.java can access this variable directly
    public String helloMsg;
 
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
