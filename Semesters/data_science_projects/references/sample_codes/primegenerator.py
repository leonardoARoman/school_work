# function name getAverage takes an array of integers and returns the average.
def getAverage( array_of_numbers ):
    sum = 0
    for index in range(len(array_of_numbers)):
        sum = sum + array_of_numbers[index]
    return sum/len(array_of_numbers);

numbers = [3,4,2,3,5,2,12,32,21,1,0,24,87,100,0,0,10,25,65,23,12,65,76,87,9,3,16,72]


# returns a list of prime numbers from 0 to n
print(getAverage(numbers))

def getPrimes( n ):
    if( n < 500):
        return
    primes = []
    isPrime = False
    while n > 1:
        for i in range(2,n):
            if(n%i == 0):
                isPrime = False
                break
            else:
                isPrime = True
        if(isPrime):
            primes.append(n)
            
        n -= 1
    primes.append(1)
    primes.sort()
    return primes;

print(getPrimes(500))

# api_key = open('EyZWqz4X3Zze8xdt8cQ-')
# quandl.get("Data", authtoken="API_key")
# df = quandl.get("ZILLOW/N68_LPCSSF", authtoken="EyZWqz4X3Zze8xdt8cQ-")
# print(df.tail())

# titani_train = pd.read_html('http://www.theus50.com/fastfacts/capital.php')
# print(titani_train[0])
