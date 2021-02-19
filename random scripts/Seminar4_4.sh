#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <sys/wait.h>




int main()
{

int c2p[2],p2c[2];

int res=pipe(c2p);
int res2=pipe(p2c);

if(res==-1 || res2=-1)
{
    perror("Pipe error: ");
    exit(1);

}

int pid=fork();

if(pid==-1)
{
    perror("Fork error: ");
    exit(2);

}

if(pid==0)
{
    close(c2p[1]);
    close(p2c[0])
    while(1)
    {
        int n=2;
        read(p2c[0],&n,sizeof(int));
        if(n==0)
        {
            break;
        }
        
        int n2=0;
        read(p2c[0],&n2,sizeof(int));
        int sum=n2+n;
        write(c2p[1],&sum,sizeof(int));
        

    }
    close(c2p[1]);
    close(p2c[0])
    exit(EXIT_SUCCESS);


}

close(p2c[0]);
close(c2p[1]);

while(1)
{
int n=0;
printf("Give a number > ");
scanf("%d",&n);
write(p2c[1],&n,sizeof(int));
sleep(2);

if(n==0)
{
    break;
}



int n=2;

printf("Give the second number > ");
scanf("%d",&n2);
write(p2c[1],&n2,sizeof(int));
int sum=0;
read(c2p[0],&sum,sizeof(int));
printf("The sum is: %d\n",sum);
}

close(pd[1]);
int status;
wait(&status);

return 0;
}






}