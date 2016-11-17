//Jonathan Quang
//APCS1 pd5
//HW18 -- Loopy
//2016-10-17


public class DriverCoin {


	//howManyUntilHeads assumes creation and coin flipping both work. Coin flipping must occasionally output "heads"
	//It will print a summary statement of the number of flips it took to get that many heads
	public static void howManyUntilHeads(int desiredHeads) {
		Coin theCoin = new Coin("quarter");
		int numHeads = 0;
		int numFlips = 0;
		while (numHeads < desiredHeads) {
			if (theCoin.flip() == "heads") {
				numHeads += 1;
				}
			numFlips += 1;
			}
		System.out.println("It took " + numFlips + " flips to get heads " + desiredHeads + " times.");
				
			}
			
	//howManyMatches assumes an integer input, functioning coin creation and flipping, and that the coin flips output one out of two possible values at a time 
	//it will print a summary statement of flips it took to get that many matches
	public static void howManyMatches(int desiredMatches) {
		Coin firstCoin = new Coin("quarter");
		Coin secondCoin = new Coin("quarter");
		int currentMatches = 0;
		int numFlips = 0;
		while (currentMatches < desiredMatches) {
			if (firstCoin.flip() == secondCoin.flip()) {
				currentMatches += 1;
			}
			numFlips += 1;
		}
		System.out.println("It took " + numFlips + " flips to get " + desiredMatches + " matches.");
		}
		
	//matches13YearOfBirth assumes the same as the above function
	//It will print a summary statement of flips it took to get at least 13 matches and matches divisible by the input integer
	public static void matches13YearOfBirth(int yearOfBirth) {
		Coin firstCoin = new Coin("quarter");
		Coin secondCoin = new Coin("quarter");
		int currentMatches = 0;
		int numFlips = 0;
		while ((currentMatches < 13) || !(yearOfBirth%currentMatches==0)) { //thank the java creators for short circuiting
			if (firstCoin.flip() == secondCoin.flip()) {
				currentMatches += 1;
				System.out.println("match");
				
			}
			numFlips += 1;
		}
		System.out.println("It took " + numFlips + " flips to get at least 13 matches and matches divisible by " + yearOfBirth + " at " + currentMatches + " matches.");
	}
	
	
    public static void main( String[] args ) {

	//build Objects from blueprint specified by class Coin

	
	//test default constructor
	Coin mine = new Coin();

	//test 1st overloaded constructor
	Coin yours = new Coin( "quarter" );

	
	//test 2nd overloaded constructor
	Coin wayne = new Coin( "dollar", "heads" );

	
	//test toString() methods of each Coin
	System.out.println("mine: " + mine);
	System.out.println("yours: " + yours);
	System.out.println("wayne: " + wayne);

	//test flip() method
	System.out.println("\nAfter flipping...");
	yours.flip();
	wayne.flip();
	System.out.println("yours: " + yours);
	System.out.println("wayne: " + wayne);

	//test equals() method
	if ( yours.equals(wayne) ) 
	    System.out.println( "Matchee matchee!" );
	else
	    System.out.println( "No match. Firestarter you can not be." );
		
	howManyUntilHeads(4);
	howManyUntilHeads(8);
	 
	 
	howManyMatches(7);
	howManyMatches(20);
	
	matches13YearOfBirth(2000);
	//matches13YearOfBirth(1999);

    }//end main

}//end class