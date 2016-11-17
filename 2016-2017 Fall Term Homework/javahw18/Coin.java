//Jonathan Quang
//APCS1 pd5
//HW18 -- Loopy
//2016-10-17

public class Coin {

	//initializing the variables
    private int value;
    private String upFace;
    private String name;
    private int flipCtr;
    private int headsCtr;
    private int tailsCtr;
    private double bias;

	//the default constructors setup everything except the coin type and value
    public Coin() {
	setFlipCtr(0);
	setHeadsCtr(0);
	setTailsCtr(0);
	setBias(0.5);
	setValue(0);
	setUpFace("heads");
    }

	//calls upon the default constructor and then sets the name and assigns a value in cents according to the nae
    public Coin (String theCoinType){
	this();
	setName(theCoinType);
	assignValue();
	
    }

	//does the above, but also sets the face
    public Coin (String theCoinType, String currentFace) {
	this(theCoinType);
	setUpFace(currentFace);
    }

	//assigns the value of the coin by adding to the default value of 0 according to name
    public void assignValue() {
	if (name == "dollar"){
	    setValue(value + 100);
	}
	if (name == "quarter") {
	    setValue(value + 25);
	}
	if (name == "dime") {
	    setValue(value + 10);
	}
	if (name == "nickel") {
	    setValue(value + 5);
	}
	if (name == "penny") {
	    setValue(value + 1);
	}

    }



	//defining the mutator methods
    public void setValue(int theValue){
	value=theValue;
    }
    public void setUpFace(String theUpFace) {
	upFace=theUpFace;
    }
    public void setName(String theName) {
	name=theName;
    }
    public void setFlipCtr(int theFlipCtr) {
	flipCtr=theFlipCtr;
    }
    public void setHeadsCtr(int theHeadsCtr) {
	headsCtr=theHeadsCtr;
    }
    public void setTailsCtr(int theTailsCtr) {
	tailsCtr=theTailsCtr;
    }
    public void setBias(double theBias) {
	bias=theBias;
    }
	
	//does a coin flip using Math.random(), which generates a double between 0 and 1, 
	//then compares it to the bias. If the number is greater than the bias, it returns head, else tails
    public String flip() {
	double randResult = Math.random();
	
	if (randResult < bias) {
		setUpFace("heads");
	    return "heads";
	}
	else {
		setUpFace("tails");
	    return "tails";
	}
    }

	//overwrites toString() to concatenate the name and the face of the coin 
    public String toString() {
	return name + "--" + upFace;
    }

	
	//overwrites .equals() to compre the upface of two coins
    public boolean equals(Coin otherCoin) {
		if (upFace == otherCoin.upFace) {
			return true;
		}
		else {
			return false;
		}
	}
	
    
    }
    
    

