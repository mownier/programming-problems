package main

import(
	"fmt"
)

type BubbleSort struct {
	Results []int
}

func (b *BubbleSort) Process(arr []int, increasing bool) {
	b.Results = arr
	for ;; {
		noswap := true
		for i := 0; i < len(b.Results) - 1; i++ {
			j := i + 1
			var condition bool
			if increasing == true {
				condition = b.Results[i] > b.Results[j]
			} else {
				condition = b.Results[i] < b.Results[j]
			}
			if condition == true {
				noswap = false
				b.swap(i, j)
			}
		} 
		if noswap == true {
			break;
		}
	}
}

func (b *BubbleSort) swap(i, j int) {
	b.Results[i], b.Results[j] = b.Results[j], b.Results[i]
}

func (b *BubbleSort) Print() {
	fmt.Println("")
	for _, item := range b.Results {
		fmt.Printf("%d,",item)
	}
}

func main() {
	arr := []int{9, 5, 2, 1, 5, 9, 0, 8, 7, 7, 90, 67, 4, 1}
	b := new(BubbleSort)
	b.Process(arr, false)
	b.Print()
}