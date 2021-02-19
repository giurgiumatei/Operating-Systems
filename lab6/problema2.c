#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <sys/wait.h>
#include <string.h>


/*


void parse(char* line, char** argv)
{


	char *p=strtok(line," \t \n");
	int i=0;


	while(p!= NULL)
	{
		argv[i]=p;
		i++;
		p=strtok(NULL," \t \n");

		return argv;
	
	}



}


*/







int main(int argc,char** argv)
{


	char* command,commands;

	command=(char*)malloc(100 * sizeof(char));
	commands=(char*)malloc(100 * sizeof(char));
	commands="\0";
	scanf("%[^\n]%*c",command);
	char* token= strtok(command," \n");
 
	strcat(commands,token);
	strcat(commands,token);

	printf("%s",commands);

	return 0;
}
