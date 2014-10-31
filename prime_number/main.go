package main

import (
	"fmt"
)

func main() {
	count := showPrimeNumbers(50)
	fmt.Printf("\nTOTAL: %d\n",count)
}

func isPrimeNumber(number int) bool {	
	if number < 2 {
		return false
	} else if number == 2 || number == 3  {
		return true		
	} else {
		valid := true
		for i := 2; i <= number/2; i++ {
			if number % i == 0 {
				valid = false
				break
			}
		}
		return valid
	}
}

// 1, 2, 3, 5, 7, 11, 13, 19, 23, 29, 37, ...
func showPrimeNumbers(number int) int {
	count := 0
	if number < 2 {
		fmt.Println("There's nothing to show.")
	} else {
		for i := 2; i <= number; i++ {
			if (isPrimeNumber(i)) {
				fmt.Printf("%d,",i)
				count++
			}
		}
	}
	return count
}