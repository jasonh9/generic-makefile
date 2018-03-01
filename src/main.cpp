#include <iostream>
#include <string>
using namespace std;
#include "Mathematics.h"
int main() {
	int num1, num2, result;
	Mathematics maths;
	cout <<"Enter the first number:";
	std::cin>>num1;
	std::cout<<"Enter the 2nd number:";
	std::cin>>num2;

	result = maths.add(num1, num2);
	std::cout <<"\nThe result of adding two numbers is: "<<result<<endl;
	result = maths.subtract(num1, num2);
	std::cout <<"The result of subtracting two numbers is: "<<result<<endl;
	result = maths.multiply(num1, num2);
	std::cout <<"The result of multipltying two numbers is: "<<result<<endl;
	result = maths.divide(num1, num2);
	std::cout <<"The result of dividing two numbers is: "<<result<<endl;
}
