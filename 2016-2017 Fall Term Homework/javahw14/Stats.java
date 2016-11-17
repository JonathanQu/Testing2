//Jonathan Quang
//APCS1 pd<5>
//HW#14 -- stAtistically sPeaking/ Statistics in java/ Use the math library to write a statistics library
//2016--10-06   



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





}
