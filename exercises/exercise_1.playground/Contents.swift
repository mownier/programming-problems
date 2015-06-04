/*
Problem 4
Write a function that given a list of non negative integers, arranges them such that they form the largest possible number. For example, given [50, 2, 1, 9], the largest formed number is 95021.
*/
/*
1. Arrange in descending order the content of the array by comparing the left-most digit.
1.1. When comparing x and y, if the first digit is equal, form 2 numbers: xy and yx. If xy is greater than yx, consider x as greater than y. Otherwise, consider y.
2. Extract the digits for each number having multiple digits resulting to an array of single digit number.
3. Sum all the digit that is multiplied by 10^(array count - (index + 1)).

Example:
input: [50, 2, 1, 9]
1. [9, 50, 2, 1]
2. [9, 5, 0, 2, 1]
3. (9 * 10^(5 - (0 + 1))) = 90,000 +
(5 * 10^(5 - (1 + 1))) = 5,000 +
(0 * 10^(5 - (2 + 1))) = 0 +
(2 * 10^(5 - (3 + 1))) = 20 +
(1 * 10^(5 - (4 + 1))) = 1
= 95,021

[20, 2, 1, 9]
[9, 20, 2, 1] = 92,021
[9, 2, 20, 1] = 92,201

[25, 24, 1, 9]
[9, 25, 24, 1] = 925,241
[9, 24, 25, 1] = 924,251

[233, 2441, 1, 9]
[9, 233, 2441, 1] = 923,324,411
[9, 2441, 233, 1] = 924,412,331
*/

func numberFromTwoNumbers(num1: Int, num2: Int) -> Int {
    /*
    10, 14 = 1014
    14, 10 = 1410
    */
    let num1Digits = extractNumberToDigits(num1)
    let num2Digits = extractNumberToDigits(num2)
    var resultDigits: [Int] = [Int]()
    
    for digit in num2Digits {
        resultDigits.append(digit)
    }
    
    for digit in num1Digits {
        resultDigits.append(digit)
    }
    
    let result: Int = numberWithDigits(resultDigits)
    
    return result
}

func numberRaiseToThePower(num: Int, power: UInt) -> Int {
    if (power == 0) {
        return 1
    } else if (power == 1 || num == 0 || num == 1) {
        return num
    }
    
    return num * numberRaiseToThePower(num, power - 1)
}

func numberWithDigits(digits: [Int]) -> Int {
    var result: Int = 0
    
    for var i = 0; i < digits.count; i++ {
        let digit = abs(digits[i])
        assert(digit / 10 == 0, "Single digit is expected.")
        let powerOf10 = numberRaiseToThePower(10, UInt(i))
        let value = digit * powerOf10
        result += value
    }
    
    return result
}

func extractNumberToDigits(number: Int) -> [Int] {
    var result: [Int] = [Int]()
    /*
    543 / 10 = 54.3 ( != 0 )
    543 % 10 = 3
    return 3
    54 / 10 = 5.4 ( != 0 )
    54 % 10 = 4
    return 4
    5 / 10 = 0
    return 5
    */
    
    var num: Int = number
    var quotient: Int = -1
    
    while (quotient != 0) {
        quotient = num / 10
        let remainder: Int = num % 10
        result.append(abs(remainder))
        num = Int(quotient)
    }
    
    return result
}

func swapValue(arr: [UInt], i: Int, j: Int) -> [UInt] {
    assert(i >= 0 && i < arr.count && j >= 0 && j < arr.count)
    
    var result = arr
    var num1 = arr[i]
    var num2 = arr[j]
    
    if (num1 == num2 && i == j) {
        return arr
    }
    
    result.removeAtIndex(i)
    result.insert(num2, atIndex: i)
    result.removeAtIndex(j)
    result.insert(num1, atIndex: j)
    
    return result
}

func bubbleSort(arr: [UInt]) -> [UInt] {
    /*
    [5, 3, 7, 1]
    iterate #1
    53 >= 35, (larger=5, [5, 3, 7, 1])
    37 >= 73, (larger=7, [5, 7, 3, 1])
    31 >= 13, (larger=3, [5, 7, 3, 1])
    swapped = true
    
    iterate #2
    57 >= 75, (larger=7, [7, 5, 3, 1])
    53 >= 35, (larger=5, [7, 5, 3, 1])
    31 >= 13, (larger=3, [7, 5, 3, 1])
    swapped = true
    
    iterate #3
    75 >= 57, (larger=7, [7, 5, 3, 1])
    53 >= 35, (larger=5, [7, 5, 3, 1])
    31 >= 13, (larger=3, [7, 5, 3, 1])
    swapped = false
    
    iterate stop
    
    */
    var result: [UInt] =  arr
    var done: Bool = false
    
    while (!done) {
        var swap: Bool = false
        
        for var i = 0; i < result.count - 1; i++ {
            let num1 = Int(result[i])
            let num2 = Int(result[i + 1])
            
            let num1num2 = numberFromTwoNumbers(num1, num2)
            let num2num1 = numberFromTwoNumbers(num2, num1)
            
            if (num2num1 > num1num2) {
                result = swapValue(result, i, i + 1)
                swap = true
            }
        }
        
        if (!swap) {
            done = true
        }
    }
    
    return result
}

func getTheLargestNumberFormedFromArray(arr: [UInt]) -> Int {
    var sorted: [UInt] = bubbleSort(arr)
    var resultDigits: [Int] = [Int]()
    
    for var i: Int = sorted.count - 1; i >= 0; i-- {
        let num: UInt = sorted[i]
        let numDigits: [Int] = extractNumberToDigits(Int(num))
        
        for var j: Int = 0; j < numDigits.count; j++ {
            let digit: Int = numDigits[j]
            resultDigits.append(digit)
        }
    }
    
    let result: Int = numberWithDigits(resultDigits)
    return result
}

let input: [UInt] = [2, 2000, 1, 9]
let largest: Int = getTheLargestNumberFormedFromArray(input)
