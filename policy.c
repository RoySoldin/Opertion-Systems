#include "types.h"
#include "stat.h"
#include "user.h"
#include "fs.h"
#include "fcntl.h"
//#include "defs.h"

int
main(int argc, char *argv[])
{
	int new_policy = *argv[1];	
	policy(new_policy);
	exit(0);
}