#include "cos.h"
#include <iostream>
#include <cmath>

double DOcos(double val)
{
    double result;
    result=cos(val * M_PI / 180);
    if ( X == 90){
        result=1;
    } else {
        result=cos(val * M_PI / 180);
    }
    return result;
}
