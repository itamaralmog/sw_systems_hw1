#include<stdio.h>
#include "myMath.h"
int main(){
   printf("please insert real number:");
   double p;
   scanf("%lf",&p); 
   int pInt=p; 
   float fx1=sub(add(Exponent(pInt),Power(p,3)),2);
   float fx2=add(mul(p,3),mul(Power(p,2),2));
   float fx3=sub(div(mul(Power(p,3),4),5),mul(p,2));
   printf("The value of f(x)=e^x+x^3-2 at the point %0.4lf is:%0.4f\n",p,fx1);
   printf("The value of f(x)=3x+2x^2 at the point %0.4lf is:%0.4f\n",p,fx2);
   printf("The value of f(x)=(4x^3)/5-2x at the point %0.4lf is:%0.4f\n",p,fx3);
   return 1;
}