package main

import "fmt"

func main() {
	addTwo(2, 3)
}

func addTwo(x, y int) int {
	add := x + y

	fmt.Println(add)
	return add
}
