package main

import (
	"fmt"
)

func main() {
	number := 2
	result := factorial(number)
	if result < 0 {
		fmt.Println("Invalid input.")
	} else {
		fmt.Printf("!%d = %d\n", number, result)
	}
}

func factorial(number int) int {
	if number == 1 || number == 0 {
		return 1
	} else if number < 0 {
		return -1
	} else {
		return number * factorial(number - 1)
	}
}