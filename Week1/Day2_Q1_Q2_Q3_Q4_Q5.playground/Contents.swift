import UIKit

// 1st Question
var sum1 = 0

for i in 1 ... 999 { // limit is 1k
    if(i % 3 == 0){ // only mod 3 == 0 numbers
        sum1 += i
    }
    if((i % 5 == 0) && (i % 3 != 0)){ // only mod 5 == 0 number
        sum1 += i
    }
}

print(sum1)


// 2nd Question
var sum2 = 0, num1 = 1, num2 = 1, num3 = 0

while num3 <= 4000000 { // lower then 4 million numbers
    num3 = num1 + num2
    if(num3 % 2 == 0){
        sum2 += num3
    }
    num1 = num2 // 2nd number must be 1st to keep going Fibonacci
    num2 = num3 // new Fibonacci number must be 2nd to keep going Fibonacci
}

print(sum2)


// 3rd Question
var numberToFactor = 0, primeFactor = 2

print(findLargestPrimeFactor(number: 600851475143))

func findLargestPrimeFactor (number : Int) -> Int {
    numberToFactor = number
    
    while numberToFactor > 1 { // number must be higher then 1
        if (numberToFactor % primeFactor == 0) { // when number mod primeFactor equals to 0, then new number equals to number/primeFactor
            numberToFactor /= primeFactor
        }else {
            primeFactor += 1 // // when number mod primeFactor doesn't equal to 0, keep going with next primeFactor number
        }
    }
    return primeFactor
}


// 4th Question
var result = 0

palindromeNumber()

func palindromeNumber() {
    for number1 in stride (from: 999, to: 100, by: -1){ // for the 1st number
        for number2 in stride(from: 999, to: 100, by: -1) { // counter of the 2nd number
            
            let number = number1 * number2
            let numberInStr = String(number) // to process in string format
            let reverseNumberInStr = String(numberInStr.reversed()) // get reversed string format of the number
            
            if (numberInStr == reverseNumberInStr) { // compares normal and reversed formats
                if (result < number) {
                    result = number // if they are the same, result is equal to new number
                    break
                }
            }
        }
    }
    print(result)
}


// 5th Question
var result5 = 1;
print(leastCommonMultiple(number5: 20))

func leastCommonMultiple(number5: Int) -> Int{ // to find least common multiple of the two numbers
    for i in 1 ... number5 {
        result5 = (result5 * i) / (greatestCommonDivisor(a: result5, b: i)) // uses greatestCommonDivisor to calculate leastCommonMultiple
    }
    return result5
}

func greatestCommonDivisor(a: Int, b: Int) -> Int{ // to calculate greatest common divisor of the two numbers
    if(a % b != 0){
        return greatestCommonDivisor(a: b, b: a % b)
    }else{
        return b
    }
}
