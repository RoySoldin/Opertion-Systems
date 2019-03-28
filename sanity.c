#include "types.h"
#include "stat.h"
#include "user.h"
#include "fs.h"
#include "fcntl.h"
// #include "defs.h"

int
main(int argc, char *argv[])
{	
	int pid2;
	int pid3;
	int pid = fork();
	if(pid == 0){
		printf(0,"Kid 1 is going to sleep...\n");
		sleep(100);
		printf(0,"Kid 1 is waking up...\n");

		pid2 = fork();
		if(pid2 == 0){
			printf(0,"Kid 2 is going to sleep...\n");
			sleep(120);
			printf(0,"Kid 2 is waking up...\n");

			printf(0,"Kid 2 is forking...\n");			
			pid3 = fork();
			if(pid3 == 0)
			{
				printf(0,"Kid 3 is going to sleep...\n");
				sleep(80);
				printf(0,"Kid 3 is waking up...\n");
			}
			else
			{
				wait(&pid3);
				printf(0,"Kid 2 is exiting...\n");
			}


		}
		else{
			wait(&pid2);
			printf(0,"Dad 2 is going to sleep...\n");
			sleep(350);
			printf(0,"Dad 2 is waking up...\n");
		}
	}
	else{
		wait(&pid);
		printf(0,"Dad 1 is going to sleep...\n");
		sleep(223);
		printf(0,"Dad 1 is waking up...\n");
	}

	printf(0,"pid1 is - %d is exiting now...\n", pid);
	printf(0,"pid2 is - %d is exiting now...\n", pid2);
	exit(0);
}