#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <fcntl.h>
#include <sys/types.h>
#include <signal.h>


int main()
{

	signal(SIGCHLD,SIG_IGN);
	int a=0;
	
	int isprime=0;
	int p2c[2];
	pipe(p2c);

        int pid=fork();


	
	while (1)

	{


		if(pid!=0)
                         
		{	sleep(1);

			printf("a= ");

			scanf("%d",&a);



			if(a==0)
			{
				  write(p2c[1],&a,sizeof(int));
				  close(p2c[0]);
				 close(p2c[1]);
				break;
			}
			else
			{
			
			

		
		
			write(p2c[1],&a,sizeof(int));
			}
		}
		else if(pid==0)
			{
				
				 read(p2c[0],&a,sizeof(int));
				 
				 if(a==0)
				 {
					 close(p2c[0]);
					 close(p2c[1]);
					 exit(0);
				 }
				 isprime=1;
				 for(int i=2;i<=a/2;i++)
				  {
					  if (a%i==0)
					 {
																														                                         isprime=0;
																															                                 }
				       }
			          if(isprime==1)
			   {

				   printf(" is prime\n");
			    }

			

			}



			
			}



		

		
		

		return 0;
		}










