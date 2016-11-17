//Jonathan Quang
//APCS1 pd<5>
//HW#15 -- May ah Hahv S’maur, Please?/ Statistics in java/ Augmenting the statistics library
//2016--10--07  



public class Stats{

	//pretty standard arithmetic mean stuff between 2 numbers
    public static int mean(int a, int b) {
	return (a+b)/2;
    }
    
    public static double mean(double a, double b) {
	return (a+b)/2;
    }
	
	//returns the maximum integer using if/else statements
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
	
	//returns the geometric mean, which is the nth root of the product of the numbers where n is the amount of numbers
	public static int geoMean (int a, int b) {
		return (int) Math.sqrt(a*b);
	}
	
	public static double geoMean (double a, double b) {
		return Math.sqrt(a*b);
	}

	
	//finds the max of 3 numbers by finding the max of the first two, then finding the max of the third and the previous max
	public static int max (int a, int b, int c) {
		return Stats.max(Stats.max(a,b),c);
	}
	
	public static double max (double a, double b, double c) {
		return Stats.max(Stats.max(a,b),c);
	}
	
	//finds the cubic root of the product of three numbers using  the Math.pow function which raises the product to
	//the one third power
	public static int geoMean (int a, int b, int c) {
		double closeAnswer = Math.pow(a*b*c , (1.0/3.0));
		return (int) Math.round(closeAnswer); //Rounding here is generally more accurate than truncating the decimal
	}

		public static double geoMean (double a, double b, double c) {
		double closeAnswer = Math.pow(a*b*c , (1.0/3.0));
		return closeAnswer;
	}



}
