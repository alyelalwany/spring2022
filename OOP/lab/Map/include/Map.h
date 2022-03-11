#ifndef MAP_H
#define MAP_H
#include <string>
#include <iostream>
#include <vector>
#include "read.hpp"
#include <exception>
inline bool valid(int a) {return true;}
struct Item
{
    int key;
    std::string data;
    Item(){};
    Item(int key, std::string data) : key(key), data(data){}

    friend std::istream &operator>>(std::istream &s,Item &e)
    {
        e.key= read<int>("Key: ", "Integer is needed!",valid);
        std::cout<<"Data: ";
        s>> e.data;
        return s;
    }
    friend std::ostream &operator<<(std::ostream &s, const Item &e)
    {
        s << "(" << e.key << "," << e.data << ")";
        return s;
    }
    bool operator==(const Item &b)
    {
        return (this->key==b.key && this->data ==b.data);
    }
};

class Map
{
    public:
    class ExistingKeyException : public std::exception
    {
    };
    class NonExistingKeyException : public std::exception
    {
    };
    int count() const{return _vec.size();}
    void insert(Item a);
    void erase(int key)throw(std::exception);
    bool isIn(int key) const;
    std::string &operator[](int key) throw (std::exception);
    bool isEmpty() const{return _vec.size()==0;}

    friend std::ostream &operator<<(std::ostream &s, const Map &m);

    //Methods for testing
    std::vector<Item> getItems() const;
    std::pair<bool,int> getLogSearch(int key) const {return logSearch(key);}

    private:
        std::vector<Item> _vec;
        std::pair<bool,int> logSearch(int key) const;
};

#endif // MAP_H
