@echo off
color 07
echo Welcome to a pick-your-own adventure where you play as Bezdomny
echo from the book The Master and the Margarita written by
echo Mikhail Bulgakov
echo Use your knowledge of the book to avoid being locked up in the asylum
pause
cls
echo You remember having a conversation about religion
echo with Berlioz. The profilic writer doubts the existence
echo of god and the like.
pause
cls
echo A foreigner walks by and shows interest in your conversation.
type woland.txt
pause
cls
echo you think to yourself "He's sticking to us like glue, the foreign pest!"
echo The foreigner comes off as odd to you.
echo He makes an even weirder prophecy.
echo He claims that Berlioz will have his head cut off when the moon has set
echo Then the foreigner says some absurd prediction about Annushka spilling sunflower oil.
echo This somehow prevents Berlioz from going to his meeting?
echo The foreigner introduces himself as a specialist in black magic/historian,
echo and gives us his card. Then, he begins a story about Pontius Pilate
cls
echo You wake up, and it appears that time has accelerated to the evening.
echo Berlioz is still debating with the consultant about the existence of religion.
echo All of sudden, the consultant starts speaking broken Russian
echo and talks about how if the devil exists, so must religion.
echo What strikes you the most is that the consultant says that he will receive a demonstration
pause
cls
echo Fast forward a little bit, and you hear a scream.
echo You see Berlioz's head, blood, and shattered glass.
echo You hear about Anushka spilling oil that caused him to slip.
echo You attempt to report the foreigner to the police, but he feigns innocence and runs.
echo You try to catch up to him
pause
cls
echo You chase him through an aparment and then a sudden thought overcomes you,
echo "he must be in the river?"
echo How do you deal with this thought?
echo 1)ditch your clothes and jump into the river
echo 2)give up, and go to the Massolit restauraunt
echo 3)go to the police station personally 
SET insanity=0
set /p answer= "What should you do?"
if %answer% == 1 goto gotRobbed
if %answer% == 2 set insanity=0
if %answer% == 2 goto resteraunt
if %answer% == 3 set insanity=0
if %answer% == 3 goto policeStationPersonally
:gotRobbed
cls
echo You swim in the river reeking of oil, but you cannot find the foreign criminal
echo You return to where you left your clothes, but find that you have been robbed
echo You arrive at the official Massolit restaurant
echo but your improvised appearance wearing white striped long johns and a peasant blouse leads some restaurant people to question your insanity
pause
set insanity=10
:resteraunt
cls
echo Well, you have barged into the restaurant
echo 1)Time is running low, tell people to quickly capture the consultant
echo 2)Explain how you met this man that predicted how Berlioz died, and you think he planned Berlioz's murder
echo 3)Realize that these people don't really care that much about Berlioz and run to the police station
set /p answer2= "How do you explain what happened to Berlioz?"
if %answer2% == 1 goto insaneCall
if %answer2% == 2 goto askForName
if %answer2% == 3 goto policeStationPersonally2
:policeStationPersonally
echo You go to the police station.
echo By now, you have calmed down.
pause
echo You explain the current predicament:
echo 1)Include Pontius Pilate in your explanation
echo 2)Include the foreigner's name in your explanation
echo 3)Include none of the above and give a regular explanation
set /p answer3= "What do you say?"
if %answer3% == 1 set /A insanity=%insanity%+10
if %answer3% == 1 goto asylum
if %answer3% == 2 set /A insanity=%insanity%+5
if %answer3% == 2 goto asylum
if %answer3% == 3 goto nationalLevelResponse
:insaneCall
cls
echo Your shouting has been interpreted as the ramblings of a mad man.
echo When someone inquires about the name of the alleged criminal,
echo You can only remember that his name began with a 'W'
echo This only makes the people in the restaurant think you are insane even more
pause
set /A insanity=%insanity%+10
echo Archibald and the doorman get the police and a van to cart you off to the asylum
pause
goto asylum
:askForName
echo When someone inquires about the name of the alleged criminal,
echo You can only remember that his name began with a 'W'
echo This only makes the people in the restaurant think you are insane
set /A insanity=%insanity%+5
pause
echo since you barged in and seem to have trouble remembering, Archibald and the doorman get the police and a van to cart you off to the asylum
pause
goto asylum
:policeStationPersonally2
echo You realize that barging into the restaurant was a mistake.
echo so you decide to leave and visit the police station personally
pause
echo The people in the restaurant assume you are insane since you just barged in and left.
echo This reasoning leads to you being carted off to the asylum
pause
goto asylum
:nationalLevelResponse
echo you report the crime sucessfully
echo Thankfully an investigation is launched before the foreign consultant can cause more trouble
echo Woland returns to hell early it seems...
pause
type woland2.txt
pause
color cf
echo to be continued
echo you have received the best ending
pause
goto:eof
:asylum
echo it seems you were knocked out in the van
echo you wake up in a doctor's room
pause
color fc
echo Ryukhin and a doctor begin questioning you
echo In your confusion and fustration you begin spewing out an incoherent story including Pontius Pilate
echo You see that it is late, 2AM, so the doctor lets you use the phone.
pause
echo 1)Call the police
echo 2)Put down the phone and retell the story in a coherent fashion without mentioning Pontius Pilate to make your story more believable
set /p answer4= "What do you do?"
if %answer4% == 1 goto asylum2
if %answer4% == 1 goto calmDown
:calmDown
cls
echo Your story seems logical at this point, so the doctor just reccomends you sleep for the night
pause
echo The next day, you wake up, and the doctor tells you to forget about the crime, telling you not to pursue the foreigner
echo You notice that there are quite a few foreigners that visit this asylum themselves, but not wanting to be locked up, you decide to agree and leave
pause
cls
goto:eof
:asylum2
set /A insanity=%insanity%+10
echo You call the police to send in five armed motorcycles,
echo To calm you down, the nurse gives you an injection
echo you fall asleep
pause
cls
echo the next day you wake up
echo your insanity level has been rated to be:
echo %insanity%
set bench1=11
set bench2=20
pause
if %insanity% LSS %bench1% goto safeEnding
if %insanity% LSS %bench2% goto mediocore
goto badEnding
:safeEnding
echo your insanity level is low enough that they will release you if you act normal for a week
pause
type endText.txt
pause
goto:eof
:mediocore
echo your insanity level is high enough to warrant a permenant stay in the asylum
pause
type endText.txt
pause
goto:eof
:badEnding
echo you are insane enough to be permenantly put on sedatives for the rest of your life
pause
type endText.txt
pause
goto:eof

