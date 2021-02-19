#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <signal.h>
#include <string.h>


int main(int argc, char** argv)
{


	int i;

	signal(SIGCHLD, SIG_IGN);


		if(argc ==1)
		{

			printf("Program has no arguments!\n");
			return 0;
		}



		for(i=1;i<argc;i++)
		{
			int pid=fork();

			if(pid==-1)
			{
				exit(1);
			}

			if(pid==0)
			{
				execlp("sed","sed","-i","s/[0-9]//g",argv[i],NULL);
				exit(0);
			}

			

		}


		return 0;
}


