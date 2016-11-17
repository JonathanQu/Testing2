#Jonathan Quang
#Period 3 
#IntroCS2
#3/3/16

def taxiFare(miles,numCustomers):
	if numCustomers < 5:
		perMileMultiplier=1.50
	else:
		perMileMultiplier=2.50
	return miles * perMileMultiplier
	
def distance(x0, y0, x1, y1):
	return (((x1 - x0) ** 2)+((y1 - y0) ** 2)) ** 0.5

def closerPoint(x1,y1,x2,y2,x3,y3):
	if distance(x1,y1,x2,y2) < distance(x2,y2,x3,y3):
		return 1
	if distance(x2,y2,x3,y3) < distance(x1,y1,x2,y2):
		return 2
		
def sumDigs(n):
	storedSum = 0
	while n >= 0:
		storedSum = storedSum + (n % 10)
		n = n / 10
		if n < 10:
			return storedSum + (n % 10)
	
print taxiFare( 8, 3 ) 
#12
print taxiFare( 8, 6 ) 
#20
	
print closerPoint( 4, 0, 10, 0, 0, 0) 
#==> 1 (4, 0) is closer to (0, 0)
print closerPoint( 9, 0, 0, -3, 0, 0) 
#==> 2 (0, -3) is closer to (0, 0)

print sumDigs( 0) 
#==> 0
print sumDigs( 5) 
#==> 5
print sumDigs( 612) 
#==> 9