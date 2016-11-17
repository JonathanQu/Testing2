

def closerNumber(a,b,c):
	if abs(c-a) < abs(c-b):
		return str(c) + " is closer to " + str(a)
	else:
		return str(c) + " is closer to " + str(b)

print closerNumber(7,16,10)
print closerNumber(20,3,8)
print closerNumber(-5,8,0)

def sumDigs(n): 
	storedSum = 0 
	num = n
	while num > 0:
		storedSum = storedSum + (num % 10)
		num = num / 10
	return storedSum
	
print sumDigs(14)

	
def funTableRow(a):
	return '<tr><td>' + str(a) + '</td><td>' + str(a ** 2) + '</td><td>' + str(sumDigs(a**2)) + '</td></tr>' 
	
print funTableRow(3)
	
def funTable(a,b):
	genTable = ''
	curNum=a
	while curNum <= b:
		genTable=genTable + funTableRow(curNum)
		curNum = curNum + 1
	return '<table border="1"><tr><td><b>n</b></td><td><b>n^2</b></td><td><b>sumDigits</b></td></tr>' + genTable + '</table>'
	
print funTable(1,10)