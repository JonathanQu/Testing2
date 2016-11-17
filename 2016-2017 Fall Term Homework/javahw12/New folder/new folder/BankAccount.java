//Team Smart Taxes (Jonathan Quang, Irene Lam, Tiffany Moi)
//Irene Lam
//APCS1 pd5
//HW12 -- Mo Money Mo Problems
//2016--10--01

public class BankAccount{
    /* The instance variables are Strings, ints, or double based on what they achieve in real life (i.e. names and passwords consist of alphabetical characters and potentially numbers, and thus should be Strings; the pin and account number (accNum) are purely integers (no fractions), and balance should have the capability of having decimal points (hence double)). */
    private String owner;
    private double balance;
    private int pin;
    private int accNum;
    private String password;
    /* Setting the variables to the given values with the help of mutators (Note: the code was modified from real life since we didn't know how the Java equivalent of random for the account number). */
    public BankAccount() {
	owner = "please input a name";
	password = "empty";
	pin = 9999;
	accNum = 999999999;
	balance = 0.0;
    } 
     /*This is for the scenario where no parameters are given. Their default values correspond with whether they are strings, ints, or double.*/

    public BankAccount(String name, double mulah,String pass, int fourdig, int ninedig){
        setOwner(name);
	setBalance(mulah);
	setPin(fourdig);
	setAccNum(ninedig);
	setPassword(pass);
	    }
    public void setOwner(String name){
	owner=name;
    } // Manually changes the name
    public void setBalance(double mulah){
	balance=mulah;
    } // Makes it easier to change the balance rather than doing calculations via deposit/withdrawals to get the desired balance
    public void setPin(int fourdig){
	if (fourdig>=1000 && fourdig<=9998){
	    pin=fourdig;
	}
	else {
	    pin=9999;
	    System.out.println(owner + ", The pin must be a value between 1000 and 9998");
	}
    } // Manually changes the PIN number. Also provides a safeguard against changing the PIN to a number less than 1000 and greater than 9998.
    public void setAccNum(int ninedig){
	if (ninedig >=100000000 && ninedig <= 999999998){
	    accNum=ninedig;
	}
	else {
	    pin=999999999;
	    System.out.println("The pin must be a value between 100000000 and 999999998");
	}
    } // Manually changes the account number. Also provides a safeguard against changing the account number to a number less than 100000000 and greater than 999999998.
    public void setPassword(String pass){
	password=pass;
    }
    public String toString(){
	return "Name: "+owner+"\nBalance: "+balance+"\nPin: "+pin+"\nAccount Num: "+accNum+"\nPassword: "+password;
	    }
    //deposit() returns a double to check that the transaction went through (also to make sure    
    //that my code works)
    public String deposit(double moneyIn){
	balance+=moneyIn;
	return "New Balance: " + balance;
	    }    
    //Checks to see if the balance is greater than or equal to the withdrawal sum, and returns 
    //an error message if the withdrawal sum is greater
    public boolean withdraw(double moneyOut){
	if (moneyOut<=balance){
	    balance-=moneyOut;
	    return true;
	}
	else {
	    System.out.println(owner + ", Error: Not enough money in the bank account. Take out less money. Be glad we don't charge an overdraft fee");
	    return false;
	}
    } 

    public Boolean authenticate(int ninedig, String pass){
	return password==pass && accNum==ninedig;
    } // Verifies that the account number and password matches

    public static void main(String args[]){
	BankAccount bob=new BankAccount();
	System.out.println(bob);
	BankAccount alicia = new BankAccount("Alicia",  2555.29, "pasd3au", 5562, 914522312);
	alicia.deposit(20);
	alicia.setBalance(199);
	alicia.withdraw(200);
	alicia.withdraw(100);
	alicia.setPin(111);
	alicia.authenticate(914522312, "pasd3au");
	alicia.authenticate(151551515, "pasd3au");
	System.out.println(alicia);

    }// Tests functionality
}
