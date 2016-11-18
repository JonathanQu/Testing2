//Jonathan Quang
//APCS1 pd5
//HW29 -- I Demand Arrays! Autoboxing variation?
//2016-11-17




public class ArrayUtils {

    //populateArrayInt only accepts object arrays. It uses a for loop to fill
    //each element of the array with a random integer from 0-100 inclusive.
    //Note that using only random integers from 0-100 was done for the sake of simplicity
	//the integer will then be autoboxed into its wrapper class Integer
    public static void populateArrayInt (Object[] arr) {
	for (int x=0; x < arr.length; x+=1) {
	    arr[x] = (int)(Math.random()*101); 
	}
    }

    //StringifyArrayInt accepts Object arrays. It uses a foreach loop to add
    //each object of the array to retStr separated by new lines.
    //Once done, it will return retStr.
    public static String stringifyArrayInt(Object[] arr) {
	String retStr = "";
	for (Object x: arr) {
	    retStr += "\n" + x;
	}
	return retStr;
    }

    public static void main(String[] args) {
	Object[] array1 = new Object[6];//declares an object array with 6 integers
	populateArrayInt(array1);
	System.out.print(stringifyArrayInt(array1));
	
    }
}
