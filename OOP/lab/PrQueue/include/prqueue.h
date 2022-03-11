#ifndef PRQUEUE_H_INCLUDED
#define PRQUEUE_H_INCLUDED
#include <string>
#include <iostream>
#include <vector>
#include "read.hpp"
using namespace std;
inline bool valid(int a){return true;}

struct Item
{
    int pr;
    std::string data;

    Item(){}
    Item(int p,std::string s): pr(p), data(s) {}

    friend std::istream& operator>>(std::istream& s, Item& e)
    {
        e.pr=read<int>("Priority:", "Integer is needed!",valid);
        std::cout<<"Data:";
        s>>e.data;
        return s;
    }

    friend std::ostream& operator<<(std::ostream& s, const Item& e)
    {
        s<<"Priority: " <<e.pr<< " data: " <<e.data<<" ";
        return s;
    }

    //for testing
    bool operator==(const Item& b)
    {
        return(pr==b.pr && data==b.data);
    }

};

class PrQueue
{
    public:
        enum PrQueueError{EMPTY_QUEUE};

        void add(Item a);
        Item remMax() throw (PrQueueError); // takes out the item with the highest priority
        Item getMaxElement() const throw(PrQueueError); // gets the item with the highest priority
        bool isEmpty() {return _vec.size()==0;}

        friend std::ostream& operator<<(std::ostream& s, const PrQueue& q);
        unsigned int getLength() const {return _vec.size();}
        unsigned int getCapacity() const {return _vec.capacity();}

        std::vector<Item> getItems() const;
        int getMaxIndex() const{return maxIndex();} //maxIndex is private so cannot be called from outside the class
    private:
        std::vector<Item> _vec; //array implemented as a vector
        int maxIndex() const; // index of the maximal element
};

#endif  //PRQUEUE_H_INCLUDED
