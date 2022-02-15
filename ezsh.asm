
user/_ezsh:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:

  return command;
}

int main(void)
{
   0:	8d 4c 24 04          	lea    0x4(%esp),%ecx
   4:	83 e4 f0             	and    $0xfffffff0,%esp
   7:	ff 71 fc             	push   -0x4(%ecx)
   a:	55                   	push   %ebp
   b:	89 e5                	mov    %esp,%ebp
   d:	57                   	push   %edi
   e:	56                   	push   %esi
   f:	53                   	push   %ebx
  static char buf[100];
  int cmdNumber = 0;
  10:	31 db                	xor    %ebx,%ebx
{
  12:	51                   	push   %ecx
  13:	83 ec 24             	sub    $0x24,%esp
  // number of history array allowed
  int history_size = 1000; 
  struct command* command;
  struct command** history = malloc(history_size * sizeof(command));
  16:	68 a0 0f 00 00       	push   $0xfa0
  1b:	e8 20 0a 00 00       	call   a40 <malloc>

  // Read and run input commands.
  while(getcmd(buf, sizeof(buf), cmdNumber) >= 0)
  20:	83 c4 10             	add    $0x10,%esp
  struct command** history = malloc(history_size * sizeof(command));
  23:	89 45 e0             	mov    %eax,-0x20(%ebp)
  while(getcmd(buf, sizeof(buf), cmdNumber) >= 0)
  26:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  2d:	8d 76 00             	lea    0x0(%esi),%esi
  fprintf(2, "%d | EZ$ ", cmdNumber); 
  30:	83 ec 04             	sub    $0x4,%esp
  33:	53                   	push   %ebx
  34:	68 38 0b 00 00       	push   $0xb38
  39:	6a 02                	push   $0x2
  3b:	e8 30 09 00 00       	call   970 <fprintf>
  memset(buf, 0, nbuf);
  40:	83 c4 0c             	add    $0xc,%esp
  43:	6a 64                	push   $0x64
  45:	6a 00                	push   $0x0
  47:	68 60 0c 00 00       	push   $0xc60
  4c:	e8 ef 03 00 00       	call   440 <memset>
  gets(buf, nbuf);
  51:	59                   	pop    %ecx
  52:	5e                   	pop    %esi
  53:	6a 64                	push   $0x64
  55:	68 60 0c 00 00       	push   $0xc60
  5a:	e8 41 04 00 00       	call   4a0 <gets>
  if(buf[0] == 0) 
  5f:	83 c4 10             	add    $0x10,%esp
  62:	80 3d 60 0c 00 00 00 	cmpb   $0x0,0xc60
  69:	0f 84 9c 01 00 00    	je     20b <main+0x20b>
  {
    command = parsecmd(buf);
  6f:	83 ec 0c             	sub    $0xc,%esp
  72:	68 60 0c 00 00       	push   $0xc60
  77:	e8 14 02 00 00       	call   290 <parsecmd>
  7c:	89 c7                	mov    %eax,%edi
    int type = 0;
    //cmd to history
    history[cmdNumber] = command;
  7e:	8b 45 e0             	mov    -0x20(%ebp),%eax
  81:	8d 34 98             	lea    (%eax,%ebx,4),%esi
  84:	89 3e                	mov    %edi,(%esi)

    // changing directories
    // The goal of "cd" is to change the current working directory of the shell itself, 
    // and that can't be accomplished from a child process unless you pretty much want to sell your soul to get it working.
    // strcmp is string compare
    if(strcmp(command->argv[0],"cd") == 0)
  86:	58                   	pop    %eax
  87:	5a                   	pop    %edx
  88:	68 ae 0b 00 00       	push   $0xbae
  8d:	8b 07                	mov    (%edi),%eax
  8f:	ff 30                	push   (%eax)
  91:	e8 1a 03 00 00       	call   3b0 <strcmp>
  96:	83 c4 10             	add    $0x10,%esp
  99:	85 c0                	test   %eax,%eax
  9b:	0f 84 a7 00 00 00    	je     148 <main+0x148>
      }
      continue;
    }

    // History
    if(command->argv[0][0] == '#')
  a1:	8b 07                	mov    (%edi),%eax
  a3:	8b 08                	mov    (%eax),%ecx
  a5:	80 39 23             	cmpb   $0x23,(%ecx)
  a8:	0f 84 02 01 00 00    	je     1b0 <main+0x1b0>

      // show command called 
      history[cmdNumber] = command;
    }

    if(command->argv[0][strlen(command->argv[0]) - 1] == '&')
  ae:	83 ec 0c             	sub    $0xc,%esp
  b1:	89 4d e4             	mov    %ecx,-0x1c(%ebp)
    int type = 0;
  b4:	31 f6                	xor    %esi,%esi
    if(command->argv[0][strlen(command->argv[0]) - 1] == '&')
  b6:	51                   	push   %ecx
  b7:	e8 54 03 00 00       	call   410 <strlen>
  bc:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
  bf:	83 c4 10             	add    $0x10,%esp
  c2:	80 7c 01 ff 26       	cmpb   $0x26,-0x1(%ecx,%eax,1)
  c7:	0f 84 c3 00 00 00    	je     190 <main+0x190>
      //ezshExec(bArg, command->argv);
      type = 1;
    }

    // exits from the shell
    if(strcmp(command->argv[0],"exit") == 0)
  cd:	83 ec 08             	sub    $0x8,%esp
  d0:	68 6a 0b 00 00       	push   $0xb6a
  d5:	8b 07                	mov    (%edi),%eax
  d7:	ff 30                	push   (%eax)
  d9:	e8 d2 02 00 00       	call   3b0 <strcmp>
  de:	83 c4 10             	add    $0x10,%esp
  e1:	85 c0                	test   %eax,%eax
  e3:	0f 84 fe 00 00 00    	je     1e7 <main+0x1e7>
      exit();
    }

    // https://www.geeksforgeeks.org/fork-system-call/
    // this executes the command
    if(fork() == 0)
  e9:	e8 dd 04 00 00       	call   5cb <fork>
  ee:	85 c0                	test   %eax,%eax
  f0:	0f 84 04 01 00 00    	je     1fa <main+0x1fa>
      //if exec fails exit the child
      
      exit();
    }
  
    if(type == 0)
  f6:	85 f6                	test   %esi,%esi
  f8:	75 36                	jne    130 <main+0x130>
    {
      wait();
  fa:	e8 dc 04 00 00       	call   5db <wait>
      fprintf(2, "Process in background\n");
    }
    
    
    //increments the command number
    cmdNumber++;
  ff:	83 c3 01             	add    $0x1,%ebx
    if(cmdNumber == (history_size))
 102:	81 fb e8 03 00 00    	cmp    $0x3e8,%ebx
 108:	0f 85 22 ff ff ff    	jne    30 <main+0x30>
    {
      //reallocates the history array
      cmdNumber = 0;
      fprintf(2, "history been reset to 0\n");
 10e:	83 ec 08             	sub    $0x8,%esp
      cmdNumber = 0;
 111:	31 db                	xor    %ebx,%ebx
      fprintf(2, "history been reset to 0\n");
 113:	68 95 0b 00 00       	push   $0xb95
 118:	6a 02                	push   $0x2
 11a:	e8 51 08 00 00       	call   970 <fprintf>
 11f:	83 c4 10             	add    $0x10,%esp
 122:	e9 09 ff ff ff       	jmp    30 <main+0x30>
 127:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 12e:	66 90                	xchg   %ax,%ax
      fprintf(2, "Process in background\n");
 130:	83 ec 08             	sub    $0x8,%esp
 133:	68 7e 0b 00 00       	push   $0xb7e
 138:	6a 02                	push   $0x2
 13a:	e8 31 08 00 00       	call   970 <fprintf>
 13f:	83 c4 10             	add    $0x10,%esp
 142:	eb bb                	jmp    ff <main+0xff>
 144:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
      fprintf(2, "changing directory\n");
 148:	83 ec 08             	sub    $0x8,%esp
 14b:	68 42 0b 00 00       	push   $0xb42
 150:	6a 02                	push   $0x2
 152:	e8 19 08 00 00       	call   970 <fprintf>
      if (command->argc < 2)
 157:	83 c4 10             	add    $0x10,%esp
 15a:	83 7f 04 01          	cmpl   $0x1,0x4(%edi)
 15e:	7e 70                	jle    1d0 <main+0x1d0>
      else if(chdir(command->argv[1]) != 0)
 160:	8b 07                	mov    (%edi),%eax
 162:	83 ec 0c             	sub    $0xc,%esp
 165:	ff 70 04             	push   0x4(%eax)
 168:	e8 d6 04 00 00       	call   643 <chdir>
 16d:	83 c4 10             	add    $0x10,%esp
 170:	85 c0                	test   %eax,%eax
 172:	0f 84 b8 fe ff ff    	je     30 <main+0x30>
        fprintf(2, "error changing dir\n");
 178:	50                   	push   %eax
 179:	50                   	push   %eax
 17a:	68 56 0b 00 00       	push   $0xb56
 17f:	6a 02                	push   $0x2
 181:	e8 ea 07 00 00       	call   970 <fprintf>
 186:	83 c4 10             	add    $0x10,%esp
 189:	e9 a2 fe ff ff       	jmp    30 <main+0x30>
 18e:	66 90                	xchg   %ax,%ax
      command->argv[0][strlen(command->argv[0]) - 1] = '\0';
 190:	8b 07                	mov    (%edi),%eax
 192:	83 ec 0c             	sub    $0xc,%esp
 195:	8b 30                	mov    (%eax),%esi
 197:	56                   	push   %esi
 198:	e8 73 02 00 00       	call   410 <strlen>
 19d:	83 c4 10             	add    $0x10,%esp
 1a0:	c6 44 06 ff 00       	movb   $0x0,-0x1(%esi,%eax,1)
      type = 1;
 1a5:	be 01 00 00 00       	mov    $0x1,%esi
 1aa:	e9 1e ff ff ff       	jmp    cd <main+0xcd>
 1af:	90                   	nop
      int NewcmdNumber = atoi(command->argv[0] + 1);
 1b0:	83 ec 0c             	sub    $0xc,%esp
 1b3:	83 c1 01             	add    $0x1,%ecx
 1b6:	51                   	push   %ecx
 1b7:	e8 a4 03 00 00       	call   560 <atoi>
      command = history[NewcmdNumber];
 1bc:	8b 55 e0             	mov    -0x20(%ebp),%edx
    if(command->argv[0][strlen(command->argv[0]) - 1] == '&')
 1bf:	83 c4 10             	add    $0x10,%esp
      command = history[NewcmdNumber];
 1c2:	8b 3c 82             	mov    (%edx,%eax,4),%edi
      history[cmdNumber] = command;
 1c5:	89 3e                	mov    %edi,(%esi)
    if(command->argv[0][strlen(command->argv[0]) - 1] == '&')
 1c7:	8b 07                	mov    (%edi),%eax
 1c9:	8b 08                	mov    (%eax),%ecx
 1cb:	e9 de fe ff ff       	jmp    ae <main+0xae>
        fprintf(2, "cd takes more than one argument.\n");
 1d0:	83 ec 08             	sub    $0x8,%esp
 1d3:	68 b4 0b 00 00       	push   $0xbb4
 1d8:	6a 02                	push   $0x2
 1da:	e8 91 07 00 00       	call   970 <fprintf>
 1df:	83 c4 10             	add    $0x10,%esp
 1e2:	e9 49 fe ff ff       	jmp    30 <main+0x30>
      fprintf(2, "exiting shell\n");
 1e7:	50                   	push   %eax
 1e8:	50                   	push   %eax
 1e9:	68 6f 0b 00 00       	push   $0xb6f
 1ee:	6a 02                	push   $0x2
 1f0:	e8 7b 07 00 00       	call   970 <fprintf>
      exit();
 1f5:	e8 d9 03 00 00       	call   5d3 <exit>
      exec(command->argv[0], command->argv);
 1fa:	8b 07                	mov    (%edi),%eax
 1fc:	57                   	push   %edi
 1fd:	57                   	push   %edi
 1fe:	50                   	push   %eax
 1ff:	ff 30                	push   (%eax)
 201:	e8 05 04 00 00       	call   60b <exec>
      exit();
 206:	e8 c8 03 00 00       	call   5d3 <exit>
    }
    
  }
  exit();
 20b:	e8 c3 03 00 00       	call   5d3 <exit>

