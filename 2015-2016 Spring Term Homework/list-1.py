import random

def merge (firstList, secondList):
	OutputList = []
	SmallerList = []
	smallestListSize = 0
	#determine what list is bigger and smaller
	if len(firstList) > len(secondList):
		OutputList=firstList
		SmallerList=secondList
		smallestListSize = len(secondList)
	elif len(secondList) >= len(firstList):
		OutputList=secondList
		smallestListSize = len(firstList)
		SmallerList=firstList
	#determine the first comparison outside of the while loop to prevent an out of index range error
	if OutputList[0] >= SmallerList[0]:
		OutputList.insert(0,SmallerList[0])
	else:
		OutputList.insert(1,SmallerList[0])
	firstCounter = 1
	secondCounter = 0
	EndThis = 0
	#the while loop excluding comparing the last number of the longer string because there is no number that exists after the last
	while firstCounter < (len(OutputList) - 1):
		while secondCounter < len(SmallerList) and EndThis == 0:
			if SmallerList[secondCounter] < OutputList[firstCounter] and SmallerList[secondCounter] >= OutputList[firstCounter - 1]:
				OutputList.insert(firstCounter,SmallerList[secondCounter])
				EndThis = 1
			else:
				secondCounter += 1
		secondCounter = 0
		EndThis = 0
		firstCounter += 2
	if OutputList[(len(OutputList)-1)] >= SmallerList[smallestListSize-1]:
		OutputList.insert((len(OutputList)-1),SmallerList[smallestListSize-1])
	else:
		OutputList.append(SmallerList[smallestListSize-1])
	
	
	
	
	return OutputList
	
g1 = [0, 2, 4, 6, 8]
g2 = [1, 3, 5, 7]
print merge(g1, g2) 

def randomList(n):  
    listCon = []
    counter = 0
    while counter < n:
        listCon.append(random.randrange(-10,11))
        counter += 1
    return listCon

print randomList(5)

def doublify(aList):
    counter = 0
    while counter < len(aList):
        aList[counter] = aList[counter] * 2
        counter += 1
    return aList

print doublify( [3, 5, -20, 45] )

def barGraph(aList):
    counter = 0
    while counter < len(aList):
        print str(counter) + ":" + ("=" * aList[counter])
        counter += 1
    
        
x = [3,4,1,0,5]
barGraph(x)
