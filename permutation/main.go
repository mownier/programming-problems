package main

import (
	"fmt"
	// "strings"
)

type Permutation struct {
	Results []string
}

func (p *Permutation) Process(str string) {
	p.permute([]byte(str), 0, len(str)-1)
}

func (p *Permutation) swap(str []byte, i, j int) {
	str[i], str[j] = str[j], str[i]
}

func (p *Permutation) contains(str string) bool {
	for _, item := range p.Results {
		if item == str {
			return true
		}
	}
	return false
}

func (p *Permutation) permute(str []byte, i, n int) {
	if i == n {
		if p.contains(string(str)) == false {
			p.Results = append(p.Results, string(str))
		}
	} else {
		for j := i; j <= n; j++ {
			p.swap(str, i, j)
			p.permute(str, i + 1, n)
			p.swap(str, i, j)
		}
	}
}

func main() {
	str := "LLL"
	p := new(Permutation)
	p.Process(str)
	for i := 0; i < len(p.Results); i++ {
		fmt.Println(p.Results[i])
	}
}


