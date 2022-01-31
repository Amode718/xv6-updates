#include "kernel/types.h"
#include "user/user.h"
#include "kernel/fcntl.h"

int
main(int argc, char *argv[])
{

  if(argc == 1){
    fprintf(2, "Have a great day!\n");
    exit();
  }
  if(argc == 2){
    fprintf(2, "Found the secret!\n");
    exit();
  }
  if(argc == 3){
    fprintf(2, "The Lord is with you where ever you go!\n");
    exit();
  }
}