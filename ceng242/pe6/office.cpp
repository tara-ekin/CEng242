#include <iostream>
#include "office.h"
#include "owner.h"

using namespace std;

Office::Office(const string &property_name, int area, Owner *owner, bool having_wifi, bool having_reception)
: Property(property_name, area, owner)
{
    this->having_wifi = having_wifi;
    this->having_reception = having_reception;
}

float Office::valuate()
{
}