00000210 <getcmd>:
{
 210:	55                   	push   %ebp
 211:	89 e5                	mov    %esp,%ebp
 213:	56                   	push   %esi
 214:	53                   	push   %ebx
 215:	8b 75 0c             	mov    0xc(%ebp),%esi
 218:	8b 5d 08             	mov    0x8(%ebp),%ebx
  fprintf(2, "%d | EZ$ ", cmdNumber); 
 21b:	83 ec 04             	sub    $0x4,%esp
 21e:	ff 75 10             	push   0x10(%ebp)
 221:	68 38 0b 00 00       	push   $0xb38
 226:	6a 02                	push   $0x2
 228:	e8 43 07 00 00       	call   970 <fprintf>
  memset(buf, 0, nbuf);
 22d:	83 c4 0c             	add    $0xc,%esp
 230:	56                   	push   %esi
 231:	6a 00                	push   $0x0
 233:	53                   	push   %ebx
 234:	e8 07 02 00 00       	call   440 <memset>
  gets(buf, nbuf);
 239:	58                   	pop    %eax
 23a:	5a                   	pop    %edx
 23b:	56                   	push   %esi
 23c:	53                   	push   %ebx
 23d:	e8 5e 02 00 00       	call   4a0 <gets>
  if(buf[0] == 0) 
 242:	83 c4 10             	add    $0x10,%esp
 245:	80 3b 01             	cmpb   $0x1,(%ebx)
 248:	19 c0                	sbb    %eax,%eax
}
 24a:	8d 65 f8             	lea    -0x8(%ebp),%esp
 24d:	5b                   	pop    %ebx
 24e:	5e                   	pop    %esi
 24f:	5d                   	pop    %ebp
 250:	c3                   	ret    
 251:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 258:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 25f:	90                   	nop

00000260 <findSpace>:
{
 260:	55                   	push   %ebp
 261:	89 e5                	mov    %esp,%ebp
 263:	83 ec 10             	sub    $0x10,%esp
  if(strchr(whitespace, c) == 0 ) 
 266:	0f be 45 08          	movsbl 0x8(%ebp),%eax
 26a:	50                   	push   %eax
 26b:	68 4c 0c 00 00       	push   $0xc4c
 270:	e8 eb 01 00 00       	call   460 <strchr>
 275:	83 c4 10             	add    $0x10,%esp
}
 278:	c9                   	leave  
  if(strchr(whitespace, c) == 0 ) 
 279:	85 c0                	test   %eax,%eax
 27b:	0f 95 c0             	setne  %al
 27e:	0f b6 c0             	movzbl %al,%eax
}
 281:	c3                   	ret    
 282:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 289:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000290 <parsecmd>:
