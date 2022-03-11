#ifndef MENU_H
#define MENU_H
#include "prqueue.h"

class Menu
{
    public:
        Menu(){};
        void run();
    private:
        int menuPrint();
        void putIn();
        void takeOut();
        void maxItem();
        void isEmpty();
        void print();
        void loadTest();
        PrQueue q;
};

#endif // MENU_H
