#include <iostream>
#include "property.h"
#include "owner.h"

using namespace std;

Property::Property()
{
}

Property::Property(const string &property_name, int area, Owner *owner)
{
    this->property_name = property_name;
    this->area = area;
    this->owner = owner;
    
    if(owner != NULL){
        owner->add_property(this);
    }
}

void Property::set_owner(Owner *owner)
{
    this->owner = owner;
}

float Property::valuate()
{
}

string &Property::get_name()
{
    return this->property_name;
}

void Property::print_info()
{
    std::cout << this->property_name << " (" << this->area << " m2)" << " Owner: ";
    if(this->owner == NULL) 
        std::cout << "No owner" << std::endl;
    else 
        std::cout << this->owner->get_name() << std::endl;
}
