#define E 2.71828182846;
double Exponent(int x){
double ans=1;
if(x>0){
for (int i = 0; i<x ; i++ )
        {
        ans*=E;
        }
        return ans;
}
if(x<0){
for (int i = 0; i<-x ; i++ )
        {
        ans/=E;
        }
        return ans;
}
return ans;
}
double Power(double x,int y){
    if(y>0){
        double ans=1;
        for (int i = 0; i <y; i++)
        {
        ans*=x;
        }
        return ans;
    }
    else if(y<0)
    {
        double ans=1;
        for (int i = 0; i <-y; i++)
        {
        ans/=x;
        }
        return ans;
    }
    if(x==0) return 0;
    return 1;
}