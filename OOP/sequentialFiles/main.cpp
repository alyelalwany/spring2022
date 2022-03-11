/** Calculate the average of daily temperatures
stored in a sequential input file.
a.) before the first temperature under the freezing point.
b.) after the first temperature under the freezing point.
c.) before and after the first temperature under the freezing point where in the after version the first freezing temperature is included, too.
*/

#include <iostream>
#include <fstream>

using namespace std;

enum Status
{
    norm,
    abnorm
};

void read(Status &st, int &e, fstream &f); /// st,e,f:read

void menuPrint();                /// print the menu
string readFileName();           /// read the file's name
void execute(int n, fstream &f); /// calculate the corresponding menu item on the given file

double division(double a, int b); /// if b=0 then division is zero

double average(fstream &x);                                 /// a.)
double avgAfterFreezing(fstream &x);                        /// b.)
pair<double, double> avgBeforeAndAfterFreezing(fstream &f); /// c.)

int main()
{
    int menuItem = 5; /// if it is not set and wrong file name is given for the first time, the program terminates
    do
    {
        menuPrint();
        cin >> menuItem;
        if (menuItem > 0 && menuItem < 4)
        {
            fstream file(readFileName());
            if (!file.fail())
            {
                execute(menuItem, file);
                file.close();
            }
            else
            {
                cout << "Wrong file name!\n";
            }
        }
    } while (menuItem != 0);

    return 0;
}

void read(Status &st, int &e, fstream &f)
{
    f >> e;
    if (f.fail())
    {
        st = abnorm;
    }
    else
    {
        st = norm;
    }
    /// one line solution:
    /// st = ( f >> e ) ? norm : abnorm;
}

double division(double s, int c)
{
    if (c != 0)
    {
        return s / c;
    }
    else
    {
        return 0;
    }
    /// one line solution:
    /// return (c==0)?0:s/c;
}

void menuPrint()
{
    cout << "\n0. Exit\n";
    cout << "1. Average of file before the first freezing point\n";
    cout << "2. Average of file after the first freezing point\n";
    cout << "3. Average of file before and after the first freezing point\n";
    cout << "Choose: ";
}

string readFileName()
{
    cout << "Input file's name: ";
    string fileName;
    cin >> fileName;
    return fileName;
}

void execute(int n, fstream &f)
{
    switch (n)
    {
    case 1:
        cout << average(f) << endl;
        break;
    case 2:
        cout << avgAfterFreezing(f) << endl;
        break;
    case 3:
        pair<double, double> result = avgBeforeAndAfterFreezing(f);
        cout << result.first << " " << result.second << endl;
        break;
    }
}

double average(fstream &x)
{
    double s = 0;
    int c = 0;
    Status st;
    int e;
    read(st, e, x);
    while (e >= 0 && st == norm)
    {
        s += e;
        ++c;
        read(st, e, x);
    }
    /// Not elegant solution:
    return division(s, c);
}

double avgAfterFreezing(fstream &x)
{
    Status st;
    int e;
    read(st, e, x);
    while (e >= 0 && st == norm)
    {
        read(st, e, x);
    }
    double s = 0;
    int c = 0;
    read(st, e, x);
    while (st == norm)
    {
        s += e;
        ++c;
        read(st, e, x);
    }
    /// Not elegant solution:
    return division(s, c);
}

pair<double, double> avgBeforeAndAfterFreezing(fstream &x)
{
    pair<double, double> result;
    Status st;
    int e;
    double s1 = 0;
    int c1 = 0;
    read(st, e, x);
    while (e >= 0 && st == norm)
    {
        s1 += e;
        ++c1;
        read(st, e, x);
    }
    result.first = division(s1, c1);

    double s2 = 0;
    int c2 = 0;
    while (st == norm)
    {
        s2 += e;
        ++c2;
        read(st, e, x);
    }
    /// Not elegant solution:
    result.second = division(s2, c2);
    return result;
}
