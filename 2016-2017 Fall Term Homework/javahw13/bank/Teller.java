//Team Smart Taxes (Jonathan Quang, Irene Lam, Tiffany Moi)
//Tiffany Moi
//APCS1 pd5
//HW13 -- Outsourcing
//2016--10--05

public class Teller {
	public static void main (String[] args) {
		//should yield a functioning instance of a bank account
		BankAccount Joe = new BankAccount();

		//Sets the variables for instance Joe
		Joe.setvars("Bob", "imbob2", 1234, 123456789, 100.00);
		
		System.out.println("---Testing authenticate----");
		//The next two lines test the method authenticate. They should yield false and true respectively
		System.out.println(Joe.authenticate(123456789, "imbob1"));
		System.out.println(Joe.authenticate(123456789, "imbob2"));


		System.out.println("----Testing withdraw----");
		//The next two lines test the method withdraw. The should print an error stating that there is not enough money, while the latter line should subtract 1 from the balance (producing 999 in this scenario), and will print all of the user's information (e.g. name, password, pin, balance).
		Joe.withdraw(10000);
		Joe.withdraw(1);
		
		System.out.println("---Testing deposit----");
		//Deposit will print the entire user's information with the addition of the deposit (in this case 0.1)
		Joe.deposit(.01);
		
		System.out.println("---testing printing account stuff---");
		//The below methods will both print out all the user's information (the difference being that the former prints based on the code, while the latter returns the information and thus requires a System.out.prinln statement to show results)
		Joe.seeAccInfo();
		System.out.println(Joe.toString());
	}
}
