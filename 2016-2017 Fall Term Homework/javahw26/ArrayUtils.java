//Jonathan Quang
//APCS1 pd5
//HW26 -- I Demand Arrays!
//2016-11-03




public class ArrayUtils {

    //populateArrayInt only accepts integer arrays. It uses a for loop to fill
    //each element of the array with a random integer from 0-100 inclusive.
    //Note that using only random integers from 0-100 was done for the sake of simplicity
    public static void populateArrayInt (int[] arr) {
	for (int x=0; x < arr.length; x+=1) {
	    arr[x] = (int)(Math.random()*101); 
	}
    }

    //StringifyArrayInt accepts integer arrays. It uses a foreach loop to add
    //each integer of the array to retStr seperated by new lines.
    //Once done, it will return retStr.
    public static String stringifyArrayInt(int[] arr) {
	String retStr = "";
	for (int x: arr) {
	    retStr += "\n" + x;
	}
	return retStr;
    }

    public static void main(String[] args) {
	int[] array1 = new int[6];//declares an integer array with 6 integers
	populateArrayInt(array1);
	System.out.print(stringifyArrayInt(array1));
	int[] data1;
	int[] data2 = new int[5];
	data2[0]=3;
	data2[1]++;
	data2[2]=data2[0]+data2[1];
	data2[3]=data2.length;
	//data2[4]=data1.length;
	//data2[5]=1;
	System.out.println(stringifyArrayInt(data2));
    }
}
