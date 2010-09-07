/* 
 * File:   Node.cpp
 * Author: onodes
 * 
 * Created on 2010/06/12, 20:29
 */

#include <iostream>
#include <fstream>
#include <iomanip>
#include <boost/multi_array.hpp>
#include <math.h>
using namespace std;
using namespace boost;

const double E = 2.718281828;
int size;
float theta, psi, gamma, lmda, sigma;
multi_array<float,2> inputData,outputData,gaborData;

Node::Node(size=256,theta=0.25,psi=0,gamma=1,lmda=64,sigma=64) {
    inputData(extents[size][size]);
    outputData(extents[size][size]);
    gaborData(extents[size][size]);

    for(int x=0;x<size;x++){
        for(int y=0;y<size;y++){
            gaborData[x][y] = Gabor(x-size/2,y-size/2);
        }
    }

}

Node::Node(const Node& orig) {
}

Node::~Node() {
}

Gabor(int x,int y){
    float xdash = x * cos(theta) + y * sin(theta);
    float ydash = -x * sin(theta) + y* cos(theta);

   float g = pow(E,-(pow(xdash,2) + (pow(gamma,2) * pow(ydash,2))  )/(2*pow(sigma,2))* cos(2*M_PI*(xdash/lmda) + psi));


}