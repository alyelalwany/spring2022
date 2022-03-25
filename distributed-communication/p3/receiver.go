package main

import "fmt"

type student struct {
	name string
	id   string
}

type neptun string

func main() {
	adam := student{"Adam", "abcdef"}
	fmt.Println(adam.getNameR())
	fmt.Println(getNameA(adam))
	adam.setName("Ali")
	fmt.Println(adam.name)
	var aNeptun neptun = "asdf"
	aNeptun.printId()
}

func (s *student) setName(nameInput string) {
	(*s).name = nameInput
}

func (s student) getNameR() string {
	return s.name
}

func getNameA(s student) string {
	return s.name
}

func (i neptun) printId() {
	fmt.Println(i)
}
