
//1.Done შექმენით function რომლის მეშვეობითაც გამოითვლით ფაქტორიალს. function იღებს ერთ Int ტიპის ცვლადს და აბრუნებს ფაქტორიალს, ანუ მაგალითად თუ გადავაწვდით 5-იანს function-მა უნდა დაგვიბრუნოს 120 რომელიც მიიღო შემდეგი გამოთვლის შედეგად 5*4*3*2*1. არ გამოიყენოთ მზა ფუნქციები.
func factorial(factorialNumber: Int) -> Int {
    if factorialNumber == 0 {
        return 1
    } else {
        var result = 1
        for n in 1...factorialNumber {
             result *= n
        }
        return result
    }
}
print("1.",factorial(factorialNumber: 3))

//2.Done შექმენით function რომელიც აგენერირებს ფიბონაჩის პირველ 20 რიცხვს. არ გამოიყენოთ მზა ფუნქციები.
func fibonacci(fibonacciNumber: Int) -> [Int] {
    var fibonacciArray = [Int]()
    if fibonacciNumber >= 1 {
        fibonacciArray.append(1)
    }
    if fibonacciNumber >= 2 {
        fibonacciArray.append(1)
    }
    for _ in 2..<fibonacciNumber {
        fibonacciArray.append(fibonacciArray[fibonacciArray.count - 1] + fibonacciArray[fibonacciArray.count - 2])
    }
    return fibonacciArray
}
print("2.",fibonacci(fibonacciNumber: 20))

//3.Done შექმენით function რომელიც მიიღებს String-ს, function-მა უნდა შეამოწმოს პალინდრომია (წინიდანაც და უკნიდანაც იკითხება ერთნაირად) თუ არა ეს String-ი. მაგალითად "racecar" ამ შემთხვევაში ფუნქციამ უნდა დააბრუნოს true. არ გამოიყენოთ მზა ფუნქციები. შეგიძლიათ მეორე solution-ი მზა ფუნქციის გამოყენებით გვაჩვენოთ.
func isPalindrome(word: String) -> String {
    var wordReserved = ""
    for character in word {
        wordReserved = String(character)+wordReserved
    }
    if word == wordReserved {
        return "Yes"
    } else {
        return "No"
    }
}
print("3.",isPalindrome(word: "kayak"))

//4.Done შექმენით function რომელიც გადაცემულ რიცხვების array-ს ააკვარდატებს, დაპრინტავს და დააბრუნებს მნიშვნელობას.

func square(array: [Int]) -> [Int] {
    var squared = [Int] ()
    for n in 0..<array.count {
        squared.append(array[n] * array[n])
    }
    print("4.",squared)
    return squared
}
square(array: [2,3,5])

//5. შექმენით function რომელიც დაითვლის სიტყვების რაოდენობას String-ში, ფუნქციამ უნდა მიიღოს String-ი, და დააბრუნოს dictionary, სიტყვებით და იმ რაოდენობით რამდენჯერ იყო ერთი და იგივე სიტყვა გამოყენებული String-ში. uppercase და lowercase ასოები უნდა იყოს დაჰენდლილი ერთნაირად, მაგალითად თუ function-s გადავაწვდით "TBC x USAID, tbc it academy, we are in TBC academy." function-მა უნდა დააბრუნოს ["tbc": 3, "academy": 2, "we": 1, "are": 1, "in": 1, "it": 1, "x": 1]
func wordFrequency(in sentence: String) -> [String: Int] {
    
    let sentenceLowercased = sentence.lowercased()
    var buildWord = ""
    var words = [String]()
    var wordCounter = [String: Int]()

for char in sentenceLowercased {
    if char.isLetter { buildWord.append(char)
    } else {
        words.append(buildWord)
        buildWord = ""
    }
}
for word in words {
    if let count = wordCounter[word] {
        wordCounter[word] = count + 1
    } else {
        wordCounter[word] = 1
    }
}
    return wordCounter
}

let sentence = "TBC x USAID, tbc it academy, we are in TBC academy."
print("5.",wordFrequency(in: sentence))

//6. შექმენით Closure რომელსაც გადაეცემა რიცხვი და დააბრუნებს ამ რიცხვის ორობით ჩანაწერს.

let binary: (Int) -> String = { number in
    return String(number, radix: 2)
}
let numberToConvert = 13
print("6.",binary(numberToConvert))
      
//7.Done შექმენით Closure რომელიც გაფილტრავს(ანუ წაშლის) კენტ რიცხვებს Int-ების Array-დან.

let removeEvenNumbers:  ([Int]) -> [Int] = { numbers in
 return numbers.filter { $0 % 2 != 0 }
}

var numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9]
print("7.",removeEvenNumbers(numbers))


//8.Done შექმენით Closure რომელიც დამაპავს(ანუ გააკეთებს ქმედებას ყველა მასივის ელემენტზე) Int-ების Array-ის და თითოეულ ელემენტს გაათმაგებს
let multiply10: ([Int]) -> [Int] = { numbersMultiply10 in
    return numbersMultiply10.map { $0 * 10 }
}

let numbersMultiply10 = [12, 22, 23]
print("8.",multiply10(numbersMultiply10))

//9. გამოიყენეთ escaping closure სადაც 3 წამის შემდეგ დაბეჭდავს ჩაწოდებული მასივის ჯამს.
import Foundation

var printSum: ([Int]) -> Int = { numbersArray in
    var sum = 0
    for value in numbersArray {
        sum += value
    }
    return sum
}
var numbersArray = [1,2,3,4]
func printDelay(completion: @escaping () -> Void) {
    DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
        completion ()
    }
}
printDelay {
    print("9.",printSum(numbersArray))
}

//10. function-ს გადავცეთ String-ების array და დაგვიბრუნოს მხოლოდ კენტი რიცხვების მასივი. გამოიყენეთ high order functions.

let strings = ["1", "2", "three", "4", "five", "six", "7", "8"]

let convertNumbers = strings.compactMap {string in
    Int(string)
}.filter {oddNumbers in
    oddNumbers % 2 != 0
}
print("10.",convertNumbers)
