#include <iostream>
#include "person.h"

using namespace std;

Person::Person(const string &name, float balance, int age)
: Owner(name, balance)
{
    this->age = age;
}

void Person::print_info()
{
    std::cout << "Name: " << this->name << " Age: " << this->age << std::endl;
}
