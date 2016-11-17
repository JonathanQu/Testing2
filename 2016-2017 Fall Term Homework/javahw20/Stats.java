//Jonathan Quang and Clive Johnston
//APCS1 pd<5>
//HW#20 -- HW #20: GCD Three Ways
//2016-10-20   



public class Stats{
    public static int mean(int a, int b) {
	return (a+b)/2;
    }
    
    public static double mean(double a, double b) {
	return (a+b)/2;
    }
    public static int max (int a, int b) {
	if (a > b) {
	    return a;
	}
	else {
	    return b;
		}
    }
	public static double max (double a, double b) {
		if (a > b) {
	    return a;
	}
	else {
	    return b;
		}
    }
	
	public static int geoMean (int a, int b) {
		return (int) Math.sqrt(a*b);
	}
	
	public static double geoMean (double a, double b) {
		return Math.sqrt(a*b);
	}
	
	
	//the is the brute force GCD finder, it assumes two positive integers, and counts from 1 to the smaller integer
	//It keeps tracks of the greatest factor of the two numbers as the counter goes up, then returns that factor
	public static int gcd( int a, int b) {
		int min = 0;
		int counter = 1;
		int storeFactor = 0;
		if (a < b) {
			min = a;
			}
		else {
			min = b;
			}
		
		while (counter <= min) {
			counter += 1;
			if (a%counter==0 && b%counter==0) {
				storeFactor=counter;
			}
		}
		return storeFactor;
			
	}
	
	/*Euclid's algorithm can be thought as comparing two sticks  of length A and B, where the goal is to
	  get the largest stick that when repeated, can fit into A and B without being shaved off. 
	  When stick A and B are put next to each other, the larger stick will contain the smaller stick and the difference in length.
	  This difference in length becomes a new stick, and the smaller stick becomes the larger stick.
	  If stick A is of length x(a) and stick B is of length x(b). If x is the greatest common factor, then the GCF of a and b should be 1.
	  If you follow Euclid's algorithm, eventually, a and b will equal 1, and all that is left is x, which is the GCF
	*/
	
	//gcdER takes two nonnegative integers and applies Euclid's algorithm to it to retrieve the greatest common factor
	public static int gcdER(int a, int b) {
		int min;
		int max;
		//the if else statement just sets the minimum and maximum values, which need to be known for Euclids algorithm
		if (a>b) {
			max = a;
			min = b;
			}
		else {
			max = b;
			min = a;
			}
		//if either value is 0, return the sum of the two, which is equivalent to returning the sum of the non zero number.
		if (max==0 || min==0) {
			return max+min;
			}
		//if the minimum divides into the maximum, we  have found our GCF, otherwise, we repeat this function, feeding in the minimum
		//and the difference between the max and minimum
		if (max%min==0){
			return min;
			}
		else {
			return gcdER(min,max-min);
		}
		
		//This is the while loop version of Euclid's  algorithm
		public static int gcdEW(int a, int b) {

			while ((a != 0) && (b !=0)) {
	    
			//set a as larger number
			if (a < b) {
			int tempholder = a;
			a = b;
			b = tempholder;
			}
	    
			//check divisibility
			if (a % b == 0) {
				return b;
			}

			//update
			int tempholder = a;
			a = b;
			b = tempholder - b;
		}
		return a + b;

    }//end gcdEW(a, b)
		
	}




}
