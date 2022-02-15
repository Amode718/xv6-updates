
user/_exshh:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
        wait();
    return 0;
}

int main(int argc, char** argv)
{
   0:	8d 4c 24 04          	lea    0x4(%esp),%ecx
   4:	83 e4 f0             	and    $0xfffffff0,%esp
   7:	ff 71 fc             	push   -0x4(%ecx)
   a:	55                   	push   %ebp
   b:	89 e5                	mov    %esp,%ebp
   d:	51                   	push   %ecx
   e:	83 ec 04             	sub    $0x4,%esp
    int fd;
    while ( (fd =open("console", O_RDWR)) >= 0) {
  11:	eb 0a                	jmp    1d <main+0x1d>
  13:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  17:	90                   	nop
        if (fd >= 3) {
  18:	83 f8 02             	cmp    $0x2,%eax
  1b:	7f 1b                	jg     38 <main+0x38>
    while ( (fd =open("console", O_RDWR)) >= 0) {
  1d:	83 ec 08             	sub    $0x8,%esp
  20:	6a 02                	push   $0x2
  22:	68 ee 0c 00 00       	push   $0xcee
  27:	e8 57 07 00 00       	call   783 <open>
  2c:	83 c4 10             	add    $0x10,%esp
  2f:	85 c0                	test   %eax,%eax
  31:	79 e5                	jns    18 <main+0x18>
            close(fd);
            break;
        }
    }

    ezshLoop();
  33:	e8 a8 01 00 00       	call   1e0 <ezshLoop>
            close(fd);
  38:	83 ec 0c             	sub    $0xc,%esp
  3b:	50                   	push   %eax
  3c:	e8 2a 07 00 00       	call   76b <close>
            break;
  41:	83 c4 10             	add    $0x10,%esp
  44:	eb ed                	jmp    33 <main+0x33>
  46:	66 90                	xchg   %ax,%ax
  48:	66 90                	xchg   %ax,%ax
  4a:	66 90                	xchg   %ax,%ax
  4c:	66 90                	xchg   %ax,%ax
  4e:	66 90                	xchg   %ax,%ax

00000050 <ezshCD>:
{
  50:	55                   	push   %ebp
  51:	89 e5                	mov    %esp,%ebp
  53:	83 ec 08             	sub    $0x8,%esp
    if (args[1] == 0) 
  56:	8b 45 08             	mov    0x8(%ebp),%eax
  59:	8b 40 04             	mov    0x4(%eax),%eax
  5c:	85 c0                	test   %eax,%eax
  5e:	74 40                	je     a0 <ezshCD+0x50>
    else if (chdir(args[1]) != 0)
  60:	83 ec 0c             	sub    $0xc,%esp
  63:	50                   	push   %eax
  64:	e8 4a 07 00 00       	call   7b3 <chdir>
  69:	83 c4 10             	add    $0x10,%esp
  6c:	89 c2                	mov    %eax,%edx
    return 1;
  6e:	b8 01 00 00 00       	mov    $0x1,%eax
    else if (chdir(args[1]) != 0)
  73:	85 d2                	test   %edx,%edx
  75:	75 09                	jne    80 <ezshCD+0x30>
}
  77:	c9                   	leave  
  78:	c3                   	ret    
  79:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        fprintf(2, "cd: Unkown Error");
  80:	83 ec 08             	sub    $0x8,%esp
  83:	68 be 0c 00 00       	push   $0xcbe
  88:	6a 02                	push   $0x2
  8a:	e8 51 0a 00 00       	call   ae0 <fprintf>
  8f:	83 c4 10             	add    $0x10,%esp
  92:	31 c0                	xor    %eax,%eax
}
  94:	c9                   	leave  
  95:	c3                   	ret    
  96:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  9d:	8d 76 00             	lea    0x0(%esi),%esi
        fprintf(2, "cd: missing argument\n");
  a0:	83 ec 08             	sub    $0x8,%esp
  a3:	68 a8 0c 00 00       	push   $0xca8
  a8:	6a 02                	push   $0x2
  aa:	e8 31 0a 00 00       	call   ae0 <fprintf>
        return 0;
  af:	83 c4 10             	add    $0x10,%esp
  b2:	31 c0                	xor    %eax,%eax
}
  b4:	c9                   	leave  
  b5:	c3                   	ret    
  b6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  bd:	8d 76 00             	lea    0x0(%esi),%esi

000000c0 <isSpace>:
{
  c0:	55                   	push   %ebp
  c1:	89 e5                	mov    %esp,%ebp
  c3:	83 ec 10             	sub    $0x10,%esp
    if ( strchr(whitespace, c) == 0 ) 
  c6:	0f be 45 08          	movsbl 0x8(%ebp),%eax
  ca:	50                   	push   %eax
  cb:	68 6c 0d 00 00       	push   $0xd6c
  d0:	e8 fb 04 00 00       	call   5d0 <strchr>
  d5:	83 c4 10             	add    $0x10,%esp
}
  d8:	c9                   	leave  
    if ( strchr(whitespace, c) == 0 ) 
  d9:	85 c0                	test   %eax,%eax
  db:	0f 95 c0             	setne  %al
  de:	0f b6 c0             	movzbl %al,%eax
}
  e1:	c3                   	ret    
  e2:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  e9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

000000f0 <parseCmd>:
{
  f0:	55                   	push   %ebp
  f1:	89 e5                	mov    %esp,%ebp
  f3:	57                   	push   %edi
  f4:	56                   	push   %esi
  f5:	53                   	push   %ebx
  f6:	83 ec 28             	sub    $0x28,%esp
    command = malloc(sizeof *command); 
  f9:	6a 08                	push   $0x8
  fb:	e8 b0 0a 00 00       	call   bb0 <malloc>
    command->argv = malloc(MAX_ARGS * sizeof command->argv);
 100:	c7 04 24 64 00 00 00 	movl   $0x64,(%esp)
    command = malloc(sizeof *command); 
 107:	89 c7                	mov    %eax,%edi
    command->argv = malloc(MAX_ARGS * sizeof command->argv);
 109:	e8 a2 0a 00 00       	call   bb0 <malloc>
 10e:	89 07                	mov    %eax,(%edi)
 110:	89 c3                	mov    %eax,%ebx
    command->argv[0] = malloc(ARG_LEN * sizeof *command->argv); 
 112:	c7 04 24 78 00 00 00 	movl   $0x78,(%esp)
 119:	e8 92 0a 00 00       	call   bb0 <malloc>
    for (int i = 0; buf[i]; i++)
 11e:	83 c4 10             	add    $0x10,%esp
    command->argv[0] = malloc(ARG_LEN * sizeof *command->argv); 
 121:	89 03                	mov    %eax,(%ebx)
    for (int i = 0; buf[i]; i++)
 123:	8b 45 08             	mov    0x8(%ebp),%eax
 126:	0f be 00             	movsbl (%eax),%eax
 129:	84 c0                	test   %al,%al
 12b:	0f 84 9f 00 00 00    	je     1d0 <parseCmd+0xe0>
    int offset = 0;
 131:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
    for (int i = 0; buf[i]; i++)
 138:	31 f6                	xor    %esi,%esi
    int arg = 0;
 13a:	31 db                	xor    %ebx,%ebx
 13c:	eb 2d                	jmp    16b <parseCmd+0x7b>
 13e:	66 90                	xchg   %ax,%ax
            command->argv[arg] = malloc(30 * sizeof (char));
 140:	83 ec 0c             	sub    $0xc,%esp
 143:	8b 07                	mov    (%edi),%eax
            arg++;
 145:	83 c3 01             	add    $0x1,%ebx
            command->argv[arg] = malloc(30 * sizeof (char));
 148:	6a 1e                	push   $0x1e
 14a:	8d 0c 98             	lea    (%eax,%ebx,4),%ecx
 14d:	89 4d e4             	mov    %ecx,-0x1c(%ebp)
 150:	e8 5b 0a 00 00       	call   bb0 <malloc>
 155:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
            continue;
 158:	83 c4 10             	add    $0x10,%esp
            offset = i + 1; 
 15b:	89 75 e4             	mov    %esi,-0x1c(%ebp)
            command->argv[arg] = malloc(30 * sizeof (char));
 15e:	89 01                	mov    %eax,(%ecx)
    for (int i = 0; buf[i]; i++)
 160:	8b 45 08             	mov    0x8(%ebp),%eax
 163:	0f be 04 30          	movsbl (%eax,%esi,1),%eax
 167:	84 c0                	test   %al,%al
 169:	74 3a                	je     1a5 <parseCmd+0xb5>
    if ( strchr(whitespace, c) == 0 ) 
 16b:	83 ec 08             	sub    $0x8,%esp
 16e:	50                   	push   %eax
 16f:	68 6c 0d 00 00       	push   $0xd6c
 174:	e8 57 04 00 00       	call   5d0 <strchr>
 179:	83 c4 10             	add    $0x10,%esp
 17c:	89 c1                	mov    %eax,%ecx
 17e:	89 f0                	mov    %esi,%eax
            offset = i + 1; 
 180:	83 c6 01             	add    $0x1,%esi
    if ( strchr(whitespace, c) == 0 ) 
 183:	85 c9                	test   %ecx,%ecx
 185:	75 b9                	jne    140 <parseCmd+0x50>
        command->argv[arg][i - offset] = buf[i];
 187:	8b 0f                	mov    (%edi),%ecx
 189:	8b 55 08             	mov    0x8(%ebp),%edx
 18c:	2b 45 e4             	sub    -0x1c(%ebp),%eax
 18f:	0f b6 54 32 ff       	movzbl -0x1(%edx,%esi,1),%edx
 194:	8b 0c 99             	mov    (%ecx,%ebx,4),%ecx
 197:	88 14 01             	mov    %dl,(%ecx,%eax,1)
    for (int i = 0; buf[i]; i++)
 19a:	8b 45 08             	mov    0x8(%ebp),%eax
 19d:	0f be 04 30          	movsbl (%eax,%esi,1),%eax
 1a1:	84 c0                	test   %al,%al
 1a3:	75 c6                	jne    16b <parseCmd+0x7b>
    command->argc = arg;
 1a5:	89 5f 04             	mov    %ebx,0x4(%edi)
    for (int i = arg; i < MAX_ARGS; i++)
 1a8:	83 fb 18             	cmp    $0x18,%ebx
 1ab:	7f 14                	jg     1c1 <parseCmd+0xd1>
 1ad:	8d 76 00             	lea    0x0(%esi),%esi
        command->argv[i] = '\0';
 1b0:	8b 07                	mov    (%edi),%eax
 1b2:	c7 04 98 00 00 00 00 	movl   $0x0,(%eax,%ebx,4)
    for (int i = arg; i < MAX_ARGS; i++)
 1b9:	83 c3 01             	add    $0x1,%ebx
 1bc:	83 fb 19             	cmp    $0x19,%ebx
 1bf:	75 ef                	jne    1b0 <parseCmd+0xc0>
}
 1c1:	8d 65 f4             	lea    -0xc(%ebp),%esp
 1c4:	89 f8                	mov    %edi,%eax
 1c6:	5b                   	pop    %ebx
 1c7:	5e                   	pop    %esi
 1c8:	5f                   	pop    %edi
 1c9:	5d                   	pop    %ebp
 1ca:	c3                   	ret    
 1cb:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 1cf:	90                   	nop
    command->argc = arg;
 1d0:	c7 47 04 00 00 00 00 	movl   $0x0,0x4(%edi)
    int arg = 0;
 1d7:	31 db                	xor    %ebx,%ebx
 1d9:	eb d5                	jmp    1b0 <parseCmd+0xc0>
 1db:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 1df:	90                   	nop

