#include "prqueue.h"

using namespace std;

void PrQueue::add(Item a)
{
    _vec.push_back(a);
}

Item PrQueue::remMax() throw (PrQueueError)
{

    if(_vec.size()==0) throw EMPTY_QUEUE;
    int ind = maxIndex();
    Item newItem = _vec[ind];
    _vec[ind] = _vec[_vec.size()-1];
    _vec.pop_back();

    return newItem;
}

Item PrQueue::getMaxElement() const throw (PrQueueError)
{
    if(_vec.size()==0) throw EMPTY_QUEUE;
    int ind=maxIndex();
    return Item(_vec[ind]);
}

ostream& operator<<(std::ostream& s, const PrQueue& q)
{
    s<<"\n>>>>>>>>>>>>>>>>>>>>>>>>>>>>>\n";
    s<<"Number of elements : " << q._vec.size()<<"\nContent: "<<endl;
    for(unsigned i =0; i<q._vec.size();++i)
    {
        s<<" (" <<q._vec[i].pr<<","<<q._vec[i].data<<")";
    }
    s<<"\n<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<\n";

    return s;
}


int PrQueue::maxIndex()const
{
    int ind = 0;
    for (unsigned int i=1; i<_vec.size();i++)
    {
            if(_vec[i].pr>_vec[ind].pr)
            {
                ind =i;
            }
    }
    return ind;
}

vector<Item> PrQueue::getItems() const
{
    vector<Item> v;
      for (unsigned int i=1; i<_vec.size();++i)
    {
            v.push_back(_vec[i]);
    }
    return v;
}
