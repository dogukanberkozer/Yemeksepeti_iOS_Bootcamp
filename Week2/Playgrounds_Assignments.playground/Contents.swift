import Foundation

// MARK : An extension that finds whether a given number is prime or not.
extension Int {
    func isPrime() -> Bool {
        var isPrime = true // to check the number isPrime or not
        
        if(self == 2 || self == 3){ // when the number equals to 2 or 3, self/2 is lower than 2 and in this case, the for loop becomes unworkable
            return true
        }else{
            for i in 2 ... self / 2 { // maximum half of the number can be divided for mod(%) = 0
                if(self % i == 0){
                    isPrime = false
                }
            }
        }
        return isPrime
    }
}

print(7.isPrime()) // extension call


// MARK : An instance of a generic with two parameters and different types
func workOn<T: Equatable, U: Numeric>(technology: T, duration: U) -> T { // different generic types (equatable & numeric)
    return ("\(technology) for \(duration) weeks heyyooo 🤩") as! T // return of the workOn function
}

if let result = workOn(technology: "🌱 I’m currently learning iOS development with Swift UIKit", duration: 2) {
    print(result) // 🔺 the value returned from the function is assigned to a variable
}


// MARK : Euler project 6
var result = 0

func sumOfSquare(radix: Int) -> Int {
    result = 0
    for i in 1 ... radix { // sum of the squares of the numbers
        result += Int(pow(Double(i), Double(2)))
    }
    return result
}

func squareOfSum(radix: Int) -> Int {
    result = 0
    for i in 1 ... radix { // sum of the numbers
        result += i
    }
    return Int(pow(Double(result), Double(2))) // square of the sum of the numbers
}

func difference(numbersTo: Int) -> Int { // function to calculate difference between the sum of the squares and the square of the sum.
    return squareOfSum(radix: numbersTo) - sumOfSquare(radix: numbersTo) // square of the sums minus sum of the squares
}

print(difference(numbersTo: 100)) // function call to find difference between the sum of the squares of the first one hundred natural numbers and the square of the sum.


// MARK : Euler project 7
var counterOfPrimes = 1, currentNumber = 1

while (counterOfPrimes < 10) { // if the case is <=, the loop calculates 10_002nd prime number too
    currentNumber += 2 // there is no even number as prime number except 2, so numbers for checking are all odd numbers after number 2
    if(currentNumber.isPrime() == true){
        counterOfPrimes += 1
    }
}

print(currentNumber)


// MARK : How do you determine "if let" - "guard let" usage preference?
print("'guard let' is worked out to exit the current function, loop, or condition if the check fails. Should used 'if let' if just want to unwrap some optionals, but prefer 'guard let' if need for specifically checking that conditions are correct before continuing.")


// MARK : Why do we use the static keyword?
struct bootcampStudent {
    static var purpose = "Working as an iOS developer at Yemeksepeti" // all students have the same purpose in this bootcamp
    var name: String
    var age: Int
}

let me = bootcampStudent(name: "Dogukan Berk", age: 24) // my name is Dogukan and 24 years old
print(bootcampStudent.purpose)
print("So, a Yemeksepeti iOS bootcamp student has a name and age that belongs to them, but they all have the same purpose. Uses 'static' keyword like this situation.")


// MARK : Taking the action of the first segment when the SegmentedControll is initially clicked
