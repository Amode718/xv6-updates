/*
Help from:
https://www.tutorialspoint.com/cprogramming/c_command_line_arguments.htm
https://pdos.csail.mit.edu/6.828/2018/xv6/book-rev10.pdf - page 15
*/
#include "kernel/types.h"
#include "user/user.h"
#include "kernel/fcntl.h"
#include "kernel/stat.h"
#include "kernel/fs.h"

int main(int argc, char *argv[])
{
    char buf[512];
    // Declare
    int d1,d2,n;
    struct stat st;
    // Check if there is a file
    if (argc != 3)
    {
        fprintf(2, "mv: too many or less args\n");
        exit();
    }
    
    // Check if the file can open
    if((d1 = open(argv[1], O_RDONLY)) < 0){
        fprintf(2, "mv: Can't open %s\n", argv[1]);
        exit();
    }
    // Check if the file can open
    if(fstat(d1, & st) < 0){
        fprintf(2, "mv: Can't open %s\n", argv[1]);
        close(d1);
        exit();
    }
    // File type check
    if (st.type == T_FILE)
    {
        // Check if the file can open and create new file as well as close
        if((d2 = open(argv[2], O_CREATE)) < 0){
            close(d2);
            close(0);
            if((d2 = open(argv[2], O_WRONLY) < 0)){
            fprintf(2, "mv: Can't open %s\n", argv[2]);
            exit();
        }
        }
        close(d2);
        close(0);
        // Check if the file can open
        if((d2 = open(argv[2], O_WRONLY) < 0)){
            fprintf(2, "mv: Can't open %s\n", argv[2]);
            exit();
        }
        for(;;) {
            // testcase file size
            if((n = read(d1,buf,sizeof(buf))) < 0)
            {
                fprintf(2,"mv: Error while copying\n");
                exit();
            }
            if(n == 0)
            {
                break;
            }
            if(write(d2,buf,n) != n)
            {
                // testcase
                fprintf(2,"mv: Error while copying\n");
                exit();
            }
        }
        close(d2);
    }
    else
    {
        fprintf(2, "mv: invalid args");
    }
    //close and unlink the file
    close(d1);
    unlink(argv[1]);
    exit();
}