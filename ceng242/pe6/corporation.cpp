#include <iostream>
#include "corporation.h"

using namespace std;

Corporation::Corporation(const string &name, float balance, string address)
: Owner(name, balance)
{
    this->address = address;
}

void Corporation::print_info()
{
    std::cout << "Name: " << this->name << " Address: " << this->address << std::endl;
}
