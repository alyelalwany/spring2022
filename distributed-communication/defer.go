package main

import ("fmt")

func main(){
	useDefer()
}

func useDefer(){
	fmt.Println("First")
	defer fmt.Println("Last")
	fmt.Println("Second")
}