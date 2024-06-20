package main

import (
	"testing"
)

func TestCalculate(t *testing.T) {
	tests := []struct {
		a        int
		b        int
		operator string
		expected int
		hasError bool
	}{
		{2, 3, "+", 5, false},
		{5, 3, "-", 2, false},
		{1, 1, "*", 0, true},
	}

	for _, test := range tests {
		result, err := Calculate(test.a, test.b, test.operator)
		if test.hasError {
			if err == nil {
				t.Errorf("expected an error but got none")
			}
		} else {
			if err != nil {
				t.Errorf("unexpected error: %v", err)
			}
			if result != test.expected {
				t.Errorf("expected %d but got %d", test.expected, result)
			}
		}
	}
}
