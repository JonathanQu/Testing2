def factorial(n):
	answer = 1
	while n != 1:
		if n == 0:
			return 1
		answer = answer * n
		n = n -1
	return answer

print '5! = ' + str(factorial(5))
print '0! = ' + str(factorial(0))

def repeat(theString,repeatNum):
	outputString = ''	
	while repeatNum != 0:
		outputString = outputString + theString
		repeatNum = repeatNum - 1
	return outputString

print repeat('hey',3)

def circlePoint(radius,x,y):
	if (x**2) + (y**2) == (radius**2):
		return '(' + str(x) + ',' + str(y) + ') is on the circle'
	elif (x**2) + (y**2) < (radius ** 2):
		return '(' + str(x) + ',' + str(y) + ') is inside the circle'
	else: 
		return '(' + str(x) + ',' + str(y) + ') is outside the circle'

print circlePoint(3,0,3)
print circlePoint(3,1,1)
print circlePoint(3,5,7)

def isLeapYear(theYear):
	if 0 == theYear % 400:
		return str(theYear) + ' is a leap year'
	elif 0 == theYear % 100:
		return str(theYear) + ' is not a leap year'
	elif 0 == theYear % 4:
		return str(theYear) + ' is a leap year'
	else:
		return str(theYear) + ' is not a leap year'
		
print isLeapYear(2012) #'2012 is a leap year'
print isLeapYear(1900) #'1900 is not a leap year'
print isLeapYear(2000) # '2000 is a leap year'
print isLeapYear(1983) # '1983 is not a leap year'
