package main

import (
	"fmt"
	"time"
)

func main() {
	go func() {
		fmt.Println("Hi 1")
	}()

	go func(s string) {
		fmt.Println(s)
	}("Hi 2")

	go func(s string, i int) {
		fmt.Println(s, i)
		time.Sleep(5 * time.Second)
	}("Thread", 3)

	time.Sleep(1 * time.Second)
}
