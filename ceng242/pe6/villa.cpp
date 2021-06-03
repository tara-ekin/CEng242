#include <iostream>
#include "villa.h"
#include "owner.h"

using namespace std;

Villa::Villa(const string &property_name, int area, Owner *owner, int number_of_floors, bool having_garden)
: Property(property_name, area, owner)
{
    this->number_of_floors = number_of_floors;
    this->having_garden = having_garden;
}

float Villa::valuate()
{
    float g = having_garden ? 2 : 1;
    return 10 * g * this->area * this->number_of_floors ;
}
