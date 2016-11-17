


public class Repeater {
    
    public static String fenceW (int posts) {
	int counter = posts;
	String outString = "|";
	
	if (posts < 0) {
	    return "Error, no negatives please";
	}
	if (posts == 0) {
	    return "";
	}
	if (posts == 1) {
	    return outString;
	}
	while (counter > 1) {
	    outString += "-|";
	    counter -= 1;

	}
	return  outString;
	}

    

    public static String fenceR(int posts) {
	String outString = "";
	if (posts < 0) {
	    return "no negatives please";
	}
	if (posts == 0) {
	    return "";
	}
	if (posts == 1) {
	    return "|";
	}
	if (posts > 1) {
		return "|-" + fenceR(posts - 1);
	}
	return outString;
    }


    public static void main(String[] args) {
	System.out.println(fenceW(-1));
	System.out.println(fenceW(1));
	System.out.println(fenceW(2));
	System.out.println(fenceW(3));
	System.out.println(fenceW(4));
	System.out.println(fenceR(-1));
	System.out.println(fenceR(1));
	System.out.println(fenceR(2));
	System.out.println(fenceR(3));
	
	
	
    }

    
	  

    }


