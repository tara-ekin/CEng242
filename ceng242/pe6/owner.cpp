#include <iostream>
#include <string>
#include <vector>
#include "owner.h"

using namespace std;

Owner::Owner()
{
}

Owner::Owner(const string &name, float balance)
{
    this->name = name;
    this->balance = balance;
}

void Owner::print_info()
{
}

string &Owner::get_name()
{
    return this->name;
}

void Owner::add_property(Property *property)
{
    this->properties.push_back(property);
}

void Owner::buy(Property *property, Owner *seller)
{
}

void Owner::sell(Property *property, Owner *owner)
{
}

void Owner::list_properties()
{
    std::cout << "Properties of " << this->name << ":" << std::endl;
    std::cout << "Balance: " << this->balance << "$" << std::endl;
    
    for(std::vector<Property *>::size_type i=1; i<=properties.size(); i++){
        std::cout << i << ". " << properties[i-1]->get_name() << std::endl;
    }
}
