package main

import (
	"fmt"
	"math/rand"
	"sync"
	"sync/atomic"
)

func main() {

	r := rand.Intn(1000)
	var wGroup sync.WaitGroup
	var result uint64
	for i := 0; i < r; i++ {
		wGroup.Add(1)
		go func() {
			defer wGroup.Done()
			atomic.AddUint64(&result, 1)
		}()
	}
	fmt.Print(int(result) == r)
}
