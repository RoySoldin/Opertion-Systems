#include "types.h"
#include "x86.h"
#include "defs.h"
#include "date.h"
#include "param.h"
#include "memlayout.h"
#include "mmu.h"
#include "proc.h"

int
sys_fork(void)
{
  return fork();
}

int
sys_exit(void)
{
  int status;
  argint(0, &status);
  exit(status);
  return 0; // not reached
}

int
sys_wait(void)
{
  int *status;
  argptr(0, (void *)&status, sizeof(int));
  return wait(status);
}
//#####################################################################################################

//                                        task 2.3

//#####################################################################################################
int
sys_detach(void)
{
  int pid;

  if(argint(0, &pid) < 0)
    return -1;
  return detach(pid);
}

//#####################################################################################################

//                                        task 3.1

//#####################################################################################################
int
sys_policy(void)
{
  int new_policy;
  argint(0, &new_policy);
  if(new_policy > 0 && new_policy < 4)
    policy(new_policy);
  return -1;  // not supposed to reach here
}  

//#####################################################################################################

//                                        task 3.2

//#####################################################################################################

int
sys_priority(void)
{
  int new_priority;
  argint(0, &new_priority);
  if(new_priority > -1 && new_priority < 11)
    priority(new_priority);
  return -1;  // not supposed to reach here
} 

//#####################################################################################################

//                                        task 3.5

//#####################################################################################################

int
sys_wait_stat(void)
{
  int *status;
  struct perf *performance;
  argptr(0, (void *)&status, sizeof(int));
  argptr(1, (void *)&performance, sizeof(struct perf));
  return wait_stat(status, performance);
} 

int
sys_kill(void)
{
  int pid;

  if(argint(0, &pid) < 0)
    return -1;
  return kill(pid);
}

int
sys_getpid(void)
{
  return myproc()->pid;
}

int
sys_sbrk(void)
{
  int addr;
  int n;

  if(argint(0, &n) < 0)
    return -1;
  addr = myproc()->sz;
  if(growproc(n) < 0)
    return -1;
  return addr;
}

int
sys_sleep(void)
{
  int n;
  uint ticks0;

  if(argint(0, &n) < 0)
    return -1;
  acquire(&tickslock);
  ticks0 = ticks;
  while(ticks - ticks0 < n){
    if(myproc()->killed){
      release(&tickslock);
      return -1;
    }
    sleep(&ticks, &tickslock);
  }
  release(&tickslock);
  return 0;
}

// return how many clock tick interrupts have occurred
// since start.
int
sys_uptime(void)
{
  uint xticks;

  acquire(&tickslock);
  xticks = ticks;
  release(&tickslock);
  return xticks;
}
