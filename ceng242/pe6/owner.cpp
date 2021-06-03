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
    float value = property->valuate();
    
    std::cout << "[BUY] Property: " << property->get_name() << " Value: " << value << "$ " << seller->get_name() << "--->" << this->name << std::endl;
    
    if(this->balance >= value){
        bool has = false;
        
        std::vector<Property *>::size_type i = 0;
        /*
        for(Property* p: seller->properties){
            if ((*p) == (*property)){
                has = true;
                break;
            }
            i++;
        }
        */
        for(; i < seller->properties.size(); i++){
            if(seller->properties[i] == property){
                has = true;
                break;
            }
        }
        
        if(has){
            this->add_property(property);
            this->balance -= value;
            
            seller->properties.erase(seller->properties.begin() + i);
            seller->balance += value;
            
            property->set_owner(this);
        }
        else{
            std::cout << "[ERROR] Transaction  on  unowned  property" << std::endl;
        }
    }
    else{
        std::cout << "[ERROR] Unaffordable  property" << std::endl;
    }
}

void Owner::sell(Property *property, Owner *owner)
{
    float value = property->valuate();
    
    std::cout << "[SELL] Property: " << property->get_name() << " Value: " << value << "$ " << this->name << "--->" << owner->get_name() << std::endl;
    
    if(owner->balance >= value){
        bool has = false;
        
        std::vector<Property *>::size_type i = 0;
        /*
        for(Property* p: this->properties){
            if ((*p) == (*property)){
                has = true;
                break;
            }
            i++;
        }
        */
        for(; i < this->properties.size(); i++){
            if(this->properties[i] == property){
                has = true;
                break;
            }
        }
        
        if(has){
            owner->add_property(property);
            owner->balance -= value;
            
            this->properties.erase(this->properties.begin() + i);
            this->balance += value;
            
            property->set_owner(owner);
        }
        else{
            std::cout << "[ERROR] Transaction  on  unowned  property" << std::endl;
        }
    }
    else{
        std::cout << "[ERROR] Unaffordable  property" << std::endl;
    }
}

void Owner::list_properties()
{
    std::cout << "Properties of " << this->name << ":" << std::endl;
    std::cout << "Balance: " << this->balance << "$" << std::endl;
    
    for(std::vector<Property *>::size_type i=1; i<=properties.size(); i++){
        std::cout << i << ". " << properties[i-1]->get_name() << std::endl;
    }
}
