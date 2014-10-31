package main

import (
	"fmt"
)

func main() {
	showFibonacciSequence(-1)
}

func fibonacci(number int) int {
	if number < 2 {
		return 0
	} else if number == 2 {
		return 1
	} else {
		return fibonacci(number - 1) + fibonacci(number - 2)
	}
}

// 0, 1, 1, 2, 3, 5, 8, 13, 21, 34, ....
func showFibonacciSequence(nth int) {
	for i := 1; i <= nth; i++ {
		fmt.Printf("%d,",fibonacci(i))
	}
}