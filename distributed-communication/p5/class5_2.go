package main

import (
	"fmt"
	"sync"
	"time"
)

func main() {

	var wGroup sync.WaitGroup
	channel := make(chan int, 5)

	wGroup.Add(1)
	go func() {
		defer wGroup.Done()
		for i := 0; i < 10; i++ {
			channel <- i
			fmt.Println("g1 sent", i)
		}
	}()

	go func() {
		wGroup.Wait()
		for i := 0; i < 10; i++ {
			channel <- i
			fmt.Println("g2 sent", i)
		}
		close(channel)
	}()

	time.Sleep(2 * time.Second)
	start := time.Now()

	for i := range channel {
		fmt.Println("main received : ", i)
	}
	duration := time.Since(start)
	println("Time taken to send and receive: ", duration)

}