000001e0 <ezshLoop>:
{
 1e0:	55                   	push   %ebp
 1e1:	89 e5                	mov    %esp,%ebp
 1e3:	57                   	push   %edi
 1e4:	56                   	push   %esi
    int cmdc = 0;
 1e5:	31 f6                	xor    %esi,%esi
{
 1e7:	53                   	push   %ebx
 1e8:	83 ec 28             	sub    $0x28,%esp
    struct command** history = malloc(historyLen * sizeof command);
 1eb:	68 90 01 00 00       	push   $0x190
 1f0:	e8 bb 09 00 00       	call   bb0 <malloc>
        fprintf(2, "%d | EZ$ ", cmdc);
 1f5:	83 c4 0c             	add    $0xc,%esp
 1f8:	6a 00                	push   $0x0
 1fa:	68 cf 0c 00 00       	push   $0xccf
 1ff:	6a 02                	push   $0x2
    struct command** history = malloc(historyLen * sizeof command);
 201:	89 45 e0             	mov    %eax,-0x20(%ebp)
        fprintf(2, "%d | EZ$ ", cmdc);
 204:	e8 d7 08 00 00       	call   ae0 <fprintf>
        memset(buf, 0, sizeof(buf));
 209:	83 c4 0c             	add    $0xc,%esp
 20c:	6a 64                	push   $0x64
 20e:	6a 00                	push   $0x0
 210:	68 80 0d 00 00       	push   $0xd80
 215:	e8 96 03 00 00       	call   5b0 <memset>
        gets(buf, sizeof(buf));
 21a:	59                   	pop    %ecx
 21b:	5b                   	pop    %ebx
 21c:	6a 64                	push   $0x64
 21e:	68 80 0d 00 00       	push   $0xd80
 223:	e8 e8 03 00 00       	call   610 <gets>
        command = parseCmd(buf);
 228:	c7 04 24 80 0d 00 00 	movl   $0xd80,(%esp)
 22f:	e8 bc fe ff ff       	call   f0 <parseCmd>
    int historyLen = 100;
 234:	c7 45 e4 64 00 00 00 	movl   $0x64,-0x1c(%ebp)
        command = parseCmd(buf);
 23b:	83 c4 10             	add    $0x10,%esp
 23e:	89 c3                	mov    %eax,%ebx
        if (cmdc >= historyLen - 1 ) 
 240:	eb 75                	jmp    2b7 <ezshLoop+0xd7>
 242:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    if (args[1] == 0) 
 248:	8b 03                	mov    (%ebx),%eax
 24a:	8b 40 04             	mov    0x4(%eax),%eax
 24d:	85 c0                	test   %eax,%eax
 24f:	0f 84 4b 01 00 00    	je     3a0 <ezshLoop+0x1c0>
    else if (chdir(args[1]) != 0)
 255:	83 ec 0c             	sub    $0xc,%esp
 258:	50                   	push   %eax
 259:	e8 55 05 00 00       	call   7b3 <chdir>
 25e:	83 c4 10             	add    $0x10,%esp
 261:	85 c0                	test   %eax,%eax
 263:	0f 85 57 01 00 00    	jne    3c0 <ezshLoop+0x1e0>
        fprintf(2, "%d | EZ$ ", cmdc);
 269:	83 ec 04             	sub    $0x4,%esp
 26c:	56                   	push   %esi
 26d:	68 cf 0c 00 00       	push   $0xccf
 272:	6a 02                	push   $0x2
 274:	e8 67 08 00 00       	call   ae0 <fprintf>
        memset(buf, 0, sizeof(buf));
 279:	83 c4 0c             	add    $0xc,%esp
 27c:	6a 64                	push   $0x64
 27e:	6a 00                	push   $0x0
 280:	68 80 0d 00 00       	push   $0xd80
 285:	e8 26 03 00 00       	call   5b0 <memset>
        gets(buf, sizeof(buf));
 28a:	58                   	pop    %eax
 28b:	5a                   	pop    %edx
 28c:	6a 64                	push   $0x64
 28e:	68 80 0d 00 00       	push   $0xd80
 293:	e8 78 03 00 00       	call   610 <gets>
        command = parseCmd(buf);
 298:	c7 04 24 80 0d 00 00 	movl   $0xd80,(%esp)
 29f:	e8 4c fe ff ff       	call   f0 <parseCmd>
        if (cmdc >= historyLen - 1 ) 
 2a4:	83 c4 10             	add    $0x10,%esp
        command = parseCmd(buf);
 2a7:	89 c3                	mov    %eax,%ebx
        if (cmdc >= historyLen - 1 ) 
 2a9:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 2ac:	83 e8 01             	sub    $0x1,%eax
 2af:	39 f0                	cmp    %esi,%eax
 2b1:	0f 8e 89 00 00 00    	jle    340 <ezshLoop+0x160>
        history[cmdc] = command;
 2b7:	8b 45 e0             	mov    -0x20(%ebp),%eax
        if ( strcmp(command->argv[0], "exit") == 0) {
 2ba:	83 ec 08             	sub    $0x8,%esp
        history[cmdc] = command;
 2bd:	89 1c b0             	mov    %ebx,(%eax,%esi,4)
        cmdc++;
 2c0:	83 c6 01             	add    $0x1,%esi
        if ( strcmp(command->argv[0], "exit") == 0) {
 2c3:	68 d9 0c 00 00       	push   $0xcd9
 2c8:	8b 03                	mov    (%ebx),%eax
 2ca:	ff 30                	push   (%eax)
 2cc:	e8 4f 02 00 00       	call   520 <strcmp>
 2d1:	83 c4 10             	add    $0x10,%esp
 2d4:	85 c0                	test   %eax,%eax
 2d6:	0f 84 6c ff ff ff    	je     248 <ezshLoop+0x68>
        } else if (strcmp(command->argv[0], "cd") == 0 ) {
 2dc:	83 ec 08             	sub    $0x8,%esp
 2df:	68 de 0c 00 00       	push   $0xcde
 2e4:	8b 03                	mov    (%ebx),%eax
 2e6:	ff 30                	push   (%eax)
 2e8:	e8 33 02 00 00       	call   520 <strcmp>
 2ed:	83 c4 10             	add    $0x10,%esp
 2f0:	85 c0                	test   %eax,%eax
    if (args[1] == 0) 
 2f2:	8b 03                	mov    (%ebx),%eax
        } else if (strcmp(command->argv[0], "cd") == 0 ) {
 2f4:	0f 84 50 ff ff ff    	je     24a <ezshLoop+0x6a>
        } else if (command->argv[0][0] == '#' ){
 2fa:	8b 38                	mov    (%eax),%edi
 2fc:	80 3f 23             	cmpb   $0x23,(%edi)
 2ff:	0f 84 43 01 00 00    	je     448 <ezshLoop+0x268>
        if ( command->argv[0][strlen(command->argv[0]) - 1] == '&' ) {
 305:	83 ec 0c             	sub    $0xc,%esp
 308:	57                   	push   %edi
 309:	e8 72 02 00 00       	call   580 <strlen>
 30e:	83 c4 10             	add    $0x10,%esp
 311:	80 7c 07 ff 26       	cmpb   $0x26,-0x1(%edi,%eax,1)
 316:	0f 84 c4 00 00 00    	je     3e0 <ezshLoop+0x200>
        ezshExec(command->argv[0], command->argv, 0);    
 31c:	8b 3b                	mov    (%ebx),%edi
 31e:	8b 1f                	mov    (%edi),%ebx
    if (fork() == 0) {
 320:	e8 16 04 00 00       	call   73b <fork>
 325:	85 c0                	test   %eax,%eax
 327:	0f 84 45 01 00 00    	je     472 <ezshLoop+0x292>
        wait();
 32d:	e8 19 04 00 00       	call   74b <wait>
    return 0;
 332:	e9 32 ff ff ff       	jmp    269 <ezshLoop+0x89>
 337:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 33e:	66 90                	xchg   %ax,%ax
            historyLen *= 2;
 340:	8b 45 e4             	mov    -0x1c(%ebp),%eax
            history = malloc(historyLen * sizeof command);
 343:	83 ec 0c             	sub    $0xc,%esp
            historyLen *= 2;
 346:	8d 0c 00             	lea    (%eax,%eax,1),%ecx
            history = malloc(historyLen * sizeof command);
 349:	c1 e0 03             	shl    $0x3,%eax
 34c:	50                   	push   %eax
            historyLen *= 2;
 34d:	89 4d dc             	mov    %ecx,-0x24(%ebp)
            history = malloc(historyLen * sizeof command);
 350:	e8 5b 08 00 00       	call   bb0 <malloc>
 355:	8b 55 e0             	mov    -0x20(%ebp),%edx
 358:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
 35b:	89 5d e4             	mov    %ebx,-0x1c(%ebp)
 35e:	89 c7                	mov    %eax,%edi
            for (int i = 0; i < historyLen/2; i++)
 360:	83 c4 10             	add    $0x10,%esp
 363:	89 d0                	mov    %edx,%eax
 365:	8d 0c 8a             	lea    (%edx,%ecx,4),%ecx
 368:	89 fa                	mov    %edi,%edx
 36a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
                history[i] = temp[i];
 370:	8b 18                	mov    (%eax),%ebx
            for (int i = 0; i < historyLen/2; i++)
 372:	83 c0 04             	add    $0x4,%eax
 375:	83 c2 04             	add    $0x4,%edx
                history[i] = temp[i];
 378:	89 5a fc             	mov    %ebx,-0x4(%edx)
            for (int i = 0; i < historyLen/2; i++)
 37b:	39 c8                	cmp    %ecx,%eax
 37d:	75 f1                	jne    370 <ezshLoop+0x190>
            free(temp);
 37f:	83 ec 0c             	sub    $0xc,%esp
 382:	ff 75 e0             	push   -0x20(%ebp)
 385:	8b 5d e4             	mov    -0x1c(%ebp),%ebx
 388:	e8 93 07 00 00       	call   b20 <free>
            historyLen *= 2;
 38d:	8b 45 dc             	mov    -0x24(%ebp),%eax
            history = malloc(historyLen * sizeof command);
 390:	89 7d e0             	mov    %edi,-0x20(%ebp)
            free(temp);
 393:	83 c4 10             	add    $0x10,%esp
            historyLen *= 2;
 396:	89 45 e4             	mov    %eax,-0x1c(%ebp)
 399:	e9 19 ff ff ff       	jmp    2b7 <ezshLoop+0xd7>
 39e:	66 90                	xchg   %ax,%ax
        fprintf(2, "cd: missing argument\n");
 3a0:	83 ec 08             	sub    $0x8,%esp
 3a3:	68 a8 0c 00 00       	push   $0xca8
 3a8:	6a 02                	push   $0x2
 3aa:	e8 31 07 00 00       	call   ae0 <fprintf>
        return 0;
 3af:	83 c4 10             	add    $0x10,%esp
 3b2:	e9 b2 fe ff ff       	jmp    269 <ezshLoop+0x89>
 3b7:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 3be:	66 90                	xchg   %ax,%ax
        fprintf(2, "cd: Unkown Error");
 3c0:	83 ec 08             	sub    $0x8,%esp
 3c3:	68 be 0c 00 00       	push   $0xcbe
 3c8:	6a 02                	push   $0x2
 3ca:	e8 11 07 00 00       	call   ae0 <fprintf>
 3cf:	83 c4 10             	add    $0x10,%esp
 3d2:	e9 92 fe ff ff       	jmp    269 <ezshLoop+0x89>
 3d7:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 3de:	66 90                	xchg   %ax,%ax
            char *bArg = malloc(ARG_LEN * sizeof *command->argv);
 3e0:	83 ec 0c             	sub    $0xc,%esp
 3e3:	6a 78                	push   $0x78
 3e5:	e8 c6 07 00 00       	call   bb0 <malloc>
            strcpy(bArg, command->argv[0]);
 3ea:	59                   	pop    %ecx
            char *bArg = malloc(ARG_LEN * sizeof *command->argv);
 3eb:	89 c7                	mov    %eax,%edi
            strcpy(bArg, command->argv[0]);
 3ed:	58                   	pop    %eax
 3ee:	8b 03                	mov    (%ebx),%eax
 3f0:	ff 30                	push   (%eax)
 3f2:	57                   	push   %edi
 3f3:	e8 f8 00 00 00       	call   4f0 <strcpy>
            memset(bArg + strlen(bArg) - 1, '\0', 1);
 3f8:	89 3c 24             	mov    %edi,(%esp)
 3fb:	e8 80 01 00 00       	call   580 <strlen>
 400:	83 c4 0c             	add    $0xc,%esp
 403:	8d 44 07 ff          	lea    -0x1(%edi,%eax,1),%eax
 407:	6a 01                	push   $0x1
 409:	6a 00                	push   $0x0
 40b:	50                   	push   %eax
 40c:	e8 9f 01 00 00       	call   5b0 <memset>
            ezshExec(bArg, command->argv, 1);
 411:	8b 1b                	mov    (%ebx),%ebx
    if (fork() == 0) {
 413:	e8 23 03 00 00       	call   73b <fork>
 418:	83 c4 10             	add    $0x10,%esp
 41b:	85 c0                	test   %eax,%eax
 41d:	0f 85 46 fe ff ff    	jne    269 <ezshLoop+0x89>
        exec(arg, argv);
 423:	52                   	push   %edx
 424:	52                   	push   %edx
 425:	53                   	push   %ebx
 426:	57                   	push   %edi
 427:	e8 4f 03 00 00       	call   77b <exec>
        fprintf(2, "exec failed\n", argv[0]);
 42c:	83 c4 0c             	add    $0xc,%esp
 42f:	ff 33                	push   (%ebx)
 431:	68 e1 0c 00 00       	push   $0xce1
 436:	6a 02                	push   $0x2
 438:	e8 a3 06 00 00       	call   ae0 <fprintf>
        exit();
 43d:	e8 01 03 00 00       	call   743 <exit>
 442:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 448:	8b 5d e0             	mov    -0x20(%ebp),%ebx
 44b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 44f:	90                   	nop
                command = history[atoi(command->argv[0] + 1)];
 450:	83 ec 0c             	sub    $0xc,%esp
 453:	83 c7 01             	add    $0x1,%edi
 456:	57                   	push   %edi
 457:	e8 74 02 00 00       	call   6d0 <atoi>
            while (command->argv[0][0] == '#')
 45c:	83 c4 10             	add    $0x10,%esp
                command = history[atoi(command->argv[0] + 1)];
 45f:	8b 04 83             	mov    (%ebx,%eax,4),%eax
            while (command->argv[0][0] == '#')
 462:	8b 10                	mov    (%eax),%edx
 464:	8b 3a                	mov    (%edx),%edi
 466:	80 3f 23             	cmpb   $0x23,(%edi)
 469:	74 e5                	je     450 <ezshLoop+0x270>
 46b:	89 c3                	mov    %eax,%ebx
 46d:	e9 93 fe ff ff       	jmp    305 <ezshLoop+0x125>
        exec(arg, argv);
 472:	50                   	push   %eax
 473:	50                   	push   %eax
 474:	57                   	push   %edi
 475:	53                   	push   %ebx
 476:	e8 00 03 00 00       	call   77b <exec>
        fprintf(2, "exec failed\n", argv[0]);
 47b:	83 c4 0c             	add    $0xc,%esp
 47e:	ff 37                	push   (%edi)
 480:	68 e1 0c 00 00       	push   $0xce1
 485:	6a 02                	push   $0x2
 487:	e8 54 06 00 00       	call   ae0 <fprintf>
        exit();
 48c:	e8 b2 02 00 00       	call   743 <exit>
 491:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 498:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 49f:	90                   	nop

000004a0 <ezshExec>:
int ezshExec(char* arg, char** argv, int type) {
 4a0:	55                   	push   %ebp
 4a1:	89 e5                	mov    %esp,%ebp
 4a3:	83 ec 08             	sub    $0x8,%esp
    if (fork() == 0) {
 4a6:	e8 90 02 00 00       	call   73b <fork>
 4ab:	85 c0                	test   %eax,%eax
 4ad:	74 1a                	je     4c9 <ezshExec+0x29>
    if (type == 0)
 4af:	8b 45 10             	mov    0x10(%ebp),%eax
 4b2:	85 c0                	test   %eax,%eax
 4b4:	74 0a                	je     4c0 <ezshExec+0x20>
}
 4b6:	c9                   	leave  
 4b7:	31 c0                	xor    %eax,%eax
 4b9:	c3                   	ret    
 4ba:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        wait();
 4c0:	e8 86 02 00 00       	call   74b <wait>
}
 4c5:	31 c0                	xor    %eax,%eax
 4c7:	c9                   	leave  
 4c8:	c3                   	ret    
        exec(arg, argv);
 4c9:	52                   	push   %edx
 4ca:	52                   	push   %edx
 4cb:	ff 75 0c             	push   0xc(%ebp)
 4ce:	ff 75 08             	push   0x8(%ebp)
 4d1:	e8 a5 02 00 00       	call   77b <exec>
        fprintf(2, "exec failed\n", argv[0]);
 4d6:	8b 45 0c             	mov    0xc(%ebp),%eax
 4d9:	83 c4 0c             	add    $0xc,%esp
 4dc:	ff 30                	push   (%eax)
 4de:	68 e1 0c 00 00       	push   $0xce1
 4e3:	6a 02                	push   $0x2
 4e5:	e8 f6 05 00 00       	call   ae0 <fprintf>
        exit();
 4ea:	e8 54 02 00 00       	call   743 <exit>
 4ef:	90                   	nop

000004f0 <strcpy>:
#include "user/user.h"
#include "../kernel/x86.h"

char*
strcpy(char *s, const char *t)
{
 4f0:	55                   	push   %ebp
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 4f1:	31 c0                	xor    %eax,%eax
{
 4f3:	89 e5                	mov    %esp,%ebp
 4f5:	53                   	push   %ebx
 4f6:	8b 4d 08             	mov    0x8(%ebp),%ecx
 4f9:	8b 5d 0c             	mov    0xc(%ebp),%ebx
 4fc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  while((*s++ = *t++) != 0)
 500:	0f b6 14 03          	movzbl (%ebx,%eax,1),%edx
 504:	88 14 01             	mov    %dl,(%ecx,%eax,1)
 507:	83 c0 01             	add    $0x1,%eax
 50a:	84 d2                	test   %dl,%dl
 50c:	75 f2                	jne    500 <strcpy+0x10>
    ;
  return os;
}
 50e:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 511:	89 c8                	mov    %ecx,%eax
 513:	c9                   	leave  
 514:	c3                   	ret    
 515:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 51c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000520 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 520:	55                   	push   %ebp
 521:	89 e5                	mov    %esp,%ebp
 523:	53                   	push   %ebx
 524:	8b 55 08             	mov    0x8(%ebp),%edx
 527:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  while(*p && *p == *q)
 52a:	0f b6 02             	movzbl (%edx),%eax
 52d:	84 c0                	test   %al,%al
 52f:	75 17                	jne    548 <strcmp+0x28>
 531:	eb 3a                	jmp    56d <strcmp+0x4d>
 533:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 537:	90                   	nop
 538:	0f b6 42 01          	movzbl 0x1(%edx),%eax
    p++, q++;
 53c:	83 c2 01             	add    $0x1,%edx
 53f:	8d 59 01             	lea    0x1(%ecx),%ebx
  while(*p && *p == *q)
 542:	84 c0                	test   %al,%al
 544:	74 1a                	je     560 <strcmp+0x40>
    p++, q++;
 546:	89 d9                	mov    %ebx,%ecx
  while(*p && *p == *q)
 548:	0f b6 19             	movzbl (%ecx),%ebx
 54b:	38 c3                	cmp    %al,%bl
 54d:	74 e9                	je     538 <strcmp+0x18>
  return (uchar)*p - (uchar)*q;
 54f:	29 d8                	sub    %ebx,%eax
}
 551:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 554:	c9                   	leave  
 555:	c3                   	ret    
 556:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 55d:	8d 76 00             	lea    0x0(%esi),%esi
  return (uchar)*p - (uchar)*q;
 560:	0f b6 59 01          	movzbl 0x1(%ecx),%ebx
 564:	31 c0                	xor    %eax,%eax
 566:	29 d8                	sub    %ebx,%eax
}
 568:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 56b:	c9                   	leave  
 56c:	c3                   	ret    
  return (uchar)*p - (uchar)*q;
 56d:	0f b6 19             	movzbl (%ecx),%ebx
 570:	31 c0                	xor    %eax,%eax
 572:	eb db                	jmp    54f <strcmp+0x2f>
 574:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 57b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 57f:	90                   	nop

00000580 <strlen>:

uint
strlen(const char *s)
{
 580:	55                   	push   %ebp
 581:	89 e5                	mov    %esp,%ebp
 583:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  for(n = 0; s[n]; n++)
 586:	80 3a 00             	cmpb   $0x0,(%edx)
 589:	74 15                	je     5a0 <strlen+0x20>
 58b:	31 c0                	xor    %eax,%eax
 58d:	8d 76 00             	lea    0x0(%esi),%esi
 590:	83 c0 01             	add    $0x1,%eax
 593:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
 597:	89 c1                	mov    %eax,%ecx
 599:	75 f5                	jne    590 <strlen+0x10>
    ;
  return n;
}
 59b:	89 c8                	mov    %ecx,%eax
 59d:	5d                   	pop    %ebp
 59e:	c3                   	ret    
 59f:	90                   	nop
  for(n = 0; s[n]; n++)
 5a0:	31 c9                	xor    %ecx,%ecx
}
 5a2:	5d                   	pop    %ebp
 5a3:	89 c8                	mov    %ecx,%eax
 5a5:	c3                   	ret    
 5a6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 5ad:	8d 76 00             	lea    0x0(%esi),%esi

000005b0 <memset>:

void*
memset(void *dst, int c, uint n)
{
 5b0:	55                   	push   %ebp
 5b1:	89 e5                	mov    %esp,%ebp
 5b3:	57                   	push   %edi
 5b4:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 5b7:	8b 4d 10             	mov    0x10(%ebp),%ecx
 5ba:	8b 45 0c             	mov    0xc(%ebp),%eax
 5bd:	89 d7                	mov    %edx,%edi
 5bf:	fc                   	cld    
 5c0:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 5c2:	8b 7d fc             	mov    -0x4(%ebp),%edi
 5c5:	89 d0                	mov    %edx,%eax
 5c7:	c9                   	leave  
 5c8:	c3                   	ret    
 5c9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

000005d0 <strchr>:

char*
strchr(const char *s, char c)
{
 5d0:	55                   	push   %ebp
 5d1:	89 e5                	mov    %esp,%ebp
 5d3:	8b 45 08             	mov    0x8(%ebp),%eax
 5d6:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 5da:	0f b6 10             	movzbl (%eax),%edx
 5dd:	84 d2                	test   %dl,%dl
 5df:	75 12                	jne    5f3 <strchr+0x23>
 5e1:	eb 1d                	jmp    600 <strchr+0x30>
 5e3:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 5e7:	90                   	nop
 5e8:	0f b6 50 01          	movzbl 0x1(%eax),%edx
 5ec:	83 c0 01             	add    $0x1,%eax
 5ef:	84 d2                	test   %dl,%dl
 5f1:	74 0d                	je     600 <strchr+0x30>
    if(*s == c)
 5f3:	38 d1                	cmp    %dl,%cl
 5f5:	75 f1                	jne    5e8 <strchr+0x18>
      return (char*)s;
  return 0;
}
 5f7:	5d                   	pop    %ebp
 5f8:	c3                   	ret    
 5f9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  return 0;
 600:	31 c0                	xor    %eax,%eax
}
 602:	5d                   	pop    %ebp
 603:	c3                   	ret    
 604:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 60b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 60f:	90                   	nop

00000610 <gets>:

char*
gets(char *buf, int max)
{
 610:	55                   	push   %ebp
 611:	89 e5                	mov    %esp,%ebp
 613:	57                   	push   %edi
 614:	56                   	push   %esi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    cc = read(0, &c, 1);
 615:	8d 7d e7             	lea    -0x19(%ebp),%edi
{
 618:	53                   	push   %ebx
  for(i=0; i+1 < max; ){
 619:	31 db                	xor    %ebx,%ebx
{
 61b:	83 ec 1c             	sub    $0x1c,%esp
  for(i=0; i+1 < max; ){
 61e:	eb 27                	jmp    647 <gets+0x37>
    cc = read(0, &c, 1);
 620:	83 ec 04             	sub    $0x4,%esp
 623:	6a 01                	push   $0x1
 625:	57                   	push   %edi
 626:	6a 00                	push   $0x0
 628:	e8 2e 01 00 00       	call   75b <read>
    if(cc < 1)
 62d:	83 c4 10             	add    $0x10,%esp
 630:	85 c0                	test   %eax,%eax
 632:	7e 1d                	jle    651 <gets+0x41>
      break;
    buf[i++] = c;
 634:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 638:	8b 55 08             	mov    0x8(%ebp),%edx
 63b:	88 44 1a ff          	mov    %al,-0x1(%edx,%ebx,1)
    if(c == '\n' || c == '\r')
 63f:	3c 0a                	cmp    $0xa,%al
 641:	74 1d                	je     660 <gets+0x50>
 643:	3c 0d                	cmp    $0xd,%al
 645:	74 19                	je     660 <gets+0x50>
  for(i=0; i+1 < max; ){
 647:	89 de                	mov    %ebx,%esi
 649:	83 c3 01             	add    $0x1,%ebx
 64c:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 64f:	7c cf                	jl     620 <gets+0x10>
      break;
  }
  buf[i] = '\0';
 651:	8b 45 08             	mov    0x8(%ebp),%eax
 654:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
  return buf;
}
 658:	8d 65 f4             	lea    -0xc(%ebp),%esp
 65b:	5b                   	pop    %ebx
 65c:	5e                   	pop    %esi
 65d:	5f                   	pop    %edi
 65e:	5d                   	pop    %ebp
 65f:	c3                   	ret    
  buf[i] = '\0';
 660:	8b 45 08             	mov    0x8(%ebp),%eax
 663:	89 de                	mov    %ebx,%esi
 665:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
}
 669:	8d 65 f4             	lea    -0xc(%ebp),%esp
 66c:	5b                   	pop    %ebx
 66d:	5e                   	pop    %esi
 66e:	5f                   	pop    %edi
 66f:	5d                   	pop    %ebp
 670:	c3                   	ret    
 671:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 678:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 67f:	90                   	nop

00000680 <stat>:

int
stat(const char *n, struct stat *st)
{
 680:	55                   	push   %ebp
 681:	89 e5                	mov    %esp,%ebp
 683:	56                   	push   %esi
 684:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 685:	83 ec 08             	sub    $0x8,%esp
 688:	6a 00                	push   $0x0
 68a:	ff 75 08             	push   0x8(%ebp)
 68d:	e8 f1 00 00 00       	call   783 <open>
  if(fd < 0)
 692:	83 c4 10             	add    $0x10,%esp
 695:	85 c0                	test   %eax,%eax
 697:	78 27                	js     6c0 <stat+0x40>
    return -1;
  r = fstat(fd, st);
 699:	83 ec 08             	sub    $0x8,%esp
 69c:	ff 75 0c             	push   0xc(%ebp)
 69f:	89 c3                	mov    %eax,%ebx
 6a1:	50                   	push   %eax
 6a2:	e8 f4 00 00 00       	call   79b <fstat>
  close(fd);
 6a7:	89 1c 24             	mov    %ebx,(%esp)
  r = fstat(fd, st);
 6aa:	89 c6                	mov    %eax,%esi
  close(fd);
 6ac:	e8 ba 00 00 00       	call   76b <close>
  return r;
 6b1:	83 c4 10             	add    $0x10,%esp
}
 6b4:	8d 65 f8             	lea    -0x8(%ebp),%esp
 6b7:	89 f0                	mov    %esi,%eax
 6b9:	5b                   	pop    %ebx
 6ba:	5e                   	pop    %esi
 6bb:	5d                   	pop    %ebp
 6bc:	c3                   	ret    
 6bd:	8d 76 00             	lea    0x0(%esi),%esi
    return -1;
 6c0:	be ff ff ff ff       	mov    $0xffffffff,%esi
 6c5:	eb ed                	jmp    6b4 <stat+0x34>
 6c7:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 6ce:	66 90                	xchg   %ax,%ax

000006d0 <atoi>:

int
atoi(const char *s)
{
 6d0:	55                   	push   %ebp
 6d1:	89 e5                	mov    %esp,%ebp
 6d3:	53                   	push   %ebx
 6d4:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 6d7:	0f be 02             	movsbl (%edx),%eax
 6da:	8d 48 d0             	lea    -0x30(%eax),%ecx
 6dd:	80 f9 09             	cmp    $0x9,%cl
  n = 0;
 6e0:	b9 00 00 00 00       	mov    $0x0,%ecx
  while('0' <= *s && *s <= '9')
 6e5:	77 1e                	ja     705 <atoi+0x35>
 6e7:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 6ee:	66 90                	xchg   %ax,%ax
    n = n*10 + *s++ - '0';
 6f0:	83 c2 01             	add    $0x1,%edx
 6f3:	8d 0c 89             	lea    (%ecx,%ecx,4),%ecx
 6f6:	8d 4c 48 d0          	lea    -0x30(%eax,%ecx,2),%ecx
  while('0' <= *s && *s <= '9')
 6fa:	0f be 02             	movsbl (%edx),%eax
 6fd:	8d 58 d0             	lea    -0x30(%eax),%ebx
 700:	80 fb 09             	cmp    $0x9,%bl
 703:	76 eb                	jbe    6f0 <atoi+0x20>
  return n;
}
 705:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 708:	89 c8                	mov    %ecx,%eax
 70a:	c9                   	leave  
 70b:	c3                   	ret    
 70c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000710 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 710:	55                   	push   %ebp
 711:	89 e5                	mov    %esp,%ebp
 713:	57                   	push   %edi
 714:	8b 45 10             	mov    0x10(%ebp),%eax
 717:	8b 55 08             	mov    0x8(%ebp),%edx
 71a:	56                   	push   %esi
 71b:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 71e:	85 c0                	test   %eax,%eax
 720:	7e 13                	jle    735 <memmove+0x25>
 722:	01 d0                	add    %edx,%eax
  dst = vdst;
 724:	89 d7                	mov    %edx,%edi
 726:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 72d:	8d 76 00             	lea    0x0(%esi),%esi
    *dst++ = *src++;
 730:	a4                   	movsb  %ds:(%esi),%es:(%edi)
  while(n-- > 0)
 731:	39 f8                	cmp    %edi,%eax
 733:	75 fb                	jne    730 <memmove+0x20>
  return vdst;
}
 735:	5e                   	pop    %esi
 736:	89 d0                	mov    %edx,%eax
 738:	5f                   	pop    %edi
 739:	5d                   	pop    %ebp
 73a:	c3                   	ret    

0000073b <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 73b:	b8 01 00 00 00       	mov    $0x1,%eax
 740:	cd 40                	int    $0x40
 742:	c3                   	ret    

00000743 <exit>:
SYSCALL(exit)
 743:	b8 02 00 00 00       	mov    $0x2,%eax
 748:	cd 40                	int    $0x40
 74a:	c3                   	ret    

0000074b <wait>:
SYSCALL(wait)
 74b:	b8 03 00 00 00       	mov    $0x3,%eax
 750:	cd 40                	int    $0x40
 752:	c3                   	ret    

00000753 <pipe>:
SYSCALL(pipe)
 753:	b8 04 00 00 00       	mov    $0x4,%eax
 758:	cd 40                	int    $0x40
 75a:	c3                   	ret    

0000075b <read>:
SYSCALL(read)
 75b:	b8 05 00 00 00       	mov    $0x5,%eax
 760:	cd 40                	int    $0x40
 762:	c3                   	ret    

00000763 <write>:
SYSCALL(write)
 763:	b8 10 00 00 00       	mov    $0x10,%eax
 768:	cd 40                	int    $0x40
 76a:	c3                   	ret    

0000076b <close>:
SYSCALL(close)
 76b:	b8 15 00 00 00       	mov    $0x15,%eax
 770:	cd 40                	int    $0x40
 772:	c3                   	ret    

00000773 <kill>:
SYSCALL(kill)
 773:	b8 06 00 00 00       	mov    $0x6,%eax
 778:	cd 40                	int    $0x40
 77a:	c3                   	ret    

0000077b <exec>:
SYSCALL(exec)
 77b:	b8 07 00 00 00       	mov    $0x7,%eax
 780:	cd 40                	int    $0x40
 782:	c3                   	ret    

00000783 <open>:
SYSCALL(open)
 783:	b8 0f 00 00 00       	mov    $0xf,%eax
 788:	cd 40                	int    $0x40
 78a:	c3                   	ret    

0000078b <mknod>:
SYSCALL(mknod)
 78b:	b8 11 00 00 00       	mov    $0x11,%eax
 790:	cd 40                	int    $0x40
 792:	c3                   	ret    

00000793 <unlink>:
SYSCALL(unlink)
 793:	b8 12 00 00 00       	mov    $0x12,%eax
 798:	cd 40                	int    $0x40
 79a:	c3                   	ret    

0000079b <fstat>:
SYSCALL(fstat)
 79b:	b8 08 00 00 00       	mov    $0x8,%eax
 7a0:	cd 40                	int    $0x40
 7a2:	c3                   	ret    

000007a3 <link>:
SYSCALL(link)
 7a3:	b8 13 00 00 00       	mov    $0x13,%eax
 7a8:	cd 40                	int    $0x40
 7aa:	c3                   	ret    

000007ab <mkdir>:
SYSCALL(mkdir)
 7ab:	b8 14 00 00 00       	mov    $0x14,%eax
 7b0:	cd 40                	int    $0x40
 7b2:	c3                   	ret    

000007b3 <chdir>:
SYSCALL(chdir)
 7b3:	b8 09 00 00 00       	mov    $0x9,%eax
 7b8:	cd 40                	int    $0x40
 7ba:	c3                   	ret    

000007bb <dup>:
SYSCALL(dup)
 7bb:	b8 0a 00 00 00       	mov    $0xa,%eax
 7c0:	cd 40                	int    $0x40
 7c2:	c3                   	ret    

000007c3 <getpid>:
SYSCALL(getpid)
 7c3:	b8 0b 00 00 00       	mov    $0xb,%eax
 7c8:	cd 40                	int    $0x40
 7ca:	c3                   	ret    

000007cb <sbrk>:
SYSCALL(sbrk)
 7cb:	b8 0c 00 00 00       	mov    $0xc,%eax
 7d0:	cd 40                	int    $0x40
 7d2:	c3                   	ret    

000007d3 <sleep>:
SYSCALL(sleep)
 7d3:	b8 0d 00 00 00       	mov    $0xd,%eax
 7d8:	cd 40                	int    $0x40
 7da:	c3                   	ret    

000007db <uptime>:
SYSCALL(uptime)
 7db:	b8 0e 00 00 00       	mov    $0xe,%eax
 7e0:	cd 40                	int    $0x40
 7e2:	c3                   	ret    

000007e3 <cpuhalt>:
SYSCALL(cpuhalt)
 7e3:	b8 16 00 00 00       	mov    $0x16,%eax
 7e8:	cd 40                	int    $0x40
 7ea:	c3                   	ret    
 7eb:	66 90                	xchg   %ax,%ax
 7ed:	66 90                	xchg   %ax,%ax
 7ef:	90                   	nop

000007f0 <printint>:
    putc(fd, digits[x >> (sizeof(uint) * 8 - 4)]);
}

static void
printint(int fd, int xx, int base, int sgn)
{
 7f0:	55                   	push   %ebp
 7f1:	89 e5                	mov    %esp,%ebp
 7f3:	57                   	push   %edi
 7f4:	56                   	push   %esi
 7f5:	53                   	push   %ebx
 7f6:	83 ec 3c             	sub    $0x3c,%esp
 7f9:	89 4d c4             	mov    %ecx,-0x3c(%ebp)
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
    x = -xx;
 7fc:	89 d1                	mov    %edx,%ecx
{
 7fe:	89 45 b8             	mov    %eax,-0x48(%ebp)
  if(sgn && xx < 0){
 801:	85 d2                	test   %edx,%edx
 803:	0f 89 7f 00 00 00    	jns    888 <printint+0x98>
 809:	f6 45 08 01          	testb  $0x1,0x8(%ebp)
 80d:	74 79                	je     888 <printint+0x98>
    neg = 1;
 80f:	c7 45 bc 01 00 00 00 	movl   $0x1,-0x44(%ebp)
    x = -xx;
 816:	f7 d9                	neg    %ecx
  } else {
    x = xx;
  }

  i = 0;
 818:	31 db                	xor    %ebx,%ebx
 81a:	8d 75 d7             	lea    -0x29(%ebp),%esi
 81d:	8d 76 00             	lea    0x0(%esi),%esi
  do{
    buf[i++] = digits[x % base];
 820:	89 c8                	mov    %ecx,%eax
 822:	31 d2                	xor    %edx,%edx
 824:	89 cf                	mov    %ecx,%edi
 826:	f7 75 c4             	divl   -0x3c(%ebp)
 829:	0f b6 92 58 0d 00 00 	movzbl 0xd58(%edx),%edx
 830:	89 45 c0             	mov    %eax,-0x40(%ebp)
 833:	89 d8                	mov    %ebx,%eax
 835:	8d 5b 01             	lea    0x1(%ebx),%ebx
  }while((x /= base) != 0);
 838:	8b 4d c0             	mov    -0x40(%ebp),%ecx
    buf[i++] = digits[x % base];
 83b:	88 14 1e             	mov    %dl,(%esi,%ebx,1)
  }while((x /= base) != 0);
 83e:	39 7d c4             	cmp    %edi,-0x3c(%ebp)
 841:	76 dd                	jbe    820 <printint+0x30>
  if(neg)
 843:	8b 4d bc             	mov    -0x44(%ebp),%ecx
 846:	85 c9                	test   %ecx,%ecx
 848:	74 0c                	je     856 <printint+0x66>
    buf[i++] = '-';
 84a:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
    buf[i++] = digits[x % base];
 84f:	89 d8                	mov    %ebx,%eax
    buf[i++] = '-';
 851:	ba 2d 00 00 00       	mov    $0x2d,%edx

  while(--i >= 0)
 856:	8b 7d b8             	mov    -0x48(%ebp),%edi
 859:	8d 5c 05 d7          	lea    -0x29(%ebp,%eax,1),%ebx
 85d:	eb 07                	jmp    866 <printint+0x76>
 85f:	90                   	nop
    putc(fd, buf[i]);
 860:	0f b6 13             	movzbl (%ebx),%edx
 863:	83 eb 01             	sub    $0x1,%ebx
  write(fd, &c, 1);
 866:	83 ec 04             	sub    $0x4,%esp
 869:	88 55 d7             	mov    %dl,-0x29(%ebp)
 86c:	6a 01                	push   $0x1
 86e:	56                   	push   %esi
 86f:	57                   	push   %edi
 870:	e8 ee fe ff ff       	call   763 <write>
  while(--i >= 0)
 875:	83 c4 10             	add    $0x10,%esp
 878:	39 de                	cmp    %ebx,%esi
 87a:	75 e4                	jne    860 <printint+0x70>
}
 87c:	8d 65 f4             	lea    -0xc(%ebp),%esp
 87f:	5b                   	pop    %ebx
 880:	5e                   	pop    %esi
 881:	5f                   	pop    %edi
 882:	5d                   	pop    %ebp
 883:	c3                   	ret    
 884:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
 888:	c7 45 bc 00 00 00 00 	movl   $0x0,-0x44(%ebp)
 88f:	eb 87                	jmp    818 <printint+0x28>
 891:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 898:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 89f:	90                   	nop

000008a0 <vprintf>:
static void vprintf(int fd, const char *fmt, va_list ap)
{
 8a0:	55                   	push   %ebp
 8a1:	89 e5                	mov    %esp,%ebp
 8a3:	57                   	push   %edi
 8a4:	56                   	push   %esi
 8a5:	53                   	push   %ebx
 8a6:	83 ec 2c             	sub    $0x2c,%esp
 8a9:	89 4d d4             	mov    %ecx,-0x2c(%ebp)
  char *s;
  int c, i, state;

  state = 0;
  for(i = 0; fmt[i]; i++){
 8ac:	0f b6 0a             	movzbl (%edx),%ecx
 8af:	84 c9                	test   %cl,%cl
 8b1:	74 6c                	je     91f <vprintf+0x7f>
 8b3:	89 c6                	mov    %eax,%esi
 8b5:	8d 5a 01             	lea    0x1(%edx),%ebx
 8b8:	31 ff                	xor    %edi,%edi
 8ba:	eb 28                	jmp    8e4 <vprintf+0x44>
 8bc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
 8c0:	83 f8 25             	cmp    $0x25,%eax
 8c3:	74 4b                	je     910 <vprintf+0x70>
  write(fd, &c, 1);
 8c5:	83 ec 04             	sub    $0x4,%esp
 8c8:	8d 45 e7             	lea    -0x19(%ebp),%eax
 8cb:	88 4d e7             	mov    %cl,-0x19(%ebp)
 8ce:	6a 01                	push   $0x1
 8d0:	50                   	push   %eax
 8d1:	56                   	push   %esi
 8d2:	e8 8c fe ff ff       	call   763 <write>
        state = '%';
      } else {
        putc(fd, c);
 8d7:	83 c4 10             	add    $0x10,%esp
  for(i = 0; fmt[i]; i++){
 8da:	0f b6 0b             	movzbl (%ebx),%ecx
 8dd:	83 c3 01             	add    $0x1,%ebx
 8e0:	84 c9                	test   %cl,%cl
 8e2:	74 3b                	je     91f <vprintf+0x7f>
    c = fmt[i] & 0xff;
 8e4:	0f b6 c1             	movzbl %cl,%eax
    if(state == 0){
 8e7:	85 ff                	test   %edi,%edi
 8e9:	74 d5                	je     8c0 <vprintf+0x20>
      }
    } else if(state == '%'){
 8eb:	83 ff 25             	cmp    $0x25,%edi
 8ee:	75 ea                	jne    8da <vprintf+0x3a>
      if(c == 'd'){
 8f0:	83 f8 25             	cmp    $0x25,%eax
 8f3:	0f 84 cf 01 00 00    	je     ac8 <vprintf+0x228>
 8f9:	83 e8 63             	sub    $0x63,%eax
 8fc:	83 f8 15             	cmp    $0x15,%eax
 8ff:	77 2f                	ja     930 <vprintf+0x90>
 901:	ff 24 85 00 0d 00 00 	jmp    *0xd00(,%eax,4)
 908:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 90f:	90                   	nop
  for(i = 0; fmt[i]; i++){
 910:	0f b6 0b             	movzbl (%ebx),%ecx
 913:	83 c3 01             	add    $0x1,%ebx
        state = '%';
 916:	bf 25 00 00 00       	mov    $0x25,%edi
  for(i = 0; fmt[i]; i++){
 91b:	84 c9                	test   %cl,%cl
 91d:	75 c5                	jne    8e4 <vprintf+0x44>
        putc(fd, c);
      }
      state = 0;
    }
  }
}
 91f:	8d 65 f4             	lea    -0xc(%ebp),%esp
 922:	5b                   	pop    %ebx
 923:	5e                   	pop    %esi
 924:	5f                   	pop    %edi
 925:	5d                   	pop    %ebp
 926:	c3                   	ret    
 927:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 92e:	66 90                	xchg   %ax,%ax
  write(fd, &c, 1);
 930:	83 ec 04             	sub    $0x4,%esp
 933:	8d 45 e7             	lea    -0x19(%ebp),%eax
 936:	88 4d d0             	mov    %cl,-0x30(%ebp)
 939:	6a 01                	push   $0x1
 93b:	50                   	push   %eax
 93c:	56                   	push   %esi
 93d:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
 941:	e8 1d fe ff ff       	call   763 <write>
        putc(fd, c);
 946:	0f b6 4d d0          	movzbl -0x30(%ebp),%ecx
  write(fd, &c, 1);
 94a:	83 c4 0c             	add    $0xc,%esp
 94d:	88 4d e7             	mov    %cl,-0x19(%ebp)
 950:	8d 45 e7             	lea    -0x19(%ebp),%eax
 953:	6a 01                	push   $0x1
      state = 0;
 955:	31 ff                	xor    %edi,%edi
  write(fd, &c, 1);
 957:	50                   	push   %eax
 958:	56                   	push   %esi
 959:	e8 05 fe ff ff       	call   763 <write>
        putc(fd, c);
 95e:	83 c4 10             	add    $0x10,%esp
 961:	e9 74 ff ff ff       	jmp    8da <vprintf+0x3a>
 966:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 96d:	8d 76 00             	lea    0x0(%esi),%esi
        putc(fd, va_arg(ap, uint));
 970:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  write(fd, &c, 1);
 973:	83 ec 04             	sub    $0x4,%esp
        putc(fd, va_arg(ap, uint));
 976:	8d 78 04             	lea    0x4(%eax),%edi
 979:	8b 00                	mov    (%eax),%eax
  write(fd, &c, 1);
 97b:	6a 01                	push   $0x1
        putc(fd, va_arg(ap, uint));
 97d:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
 980:	8d 45 e7             	lea    -0x19(%ebp),%eax
 983:	50                   	push   %eax
 984:	56                   	push   %esi
 985:	e8 d9 fd ff ff       	call   763 <write>
        putc(fd, va_arg(ap, uint));
 98a:	89 7d d4             	mov    %edi,-0x2c(%ebp)
 98d:	83 c4 10             	add    $0x10,%esp
      state = 0;
 990:	31 ff                	xor    %edi,%edi
 992:	e9 43 ff ff ff       	jmp    8da <vprintf+0x3a>
 997:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 99e:	66 90                	xchg   %ax,%ax
        printint(fd, va_arg(ap, int), 10, 1);
 9a0:	83 ec 0c             	sub    $0xc,%esp
 9a3:	8b 45 d4             	mov    -0x2c(%ebp),%eax
 9a6:	b9 0a 00 00 00       	mov    $0xa,%ecx
 9ab:	6a 01                	push   $0x1
 9ad:	8d 78 04             	lea    0x4(%eax),%edi
        printint(fd, va_arg(ap, int), 16, 0);
 9b0:	8b 10                	mov    (%eax),%edx
 9b2:	89 f0                	mov    %esi,%eax
 9b4:	e8 37 fe ff ff       	call   7f0 <printint>
 9b9:	89 7d d4             	mov    %edi,-0x2c(%ebp)
 9bc:	83 c4 10             	add    $0x10,%esp
      state = 0;
 9bf:	31 ff                	xor    %edi,%edi
 9c1:	e9 14 ff ff ff       	jmp    8da <vprintf+0x3a>
 9c6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 9cd:	8d 76 00             	lea    0x0(%esi),%esi
        printint(fd, va_arg(ap, uint), 10, 0);
 9d0:	8b 45 d4             	mov    -0x2c(%ebp),%eax
 9d3:	83 ec 0c             	sub    $0xc,%esp
 9d6:	b9 0a 00 00 00       	mov    $0xa,%ecx
 9db:	6a 00                	push   $0x0
 9dd:	8d 78 04             	lea    0x4(%eax),%edi
 9e0:	eb ce                	jmp    9b0 <vprintf+0x110>
 9e2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        printptr(fd, va_arg(ap, uint));
 9e8:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  write(fd, &c, 1);
 9eb:	83 ec 04             	sub    $0x4,%esp
 9ee:	c6 45 e7 30          	movb   $0x30,-0x19(%ebp)
        printptr(fd, va_arg(ap, uint));
 9f2:	8b 38                	mov    (%eax),%edi
 9f4:	8d 50 04             	lea    0x4(%eax),%edx
  write(fd, &c, 1);
 9f7:	8d 45 e7             	lea    -0x19(%ebp),%eax
 9fa:	6a 01                	push   $0x1
 9fc:	50                   	push   %eax
 9fd:	56                   	push   %esi
        printptr(fd, va_arg(ap, uint));
 9fe:	89 55 d4             	mov    %edx,-0x2c(%ebp)
  write(fd, &c, 1);
 a01:	e8 5d fd ff ff       	call   763 <write>
 a06:	83 c4 0c             	add    $0xc,%esp
 a09:	8d 45 e7             	lea    -0x19(%ebp),%eax
 a0c:	c6 45 e7 78          	movb   $0x78,-0x19(%ebp)
 a10:	6a 01                	push   $0x1
 a12:	50                   	push   %eax
 a13:	56                   	push   %esi
 a14:	e8 4a fd ff ff       	call   763 <write>
  putc(fd, 'x');
 a19:	b8 08 00 00 00       	mov    $0x8,%eax
 a1e:	89 5d d0             	mov    %ebx,-0x30(%ebp)
 a21:	83 c4 10             	add    $0x10,%esp
 a24:	89 fb                	mov    %edi,%ebx
 a26:	89 c7                	mov    %eax,%edi
 a28:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 a2f:	90                   	nop
    putc(fd, digits[x >> (sizeof(uint) * 8 - 4)]);
 a30:	89 d8                	mov    %ebx,%eax
  write(fd, &c, 1);
 a32:	83 ec 04             	sub    $0x4,%esp
  for (i = 0; i < (sizeof(uint) * 2); i++, x <<= 4)
 a35:	c1 e3 04             	shl    $0x4,%ebx
    putc(fd, digits[x >> (sizeof(uint) * 8 - 4)]);
 a38:	c1 e8 1c             	shr    $0x1c,%eax
  write(fd, &c, 1);
 a3b:	6a 01                	push   $0x1
 a3d:	0f b6 80 58 0d 00 00 	movzbl 0xd58(%eax),%eax
 a44:	88 45 e7             	mov    %al,-0x19(%ebp)
 a47:	8d 45 e7             	lea    -0x19(%ebp),%eax
 a4a:	50                   	push   %eax
 a4b:	56                   	push   %esi
 a4c:	e8 12 fd ff ff       	call   763 <write>
  for (i = 0; i < (sizeof(uint) * 2); i++, x <<= 4)
 a51:	83 c4 10             	add    $0x10,%esp
 a54:	83 ef 01             	sub    $0x1,%edi
 a57:	75 d7                	jne    a30 <vprintf+0x190>
        printptr(fd, va_arg(ap, uint));
 a59:	8b 5d d0             	mov    -0x30(%ebp),%ebx
      state = 0;
 a5c:	31 ff                	xor    %edi,%edi
 a5e:	e9 77 fe ff ff       	jmp    8da <vprintf+0x3a>
 a63:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 a67:	90                   	nop
        s = va_arg(ap, char*);
 a68:	8b 45 d4             	mov    -0x2c(%ebp),%eax
 a6b:	8b 38                	mov    (%eax),%edi
 a6d:	8d 50 04             	lea    0x4(%eax),%edx
 a70:	89 55 d4             	mov    %edx,-0x2c(%ebp)
        if(s == 0)
 a73:	85 ff                	test   %edi,%edi
 a75:	74 5c                	je     ad3 <vprintf+0x233>
        while(*s != 0){
 a77:	0f b6 07             	movzbl (%edi),%eax
 a7a:	84 c0                	test   %al,%al
 a7c:	74 21                	je     a9f <vprintf+0x1ff>
 a7e:	66 90                	xchg   %ax,%ax
  write(fd, &c, 1);
 a80:	83 ec 04             	sub    $0x4,%esp
 a83:	88 45 e7             	mov    %al,-0x19(%ebp)
 a86:	8d 45 e7             	lea    -0x19(%ebp),%eax
          s++;
 a89:	83 c7 01             	add    $0x1,%edi
  write(fd, &c, 1);
 a8c:	6a 01                	push   $0x1
 a8e:	50                   	push   %eax
 a8f:	56                   	push   %esi
 a90:	e8 ce fc ff ff       	call   763 <write>
        while(*s != 0){
 a95:	0f b6 07             	movzbl (%edi),%eax
 a98:	83 c4 10             	add    $0x10,%esp
 a9b:	84 c0                	test   %al,%al
 a9d:	75 e1                	jne    a80 <vprintf+0x1e0>
      state = 0;
 a9f:	31 ff                	xor    %edi,%edi
 aa1:	e9 34 fe ff ff       	jmp    8da <vprintf+0x3a>
 aa6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 aad:	8d 76 00             	lea    0x0(%esi),%esi
        printint(fd, va_arg(ap, int), 16, 0);
 ab0:	8b 45 d4             	mov    -0x2c(%ebp),%eax
 ab3:	83 ec 0c             	sub    $0xc,%esp
 ab6:	b9 10 00 00 00       	mov    $0x10,%ecx
 abb:	6a 00                	push   $0x0
 abd:	8d 78 04             	lea    0x4(%eax),%edi
 ac0:	e9 eb fe ff ff       	jmp    9b0 <vprintf+0x110>
 ac5:	8d 76 00             	lea    0x0(%esi),%esi
        putc(fd, c);
 ac8:	88 4d e7             	mov    %cl,-0x19(%ebp)
  write(fd, &c, 1);
 acb:	83 ec 04             	sub    $0x4,%esp
 ace:	e9 7d fe ff ff       	jmp    950 <vprintf+0xb0>
          s = "(null)";
 ad3:	bf f6 0c 00 00       	mov    $0xcf6,%edi
        while(*s != 0){
 ad8:	b8 28 00 00 00       	mov    $0x28,%eax
 add:	eb a1                	jmp    a80 <vprintf+0x1e0>
 adf:	90                   	nop

00000ae0 <fprintf>:
// Print to the given fd. Only understands %d,%x, %p, %s, %c.
void
fprintf(int fd, const char *fmt, ...)
{
 ae0:	55                   	push   %ebp
 ae1:	89 e5                	mov    %esp,%ebp
 ae3:	83 ec 08             	sub    $0x8,%esp
 va_list ap;
 va_start(ap, fmt); 
 vprintf(fd,fmt,ap);
 ae6:	8b 55 0c             	mov    0xc(%ebp),%edx
 ae9:	8b 45 08             	mov    0x8(%ebp),%eax
 aec:	8d 4d 10             	lea    0x10(%ebp),%ecx
 aef:	e8 ac fd ff ff       	call   8a0 <vprintf>
}
 af4:	c9                   	leave  
 af5:	c3                   	ret    
 af6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 afd:	8d 76 00             	lea    0x0(%esi),%esi

00000b00 <printf>:
void
printf(const char *fmt, ...)
{
 b00:	55                   	push   %ebp
  va_list ap;
  va_start(ap, fmt); 
  vprintf(1,fmt,ap);
 b01:	b8 01 00 00 00       	mov    $0x1,%eax
{
 b06:	89 e5                	mov    %esp,%ebp
 b08:	83 ec 08             	sub    $0x8,%esp
  vprintf(1,fmt,ap);
 b0b:	8b 55 08             	mov    0x8(%ebp),%edx
 b0e:	8d 4d 0c             	lea    0xc(%ebp),%ecx
 b11:	e8 8a fd ff ff       	call   8a0 <vprintf>
}
 b16:	c9                   	leave  
 b17:	c3                   	ret    
 b18:	66 90                	xchg   %ax,%ax
 b1a:	66 90                	xchg   %ax,%ax
 b1c:	66 90                	xchg   %ax,%ax
 b1e:	66 90                	xchg   %ax,%ax

00000b20 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 b20:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 b21:	a1 e4 0d 00 00       	mov    0xde4,%eax
{
 b26:	89 e5                	mov    %esp,%ebp
 b28:	57                   	push   %edi
 b29:	56                   	push   %esi
 b2a:	53                   	push   %ebx
 b2b:	8b 5d 08             	mov    0x8(%ebp),%ebx
  bp = (Header*)ap - 1;
 b2e:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 b31:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 b38:	89 c2                	mov    %eax,%edx
 b3a:	8b 00                	mov    (%eax),%eax
 b3c:	39 ca                	cmp    %ecx,%edx
 b3e:	73 30                	jae    b70 <free+0x50>
 b40:	39 c1                	cmp    %eax,%ecx
 b42:	72 04                	jb     b48 <free+0x28>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 b44:	39 c2                	cmp    %eax,%edx
 b46:	72 f0                	jb     b38 <free+0x18>
      break;
  if(bp + bp->s.size == p->s.ptr){
 b48:	8b 73 fc             	mov    -0x4(%ebx),%esi
 b4b:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 b4e:	39 f8                	cmp    %edi,%eax
 b50:	74 30                	je     b82 <free+0x62>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
 b52:	89 43 f8             	mov    %eax,-0x8(%ebx)
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
 b55:	8b 42 04             	mov    0x4(%edx),%eax
 b58:	8d 34 c2             	lea    (%edx,%eax,8),%esi
 b5b:	39 f1                	cmp    %esi,%ecx
 b5d:	74 3a                	je     b99 <free+0x79>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
 b5f:	89 0a                	mov    %ecx,(%edx)
  } else
    p->s.ptr = bp;
  freep = p;
}
 b61:	5b                   	pop    %ebx
  freep = p;
 b62:	89 15 e4 0d 00 00    	mov    %edx,0xde4
}
 b68:	5e                   	pop    %esi
 b69:	5f                   	pop    %edi
 b6a:	5d                   	pop    %ebp
 b6b:	c3                   	ret    
 b6c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 b70:	39 c2                	cmp    %eax,%edx
 b72:	72 c4                	jb     b38 <free+0x18>
 b74:	39 c1                	cmp    %eax,%ecx
 b76:	73 c0                	jae    b38 <free+0x18>
  if(bp + bp->s.size == p->s.ptr){
 b78:	8b 73 fc             	mov    -0x4(%ebx),%esi
 b7b:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 b7e:	39 f8                	cmp    %edi,%eax
 b80:	75 d0                	jne    b52 <free+0x32>
    bp->s.size += p->s.ptr->s.size;
 b82:	03 70 04             	add    0x4(%eax),%esi
 b85:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 b88:	8b 02                	mov    (%edx),%eax
 b8a:	8b 00                	mov    (%eax),%eax
 b8c:	89 43 f8             	mov    %eax,-0x8(%ebx)
  if(p + p->s.size == bp){
 b8f:	8b 42 04             	mov    0x4(%edx),%eax
 b92:	8d 34 c2             	lea    (%edx,%eax,8),%esi
 b95:	39 f1                	cmp    %esi,%ecx
 b97:	75 c6                	jne    b5f <free+0x3f>
    p->s.size += bp->s.size;
 b99:	03 43 fc             	add    -0x4(%ebx),%eax
  freep = p;
 b9c:	89 15 e4 0d 00 00    	mov    %edx,0xde4
    p->s.size += bp->s.size;
 ba2:	89 42 04             	mov    %eax,0x4(%edx)
    p->s.ptr = bp->s.ptr;
 ba5:	8b 4b f8             	mov    -0x8(%ebx),%ecx
 ba8:	89 0a                	mov    %ecx,(%edx)
}
 baa:	5b                   	pop    %ebx
 bab:	5e                   	pop    %esi
 bac:	5f                   	pop    %edi
 bad:	5d                   	pop    %ebp
 bae:	c3                   	ret    
 baf:	90                   	nop

00000bb0 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 bb0:	55                   	push   %ebp
 bb1:	89 e5                	mov    %esp,%ebp
 bb3:	57                   	push   %edi
 bb4:	56                   	push   %esi
 bb5:	53                   	push   %ebx
 bb6:	83 ec 1c             	sub    $0x1c,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 bb9:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
 bbc:	8b 3d e4 0d 00 00    	mov    0xde4,%edi
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 bc2:	8d 70 07             	lea    0x7(%eax),%esi
 bc5:	c1 ee 03             	shr    $0x3,%esi
 bc8:	83 c6 01             	add    $0x1,%esi
  if((prevp = freep) == 0){
 bcb:	85 ff                	test   %edi,%edi
 bcd:	0f 84 9d 00 00 00    	je     c70 <malloc+0xc0>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 bd3:	8b 17                	mov    (%edi),%edx
    if(p->s.size >= nunits){
 bd5:	8b 4a 04             	mov    0x4(%edx),%ecx
 bd8:	39 f1                	cmp    %esi,%ecx
 bda:	73 6a                	jae    c46 <malloc+0x96>
 bdc:	bb 00 10 00 00       	mov    $0x1000,%ebx
 be1:	39 de                	cmp    %ebx,%esi
 be3:	0f 43 de             	cmovae %esi,%ebx
  p = sbrk(nu * sizeof(Header));
 be6:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
 bed:	89 45 e4             	mov    %eax,-0x1c(%ebp)
 bf0:	eb 17                	jmp    c09 <malloc+0x59>
 bf2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 bf8:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
 bfa:	8b 48 04             	mov    0x4(%eax),%ecx
 bfd:	39 f1                	cmp    %esi,%ecx
 bff:	73 4f                	jae    c50 <malloc+0xa0>
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 c01:	8b 3d e4 0d 00 00    	mov    0xde4,%edi
 c07:	89 c2                	mov    %eax,%edx
 c09:	39 d7                	cmp    %edx,%edi
 c0b:	75 eb                	jne    bf8 <malloc+0x48>
  p = sbrk(nu * sizeof(Header));
 c0d:	83 ec 0c             	sub    $0xc,%esp
 c10:	ff 75 e4             	push   -0x1c(%ebp)
 c13:	e8 b3 fb ff ff       	call   7cb <sbrk>
  if(p == (char*)-1)
 c18:	83 c4 10             	add    $0x10,%esp
 c1b:	83 f8 ff             	cmp    $0xffffffff,%eax
 c1e:	74 1c                	je     c3c <malloc+0x8c>
  hp->s.size = nu;
 c20:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 c23:	83 ec 0c             	sub    $0xc,%esp
 c26:	83 c0 08             	add    $0x8,%eax
 c29:	50                   	push   %eax
 c2a:	e8 f1 fe ff ff       	call   b20 <free>
  return freep;
 c2f:	8b 15 e4 0d 00 00    	mov    0xde4,%edx
      if((p = morecore(nunits)) == 0)
 c35:	83 c4 10             	add    $0x10,%esp
 c38:	85 d2                	test   %edx,%edx
 c3a:	75 bc                	jne    bf8 <malloc+0x48>
        return 0;
  }
}
 c3c:	8d 65 f4             	lea    -0xc(%ebp),%esp
        return 0;
 c3f:	31 c0                	xor    %eax,%eax
}
 c41:	5b                   	pop    %ebx
 c42:	5e                   	pop    %esi
 c43:	5f                   	pop    %edi
 c44:	5d                   	pop    %ebp
 c45:	c3                   	ret    
    if(p->s.size >= nunits){
 c46:	89 d0                	mov    %edx,%eax
 c48:	89 fa                	mov    %edi,%edx
 c4a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      if(p->s.size == nunits)
 c50:	39 ce                	cmp    %ecx,%esi
 c52:	74 4c                	je     ca0 <malloc+0xf0>
        p->s.size -= nunits;
 c54:	29 f1                	sub    %esi,%ecx
 c56:	89 48 04             	mov    %ecx,0x4(%eax)
        p += p->s.size;
 c59:	8d 04 c8             	lea    (%eax,%ecx,8),%eax
        p->s.size = nunits;
 c5c:	89 70 04             	mov    %esi,0x4(%eax)
      freep = prevp;
 c5f:	89 15 e4 0d 00 00    	mov    %edx,0xde4
}
 c65:	8d 65 f4             	lea    -0xc(%ebp),%esp
      return (void*)(p + 1);
 c68:	83 c0 08             	add    $0x8,%eax
}
 c6b:	5b                   	pop    %ebx
 c6c:	5e                   	pop    %esi
 c6d:	5f                   	pop    %edi
 c6e:	5d                   	pop    %ebp
 c6f:	c3                   	ret    
    base.s.ptr = freep = prevp = &base;
 c70:	c7 05 e4 0d 00 00 e8 	movl   $0xde8,0xde4
 c77:	0d 00 00 
    base.s.size = 0;
 c7a:	bf e8 0d 00 00       	mov    $0xde8,%edi
    base.s.ptr = freep = prevp = &base;
 c7f:	c7 05 e8 0d 00 00 e8 	movl   $0xde8,0xde8
 c86:	0d 00 00 
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 c89:	89 fa                	mov    %edi,%edx
    base.s.size = 0;
 c8b:	c7 05 ec 0d 00 00 00 	movl   $0x0,0xdec
 c92:	00 00 00 
    if(p->s.size >= nunits){
 c95:	e9 42 ff ff ff       	jmp    bdc <malloc+0x2c>
 c9a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        prevp->s.ptr = p->s.ptr;
 ca0:	8b 08                	mov    (%eax),%ecx
 ca2:	89 0a                	mov    %ecx,(%edx)
 ca4:	eb b9                	jmp    c5f <malloc+0xaf>
