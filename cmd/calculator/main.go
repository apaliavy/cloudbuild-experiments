package main

import (
	"errors"
	"fmt"
)

func main() {
	fmt.Println("%d Simple Calculator")
	result, err := Calculate(2, 3, "+")
	if err != nil {
		fmt.Println("Error:", err)
	} else {
		fmt.Println("Result:", result)
	}
}

// Calculate performs basic arithmetic operations.
func Calculate(a, b int, operator string) (int, error) {
	switch operator {
	case "+":
		return a + b, nil
	case "-":
		return a - b, nil
	default:
		return 0, errors.New("unsupported operator")
	}
}
