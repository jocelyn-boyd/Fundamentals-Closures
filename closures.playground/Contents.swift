import UIKit

//Question 1
//Write a function named `applyKTimes` that takes an integer `K` and a closure and calls the closure K times. The closure will not take any parameters and will not have a return value.

func applyKTimes(_ K: Int,_ closure:() -> ()) {
  for _ in 1...K {
    closure()
  }
}
applyKTimes(5) { print("Hello Closures!") }

//Question 2
//Use `filter` to create an array called `multiples` that contains all the multiples of 3 from `numbers` and then print it.

let numbers2 = [1, 2, 3, 4, 6, 8, 9, 3, 12, 11]
var multiples = numbers2.filter { $0 % 3 == 0 }
print(multiples)

//Question 3
//Find the largest number from `numbers` and then print it. Use `reduce` to solve this exercise.

let numbers = [4, 7, 1, 9, 6, 5, 6, 9]
let findTheLargestNumber = numbers.reduce(0, {(x, y) in return x > y ? x : y })
//ternary operator -> condition ? true : false
print(findTheLargestNumber)

//Question 4
//Join all the strings from `strings` into one using `reduce`. Add spaces in between strings. Print your result.
var strings = ["We", "Heart", "Swift"]

var joinedStrings = strings.reduce("", { if $0 == "" {return $1} else {return $0 + " " + $1}})
print(joinedStrings)

//Question 5
let cities = ["Shanghai", "Beijing", "Delhi", "Lagos", "Tianjin", "Karachi", "Karachi", "Tokyo", "Guangzhou", "Mumbai", "Moscow", "São Paulo"]

//a. Use `sortedBy` to sort `cities` in alphabetical order.
let sortedCitiesA = cities.sorted(by: { $0 < $1} )
print(sortedCitiesA)

//b. Use `sortedBy` to sort `cities` alphabetical order of the second character of the city name.
let dropFirsLetter = { (string: String) -> String in return "\(string.dropFirst())" }
let sortedCitiesB = cities.sorted(by: { dropFirsLetter($0) < dropFirsLetter($1) })
print(sortedCitiesB)

//c. Use `sortedBy` to sort `cities` in order of the length of the city name.
let sortedCitiesC = cities.sorted(by: {$0.count < $1.count } )
print(sortedCitiesC)


//Question 6
let citiesWithPopulation: [(String, Int)] = [("Shanghai", 24256800), ("Beijing", 21516000), ("Delhi", 16787941), ("Lagos", 16060303), ("Tianjin", 15200000), ("Karachi", 14910352), ("Karachi", 14160467), ("Tokyo", 13513734), ("Guangzhou", 13080500), ("Mumbai", 12442373), ("Moscow", 12380664), ("São Paulo", 12038175)]

//a. Use `sortedBy` to sort `citiesWithPopulation` in ascending order of population.
let ascendingOrderByPopulation =  citiesWithPopulation.sorted { $0.1 < $1.1 }
print(ascendingOrderByPopulation)

//b. Use `sortedBy` to sort `citiesWithPopulation` in reverse alphabetical order of the last character in the city name.
let reverseCitiesByLastCharacter = citiesWithPopulation.sorted {"\($0.0.last)" > "\($1.0.last)"}
print(reverseCitiesByLastCharacter)

//Question 7
//Sort `numbers` in ascending order by the number of divisors. If two numbers have the same number of divisors the order in which they appear in the sorted array does not matter.

var numbers7 = [1, 2, 3, 4, 5, 6]

let numberOfDivisors = {(num: Int) -> Int in
  var count = 0
  for i in 1...num {
    if num % i == 0 {
      count += 1
    }
  }
  return count
}

let ascendingOrderByNumOfDivisors = numbers7.sorted(by: {numberOfDivisors($0) < numberOfDivisors($1)})
print(ascendingOrderByNumOfDivisors)

//Question 8
//Find the sum of the squares of all the odd numbers from `numbers` and then print it.

var numbers8 = [1, 2, 3, 4, 5, 6]

//a. Write code that removes all the odd numbers from the array.
let removeOddNumbers = numbers8.filter { $0 % 2 == 0 }
print("Even Numbers: \(removeOddNumbers)")

//b. Write code that squares all the numbers in the array.
let squareNumbers = removeOddNumbers.map { $0 * $0 }
print("Squared Even Numbers: \(squareNumbers)")

//c. Write code that finds the sum of the array.
let findSumOfArray = squareNumbers.reduce(0) { (x, y) in x + y }
print("Sum of Sqaured Numbers: \(findSumOfArray)")

//d. Now use `map`, `filter` and `reduce` to solve this problem.
let oddSquaredSum = numbers8.filter({ $0 % 2 != 0}).map{($0 * $0)}.reduce(0) { (x, y) in x + y }
print(oddSquaredSum)
