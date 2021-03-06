// init: The initial user-level program

#include "kernel/types.h"
#include "kernel/stat.h"
#include "user/user.h"
#include "kernel/fcntl.h"

char *argv[] = { "sh", 0 };

int
main(void)
{
  int pid, wpid;

  if(open("console", O_RDWR) < 0){
    mknod("console", 1, 1);
    open("console", O_RDWR);
  }
  dup(0);  // stdout
  dup(0);  // stderr

  for(;;){
    /*printf("init: starting sh\n");*/
    printf("Beware!!!\n");
    pid = fork();
    if(pid < 0){
      fprintf(2, "init: fork failed\n");
      exit();
    }
    if(pid == 0){
      exec("sh", argv);
      fprintf(2, "init: exec sh failed\n");
      exit();
    }
    while((wpid=wait()) >= 0 && wpid != pid)
      printf("zombie!\n");
  }
}
