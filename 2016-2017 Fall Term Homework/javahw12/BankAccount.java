//Team Smart Taxes
//Irene Lam
//APCS1 pd5
//HW12 -- Mo Money Mo Problems
//2016-09-29
//NOTE: Portions of the below code involved collaboration with Carol Pan and Allard Peng

public class BankAccount {
    private String name; 
    private String passwd;
    private int pin;
    private int accNum;
    private double balance;
    // The instance variables are Strings, ints, or double based on what they achieve in real life (i.e. names and passwords consist of alphabetical characters and potentially numbers, and thus should be Strings; the pin and account number (accNum) are purely integers (no fractions), and balance should have the capability of having decimal points (hence double)).
    public BankAccount() {
	name = "please input a name";
	passwd = "empty";
	pin = 9999;
	accNum = 999999999;
	balance = 0.0;
    } //This is for the scenario where no parameters are given. Their default values correspond with whether they are strings, ints, or double. 
   public BankAccount(String person, String Passwd, int Pin, int AccNum, double Balance) {
	name = person;
	passwd = Passwd;
	if (Pin < 9999 && Pin > 999) {
	    pin = Pin; }
	else {
	    pin = 9999;
	    System.out.println ("PIN paramter invalid");
	}
	if (AccNum < 999999999 && AccNum > 99999999) {
		accNum = AccNum; }
	else {
	    accNum = 999999999;
	    System.out.println("Account Number Parameter invalid");
	}
	balance = Balance;
   } //This assigns the respective name, password, PIN, account number, and balance based on what is inputted in the main function. (Note: the code was modified from real life since we didn't know how the Java equivalent of random for the account number).
    public void nameChange(String person) {
	name = person;
    } // Manually changes the name
    public void passChange(String Passwd) {
	passwd = Passwd;
    } // Manually changes the password
    public void pinChange (int Pin) {
	if (Pin < 9999 && Pin > 999) {
	    pin = Pin; }
	else {
	    pin = 9999;
	    System.out.println ("PIN paramter invalid");
	}
    } // Manually changes the PIN number
    public void accNumChange (int AccNum) {
	if (AccNum < 999999999 && AccNum > 99999999) {
		accNum = AccNum; }
	else {
	    accNum = 999999999;
	    System.out.println("Account Number Parameter invalid");
	}
    } // Manually changes the account number
    public void balanceChange (double Balance) {
	balance = Balance;
    } // Makes it easier to change the balance rather than doing calculations via deposit/withdrawals to get the desired balance
    public void deposit(double sum) {
	balance = balance + sum;
    } // Adds the sum since deposits are positive
    public boolean withdraw(double sum) {
	if (balance  > sum) {
	    balance -= sum;
	    return true;
	}
	else {
	    System.out.println("Invalid withdrawal: insufficient money in account");
	    return false;
			       }
    } // Subtracts the sum because withdrawals decrease the amount in the balance.
    // public boolean authenticate(int AccNum, string Passwd) {
    //	return 
    public void info() {
	System.out.println ("Hello, " + name);
	System.out.println ("Your password is " + passwd);
	System.out.println ("Your PIN is " + pin);
	System.out.println ("Your account number is " + accNum);
	System.out.println ("Your balance is " + balance);
    } // Prints all the information with a string before so readers know what eached printed value signifies.
   
    public static void main( String[] args) {
	BankAccount Joe = new BankAccount();
	Joe.passChange("sfsdf");
	Joe.balanceChange(1235.3);
	Joe.info();
	BankAccount Alicia = new BankAccount("Alicia",  "pasd3au", 5562, 914522312, 2555.29);
	Alicia.deposit(20);
	Alicia.info();
	BankAccount Dan = new BankAccount();
	Alicia.balanceChange(199);
	Alicia.withdraw(200);
	Alicia.pinChange(111);
    }
}
