//Jonathan Quang
//APCS pd5
//HW27 -- Recurse, Recurse, on Elements Not the First
//2016-11-3

public class Loopier {

    //linSearch accepts an integer array, and an integer to look for
    //It uses a for loop to scan from the left to right for the first occurence
    //of the target. It returns it, however, if there is no target found,
    //then the method moves out of the for loop and returns -1.
    public static int linSearch(int[] array1, int target) {
	for (int x=0; x < array1.length; x++) {
	    if (array1[x]==target) {
		return x;
	    }
	}
	return -1;
    }

    //linSearchR accepts an integer array, and a target. It is a helper
    //function that passes the array, the target, and 0 to linSearchRHelper
    public static int linSearchR(int[] array1, int target) {
	return linSearchRHelper(array1, target, 0) ;
    }

    //linSearchRHelper accepts the same as the above function, but also
    //and integer that keeps track of the index. It expects that index to be
    //0 when this method is first called
    //Base Case 1: the array[index] equivalent to target -> return the index
    //Base Case 2: we reached the end of the array and no match was fond -> -1
    //Recusion part: this method calls upon itself, passing the same inputs,
    //except curIndex is incremented by 1
    public static int linSearchRHelper(int[] array1, int target, int curIndex) {
	if (array1[curIndex]==target) {
	    return curIndex;
	}
	if (curIndex == array1.length) {
	    return -1;
	}
	return linSearchRHelper(array1, target, curIndex + 1);

    }

    //freq accepts and integer array and a target integer. It uses
    //a foreach loop to scan through the entire array. If there is a match,
    //retInt is incremented by 1. After the loop has been run through, it
    //outputs retInt
    public static int freq(int[] array1, int target){
	int retInt = 0;
	for (int x:array1) {
	    if (x==target) {
		retInt ++;
	    }
	}
	return retInt;
    }

    //freqRec accepts an integer array and a target integer. It passes these
    //values onto its helper function, along with 0 for the frequency and
    //curIndex
    public static int freqRec(int[] array1,int target) {
	return freqRecHelper(array1, target,0,0);
    }

    //this is the helper function. It accepts the above inputs, and expects
    //0 for its frequency and curIndex when it is first called
    //Base Case 1: reached the end of the array -> return frequency
    //then it checks if the array[index] is equal to the target -> frequency is incremented by 1
    //Recursive part: currIndex is incremebted by 1, then the helper function
    //is called once again
    public static int freqRecHelper(int[] array1,int target, int frequency, int curIndex) {
	if (curIndex == array1.length) {
	    return frequency;
	}
	if (array1[curIndex] == target) {
	    frequency += 1;
	}
	curIndex+=1;
	return freqRecHelper(array1, target, frequency,curIndex);
    }

    public static void main(String[] args) {
	int[] testArray = {0,3,6,9,12};
	System.out.println(linSearch(testArray,9) + " linSearch should return 3");
	System.out.println(linSearchR(testArray,12) + " linSearchR should return 4");
	int[] testArray2 = {0,1,2,3,2,3,3};
	System.out.println(freq(testArray2,2) + " freq should return 2");
	System.out.println(freqRec(testArray2,3) + " freqRec should return 3");
	
	
    }
}
