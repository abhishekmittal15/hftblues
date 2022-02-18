#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>

static char* file_name = "file.dat";
// static int n_actual = 10;
// static uint32_t n_desired=3;
static FILE* file;

int32_t open_file(){

    file = fopen (file_name, "r");
    if(file==NULL){
        printf("Couldnt open file\n");
    }
    printf("File : %p\n",file);
    return 59;

}

int32_t read_ints ()
{
    int a;
    // int32_t *a=malloc(sizeof(int32_t)*n_actual);
    // fscanf (file, "%d", &n_desired);
    // while (!feof (file))
    //     {  
        // printf ("Index: %d\n",a+index);
    printf("File : %p\n",file);
    int temp=fscanf (file, "%d",&a);    
    printf("Arguments matched : %d",temp);
        // }
    // printf("The size of the array is : %d\n",n_desired);
    // for( int32_t i=0;i<n_desired;i++ ){
    printf("%d\n",a);
    // }
    return a;
}

int32_t close_file()
{

    printf("File : %p\n",file);
    fclose(file);
    return 75;

}

int main(){
    uint32_t a;
    a=open_file();
    a=read_ints();
    a=read_ints();
    a=read_ints();
    a=read_ints();
    a=read_ints();
    a=close_file();
    return 0;

}