parsecmd(const char *buf){
 290:	55                   	push   %ebp
 291:	89 e5                	mov    %esp,%ebp
 293:	57                   	push   %edi
 294:	56                   	push   %esi
 295:	53                   	push   %ebx
 296:	83 ec 28             	sub    $0x28,%esp
  command = malloc(sizeof *command); 
 299:	6a 08                	push   $0x8
 29b:	e8 a0 07 00 00       	call   a40 <malloc>
  command->argv = malloc(MAX_ARGS * sizeof command->argv);
 2a0:	c7 04 24 64 00 00 00 	movl   $0x64,(%esp)
  command = malloc(sizeof *command); 
 2a7:	89 c7                	mov    %eax,%edi
  command->argv = malloc(MAX_ARGS * sizeof command->argv);
 2a9:	e8 92 07 00 00       	call   a40 <malloc>
 2ae:	89 07                	mov    %eax,(%edi)
 2b0:	89 c3                	mov    %eax,%ebx
  command->argv[0] = malloc(ARG_LEN * sizeof *command->argv); 
 2b2:	c7 04 24 78 00 00 00 	movl   $0x78,(%esp)
 2b9:	e8 82 07 00 00       	call   a40 <malloc>
  for(int i = 0; buf[i]; i++){
 2be:	83 c4 10             	add    $0x10,%esp
  command->argv[0] = malloc(ARG_LEN * sizeof *command->argv); 
 2c1:	89 03                	mov    %eax,(%ebx)
  for(int i = 0; buf[i]; i++){
 2c3:	8b 45 08             	mov    0x8(%ebp),%eax
 2c6:	0f be 00             	movsbl (%eax),%eax
 2c9:	84 c0                	test   %al,%al
 2cb:	0f 84 9f 00 00 00    	je     370 <parsecmd+0xe0>
  int offset = 0;
 2d1:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
  for(int i = 0; buf[i]; i++){
 2d8:	31 f6                	xor    %esi,%esi
  int arg = 0;
 2da:	31 db                	xor    %ebx,%ebx
 2dc:	eb 2d                	jmp    30b <parsecmd+0x7b>
 2de:	66 90                	xchg   %ax,%ax
      command->argv[arg] = malloc(30 * sizeof (char));
 2e0:	83 ec 0c             	sub    $0xc,%esp
 2e3:	8b 07                	mov    (%edi),%eax
      arg++;
 2e5:	83 c3 01             	add    $0x1,%ebx
      command->argv[arg] = malloc(30 * sizeof (char));
 2e8:	6a 1e                	push   $0x1e
 2ea:	8d 0c 98             	lea    (%eax,%ebx,4),%ecx
 2ed:	89 4d e4             	mov    %ecx,-0x1c(%ebp)
 2f0:	e8 4b 07 00 00       	call   a40 <malloc>
 2f5:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
      continue;
 2f8:	83 c4 10             	add    $0x10,%esp
      offset = i + 1; 
 2fb:	89 75 e4             	mov    %esi,-0x1c(%ebp)
      command->argv[arg] = malloc(30 * sizeof (char));
 2fe:	89 01                	mov    %eax,(%ecx)
  for(int i = 0; buf[i]; i++){
 300:	8b 45 08             	mov    0x8(%ebp),%eax
 303:	0f be 04 30          	movsbl (%eax,%esi,1),%eax
 307:	84 c0                	test   %al,%al
 309:	74 3a                	je     345 <parsecmd+0xb5>
  if(strchr(whitespace, c) == 0 ) 
 30b:	83 ec 08             	sub    $0x8,%esp
 30e:	50                   	push   %eax
 30f:	68 4c 0c 00 00       	push   $0xc4c
 314:	e8 47 01 00 00       	call   460 <strchr>
 319:	83 c4 10             	add    $0x10,%esp
 31c:	89 c1                	mov    %eax,%ecx
 31e:	89 f0                	mov    %esi,%eax
      offset = i + 1; 
 320:	83 c6 01             	add    $0x1,%esi
  if(strchr(whitespace, c) == 0 ) 
 323:	85 c9                	test   %ecx,%ecx
 325:	75 b9                	jne    2e0 <parsecmd+0x50>
    command->argv[arg][i - offset] = buf[i]; 
 327:	8b 0f                	mov    (%edi),%ecx
 329:	8b 55 08             	mov    0x8(%ebp),%edx
 32c:	2b 45 e4             	sub    -0x1c(%ebp),%eax
 32f:	0f b6 54 32 ff       	movzbl -0x1(%edx,%esi,1),%edx
 334:	8b 0c 99             	mov    (%ecx,%ebx,4),%ecx
 337:	88 14 01             	mov    %dl,(%ecx,%eax,1)
  for(int i = 0; buf[i]; i++){
 33a:	8b 45 08             	mov    0x8(%ebp),%eax
 33d:	0f be 04 30          	movsbl (%eax,%esi,1),%eax
 341:	84 c0                	test   %al,%al
 343:	75 c6                	jne    30b <parsecmd+0x7b>
  command->argc = arg; 
 345:	89 5f 04             	mov    %ebx,0x4(%edi)
  for(int i = arg; i < MAX_ARGS; i++)
 348:	83 fb 18             	cmp    $0x18,%ebx
 34b:	7f 14                	jg     361 <parsecmd+0xd1>
 34d:	8d 76 00             	lea    0x0(%esi),%esi
    command->argv[i] = '\0';
 350:	8b 07                	mov    (%edi),%eax
 352:	c7 04 98 00 00 00 00 	movl   $0x0,(%eax,%ebx,4)
  for(int i = arg; i < MAX_ARGS; i++)
 359:	83 c3 01             	add    $0x1,%ebx
 35c:	83 fb 19             	cmp    $0x19,%ebx
 35f:	75 ef                	jne    350 <parsecmd+0xc0>
}
 361:	8d 65 f4             	lea    -0xc(%ebp),%esp
 364:	89 f8                	mov    %edi,%eax
 366:	5b                   	pop    %ebx
 367:	5e                   	pop    %esi
 368:	5f                   	pop    %edi
 369:	5d                   	pop    %ebp
 36a:	c3                   	ret    
 36b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 36f:	90                   	nop
  command->argc = arg; 
 370:	c7 47 04 00 00 00 00 	movl   $0x0,0x4(%edi)
  int arg = 0;
 377:	31 db                	xor    %ebx,%ebx
 379:	eb d5                	jmp    350 <parsecmd+0xc0>
 37b:	66 90                	xchg   %ax,%ax
 37d:	66 90                	xchg   %ax,%ax
 37f:	90                   	nop

00000380 <strcpy>:
#include "user/user.h"
#include "../kernel/x86.h"

char*
strcpy(char *s, const char *t)
{
 380:	55                   	push   %ebp
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 381:	31 c0                	xor    %eax,%eax
{
 383:	89 e5                	mov    %esp,%ebp
 385:	53                   	push   %ebx
 386:	8b 4d 08             	mov    0x8(%ebp),%ecx
 389:	8b 5d 0c             	mov    0xc(%ebp),%ebx
 38c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  while((*s++ = *t++) != 0)
 390:	0f b6 14 03          	movzbl (%ebx,%eax,1),%edx
 394:	88 14 01             	mov    %dl,(%ecx,%eax,1)
 397:	83 c0 01             	add    $0x1,%eax
 39a:	84 d2                	test   %dl,%dl
 39c:	75 f2                	jne    390 <strcpy+0x10>
    ;
  return os;
}
 39e:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 3a1:	89 c8                	mov    %ecx,%eax
 3a3:	c9                   	leave  
 3a4:	c3                   	ret    
 3a5:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 3ac:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

000003b0 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 3b0:	55                   	push   %ebp
 3b1:	89 e5                	mov    %esp,%ebp
 3b3:	53                   	push   %ebx
 3b4:	8b 55 08             	mov    0x8(%ebp),%edx
 3b7:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  while(*p && *p == *q)
 3ba:	0f b6 02             	movzbl (%edx),%eax
 3bd:	84 c0                	test   %al,%al
 3bf:	75 17                	jne    3d8 <strcmp+0x28>
 3c1:	eb 3a                	jmp    3fd <strcmp+0x4d>
 3c3:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 3c7:	90                   	nop
 3c8:	0f b6 42 01          	movzbl 0x1(%edx),%eax
    p++, q++;
 3cc:	83 c2 01             	add    $0x1,%edx
 3cf:	8d 59 01             	lea    0x1(%ecx),%ebx
  while(*p && *p == *q)
 3d2:	84 c0                	test   %al,%al
 3d4:	74 1a                	je     3f0 <strcmp+0x40>
    p++, q++;
 3d6:	89 d9                	mov    %ebx,%ecx
  while(*p && *p == *q)
 3d8:	0f b6 19             	movzbl (%ecx),%ebx
 3db:	38 c3                	cmp    %al,%bl
 3dd:	74 e9                	je     3c8 <strcmp+0x18>
  return (uchar)*p - (uchar)*q;
 3df:	29 d8                	sub    %ebx,%eax
}
 3e1:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 3e4:	c9                   	leave  
 3e5:	c3                   	ret    
 3e6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 3ed:	8d 76 00             	lea    0x0(%esi),%esi
  return (uchar)*p - (uchar)*q;
 3f0:	0f b6 59 01          	movzbl 0x1(%ecx),%ebx
 3f4:	31 c0                	xor    %eax,%eax
 3f6:	29 d8                	sub    %ebx,%eax
}
 3f8:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 3fb:	c9                   	leave  
 3fc:	c3                   	ret    
  return (uchar)*p - (uchar)*q;
 3fd:	0f b6 19             	movzbl (%ecx),%ebx
 400:	31 c0                	xor    %eax,%eax
 402:	eb db                	jmp    3df <strcmp+0x2f>
 404:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 40b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 40f:	90                   	nop

00000410 <strlen>:

uint
strlen(const char *s)
{
 410:	55                   	push   %ebp
 411:	89 e5                	mov    %esp,%ebp
 413:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  for(n = 0; s[n]; n++)
 416:	80 3a 00             	cmpb   $0x0,(%edx)
 419:	74 15                	je     430 <strlen+0x20>
 41b:	31 c0                	xor    %eax,%eax
 41d:	8d 76 00             	lea    0x0(%esi),%esi
 420:	83 c0 01             	add    $0x1,%eax
 423:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
 427:	89 c1                	mov    %eax,%ecx
 429:	75 f5                	jne    420 <strlen+0x10>
    ;
  return n;
}
 42b:	89 c8                	mov    %ecx,%eax
 42d:	5d                   	pop    %ebp
 42e:	c3                   	ret    
 42f:	90                   	nop
  for(n = 0; s[n]; n++)
 430:	31 c9                	xor    %ecx,%ecx
}
 432:	5d                   	pop    %ebp
 433:	89 c8                	mov    %ecx,%eax
 435:	c3                   	ret    
 436:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 43d:	8d 76 00             	lea    0x0(%esi),%esi

00000440 <memset>:

void*
memset(void *dst, int c, uint n)
{
 440:	55                   	push   %ebp
 441:	89 e5                	mov    %esp,%ebp
 443:	57                   	push   %edi
 444:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 447:	8b 4d 10             	mov    0x10(%ebp),%ecx
 44a:	8b 45 0c             	mov    0xc(%ebp),%eax
 44d:	89 d7                	mov    %edx,%edi
 44f:	fc                   	cld    
 450:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 452:	8b 7d fc             	mov    -0x4(%ebp),%edi
 455:	89 d0                	mov    %edx,%eax
 457:	c9                   	leave  
 458:	c3                   	ret    
 459:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000460 <strchr>:

char*
strchr(const char *s, char c)
{
 460:	55                   	push   %ebp
 461:	89 e5                	mov    %esp,%ebp
 463:	8b 45 08             	mov    0x8(%ebp),%eax
 466:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 46a:	0f b6 10             	movzbl (%eax),%edx
 46d:	84 d2                	test   %dl,%dl
 46f:	75 12                	jne    483 <strchr+0x23>
 471:	eb 1d                	jmp    490 <strchr+0x30>
 473:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 477:	90                   	nop
 478:	0f b6 50 01          	movzbl 0x1(%eax),%edx
 47c:	83 c0 01             	add    $0x1,%eax
 47f:	84 d2                	test   %dl,%dl
 481:	74 0d                	je     490 <strchr+0x30>
    if(*s == c)
 483:	38 d1                	cmp    %dl,%cl
 485:	75 f1                	jne    478 <strchr+0x18>
      return (char*)s;
  return 0;
}
 487:	5d                   	pop    %ebp
 488:	c3                   	ret    
 489:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  return 0;
 490:	31 c0                	xor    %eax,%eax
}
 492:	5d                   	pop    %ebp
 493:	c3                   	ret    
 494:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 49b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 49f:	90                   	nop

000004a0 <gets>:

char*
gets(char *buf, int max)
{
 4a0:	55                   	push   %ebp
 4a1:	89 e5                	mov    %esp,%ebp
 4a3:	57                   	push   %edi
 4a4:	56                   	push   %esi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    cc = read(0, &c, 1);
 4a5:	8d 7d e7             	lea    -0x19(%ebp),%edi
{
 4a8:	53                   	push   %ebx
  for(i=0; i+1 < max; ){
 4a9:	31 db                	xor    %ebx,%ebx
{
 4ab:	83 ec 1c             	sub    $0x1c,%esp
  for(i=0; i+1 < max; ){
 4ae:	eb 27                	jmp    4d7 <gets+0x37>
    cc = read(0, &c, 1);
 4b0:	83 ec 04             	sub    $0x4,%esp
 4b3:	6a 01                	push   $0x1
 4b5:	57                   	push   %edi
 4b6:	6a 00                	push   $0x0
 4b8:	e8 2e 01 00 00       	call   5eb <read>
    if(cc < 1)
 4bd:	83 c4 10             	add    $0x10,%esp
 4c0:	85 c0                	test   %eax,%eax
 4c2:	7e 1d                	jle    4e1 <gets+0x41>
      break;
    buf[i++] = c;
 4c4:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 4c8:	8b 55 08             	mov    0x8(%ebp),%edx
 4cb:	88 44 1a ff          	mov    %al,-0x1(%edx,%ebx,1)
    if(c == '\n' || c == '\r')
 4cf:	3c 0a                	cmp    $0xa,%al
 4d1:	74 1d                	je     4f0 <gets+0x50>
 4d3:	3c 0d                	cmp    $0xd,%al
 4d5:	74 19                	je     4f0 <gets+0x50>
  for(i=0; i+1 < max; ){
 4d7:	89 de                	mov    %ebx,%esi
 4d9:	83 c3 01             	add    $0x1,%ebx
 4dc:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 4df:	7c cf                	jl     4b0 <gets+0x10>
      break;
  }
  buf[i] = '\0';
 4e1:	8b 45 08             	mov    0x8(%ebp),%eax
 4e4:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
  return buf;
}
 4e8:	8d 65 f4             	lea    -0xc(%ebp),%esp
 4eb:	5b                   	pop    %ebx
 4ec:	5e                   	pop    %esi
 4ed:	5f                   	pop    %edi
 4ee:	5d                   	pop    %ebp
 4ef:	c3                   	ret    
  buf[i] = '\0';
 4f0:	8b 45 08             	mov    0x8(%ebp),%eax
 4f3:	89 de                	mov    %ebx,%esi
 4f5:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
}
 4f9:	8d 65 f4             	lea    -0xc(%ebp),%esp
 4fc:	5b                   	pop    %ebx
 4fd:	5e                   	pop    %esi
 4fe:	5f                   	pop    %edi
 4ff:	5d                   	pop    %ebp
 500:	c3                   	ret    
 501:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 508:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 50f:	90                   	nop

00000510 <stat>:

int
stat(const char *n, struct stat *st)
{
 510:	55                   	push   %ebp
 511:	89 e5                	mov    %esp,%ebp
 513:	56                   	push   %esi
 514:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 515:	83 ec 08             	sub    $0x8,%esp
 518:	6a 00                	push   $0x0
 51a:	ff 75 08             	push   0x8(%ebp)
 51d:	e8 f1 00 00 00       	call   613 <open>
  if(fd < 0)
 522:	83 c4 10             	add    $0x10,%esp
 525:	85 c0                	test   %eax,%eax
 527:	78 27                	js     550 <stat+0x40>
    return -1;
  r = fstat(fd, st);
 529:	83 ec 08             	sub    $0x8,%esp
 52c:	ff 75 0c             	push   0xc(%ebp)
 52f:	89 c3                	mov    %eax,%ebx
 531:	50                   	push   %eax
 532:	e8 f4 00 00 00       	call   62b <fstat>
  close(fd);
 537:	89 1c 24             	mov    %ebx,(%esp)
  r = fstat(fd, st);
 53a:	89 c6                	mov    %eax,%esi
  close(fd);
 53c:	e8 ba 00 00 00       	call   5fb <close>
  return r;
 541:	83 c4 10             	add    $0x10,%esp
}
 544:	8d 65 f8             	lea    -0x8(%ebp),%esp
 547:	89 f0                	mov    %esi,%eax
 549:	5b                   	pop    %ebx
 54a:	5e                   	pop    %esi
 54b:	5d                   	pop    %ebp
 54c:	c3                   	ret    
 54d:	8d 76 00             	lea    0x0(%esi),%esi
    return -1;
 550:	be ff ff ff ff       	mov    $0xffffffff,%esi
 555:	eb ed                	jmp    544 <stat+0x34>
 557:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 55e:	66 90                	xchg   %ax,%ax

00000560 <atoi>:

int
atoi(const char *s)
{
 560:	55                   	push   %ebp
 561:	89 e5                	mov    %esp,%ebp
 563:	53                   	push   %ebx
 564:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 567:	0f be 02             	movsbl (%edx),%eax
 56a:	8d 48 d0             	lea    -0x30(%eax),%ecx
 56d:	80 f9 09             	cmp    $0x9,%cl
  n = 0;
 570:	b9 00 00 00 00       	mov    $0x0,%ecx
  while('0' <= *s && *s <= '9')
 575:	77 1e                	ja     595 <atoi+0x35>
 577:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 57e:	66 90                	xchg   %ax,%ax
    n = n*10 + *s++ - '0';
 580:	83 c2 01             	add    $0x1,%edx
 583:	8d 0c 89             	lea    (%ecx,%ecx,4),%ecx
 586:	8d 4c 48 d0          	lea    -0x30(%eax,%ecx,2),%ecx
  while('0' <= *s && *s <= '9')
 58a:	0f be 02             	movsbl (%edx),%eax
 58d:	8d 58 d0             	lea    -0x30(%eax),%ebx
 590:	80 fb 09             	cmp    $0x9,%bl
 593:	76 eb                	jbe    580 <atoi+0x20>
  return n;
}
 595:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 598:	89 c8                	mov    %ecx,%eax
 59a:	c9                   	leave  
 59b:	c3                   	ret    
 59c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

000005a0 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 5a0:	55                   	push   %ebp
 5a1:	89 e5                	mov    %esp,%ebp
 5a3:	57                   	push   %edi
 5a4:	8b 45 10             	mov    0x10(%ebp),%eax
 5a7:	8b 55 08             	mov    0x8(%ebp),%edx
 5aa:	56                   	push   %esi
 5ab:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 5ae:	85 c0                	test   %eax,%eax
 5b0:	7e 13                	jle    5c5 <memmove+0x25>
 5b2:	01 d0                	add    %edx,%eax
  dst = vdst;
 5b4:	89 d7                	mov    %edx,%edi
 5b6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 5bd:	8d 76 00             	lea    0x0(%esi),%esi
    *dst++ = *src++;
 5c0:	a4                   	movsb  %ds:(%esi),%es:(%edi)
  while(n-- > 0)
 5c1:	39 f8                	cmp    %edi,%eax
 5c3:	75 fb                	jne    5c0 <memmove+0x20>
  return vdst;
}
 5c5:	5e                   	pop    %esi
 5c6:	89 d0                	mov    %edx,%eax
 5c8:	5f                   	pop    %edi
 5c9:	5d                   	pop    %ebp
 5ca:	c3                   	ret    

000005cb <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 5cb:	b8 01 00 00 00       	mov    $0x1,%eax
 5d0:	cd 40                	int    $0x40
 5d2:	c3                   	ret    

000005d3 <exit>:
SYSCALL(exit)
 5d3:	b8 02 00 00 00       	mov    $0x2,%eax
 5d8:	cd 40                	int    $0x40
 5da:	c3                   	ret    

000005db <wait>:
SYSCALL(wait)
 5db:	b8 03 00 00 00       	mov    $0x3,%eax
 5e0:	cd 40                	int    $0x40
 5e2:	c3                   	ret    

000005e3 <pipe>:
SYSCALL(pipe)
 5e3:	b8 04 00 00 00       	mov    $0x4,%eax
 5e8:	cd 40                	int    $0x40
 5ea:	c3                   	ret    

000005eb <read>:
SYSCALL(read)
 5eb:	b8 05 00 00 00       	mov    $0x5,%eax
 5f0:	cd 40                	int    $0x40
 5f2:	c3                   	ret    

000005f3 <write>:
SYSCALL(write)
 5f3:	b8 10 00 00 00       	mov    $0x10,%eax
 5f8:	cd 40                	int    $0x40
 5fa:	c3                   	ret    

000005fb <close>:
SYSCALL(close)
 5fb:	b8 15 00 00 00       	mov    $0x15,%eax
 600:	cd 40                	int    $0x40
 602:	c3                   	ret    

00000603 <kill>:
SYSCALL(kill)
 603:	b8 06 00 00 00       	mov    $0x6,%eax
 608:	cd 40                	int    $0x40
 60a:	c3                   	ret    

0000060b <exec>:
SYSCALL(exec)
 60b:	b8 07 00 00 00       	mov    $0x7,%eax
 610:	cd 40                	int    $0x40
 612:	c3                   	ret    

00000613 <open>:
SYSCALL(open)
 613:	b8 0f 00 00 00       	mov    $0xf,%eax
 618:	cd 40                	int    $0x40
 61a:	c3                   	ret    

0000061b <mknod>:
SYSCALL(mknod)
 61b:	b8 11 00 00 00       	mov    $0x11,%eax
 620:	cd 40                	int    $0x40
 622:	c3                   	ret    

00000623 <unlink>:
SYSCALL(unlink)
 623:	b8 12 00 00 00       	mov    $0x12,%eax
 628:	cd 40                	int    $0x40
 62a:	c3                   	ret    

0000062b <fstat>:
SYSCALL(fstat)
 62b:	b8 08 00 00 00       	mov    $0x8,%eax
 630:	cd 40                	int    $0x40
 632:	c3                   	ret    

00000633 <link>:
SYSCALL(link)
 633:	b8 13 00 00 00       	mov    $0x13,%eax
 638:	cd 40                	int    $0x40
 63a:	c3                   	ret    

0000063b <mkdir>:
SYSCALL(mkdir)
 63b:	b8 14 00 00 00       	mov    $0x14,%eax
 640:	cd 40                	int    $0x40
 642:	c3                   	ret    

00000643 <chdir>:
SYSCALL(chdir)
 643:	b8 09 00 00 00       	mov    $0x9,%eax
 648:	cd 40                	int    $0x40
 64a:	c3                   	ret    

0000064b <dup>:
SYSCALL(dup)
 64b:	b8 0a 00 00 00       	mov    $0xa,%eax
 650:	cd 40                	int    $0x40
 652:	c3                   	ret    

00000653 <getpid>:
SYSCALL(getpid)
 653:	b8 0b 00 00 00       	mov    $0xb,%eax
 658:	cd 40                	int    $0x40
 65a:	c3                   	ret    

0000065b <sbrk>:
SYSCALL(sbrk)
 65b:	b8 0c 00 00 00       	mov    $0xc,%eax
 660:	cd 40                	int    $0x40
 662:	c3                   	ret    

00000663 <sleep>:
SYSCALL(sleep)
 663:	b8 0d 00 00 00       	mov    $0xd,%eax
 668:	cd 40                	int    $0x40
 66a:	c3                   	ret    

0000066b <uptime>:
SYSCALL(uptime)
 66b:	b8 0e 00 00 00       	mov    $0xe,%eax
 670:	cd 40                	int    $0x40
 672:	c3                   	ret    

00000673 <cpuhalt>:
SYSCALL(cpuhalt)
 673:	b8 16 00 00 00       	mov    $0x16,%eax
 678:	cd 40                	int    $0x40
 67a:	c3                   	ret    
 67b:	66 90                	xchg   %ax,%ax
 67d:	66 90                	xchg   %ax,%ax
 67f:	90                   	nop

00000680 <printint>:
    putc(fd, digits[x >> (sizeof(uint) * 8 - 4)]);
}

static void
printint(int fd, int xx, int base, int sgn)
{
 680:	55                   	push   %ebp
 681:	89 e5                	mov    %esp,%ebp
 683:	57                   	push   %edi
 684:	56                   	push   %esi
 685:	53                   	push   %ebx
 686:	83 ec 3c             	sub    $0x3c,%esp
 689:	89 4d c4             	mov    %ecx,-0x3c(%ebp)
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
    x = -xx;
 68c:	89 d1                	mov    %edx,%ecx
{
 68e:	89 45 b8             	mov    %eax,-0x48(%ebp)
  if(sgn && xx < 0){
 691:	85 d2                	test   %edx,%edx
 693:	0f 89 7f 00 00 00    	jns    718 <printint+0x98>
 699:	f6 45 08 01          	testb  $0x1,0x8(%ebp)
 69d:	74 79                	je     718 <printint+0x98>
    neg = 1;
 69f:	c7 45 bc 01 00 00 00 	movl   $0x1,-0x44(%ebp)
    x = -xx;
 6a6:	f7 d9                	neg    %ecx
  } else {
    x = xx;
  }

  i = 0;
 6a8:	31 db                	xor    %ebx,%ebx
 6aa:	8d 75 d7             	lea    -0x29(%ebp),%esi
 6ad:	8d 76 00             	lea    0x0(%esi),%esi
  do{
    buf[i++] = digits[x % base];
 6b0:	89 c8                	mov    %ecx,%eax
 6b2:	31 d2                	xor    %edx,%edx
 6b4:	89 cf                	mov    %ecx,%edi
 6b6:	f7 75 c4             	divl   -0x3c(%ebp)
 6b9:	0f b6 92 38 0c 00 00 	movzbl 0xc38(%edx),%edx
 6c0:	89 45 c0             	mov    %eax,-0x40(%ebp)
 6c3:	89 d8                	mov    %ebx,%eax
 6c5:	8d 5b 01             	lea    0x1(%ebx),%ebx
  }while((x /= base) != 0);
 6c8:	8b 4d c0             	mov    -0x40(%ebp),%ecx
    buf[i++] = digits[x % base];
 6cb:	88 14 1e             	mov    %dl,(%esi,%ebx,1)
  }while((x /= base) != 0);
 6ce:	39 7d c4             	cmp    %edi,-0x3c(%ebp)
 6d1:	76 dd                	jbe    6b0 <printint+0x30>
  if(neg)
 6d3:	8b 4d bc             	mov    -0x44(%ebp),%ecx
 6d6:	85 c9                	test   %ecx,%ecx
 6d8:	74 0c                	je     6e6 <printint+0x66>
    buf[i++] = '-';
 6da:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
    buf[i++] = digits[x % base];
 6df:	89 d8                	mov    %ebx,%eax
    buf[i++] = '-';
 6e1:	ba 2d 00 00 00       	mov    $0x2d,%edx

  while(--i >= 0)
 6e6:	8b 7d b8             	mov    -0x48(%ebp),%edi
 6e9:	8d 5c 05 d7          	lea    -0x29(%ebp,%eax,1),%ebx
 6ed:	eb 07                	jmp    6f6 <printint+0x76>
 6ef:	90                   	nop
    putc(fd, buf[i]);
 6f0:	0f b6 13             	movzbl (%ebx),%edx
 6f3:	83 eb 01             	sub    $0x1,%ebx
  write(fd, &c, 1);
 6f6:	83 ec 04             	sub    $0x4,%esp
 6f9:	88 55 d7             	mov    %dl,-0x29(%ebp)
 6fc:	6a 01                	push   $0x1
 6fe:	56                   	push   %esi
 6ff:	57                   	push   %edi
 700:	e8 ee fe ff ff       	call   5f3 <write>
  while(--i >= 0)
 705:	83 c4 10             	add    $0x10,%esp
 708:	39 de                	cmp    %ebx,%esi
 70a:	75 e4                	jne    6f0 <printint+0x70>
}
 70c:	8d 65 f4             	lea    -0xc(%ebp),%esp
 70f:	5b                   	pop    %ebx
 710:	5e                   	pop    %esi
 711:	5f                   	pop    %edi
 712:	5d                   	pop    %ebp
 713:	c3                   	ret    
 714:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
 718:	c7 45 bc 00 00 00 00 	movl   $0x0,-0x44(%ebp)
 71f:	eb 87                	jmp    6a8 <printint+0x28>
 721:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 728:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 72f:	90                   	nop

00000730 <vprintf>:
static void vprintf(int fd, const char *fmt, va_list ap)
{
 730:	55                   	push   %ebp
 731:	89 e5                	mov    %esp,%ebp
 733:	57                   	push   %edi
 734:	56                   	push   %esi
 735:	53                   	push   %ebx
 736:	83 ec 2c             	sub    $0x2c,%esp
 739:	89 4d d4             	mov    %ecx,-0x2c(%ebp)
  char *s;
  int c, i, state;

  state = 0;
  for(i = 0; fmt[i]; i++){
 73c:	0f b6 0a             	movzbl (%edx),%ecx
 73f:	84 c9                	test   %cl,%cl
 741:	74 6c                	je     7af <vprintf+0x7f>
 743:	89 c6                	mov    %eax,%esi
 745:	8d 5a 01             	lea    0x1(%edx),%ebx
 748:	31 ff                	xor    %edi,%edi
 74a:	eb 28                	jmp    774 <vprintf+0x44>
 74c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
 750:	83 f8 25             	cmp    $0x25,%eax
 753:	74 4b                	je     7a0 <vprintf+0x70>
  write(fd, &c, 1);
 755:	83 ec 04             	sub    $0x4,%esp
 758:	8d 45 e7             	lea    -0x19(%ebp),%eax
 75b:	88 4d e7             	mov    %cl,-0x19(%ebp)
 75e:	6a 01                	push   $0x1
 760:	50                   	push   %eax
 761:	56                   	push   %esi
 762:	e8 8c fe ff ff       	call   5f3 <write>
        state = '%';
      } else {
        putc(fd, c);
 767:	83 c4 10             	add    $0x10,%esp
  for(i = 0; fmt[i]; i++){
 76a:	0f b6 0b             	movzbl (%ebx),%ecx
 76d:	83 c3 01             	add    $0x1,%ebx
 770:	84 c9                	test   %cl,%cl
 772:	74 3b                	je     7af <vprintf+0x7f>
    c = fmt[i] & 0xff;
 774:	0f b6 c1             	movzbl %cl,%eax
    if(state == 0){
 777:	85 ff                	test   %edi,%edi
 779:	74 d5                	je     750 <vprintf+0x20>
      }
    } else if(state == '%'){
 77b:	83 ff 25             	cmp    $0x25,%edi
 77e:	75 ea                	jne    76a <vprintf+0x3a>
      if(c == 'd'){
 780:	83 f8 25             	cmp    $0x25,%eax
 783:	0f 84 cf 01 00 00    	je     958 <vprintf+0x228>
 789:	83 e8 63             	sub    $0x63,%eax
 78c:	83 f8 15             	cmp    $0x15,%eax
 78f:	77 2f                	ja     7c0 <vprintf+0x90>
 791:	ff 24 85 e0 0b 00 00 	jmp    *0xbe0(,%eax,4)
 798:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 79f:	90                   	nop
  for(i = 0; fmt[i]; i++){
 7a0:	0f b6 0b             	movzbl (%ebx),%ecx
 7a3:	83 c3 01             	add    $0x1,%ebx
        state = '%';
 7a6:	bf 25 00 00 00       	mov    $0x25,%edi
  for(i = 0; fmt[i]; i++){
 7ab:	84 c9                	test   %cl,%cl
 7ad:	75 c5                	jne    774 <vprintf+0x44>
        putc(fd, c);
      }
      state = 0;
    }
  }
}
 7af:	8d 65 f4             	lea    -0xc(%ebp),%esp
 7b2:	5b                   	pop    %ebx
 7b3:	5e                   	pop    %esi
 7b4:	5f                   	pop    %edi
 7b5:	5d                   	pop    %ebp
 7b6:	c3                   	ret    
 7b7:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 7be:	66 90                	xchg   %ax,%ax
  write(fd, &c, 1);
 7c0:	83 ec 04             	sub    $0x4,%esp
 7c3:	8d 45 e7             	lea    -0x19(%ebp),%eax
 7c6:	88 4d d0             	mov    %cl,-0x30(%ebp)
 7c9:	6a 01                	push   $0x1
 7cb:	50                   	push   %eax
 7cc:	56                   	push   %esi
 7cd:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
 7d1:	e8 1d fe ff ff       	call   5f3 <write>
        putc(fd, c);
 7d6:	0f b6 4d d0          	movzbl -0x30(%ebp),%ecx
  write(fd, &c, 1);
 7da:	83 c4 0c             	add    $0xc,%esp
 7dd:	88 4d e7             	mov    %cl,-0x19(%ebp)
 7e0:	8d 45 e7             	lea    -0x19(%ebp),%eax
 7e3:	6a 01                	push   $0x1
      state = 0;
 7e5:	31 ff                	xor    %edi,%edi
  write(fd, &c, 1);
 7e7:	50                   	push   %eax
 7e8:	56                   	push   %esi
 7e9:	e8 05 fe ff ff       	call   5f3 <write>
        putc(fd, c);
 7ee:	83 c4 10             	add    $0x10,%esp
 7f1:	e9 74 ff ff ff       	jmp    76a <vprintf+0x3a>
 7f6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 7fd:	8d 76 00             	lea    0x0(%esi),%esi
        putc(fd, va_arg(ap, uint));
 800:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  write(fd, &c, 1);
 803:	83 ec 04             	sub    $0x4,%esp
        putc(fd, va_arg(ap, uint));
 806:	8d 78 04             	lea    0x4(%eax),%edi
 809:	8b 00                	mov    (%eax),%eax
  write(fd, &c, 1);
 80b:	6a 01                	push   $0x1
        putc(fd, va_arg(ap, uint));
 80d:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
 810:	8d 45 e7             	lea    -0x19(%ebp),%eax
 813:	50                   	push   %eax
 814:	56                   	push   %esi
 815:	e8 d9 fd ff ff       	call   5f3 <write>
        putc(fd, va_arg(ap, uint));
 81a:	89 7d d4             	mov    %edi,-0x2c(%ebp)
 81d:	83 c4 10             	add    $0x10,%esp
      state = 0;
 820:	31 ff                	xor    %edi,%edi
 822:	e9 43 ff ff ff       	jmp    76a <vprintf+0x3a>
 827:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 82e:	66 90                	xchg   %ax,%ax
        printint(fd, va_arg(ap, int), 10, 1);
 830:	83 ec 0c             	sub    $0xc,%esp
 833:	8b 45 d4             	mov    -0x2c(%ebp),%eax
 836:	b9 0a 00 00 00       	mov    $0xa,%ecx
 83b:	6a 01                	push   $0x1
 83d:	8d 78 04             	lea    0x4(%eax),%edi
        printint(fd, va_arg(ap, int), 16, 0);
 840:	8b 10                	mov    (%eax),%edx
 842:	89 f0                	mov    %esi,%eax
 844:	e8 37 fe ff ff       	call   680 <printint>
 849:	89 7d d4             	mov    %edi,-0x2c(%ebp)
 84c:	83 c4 10             	add    $0x10,%esp
      state = 0;
 84f:	31 ff                	xor    %edi,%edi
 851:	e9 14 ff ff ff       	jmp    76a <vprintf+0x3a>
 856:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 85d:	8d 76 00             	lea    0x0(%esi),%esi
        printint(fd, va_arg(ap, uint), 10, 0);
 860:	8b 45 d4             	mov    -0x2c(%ebp),%eax
 863:	83 ec 0c             	sub    $0xc,%esp
 866:	b9 0a 00 00 00       	mov    $0xa,%ecx
 86b:	6a 00                	push   $0x0
 86d:	8d 78 04             	lea    0x4(%eax),%edi
 870:	eb ce                	jmp    840 <vprintf+0x110>
 872:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        printptr(fd, va_arg(ap, uint));
 878:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  write(fd, &c, 1);
 87b:	83 ec 04             	sub    $0x4,%esp
 87e:	c6 45 e7 30          	movb   $0x30,-0x19(%ebp)
        printptr(fd, va_arg(ap, uint));
 882:	8b 38                	mov    (%eax),%edi
 884:	8d 50 04             	lea    0x4(%eax),%edx
  write(fd, &c, 1);
 887:	8d 45 e7             	lea    -0x19(%ebp),%eax
 88a:	6a 01                	push   $0x1
 88c:	50                   	push   %eax
 88d:	56                   	push   %esi
        printptr(fd, va_arg(ap, uint));
 88e:	89 55 d4             	mov    %edx,-0x2c(%ebp)
  write(fd, &c, 1);
 891:	e8 5d fd ff ff       	call   5f3 <write>
 896:	83 c4 0c             	add    $0xc,%esp
 899:	8d 45 e7             	lea    -0x19(%ebp),%eax
 89c:	c6 45 e7 78          	movb   $0x78,-0x19(%ebp)
 8a0:	6a 01                	push   $0x1
 8a2:	50                   	push   %eax
 8a3:	56                   	push   %esi
 8a4:	e8 4a fd ff ff       	call   5f3 <write>
  putc(fd, 'x');
 8a9:	b8 08 00 00 00       	mov    $0x8,%eax
 8ae:	89 5d d0             	mov    %ebx,-0x30(%ebp)
 8b1:	83 c4 10             	add    $0x10,%esp
 8b4:	89 fb                	mov    %edi,%ebx
 8b6:	89 c7                	mov    %eax,%edi
 8b8:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 8bf:	90                   	nop
    putc(fd, digits[x >> (sizeof(uint) * 8 - 4)]);
 8c0:	89 d8                	mov    %ebx,%eax
  write(fd, &c, 1);
 8c2:	83 ec 04             	sub    $0x4,%esp
  for (i = 0; i < (sizeof(uint) * 2); i++, x <<= 4)
 8c5:	c1 e3 04             	shl    $0x4,%ebx
    putc(fd, digits[x >> (sizeof(uint) * 8 - 4)]);
 8c8:	c1 e8 1c             	shr    $0x1c,%eax
  write(fd, &c, 1);
 8cb:	6a 01                	push   $0x1
 8cd:	0f b6 80 38 0c 00 00 	movzbl 0xc38(%eax),%eax
 8d4:	88 45 e7             	mov    %al,-0x19(%ebp)
 8d7:	8d 45 e7             	lea    -0x19(%ebp),%eax
 8da:	50                   	push   %eax
 8db:	56                   	push   %esi
 8dc:	e8 12 fd ff ff       	call   5f3 <write>
  for (i = 0; i < (sizeof(uint) * 2); i++, x <<= 4)
 8e1:	83 c4 10             	add    $0x10,%esp
 8e4:	83 ef 01             	sub    $0x1,%edi
 8e7:	75 d7                	jne    8c0 <vprintf+0x190>
        printptr(fd, va_arg(ap, uint));
 8e9:	8b 5d d0             	mov    -0x30(%ebp),%ebx
      state = 0;
 8ec:	31 ff                	xor    %edi,%edi
 8ee:	e9 77 fe ff ff       	jmp    76a <vprintf+0x3a>
 8f3:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 8f7:	90                   	nop
        s = va_arg(ap, char*);
 8f8:	8b 45 d4             	mov    -0x2c(%ebp),%eax
 8fb:	8b 38                	mov    (%eax),%edi
 8fd:	8d 50 04             	lea    0x4(%eax),%edx
 900:	89 55 d4             	mov    %edx,-0x2c(%ebp)
        if(s == 0)
 903:	85 ff                	test   %edi,%edi
 905:	74 5c                	je     963 <vprintf+0x233>
        while(*s != 0){
 907:	0f b6 07             	movzbl (%edi),%eax
 90a:	84 c0                	test   %al,%al
 90c:	74 21                	je     92f <vprintf+0x1ff>
 90e:	66 90                	xchg   %ax,%ax
  write(fd, &c, 1);
 910:	83 ec 04             	sub    $0x4,%esp
 913:	88 45 e7             	mov    %al,-0x19(%ebp)
 916:	8d 45 e7             	lea    -0x19(%ebp),%eax
          s++;
 919:	83 c7 01             	add    $0x1,%edi
  write(fd, &c, 1);
 91c:	6a 01                	push   $0x1
 91e:	50                   	push   %eax
 91f:	56                   	push   %esi
 920:	e8 ce fc ff ff       	call   5f3 <write>
        while(*s != 0){
 925:	0f b6 07             	movzbl (%edi),%eax
 928:	83 c4 10             	add    $0x10,%esp
 92b:	84 c0                	test   %al,%al
 92d:	75 e1                	jne    910 <vprintf+0x1e0>
      state = 0;
 92f:	31 ff                	xor    %edi,%edi
 931:	e9 34 fe ff ff       	jmp    76a <vprintf+0x3a>
 936:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 93d:	8d 76 00             	lea    0x0(%esi),%esi
        printint(fd, va_arg(ap, int), 16, 0);
 940:	8b 45 d4             	mov    -0x2c(%ebp),%eax
 943:	83 ec 0c             	sub    $0xc,%esp
 946:	b9 10 00 00 00       	mov    $0x10,%ecx
 94b:	6a 00                	push   $0x0
 94d:	8d 78 04             	lea    0x4(%eax),%edi
 950:	e9 eb fe ff ff       	jmp    840 <vprintf+0x110>
 955:	8d 76 00             	lea    0x0(%esi),%esi
        putc(fd, c);
 958:	88 4d e7             	mov    %cl,-0x19(%ebp)
  write(fd, &c, 1);
 95b:	83 ec 04             	sub    $0x4,%esp
 95e:	e9 7d fe ff ff       	jmp    7e0 <vprintf+0xb0>
          s = "(null)";
 963:	bf d6 0b 00 00       	mov    $0xbd6,%edi
        while(*s != 0){
 968:	b8 28 00 00 00       	mov    $0x28,%eax
 96d:	eb a1                	jmp    910 <vprintf+0x1e0>
 96f:	90                   	nop

00000970 <fprintf>:
// Print to the given fd. Only understands %d,%x, %p, %s, %c.
void
fprintf(int fd, const char *fmt, ...)
{
 970:	55                   	push   %ebp
 971:	89 e5                	mov    %esp,%ebp
 973:	83 ec 08             	sub    $0x8,%esp
 va_list ap;
 va_start(ap, fmt); 
 vprintf(fd,fmt,ap);
 976:	8b 55 0c             	mov    0xc(%ebp),%edx
 979:	8b 45 08             	mov    0x8(%ebp),%eax
 97c:	8d 4d 10             	lea    0x10(%ebp),%ecx
 97f:	e8 ac fd ff ff       	call   730 <vprintf>
}
 984:	c9                   	leave  
 985:	c3                   	ret    
 986:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 98d:	8d 76 00             	lea    0x0(%esi),%esi

00000990 <printf>:
void
printf(const char *fmt, ...)
{
 990:	55                   	push   %ebp
  va_list ap;
  va_start(ap, fmt); 
  vprintf(1,fmt,ap);
 991:	b8 01 00 00 00       	mov    $0x1,%eax
{
 996:	89 e5                	mov    %esp,%ebp
 998:	83 ec 08             	sub    $0x8,%esp
  vprintf(1,fmt,ap);
 99b:	8b 55 08             	mov    0x8(%ebp),%edx
 99e:	8d 4d 0c             	lea    0xc(%ebp),%ecx
 9a1:	e8 8a fd ff ff       	call   730 <vprintf>
}
 9a6:	c9                   	leave  
 9a7:	c3                   	ret    
 9a8:	66 90                	xchg   %ax,%ax
 9aa:	66 90                	xchg   %ax,%ax
 9ac:	66 90                	xchg   %ax,%ax
 9ae:	66 90                	xchg   %ax,%ax

000009b0 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 9b0:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 9b1:	a1 c4 0c 00 00       	mov    0xcc4,%eax
{
 9b6:	89 e5                	mov    %esp,%ebp
 9b8:	57                   	push   %edi
 9b9:	56                   	push   %esi
 9ba:	53                   	push   %ebx
 9bb:	8b 5d 08             	mov    0x8(%ebp),%ebx
  bp = (Header*)ap - 1;
 9be:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 9c1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 9c8:	89 c2                	mov    %eax,%edx
 9ca:	8b 00                	mov    (%eax),%eax
 9cc:	39 ca                	cmp    %ecx,%edx
 9ce:	73 30                	jae    a00 <free+0x50>
 9d0:	39 c1                	cmp    %eax,%ecx
 9d2:	72 04                	jb     9d8 <free+0x28>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 9d4:	39 c2                	cmp    %eax,%edx
 9d6:	72 f0                	jb     9c8 <free+0x18>
      break;
  if(bp + bp->s.size == p->s.ptr){
 9d8:	8b 73 fc             	mov    -0x4(%ebx),%esi
 9db:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 9de:	39 f8                	cmp    %edi,%eax
 9e0:	74 30                	je     a12 <free+0x62>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
 9e2:	89 43 f8             	mov    %eax,-0x8(%ebx)
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
 9e5:	8b 42 04             	mov    0x4(%edx),%eax
 9e8:	8d 34 c2             	lea    (%edx,%eax,8),%esi
 9eb:	39 f1                	cmp    %esi,%ecx
 9ed:	74 3a                	je     a29 <free+0x79>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
 9ef:	89 0a                	mov    %ecx,(%edx)
  } else
    p->s.ptr = bp;
  freep = p;
}
 9f1:	5b                   	pop    %ebx
  freep = p;
 9f2:	89 15 c4 0c 00 00    	mov    %edx,0xcc4
}
 9f8:	5e                   	pop    %esi
 9f9:	5f                   	pop    %edi
 9fa:	5d                   	pop    %ebp
 9fb:	c3                   	ret    
 9fc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 a00:	39 c2                	cmp    %eax,%edx
 a02:	72 c4                	jb     9c8 <free+0x18>
 a04:	39 c1                	cmp    %eax,%ecx
 a06:	73 c0                	jae    9c8 <free+0x18>
  if(bp + bp->s.size == p->s.ptr){
 a08:	8b 73 fc             	mov    -0x4(%ebx),%esi
 a0b:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 a0e:	39 f8                	cmp    %edi,%eax
 a10:	75 d0                	jne    9e2 <free+0x32>
    bp->s.size += p->s.ptr->s.size;
 a12:	03 70 04             	add    0x4(%eax),%esi
 a15:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 a18:	8b 02                	mov    (%edx),%eax
 a1a:	8b 00                	mov    (%eax),%eax
 a1c:	89 43 f8             	mov    %eax,-0x8(%ebx)
  if(p + p->s.size == bp){
 a1f:	8b 42 04             	mov    0x4(%edx),%eax
 a22:	8d 34 c2             	lea    (%edx,%eax,8),%esi
 a25:	39 f1                	cmp    %esi,%ecx
 a27:	75 c6                	jne    9ef <free+0x3f>
    p->s.size += bp->s.size;
 a29:	03 43 fc             	add    -0x4(%ebx),%eax
  freep = p;
 a2c:	89 15 c4 0c 00 00    	mov    %edx,0xcc4
    p->s.size += bp->s.size;
 a32:	89 42 04             	mov    %eax,0x4(%edx)
    p->s.ptr = bp->s.ptr;
 a35:	8b 4b f8             	mov    -0x8(%ebx),%ecx
 a38:	89 0a                	mov    %ecx,(%edx)
}
 a3a:	5b                   	pop    %ebx
 a3b:	5e                   	pop    %esi
 a3c:	5f                   	pop    %edi
 a3d:	5d                   	pop    %ebp
 a3e:	c3                   	ret    
 a3f:	90                   	nop

00000a40 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 a40:	55                   	push   %ebp
 a41:	89 e5                	mov    %esp,%ebp
 a43:	57                   	push   %edi
 a44:	56                   	push   %esi
 a45:	53                   	push   %ebx
 a46:	83 ec 1c             	sub    $0x1c,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 a49:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
 a4c:	8b 3d c4 0c 00 00    	mov    0xcc4,%edi
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 a52:	8d 70 07             	lea    0x7(%eax),%esi
 a55:	c1 ee 03             	shr    $0x3,%esi
 a58:	83 c6 01             	add    $0x1,%esi
  if((prevp = freep) == 0){
 a5b:	85 ff                	test   %edi,%edi
 a5d:	0f 84 9d 00 00 00    	je     b00 <malloc+0xc0>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 a63:	8b 17                	mov    (%edi),%edx
    if(p->s.size >= nunits){
 a65:	8b 4a 04             	mov    0x4(%edx),%ecx
 a68:	39 f1                	cmp    %esi,%ecx
 a6a:	73 6a                	jae    ad6 <malloc+0x96>
 a6c:	bb 00 10 00 00       	mov    $0x1000,%ebx
 a71:	39 de                	cmp    %ebx,%esi
 a73:	0f 43 de             	cmovae %esi,%ebx
  p = sbrk(nu * sizeof(Header));
 a76:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
 a7d:	89 45 e4             	mov    %eax,-0x1c(%ebp)
 a80:	eb 17                	jmp    a99 <malloc+0x59>
 a82:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 a88:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
 a8a:	8b 48 04             	mov    0x4(%eax),%ecx
 a8d:	39 f1                	cmp    %esi,%ecx
 a8f:	73 4f                	jae    ae0 <malloc+0xa0>
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 a91:	8b 3d c4 0c 00 00    	mov    0xcc4,%edi
 a97:	89 c2                	mov    %eax,%edx
 a99:	39 d7                	cmp    %edx,%edi
 a9b:	75 eb                	jne    a88 <malloc+0x48>
  p = sbrk(nu * sizeof(Header));
 a9d:	83 ec 0c             	sub    $0xc,%esp
 aa0:	ff 75 e4             	push   -0x1c(%ebp)
 aa3:	e8 b3 fb ff ff       	call   65b <sbrk>
  if(p == (char*)-1)
 aa8:	83 c4 10             	add    $0x10,%esp
 aab:	83 f8 ff             	cmp    $0xffffffff,%eax
 aae:	74 1c                	je     acc <malloc+0x8c>
  hp->s.size = nu;
 ab0:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 ab3:	83 ec 0c             	sub    $0xc,%esp
 ab6:	83 c0 08             	add    $0x8,%eax
 ab9:	50                   	push   %eax
 aba:	e8 f1 fe ff ff       	call   9b0 <free>
  return freep;
 abf:	8b 15 c4 0c 00 00    	mov    0xcc4,%edx
      if((p = morecore(nunits)) == 0)
 ac5:	83 c4 10             	add    $0x10,%esp
 ac8:	85 d2                	test   %edx,%edx
 aca:	75 bc                	jne    a88 <malloc+0x48>
        return 0;
  }
}
 acc:	8d 65 f4             	lea    -0xc(%ebp),%esp
        return 0;
 acf:	31 c0                	xor    %eax,%eax
}
 ad1:	5b                   	pop    %ebx
 ad2:	5e                   	pop    %esi
 ad3:	5f                   	pop    %edi
 ad4:	5d                   	pop    %ebp
 ad5:	c3                   	ret    
    if(p->s.size >= nunits){
 ad6:	89 d0                	mov    %edx,%eax
 ad8:	89 fa                	mov    %edi,%edx
 ada:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      if(p->s.size == nunits)
 ae0:	39 ce                	cmp    %ecx,%esi
 ae2:	74 4c                	je     b30 <malloc+0xf0>
        p->s.size -= nunits;
 ae4:	29 f1                	sub    %esi,%ecx
 ae6:	89 48 04             	mov    %ecx,0x4(%eax)
        p += p->s.size;
 ae9:	8d 04 c8             	lea    (%eax,%ecx,8),%eax
        p->s.size = nunits;
 aec:	89 70 04             	mov    %esi,0x4(%eax)
      freep = prevp;
 aef:	89 15 c4 0c 00 00    	mov    %edx,0xcc4
}
 af5:	8d 65 f4             	lea    -0xc(%ebp),%esp
      return (void*)(p + 1);
 af8:	83 c0 08             	add    $0x8,%eax
}
 afb:	5b                   	pop    %ebx
 afc:	5e                   	pop    %esi
 afd:	5f                   	pop    %edi
 afe:	5d                   	pop    %ebp
 aff:	c3                   	ret    
    base.s.ptr = freep = prevp = &base;
 b00:	c7 05 c4 0c 00 00 c8 	movl   $0xcc8,0xcc4
 b07:	0c 00 00 
    base.s.size = 0;
 b0a:	bf c8 0c 00 00       	mov    $0xcc8,%edi
    base.s.ptr = freep = prevp = &base;
 b0f:	c7 05 c8 0c 00 00 c8 	movl   $0xcc8,0xcc8
 b16:	0c 00 00 
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 b19:	89 fa                	mov    %edi,%edx
    base.s.size = 0;
 b1b:	c7 05 cc 0c 00 00 00 	movl   $0x0,0xccc
 b22:	00 00 00 
    if(p->s.size >= nunits){
 b25:	e9 42 ff ff ff       	jmp    a6c <malloc+0x2c>
 b2a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        prevp->s.ptr = p->s.ptr;
 b30:	8b 08                	mov    (%eax),%ecx
 b32:	89 0a                	mov    %ecx,(%edx)
 b34:	eb b9                	jmp    aef <malloc+0xaf>
