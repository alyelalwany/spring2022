/** Calculate the average of daily temperatures
stored in a sequential input file.
a.) before the first temperature under the freezing point.
b.) after the first temperature under the freezing point.
c.) before and after the first temperature under the freezing point where in the after version the first freezing temperature is included, too.
*/

#include <iostream>
#include <fstream>
using namespace std;

enum Status {norm, abnorm};

void read(Status &st,int &e,fstream &f);
double average(fstream &x);
string readFileName();
pair<double,double> avgBeforeAndAfterFreezing(fstream &f);

string readFileName()
{

    cout<<"Input file's name : ";
    string fileName;
    cin>> fileName;
    return fileName;
}
double division(double s, int c)
{
    if(c!=0)
    {
        return s/c; //avg
    }
    else
    {
        return 0;
    }
    //return (c==0)? 0 : s/c;
}

double average(fstream &x)
{

    double s = 0;
    int c =0;
    Status st;
    int e;
    read(st,e,x);
    while(e>=0&& st==norm)
    {
        s+=e;
        ++c;
        read(st,e,x);
    }
    return (s,c);//avg
}

double avgAfterFreezing(fstream &x){
    Status st;
    int e;
    read(st,e,x);
    while(e>=0&&st==norm)
    {
        read(st,e,x);
    }
    double s= 0;
    int c=0;
    read(st,e,x);
    while(st==norm)
    {
        s+= e;
        ++c;
        read(st,e,x);
    }
    return division(s,c);
}


void read(Status &st, int &e,fstream &f)
{
    f>>e;
    if(f.fail()){
        st=abnorm;
    }
    else{
        st=norm;
    }
    // st = (f>>e) ? norm : abnorm;
}



int main()
{

    return 0;
}
