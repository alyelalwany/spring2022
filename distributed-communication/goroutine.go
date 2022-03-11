package main

import (
	"fmt"
	"time"
)

func main() {
	go printR("Hi1")
	go print("Hi2")
	time.Sleep(1 * time.Second)

	go func(s string) {
		fmt.Println(s)
	}("Anonymous")
	time.Sleep(1 * time.Second)

}

func print(s string) {
	fmt.Println(s)
}

func printR(s string) string {
	fmt.Println(s)
	return s
}
