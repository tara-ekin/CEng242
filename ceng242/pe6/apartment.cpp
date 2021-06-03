#include <iostream>
#include "apartment.h"
#include "owner.h"

using namespace std;

Apartment::Apartment(const string &property_name, int area, Owner *owner, int floor, bool having_elevator)
: Property(property_name, area, owner)
{
    this->floor = floor;
    this->having_elevator = having_elevator;
}

float Apartment::valuate()
{
}
