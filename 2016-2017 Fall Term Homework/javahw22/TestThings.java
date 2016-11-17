public class TestThings {
	public static String doubleChar(String str) {
		String retStr="";
		int counter = 0;
		while (counter != str.length()) {
			retStr+= str.substring(counter,counter+1) + str.substring(counter,counter+1);
			counter += 1;
		}
		return retStr;
	
	}
	
	public static int countHi(String str) {
		int retInt=0;
		for (int x=0; x < str.length()-1; x+=1) {
			if (str.substring(x,x+2).equals("hi")) {
			retInt += 1;
			}
		
		}
		return retInt;
		}
		
	public static boolean catDog(String str) {
		int numCat=0;
		int numDog=0;
		for (int x=0; x < str.length()-2; x+=1) {
			String threeChar=str.substring(x,x+3);
			if (threeChar.equals("cat")) {
				numCat+=1;
				}
			if (threeChar.equals("dog")) {
				numDog+=1;
				}
		}
		return (numCat==numDog);
	}
	
	public static int countCode(String str) {
		int retInt = 0;
		for (int x=0; x < str.length()-3; x+=1) {
			String fourChar = str.substring(x,x+4);
			String twoChar = fourChar.substring(0,2);
			String lastChar = fourChar.substring(3);
			if (twoChar.equals("co") && lastChar.equals("e")) {
				retInt += 1;
			}
		}
		return retInt;
	}
	
	public static boolean endOther(String a,String b) {
		a = a.toLowerCase();
		b = b.toLowerCase();
		if (a.length() <= b.length()) {
			String lastLetters = b.substring(b.length()-a.length());
			return lastLetters.equals(a);
		}
		else {
			return endOther(b,a);
		}
	}
	
	public static boolean xyzThere(String str) {
		boolean retBool = false;
		if (str.equals("xyz")) { //an exception because the code below only works with 4 or more characters
			return true;
		}
		for(int x = 1; x < str.length()-3; x+=1) {
			String subLen4=str.substring(x,x+4);
			if (subLen4.equals(".xyz")) {
				retBool = retBool || false;
			}
			else {
			String first3 = subLen4.substring(0,3);
			String previousChar = str.substring(x-1,x);
			boolean containsGoodStartXYZ=(first3.equals("xyz") && !(previousChar.equals(".")));
			
			String last3 = subLen4.substring(1);
			String firstChar=subLen4.substring(0,1);
			boolean containsGoodEndXYZ=(last3.equals("xyz") && !(firstChar.equals(".")));
			
			System.out.println(last3 + "|" + firstChar);
				if (containsGoodEndXYZ && containsGoodStartXYZ) {
				retBool = retBool || true;
				}
			}
		}
		return retBool;
	
	}
	
	
	public static void main(String[] args) {
		System.out.println(doubleChar("The"));
		System.out.println(countHi("ABChi hi"));
		System.out.println(catDog("1cat1cadodog"));
		System.out.println(countCode("cozexxcope"));
		System.out.println(endOther("Hiabc", "abc"));
		System.out.println(xyzThere("abc.xyzxyz"));

	}

}