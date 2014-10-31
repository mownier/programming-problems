package main 

import (
	"fmt"
	"strings"
)

func main() {
	word := "ABCDCBA"
	if isPalindrome(word) == true {
		fmt.Println("'" + word + "' is a palindrome.")
	} else {
		fmt.Println("'" + word + "'' is not a palindrome.")
	}
}

func isPalindrome(input string) bool {
	word := strings.Replace(input, " ", "", -1)
	if len(word) == 0 {
		return false
	} else {
		valid := true
		for i := 0; i < len(word)/2; i++ {
			leftMostCharacter := word[i]
			rightMostCharacter := word[len(word)-1-i]
			if leftMostCharacter != rightMostCharacter {
				valid = false
				break;
			}
		}
		return valid
	}
}
