//Jonathan Quang
//APCS pd5
//HW28 -- I Was Born a Gamblin' Man
//2016-11-06

public class Slots {

    private static final String[] FRUITS = {
	"lime", "lime", "lime", 
	"lemon", "lemon", "lemon", 
	"cherry", "cherry", "cherry", 
	"orange", "orange", "orange", 
	"grapefruit", "grapefruit", "grapefruit", 
	"tangerine", "tangerine", "tangerine", 
	"ugli", "ugli", "ugli",
	"peach", "peach", "peach"
    };
    private String[] _fruits; //to be init'd by each instance

    


    /*=====================================
      Slots() -- default constructor
      pre:  constant array FRUITS exists, has been initialized
      post: mutable array _fruits contains same elements as FRUITS
      Uses a for loop to copy FRUITS to _fruits index by index
      =====================================*/
    public Slots() {

	_fruits = new String[FRUITS.length];
	for (int x=0; x < FRUITS.length; x++) {
	    _fruits[x]=FRUITS[x];
	}
    }


    /*=====================================
      String toString() -- overrides inherited toString()
      pre:  
      post: returns String of elements in slots 0 thru 2, separated by tabs
      =====================================*/
    public String toString() {
	return _fruits[0] + "\t" + _fruits[1] + "\t" +  _fruits[2];

    }


    /*=====================================
      void swap(int,int) -- array swap util fxn
      pre:  _fruits array exists
      post: elements at indices i, j are swapped
      This is achieved by having a string store the value of array[i] to,
      the loss of data, then setting array[i] to array[j], then setting 
      array[j] to the stored string before
      =====================================*/
    private void swap( int i, int j ) {
	String iOfArray = _fruits[i];
	_fruits[i] = _fruits[j];
	_fruits[j] = iOfArray;

    }


    /*=====================================
      void spinOnce() -- simulate a pull of the slot machine lever
      pre:  _fruits array exists
      post: randomized order of elements in _fruits array
      This method swaps random elements of the _fruits array 99 times.
      =====================================*/
    public void spinOnce() {
	for (int x=0;x<100;x++){
	    int firstSwap = (int)(Math.random() * _fruits.length);
	    int secondSwap = (int)(Math.random() * _fruits.length);
	    swap(firstSwap,secondSwap);
	   
	}
    }


    /*=====================================
      boolean jackpot() -- checks for a winning combo
      pre:  _fruits is existing array
      post: returns true if first 3 slots represent winning combo,
      false otherwise
      =====================================*/
    public boolean jackpot() {
	return (_fruits[0].equals(_fruits[1]) &&
		_fruits[0].equals(_fruits[2]) &&
		_fruits[1].equals(_fruits[2]));

    }


    /*=====================================
      boolean miniWin() -- checks for a winning combo
      pre:  _fruits is existing array
      post: returns true if first 3 slots represent winning combo,
      or if first 3 slots mutually distinct, 
      false otherwise
      =====================================*/
    public boolean miniWin() {
	if (jackpot()) {
	    return true;
	}
	if (!(_fruits[0].equals(_fruits[1])) &&
	    !(_fruits[0].equals(_fruits[2])) &&
	    !(_fruits[1].equals(_fruits[2]))) {
	    return true;
	}
	return false;
	
    }


    //main() method for testing
    public static void main( String[] args ) {
        
	Slots machine01 = new Slots();
	Slots machine02 = new Slots();
	
	//test to verify slot machines function indepently
	System.out.println();
	System.out.println( "Machine01 initial state:\t" + machine01 );
	System.out.println( "Machine02 initial state:\t" + machine02 );
	
	System.out.println( "\nSpinning machine01...\n" );

	machine01.spinOnce();

	System.out.println();
	System.out.println( "Machine01 state:\t" + machine01 );
	System.out.println( "Machine02 state:\t" + machine02 );
	System.out.println();

	
	//test gamble-until-you-win mechanism

	System.out.println( "Preparing to spin until a mini win! . . ." );
	System.out.println( "------------------------------------" );

	//if you haven't won, spin again until you win!
	while( machine01.miniWin() == false ) {
	    System.out.println( "Your spin..." + "\t" + machine01 );
	    System.out.println( "LOSE\n" );
	    machine01.spinOnce();
	}

	System.out.println( "====================================" );
	System.out.println( "Your spin..." + "\t" + machine01 );
	System.out.println( "WIN\n" );



	System.out.println( "Preparing to spin until...jackpot! . . ." );
	System.out.println( "------------------------------------" );

	//if you haven't won, spin again until you win!
	while( machine01.jackpot() == false ) {
	    System.out.println( "Your spin..." + "\t" + machine01 );
	    System.out.println( "LOSE\n" );
	    machine01.spinOnce();
	}

	System.out.println( "====================================" );
	System.out.println( "Your spin..." + "\t" + machine01 );
	System.out.println( "JACKPOT!\n" );
	
    }//end main

}//end class Slotspublic class Slots 
