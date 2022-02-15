//Andrei Modiga
//02-15-2022
//OS

#include "kernel/types.h"
#include "kernel/stat.h"
#include "user/user.h"
#include "kernel/fcntl.h"


struct command 
{ 
  char** argv;
  int argc;
};

// https://www.unf.edu/~cwinton/html/cop3601/s10/class.notes/C4-PurgeBlnkLns.pdf
char whitespace[] = " \t\r\n\v";
#define MAX_ARGS 25
#define ARG_LEN 30

// int so that main can return integer type data
int getcmd(char *buf, int nbuf, int cmdNumber)
{
  // Prints the prompt
  fprintf(2, "%d | EZ$ ", cmdNumber); 
  memset(buf, 0, nbuf);
  gets(buf, nbuf);
  if(buf[0] == 0) 
    return -1;
  return 0;
}

int findSpace(const char c) 
{
  // checks for whitespace
  if(strchr(whitespace, c) == 0 ) 
    return 0;
  else
    return 1;
}

struct command*
parsecmd(const char *buf){
  struct command* command;
  // allocate the command structure
  command = malloc(sizeof *command); 
  // allocate the argument array
  command->argv = malloc(MAX_ARGS * sizeof command->argv);
  // set the argument count to 0
  command->argv[0] = malloc(ARG_LEN * sizeof *command->argv); 


  int offset = 0;
  int arg = 0;
  for(int i = 0; buf[i]; i++){
    // if we have space, we need to allocate a new argument 
    if (findSpace(buf[i])){
      arg++;
      command->argv[arg] = malloc(30 * sizeof (char));
      // set the offset to the beginning of the next argument
      offset = i + 1; 
      continue;
    }

    // slices the string into arguments
    command->argv[arg][i - offset] = buf[i]; 

  }

  // stores argument count
  command->argc = arg; 

  for(int i = arg; i < MAX_ARGS; i++)
  {
    command->argv[i] = '\0';
  }

  return command;
}

int main(void)
{
  static char buf[100];
  int cmdNumber = 0;
  // number of history array allowed
  int history_size = 1000; 
  struct command* command;
  struct command** history = malloc(history_size * sizeof(command));

  // Read and run input commands.
  while(getcmd(buf, sizeof(buf), cmdNumber) >= 0)
  {
    command = parsecmd(buf);
    int type = 0;
    //cmd to history
    history[cmdNumber] = command;

    // changing directories
    // The goal of "cd" is to change the current working directory of the shell itself, 
    // and that can't be accomplished from a child process unless you pretty much want to sell your soul to get it working.
    // strcmp is string compare
    if(strcmp(command->argv[0],"cd") == 0)
    {
      fprintf(2, "changing directory\n");
      if (command->argc < 2)
      {
        fprintf(2, "cd takes more than one argument.\n");

      }
      else if(chdir(command->argv[1]) != 0)
      {
        fprintf(2, "error changing dir\n");
      }
      continue;
    }

    // History
    if(command->argv[0][0] == '#')
    {

      // changes string to an integer to call back history      
      int NewcmdNumber = atoi(command->argv[0] + 1);
      command = history[NewcmdNumber];

      // show command called 
      history[cmdNumber] = command;
    }

    if(command->argv[0][strlen(command->argv[0]) - 1] == '&')
    {
      // char* bArg = malloc(ARG_LEN * sizeof *command->argv);
      // strcpy(bArg, command->argv[0]);
      // memset(bArg + (strlen(bArg) - 1), '\0', 1);
      // remove the & from the end of the command
      command->argv[0][strlen(command->argv[0]) - 1] = '\0';

      
 
      //ezshExec(bArg, command->argv);
      type = 1;
    }

    // exits from the shell
    if(strcmp(command->argv[0],"exit") == 0)
    {
      fprintf(2, "exiting shell\n");
      exit();
    }

    // https://www.geeksforgeeks.org/fork-system-call/
    // this executes the command
    if(fork() == 0)
    { 
    
      exec(command->argv[0], command->argv);

      //if exec fails exit the child
      
      exit();
    }
  
    if(type == 0)
    {
      wait();
    } 
    else
    {
      fprintf(2, "Process in background\n");
    }
    
    
    //increments the command number
    cmdNumber++;
    if(cmdNumber == (history_size))
    {
      //reallocates the history array
      cmdNumber = 0;
      fprintf(2, "history been reset to 0\n");
    }
    
  }
  exit();
}