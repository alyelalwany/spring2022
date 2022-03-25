package main

import (
	"fmt"
	"net/http"
	"sync"
	"time"
)

func main() {
	urls := []string{"www.google.com", "www.facebook.com", "www.asdfasfad.com", "www.ebay.com", "www.amazon.com"}
	urlMap := make(map[string]string)
	var mutex sync.Mutex
	var wGroup sync.WaitGroup

	for _, url := range urls {
		wGroup.Add(1)
		go func(link string) {
			defer wGroup.Done()
			mutex.Lock()
			urlMap[link] = linkTest(link)
			mutex.Unlock()
		}(url)
	}

	wGroup.Wait()
	fmt.Print(urlMap)
}

func linkTest(link string) string {
	client := http.Client{
		Timeout: 3 * time.Second,
	}
	_, err := client.Get("http://" + link)
	if err != nil {
		resultString := "bad"
		return resultString
	}
	resultString := "good"
	return resultString
}
