@echo off
color 07
echo "it is night, and you have arranged for a North Korean agent with anger issues to pick you up at a field 2 miles from here"
pause
echo the situation is that the nuclear facility you are being trained at is heavily guarded
echo you have managed to sneak a knife and a crossbow with 3 bolts filled with paralysis poison
echo you managed to pickpocket 1000 in the local currency during the training program
echo you are sleeping in a room with three other people, one of which is a light sleeper
echo you have two choices
echo 1) open the door and walk out of the bedroom
echo 2) assassinate the light sleeper
set /p ANSWER= "What do you do?"
if %ANSWER% == 1 goto P1
if %ANSWER% == 2 goto P2
:P1
echo the door creaks and the light sleeper wakes up and looks at you
pause
echo three things pop into your head
pause
echo 1) run through the door
echo 2) throw 100 at him to shush him up
echo 3) charge at him
set /p ANSWER1= "Whats the plan man?"
if %ANSWER1% == 1 goto P3
if %ANSWER1% == 2 goto P4
if %ANSWER1% == 3 goto P3
:P2
echo you plunge your knife into his heart and clean the knife on his blanket
echo you open the door and it creaks, but nobody wakes up
goto P4
pause
:P3
color fc
echo woops
pause
echo you succeed in your action, but the noise alerts a guard and he shoots you
pause
goto theEND
:theEND
echo you lose
type losescreen.txt
pause
goto:eof
:P4
echo success you escape into the hallway
pause
echo you know you will get paid if you secure some north korean intel
echo or destroy some nuclear infrastructure
echo 1) computer room
echo 2) nuclear reactor room
set /p ANSWER4=
if  %ANSWER4% == 1 goto P5
if  %ANSWER4% == 2 goto nuclearReactorRoom
pause
:P5
echo you encounter a guard
color 4c
pause
echo he is looking over the computer room from the far corner
pause
echo 1)sneak past the guard by crouching under a desk
echo 2)use your crossbow on him
set /p ANSWER5= "How do I go about this"
if %ANSWER5% == 1 goto computerTerminalGuard
if %ANSWER5% == 2 goto computerTerminalNoGuard
:computerTerminalGuard
color 0A
echo the computer screen is black
pause
echo you look for the power button
pause 
echo you turn on the computer
pause 
echo the computer turns on and prompts for a password
pause
echo 1) 12345
echo 2) boom
echo 3) all hail the glorious dictator kim jung un
set /p ANSWERcomputerTerminalGuard= "Whats the password again?"
if %ANSWERcomputerTerminalGuard% == 1 goto beep
if %ANSWERcomputerTerminalGuard% == 2 goto beep
if %ANSWERcomputerTerminalGuard% == 3 goto accessAccepted
:computerTerminalNoGuard
color 0A
echo you power on the computer
pause
echo it prompts for a password
pause
echo you vaguely remember the password being one of these:
echo 1) 12345
echo 2) boom
echo 3) all hail the glorious dictator kim jung un
set /p thePassword= "what do you type?"
if %thePassword% == 1 echo the computer beeps and powers off
if %thePassword% == 1 goto computerTerminalNoGuard
if %thePassword% == 2 echo the computer beeps and powers off
if %thePassword% == 2 goto computerTerminalNoGuard
if %thePassword% == 3 goto accessAccepted
:beep
echo the computer makes a beep noise, and the guard is alerted
pause
echo he opens fire on you
color fc
pause
goto theEND
:accessAccepted
echo you plug in your flashdrive
pause
echo your flashdrive only stores 1GB
pause
echo there are three files of interest to you that are 1GB or less
echo 1)Nuclear Stuff Order Form
echo 2)Korean Imports
echo 3)Mr.Ting's childhood hopes and dreams
set /p theFile= "which do you download?"
goto theHallCompDone
:theHallCompDone
cls
echo you return to the hallway beside the bedroom
pause
echo 1)Head for the garage
echo 2)Head for the nuclear reactor room
set /p nextLocation= "where do you go?"
if %nextLocation% == 1 goto garage
if %nextLocation% == 2 goto nuclearReactorRoomCompDone
:nuclearReactorRoomCompDone
echo you have arrived at the nuclear reactor room
pause
echo you hear two guards talking to each other
pause
echo 1) shoot both guards with your remaining crossbow bolts
echo 2) run and knife both guards, you shouldn't waste those bolts
set /p killChoice= "What do you do?"
if %killChoice% == 1 goto reactor
if %killChoice% == 2 echo you kill once, but the other guard shoots you
pause
if %killChoice% == 2 goto theEND
:reactor
echo you arrive at the reactor room and you see four things you can break
echo you plan to take a part of what you break with you as proof
echo 1) shielding
echo 2) coolants
echo 3)moderators
echo 4)control rods
set /p stealChoice= "What do you break and take?"
goto garage
:nuclearReactorRoom
echo you have arrived at the nuclear reactor room
pause
echo you hear two guards talking to each other
pause
echo 1) shoot both guards with two crossbow bolts
echo 2) run and knife both guards, you shouldn't waste those bolts
set /p killChoice2= "What do you do?"
if %killChoice2% == 1 goto reactor2
if %killChoice2% == 2 echo you kill once, but the other guard shoots you
pause
if %killChoice2% == 2 goto theEND
:reactor2
echo you arrive at the reactor room and you see four things you can break
echo you plan to take a part of what you break with you as proof
echo 1) shielding
echo 2) coolants
echo 3)moderators
echo 4)control rods
set /p stealChoice= "What do you break and take?"
goto theHallReactorDone2
:theHallReactorDone2
cls
echo you return to the hallway beside the bedroom
pause
echo 1)Head for the garage
echo 2)Head for the computer room
set /p nextLocation2= "where do you go?"
if %nextLocation2% == 1 goto garage
if %nextLocation2% == 2 goto computerRoomReactorDone
:computerRoomReactorDone
echo you encounter a guard
color 4c
pause
echo he is looking over the computer room from the far corner
pause
echo 1)sneak past the guard by crouching under a desk
echo 2)use your crossbow on him
set /p ANSWER5= "How do I go about this"
if %ANSWER5% == 1 goto computerTerminalGuard2
if %ANSWER5% == 2 goto computerTerminalNoGuard2
:computerTerminalGuard2
color 0A
echo the computer screen is black
pause
echo you look for the power button
pause 
echo you turn on the computer
pause 
echo the computer turns on and prompts for a password
pause
echo 1) 12345
echo 2) boom
echo 3) all hail the glorious dictator kim jung un
set /p ANSWERcomputerTerminalGuard2= "Whats the password again?"
if %ANSWERcomputerTerminalGuard2% == 1 goto beep
if %ANSWERcomputerTerminalGuard2% == 2 goto beep
if %ANSWERcomputerTerminalGuard2% == 3 goto accessAccepted2
:computerTerminalNoGuard2
color 0A
echo you power on the computer
pause
echo it prompts for a password
pause
echo you vaguely remember the password being one of these:
echo 1) 12345
echo 2) boom
echo 3) all hail the glorious dictator kim jung un
set /p thePassword2= "what do you type?"
if %thePassword2% == 1 echo the computer beeps and powers off
if %thePassword2% == 1 goto computerTerminalNoGuard2
if %thePassword2% == 2 echo the computer beeps and powers off
if %thePassword2% == 2 goto computerTerminalNoGuard2
if %thePassword2% == 3 goto accessAccepted
:accessAccepted
echo you plug in your flashdrive
pause
echo your flashdrive only stores 1GB
pause
echo there are three files of interest to you that are 1GB or less
echo 1)Nuclear Stuff Order Form
echo 2)Korean Imports
echo 3)Mr.Ting's childhood hopes and dreams
set /p theFile= "which do you download?"
goto garage
:garage
echo you have taken what you could
pause
echo the field is two miles from here
pause
echo you see three ways to get there
echo 1)car
echo 2)stealth helicopter
echo 3)horse
set /p vehicleChoice= "how you gonna get there m8?"
if %vehicleChoice% == 1 goto car
if %vehicleChoice% == 2 goto helicopter
if %vehicleChoice% == 3 goto horse
:car
type car.txt
pause
echo the car roars to life
echo you drive the car off into the field, but the guards notice the noise
echo they open fire on you
pause
goto theEND
:helicopter
echo you turn on the engine in the helicopter
pause
type helicopter.txt
echo it lifts off the ground
pause
echo you forgot that garages have a roof and you crash the helicopter
pause
goto theEND
:horse
type horse.txt
pause
echo the horse refuses to move
echo 1) feed it the rest of your money
echo 2) flash the knife in front of the horse
set /p horseChoice= "whatcha gonna do m8?"
if %horseChoice% == 1 goto escape
if %horseChoice% == 2 goto mistakesweremade
:mistakesweremade
echo the horse starts stomping around and alerts the guards
pause
echo the guards swarm in
pause
goto theEND
:escape
echo after a while you meet the agent at the arranged location
pause
type agent.txt
pause
echo you present to him your things
pause
echo %theFile%
echo %stealChoice%
pause
set money=0	
if %theFile% == 1 set money=1000000
if %theFile% == 2 set money=500000
if %theFile% == 3 goto angryAgent
if %stealChoice% == 1 set /A money=%money%+1000000
if %stealChoice% == 2 goto angryAgent2
if %stealChoice% == 3 goto angryAgent2
if %stealChoice% == 4 set /A money=%money%+500000
if %money% == 0 goto noMoney
echo you have made
echo %money%
echo in USD
echo it looks like you could have earned more money
pause
echo play again?
pause
goto:eof
:angryAgent
echo is this a joke to you?
echo screams the agent
pause
echo how is mr ting's hopes and dreams relevant?
echo questions the agnet
pause
echo he shoots you
pause
goto theEND
:angryAgent2
echo the coolant and moderator could be water for all I know!
echo screeches the agnet
pause
echo that stuff is cheap as heck for even the north koreans to replace
echo he stabs you with your own knife
pause
goto theEND

