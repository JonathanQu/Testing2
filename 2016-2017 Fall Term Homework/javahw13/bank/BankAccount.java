//Team Take 2 (Thomas Lin, Alison Lee, Kristin Lin)
//APCS1 pd05
//HW#12 -- No Money No Problems
//2016-10-01

public class BankAccount {

    //instance variables 
    private String fullname; 
    private String password;
    private int pin;
    private int accnum;
    private double balance;

    /*Default constructor: sets the variables when no arguments are given
      Precondition: Constructor is called with no arguments
      Postcondition: variables of instance are set to default values
      ----------------------------------------------------------------*/
    public BankAccount () {
	fullname = "No Name";
	password = "No Password";
	pin = 9999;
	accnum = 999999999;
	balance = 0;
    }

    /*Method setvars: sets variables to the given values in the argument
      Precondition: name, password, pin, account number, and balance are given
      Postcondition: sets the instance vars to the given values
      ----------------------------------------------------------------*/
    public void setvars(String name, String pwd,int pin1,int accnum1,double balance1) {
	fullname = name;
	password = pwd;

	//Ensures that the given pin is valid. If it is not, set to the default 9999
	if (pin1 > 9999 || pin1 < 1000){
	    pin = 9999;
	    System.out.println ("Pin Invalid.");
	} else {
	    pin = pin1;
	}
	
	/*Ensures that the given account number is valid. If it is not, set to the default    
  999999999*/
	if (accnum1 > 999999999 || accnum1 < 100000000) {
	    accnum = 999999999;
	    System.out.println ("Account Number Invalid.");
	} else {accnum = accnum1;
	}

	balance = balance1;
	/*it then calls seeAccInfo, which will print all the acc's info, to show the var values
  are set correctly*/
	seeAccInfo ();
    }

    /*Method authenticate: checks if the given password matches the one associated with the    
      given account number
      Precondition: account number and password are given
      Postcondition: returns if the given info is correct
      ----------------------------------------------------------------*/
    public boolean authenticate(int accnum1, String password1) {
	if (accnum1 == accnum && password1 == password){
	    System.out.println ("\nCredentials verified.");
	    return true;
	} else {
	    System.out.println ("\nCredentials invalid");
	    return false;
	}
    }

      /*Method toString: overwrites the prewritten method to return account information
      Precondition: none
      Postcondition: returns account information of an instance
      ----------------------------------------------------------------*/
    public String toString(){
	String retString;
	retString = "\nName:" + fullname; 
	retString += "\nPassword:" + password;
	retString += "\nPin:" + pin;
	retString += "\nAccount Number:" + accnum;
	retString += "\nBalance:$" + balance;

	return retString;
    }

      /*Method seeAccInfo: prints account information of an instance
      Precondition: none
      Postcondition: prints account info
      ----------------------------------------------------------------*/
    public void seeAccInfo () {
	System.out.println (toString ());
    } 

    /*Method withdraw: allows instance to take out money if it is less the amount left in the 
      account. If not, it prints an error.
      Precondition: withdraw amount is given
      Postcondition: prints an error if amount is too much or subtracts the amount withdrawn 
      from the account and prints the new account information
    ----------------------------------------------------------------*/
    public void withdraw (double amt) {	
	if (balance < amt){
	    System.out.println ("\nError: Not enough money.");
	} else {
	    balance -= amt; 
	    seeAccInfo ();
	}
    }

    /*Method deposit: puts in money to the account
      Precondition: amount deposited is given
      Postcondition: adds the amount of money to the account balance and prints the new 
      account information
    ----------------------------------------------------------------*/
    public void deposit (double amt) {
	balance += amt;
	seeAccInfo ();
    }

 //main method that creates instance person with its own full set of instance variables. Then to test, it calls setvars, withdraw, and deposit   
 /*   public static void main(String [] args) {
	//functioning
	BankAccount person = new BankAccount ();
	person.setvars ("Harry Potter", "yerawizardharry", 1234, 123456789, 3200);

	//Withdrawl of $12.10
	System.out.println ("\n---TEST CASE-Withdrawl of $12.10---");	
	person.withdraw (12.1);

	//Deposit of $12.20
	System.out.println ("\n---TEST CASE-Deposit of $12.20---");
	person.deposit (12.2);

	//pin and password invalid
	System.out.println ("\n--Dumbo's Invalid Bank Account---");
	BankAccount Dumbo = new BankAccount ();
	Dumbo.setvars ("Dumbo", "flappyears", 293, 122234, .23);

	//not enough in balance
	System.out.print ("\n--Dory's Bank Account--");
	BankAccount Dory = new BankAccount();
	Dory.setvars ("Dory", "42WallabyWay", 4321, 987654321, 3.14); 

	//Withdraw Error
	System.out.print ("\n---TEST CASE- Invalid Withdraw---");
	Dory.withdraw (4.13);

	//Authenticate Error
	System.out.print ("\n---TEST CASE- Invalid Credentials---");
	Dory.authenticate (123123123, "abcde");
	}*/

  }

