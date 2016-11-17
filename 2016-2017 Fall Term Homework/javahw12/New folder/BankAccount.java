//Jonathan Quang Group:Smart Taxes
//APCS1 pd5
//HW11 -- Iterative Improvement/ Improving the Bank account code
//2016-09-28



public class BankAccount {
    //declare the variables according to how the show up in the real world
    private String owner;
    private double balance;
    private int pin;
    private int accNum;
    private String password;
	
	public BankAccount() {
		setAccount("Unassigned account", 0, 9999, 999999999, "Unassigned Password"); 
	
	}
	
	public BankAccount(String theOwner, double theBalance, int thePin, int theAccNum, String thePassword) {
		setAccount(theOwner, theBalance, thePin, theAccNum, thePassword);
	
	}
	
	
	public void setOwner (String theOwner) {
		owner=theOwner;
	}
	public void setBalance (double theBalance) {
		balance=theBalance;
	}
	public void setPin (int thePin) {
		pin=thePin;
	}
	public void setAccNum (int theAccNum) {
		accNum=theAccNum;
	}
	public void setPassword (String thePassword) {
		password=thePassword;
	}
	
	
	
	
    //sets the variables above to certain values
    public void setAccount(String theOwner, double theBalance, int thePin, int theAccNum, String thePassword) {
	if (thePin <= 9998 && thePin >=1000) {
			setPin(thePin);
		}
		else {
			setPin(9999);
			System.out.println("Invalid pin");
		}
		if (theAccNum <= 999999998 && theAccNum >= 100000000){
			setAccNum(theAccNum);
		}
		else {
			setAccNum(999999999);
			System.out.println("invalid account number");
		}
		setOwner(theOwner);
		setBalance(theBalance);
		setPassword(thePassword);
    }


    //print out the values associated with the bank account
    public void printAccount(){
	System.out.println("owner:" + owner);
	System.out.println("balance:" + balance);
	System.out.println("pin:" + pin);
	System.out.println("accNum:" + accNum);
	System.out.println("password:" + password);
	
    }

    //adds to the balance and prints out a message about what has occured
    public void depositMoney(double moneyInserted){
	balance += moneyInserted;
	System.out.println(moneyInserted + " has been deposited into the account. The new balance is " + balance);
    }

    //subtracts from the balance and prints out a message about what has occured
    public boolean withdrawMoney(double  moneyTaken){
		if (balance > moneyTaken){
			balance -= moneyTaken;
			System.out.println("your new balance is " + moneyTaken);
			return true;
		}
		else {
			System.out.println("You dont have enough money because you have " + balance + " in your account, but you tried to withdraw "  + moneyTaken);
			return false;
		}
		
    }
	



    //tests all the functions written above =)
    public static void main(String[] args) {
	BankAccount bobert = new BankAccount();
	System.out.println("Above is the empty constructor case, under is an actual test case");
	bobert.setAccount("Bobert", 100.01, 1234, 987654321, "password1" );
	bobert.printAccount();
	bobert.depositMoney(14);
	bobert.withdrawMoney(14);
	bobert.withdrawMoney(10000);
	
	
    }



}
