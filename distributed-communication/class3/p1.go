package main

import("fmt")


/*
// p1
Create a struct animal. Its fields: specie (type string), name (type
string).
In the main function, create its typed value dog1 with field value ”dog”
and ”One”. Print out the dog1. Print out dog1’s name. Modify dog1’s
name to ”Two”. Print out dog1 again
// p2
Create a method setName of animal, which takes the pointer to the
animal as the receiver (the receiver name is ap). It takes a string n
as the parameter. In the function, we change the animal’s name to n
(Change the original value).
In the main function, use setName to change dog1’s name to ”Three”.
Print out the dog1.
// p3
Create a method move of animal, which takes the animal as the receiver (the receiver name is a). It prints out the a’ specie, name, and
a string ”move”. Like ”dog One move”.
// p4
Create a slice of animal. Its name is animalSlice. It has five initial
elements: animal ”dog” ”One”, animal ”dog” ”Two”, animal ”cat”
”Three”, animal ”cat” ”Four”, animal ”bird” ”Five”.
Print out the slice.
Print out animalSlice’ third elements.
Print out animalSlice’ second elements till the fourth elements.
*/
type animal struct{
	specie string
	name string
}

func main(){
	dog1 := animal{"dog","One"}
	dog2 := animal{"dog","Two"}
	cat1 := animal{"cat","Three"}
	cat2 := animal{"cat","Four"}
	bird := animal{"bird","Five"}
	fmt.Println(dog1.name)
	fmt.Println(dog2.name)
	dog1.name = "dog1changed"
	fmt.Println(dog1.name)
	dog1.setName("Three")
	fmt.Println(dog1.name)
	dog1.move()
	dog2.move()

	animalSlice := []animal{
		dog1,
		dog2,
		cat1,
		cat2,
		bird,
	}
	fmt.Println(animalSlice)
	fmt.Println(animalSlice[2])
	fmt.Println(animalSlice[2:4])



}
func (ap *animal) setName(n string) {

	(*ap).name = n

}
func (a animal) move(){
	fmt.Println(a.specie+" " + a.name + " move")
}