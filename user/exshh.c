#include "kernel/types.h"
#include "kernel/stat.h"
#include "user/user.h"
#include "kernel/fcntl.h"

#define Max_Buffer_Size 100
#define MAX_ARGS 25
#define ARG_LEN 30

int ezshCD(char**);
int isSpace(const char);
struct command* parseCmd(const char*);
void ezshLoop(void);
int ezshExec(char *, char **, int);
int main(int, char**);

struct command {
  char** argv;
  int argc;
};

char whitespace[] = " \t\r\n\v";

int ezshCD(char **args)
{
    if (args[1] == 0) 
    {
        fprintf(2, "cd: missing argument\n");
        return 0;
    }
    else if (chdir(args[1]) != 0)
    {
        fprintf(2, "cd: Unkown Error");
        return 0;
    }

    return 1;
}

int isSpace(const char c)
{
    if ( strchr(whitespace, c) == 0 ) 
        return 0;
    else
        return 1;
}


struct command* parseCmd(const char* buf)
{
    struct command* command;
    // allocate the command structure
    command = malloc(sizeof *command); 
    // allocate the argument array
    command->argv = malloc(MAX_ARGS * sizeof command->argv);
    // set the argument count to 0
    command->argv[0] = malloc(ARG_LEN * sizeof *command->argv); 

    int arg = 0;
    int offset = 0;
    for (int i = 0; buf[i]; i++)
    {
        // if we have space, we need to allocate a new argument 
        if (isSpace(buf[i]))
        {
            arg++;
            command->argv[arg] = malloc(30 * sizeof (char));
            // set the offset to the beginning of the next argument
            offset = i + 1; 
            continue;
        }
        // copy the argument
        command->argv[arg][i - offset] = buf[i];
    }

    command->argc = arg;

    for (int i = arg; i < MAX_ARGS; i++)
        command->argv[i] = '\0';
    
    return command;
}

void ezshLoop(void)
{
    static char buf[Max_Buffer_Size];
    struct command* command;

    int historyLen = 100;
    struct command** history = malloc(historyLen * sizeof command);
    int cmdc = 0;

    while (1) 
    {
        fprintf(2, "%d | EZ$ ", cmdc);
        memset(buf, 0, sizeof(buf));
        gets(buf, sizeof(buf));

        command = parseCmd(buf);

        if (cmdc >= historyLen - 1 ) 
        {
            historyLen *= 2;
            struct command** temp = history;
            history = malloc(historyLen * sizeof command);

            for (int i = 0; i < historyLen/2; i++)
                history[i] = temp[i];

            free(temp);
        }

        history[cmdc] = command;
        cmdc++;

        if ( strcmp(command->argv[0], "exit") == 0) {
            ezshCD(command->argv);
            continue;
        } else if (strcmp(command->argv[0], "cd") == 0 ) {
            ezshCD(command->argv);
            continue;
        } else if (command->argv[0][0] == '#' ){
            while (command->argv[0][0] == '#')
                command = history[atoi(command->argv[0] + 1)];
            
        }

        if ( command->argv[0][strlen(command->argv[0]) - 1] == '&' ) {
            char *bArg = malloc(ARG_LEN * sizeof *command->argv);
            strcpy(bArg, command->argv[0]);
            memset(bArg + strlen(bArg) - 1, '\0', 1);

            ezshExec(bArg, command->argv, 1);
            continue;
        }

        ezshExec(command->argv[0], command->argv, 0);    
    }

    for (int i = 0; i < cmdc; i++) {
        for (int k = 0; k < history[i]->argc; k++)
            free(history[i]->argv[k]);
        free(history[i]->argv);
        free(history[i]);

    }
    free(history);
}

int ezshExec(char* arg, char** argv, int type) {
    if (fork() == 0) {
        exec(arg, argv);
        fprintf(2, "exec failed\n", argv[0]);
        exit();
    }

    if (type == 0)
        wait();
    return 0;
}

int main(int argc, char** argv)
{
    int fd;
    while ( (fd =open("console", O_RDWR)) >= 0) {
        if (fd >= 3) {
            close(fd);
            break;
        }
    }

    ezshLoop();
    exit();
}