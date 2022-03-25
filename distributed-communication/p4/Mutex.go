package main

import (
	"fmt"
	"sync"
)

func main() {

	var wg sync.WaitGroup
	var mu sync.Mutex

	var result = 0

	for i := 0; i < 1000; i++ {
		wg.Add(1)
		go func(a int) {
			defer wg.Done()
			mu.Lock()
			result += a
			mu.Unlock()
		}(i)
	}

	wg.Wait()

	fmt.Println(result)
}
