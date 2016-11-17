public class DriverStat {

	

    public static void main(String[] args) {
	
	double jack = 15.121212;
	int joe = 14;
	
	System.out.println(Stats.mean(1,9));//5
	System.out.println(Stats.mean(5.5,10.5));//8.0
	System.out.println(Stats.max(1,5));//5
	System.out.println(Stats.max(1.2425,9.1515));//9.1515
	System.out.println(Stats.geoMean(2,18));//6
	System.out.println(Stats.geoMean(0.5,4.5));//1.5
	
	System.out.println(jack + joe);
	System.out.println("-------------Test gcd");
	System.out.println(Stats.gcd(100,200));//100
	System.out.println(Stats.gcd(417,695));//139
	System.out.println(Stats.gcd(695,417));//139
	System.out.println("-------Test gcdER");
	System.out.println(Stats.gcdER(100,200));//100
	System.out.println(Stats.gcdER(695,417));//139

    }
		    





}
