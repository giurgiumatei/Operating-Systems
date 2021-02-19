#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <signal.h>
#include <sys/wait.h>

int prim(int n)
{
    if(n<2)
    {
        return 0;
    }

for(int i=2;i*i<=n;i++)
{
    if(n%i==0)
    {
        return 0;
    }

}
    return 1


}




int main()
{

int pd[2];

int res=pipe(pd);

if(res==-1)
{
    perror("Pipe error: ");
    exit(1);

}

int pid=fork();

if(pid==-1)
{
    perror("Fork error: ");

}

if(pid==0)
{
    close(pd[1]);
    while(1)
    {
        int n=2;
        read(pd[0],&n,sizeof(int));
        if(prim(n))
        {
            printf("Number is prime\n");
        }

        else
        {
            printf("Number is not prime\n");

        }

        if(n==0)
        {
            break;
        }

    }
    close(pd[0]);
    exit(EXIT_SUCCESS);


}

close(pd[0]);

while(1)
{
int n=0;
printf("Give a number > ");
scanf("%d",&n);
write(pd[1],&n,sizeof(int));
sleep(2);

if(n==0)
{
    break;
}

}

close(pd[1]);
int status;
wait(&status);

return 0;
}






}