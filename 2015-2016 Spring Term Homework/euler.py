
#Problem 1
def multiples3and5Sum(UpperLimit):
	sumStorage=0
	n = 0
	while n < UpperLimit:
		if (0 == n%3) or (0 == n%5):
			sumStorage = sumStorage + n 
		n = n + 1
		
	return sumStorage
	
	
print multiples3and5Sum(1000)
print "number above is the answer to problem #1"

#problem 6
def sumSquareDifference(LargestNumberInclusive):
	squareEachSum = 0
	n = 0
	while n < (LargestNumberInclusive + 1):
		squareEachSum = squareEachSum + (n ** 2)
		n = n + 1
	sumOfNaturalNumbers = (LargestNumberInclusive * (LargestNumberInclusive + 1))/2
	squaredNaturalSum = sumOfNaturalNumbers ** 2
	return squaredNaturalSum - squareEachSum

print sumSquareDifference(100)
print "above number is the answer to problem #6"

#Problem 48

def SelfPowersSum(Maximum):
	theSum = 0
	StartingNum = 0
	while StartingNum < (Maximum + 1):
		theSum = theSum + (StartingNum ** StartingNum)
		StartingNum = StartingNum + 1
	return theSum
	
def getLastTenDigitsOfPowerSum(Maximum):
	return SelfPowersSum(Maximum) % (10 ** 10)
	
print getLastTenDigitsOfPowerSum(1000)
print "above number is the answer to problem #48" 

#Problem 14
def termsInCollatzSeq(number):
	currentNum=number
	termsInSeq=0
	while currentNum != 1:
		if 0 == (currentNum % 2):
			currentNum = currentNum / 2
			termsInSeq = termsInSeq + 1
		else:
			currentNum = (3.0 * currentNum) + 1
			termsInSeq = termsInSeq + 1
	return termsInSeq + 1

		

def LongestCollatzSequence(LargestNum):
	n=1
	highestSeedForSequence = 0
	highestTermsProducedByHighestSeed = 0
	numTerms = 0
	while n < LargestNum:
		numTerms = termsInCollatzSeq(n)
		if numTerms > highestTermsProducedByHighestSeed:
			highestSeedForSequence = n
			highestTermsProducedByHighestSeed = numTerms
		n = n + 1
		
		
	return highestSeedForSequence
	
print "Warning, the next answer will take a couple minutes to generate"
print LongestCollatzSequence(1000000)
print"Above is the answer for problem #14"
		
		
