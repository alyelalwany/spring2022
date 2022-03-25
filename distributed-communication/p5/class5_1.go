package main

import (
	"fmt"
)

func main() {
	channel := make(chan string)
	go func() {
		channel <- "Hello"
	}()
	r := <-channel
	fmt.Println(r)
}
