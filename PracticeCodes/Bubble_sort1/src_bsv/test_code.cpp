#include<iostream>
using namespace std;

int main(){
    
    int n=5;
    int arr[n]={5,4,3,2,1};
    int iterations=0;
    while(true){
        iterations++;
        bool swapped=false;
        for(int i=1;i<n;i++){
            if(arr[i-1]>arr[i]){
                swapped=true;
                int temp=arr[i];
                arr[i]=arr[i-1];
                arr[i-1]=temp;
            }
        }
        if(swapped==false){
            break;
        }
    }
    cout<<"The sorted array is "<<endl;
    for(int i=0;i<n;i++){
        cout<<arr[i]<<" ";
    }
    cout<<endl;
    cout<<"It took "<<iterations<<" number of iterations"<<endl;
    return 0;
}