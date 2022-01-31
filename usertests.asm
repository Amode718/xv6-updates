
user/_usertests:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
  return randstate;
}

int
main(int argc, char *argv[])
{
       0:	8d 4c 24 04          	lea    0x4(%esp),%ecx
       4:	83 e4 f0             	and    $0xfffffff0,%esp
       7:	ff 71 fc             	push   -0x4(%ecx)
       a:	55                   	push   %ebp
       b:	89 e5                	mov    %esp,%ebp
       d:	51                   	push   %ecx
       e:	83 ec 10             	sub    $0x10,%esp
  printf("usertests starting\n");
      11:	68 36 4b 00 00       	push   $0x4b36
      16:	e8 85 39 00 00       	call   39a0 <printf>

  if(open("usertests.ran", 0) >= 0){
      1b:	5a                   	pop    %edx
      1c:	59                   	pop    %ecx
      1d:	6a 00                	push   $0x0
      1f:	68 4a 4b 00 00       	push   $0x4b4a
      24:	e8 1a 36 00 00       	call   3643 <open>
      29:	83 c4 10             	add    $0x10,%esp
      2c:	85 c0                	test   %eax,%eax
      2e:	78 12                	js     42 <main+0x42>
    printf("already ran user tests -- rebuild fs.img\n");
      30:	83 ec 0c             	sub    $0xc,%esp
      33:	68 b4 52 00 00       	push   $0x52b4
      38:	e8 63 39 00 00       	call   39a0 <printf>
    exit();
      3d:	e8 c1 35 00 00       	call   3603 <exit>
  }
  close(open("usertests.ran", O_CREATE));
      42:	50                   	push   %eax
      43:	50                   	push   %eax
      44:	68 00 02 00 00       	push   $0x200
      49:	68 4a 4b 00 00       	push   $0x4b4a
      4e:	e8 f0 35 00 00       	call   3643 <open>
      53:	89 04 24             	mov    %eax,(%esp)
      56:	e8 d0 35 00 00       	call   362b <close>

  argptest();
      5b:	e8 c0 32 00 00       	call   3320 <argptest>
  createdelete();
      60:	e8 2b 10 00 00       	call   1090 <createdelete>
  linkunlink();
      65:	e8 a6 18 00 00       	call   1910 <linkunlink>
  concreate();
      6a:	e8 b1 15 00 00       	call   1620 <concreate>
  fourfiles();
      6f:	e8 2c 0e 00 00       	call   ea0 <fourfiles>
  sharedfd();
      74:	e8 77 0c 00 00       	call   cf0 <sharedfd>

  bigargtest();
      79:	e8 82 2f 00 00       	call   3000 <bigargtest>
  bigwrite();
      7e:	e8 8d 21 00 00       	call   2210 <bigwrite>
  bigargtest();
      83:	e8 78 2f 00 00       	call   3000 <bigargtest>
  bsstest();
      88:	e8 23 2f 00 00       	call   2fb0 <bsstest>
  sbrktest();
      8d:	e8 7e 2a 00 00       	call   2b10 <sbrktest>
  validatetest();
      92:	e8 79 2e 00 00       	call   2f10 <validatetest>

  opentest();
      97:	e8 e4 02 00 00       	call   380 <opentest>
  writetest();
      9c:	e8 5f 03 00 00       	call   400 <writetest>
  writetest1();
      a1:	e8 ea 04 00 00       	call   590 <writetest1>
  createtest();
      a6:	e8 75 06 00 00       	call   720 <createtest>

  openiputtest();
      ab:	e8 f0 01 00 00       	call   2a0 <openiputtest>
  exitiputtest();
      b0:	e8 1b 01 00 00       	call   1d0 <exitiputtest>
  iputtest();
      b5:	e8 56 00 00 00       	call   110 <iputtest>

  mem();
      ba:	e8 61 0b 00 00       	call   c20 <mem>
  pipe1();
      bf:	e8 0c 08 00 00       	call   8d0 <pipe1>
  preempt();
      c4:	e8 87 09 00 00       	call   a50 <preempt>
  exitwait();
      c9:	e8 d2 0a 00 00       	call   ba0 <exitwait>

  rmdot();
      ce:	e8 0d 25 00 00       	call   25e0 <rmdot>
  fourteen();
      d3:	e8 d8 23 00 00       	call   24b0 <fourteen>
  bigfile();
      d8:	e8 13 22 00 00       	call   22f0 <bigfile>
  subdir();
      dd:	e8 6e 1a 00 00       	call   1b50 <subdir>
  linktest();
      e2:	e8 29 13 00 00       	call   1410 <linktest>
  unlinkread();
      e7:	e8 a4 11 00 00       	call   1290 <unlinkread>
  dirfile();
      ec:	e8 5f 26 00 00       	call   2750 <dirfile>
  iref();
      f1:	e8 4a 28 00 00       	call   2940 <iref>
  forktest();
      f6:	e8 65 29 00 00       	call   2a60 <forktest>
  bigdir(); // slow
      fb:	e8 20 19 00 00       	call   1a20 <bigdir>

  uio();
     100:	e8 ab 31 00 00       	call   32b0 <uio>

  exectest();
     105:	e8 86 07 00 00       	call   890 <exectest>

  exit();
     10a:	e8 f4 34 00 00       	call   3603 <exit>
     10f:	90                   	nop

00000110 <iputtest>:
{
     110:	55                   	push   %ebp
     111:	89 e5                	mov    %esp,%ebp
     113:	83 ec 14             	sub    $0x14,%esp
  printf("iput test\n");
     116:	68 dc 3b 00 00       	push   $0x3bdc
     11b:	e8 80 38 00 00       	call   39a0 <printf>
  if(mkdir("iputdir") < 0){
     120:	c7 04 24 6f 3b 00 00 	movl   $0x3b6f,(%esp)
     127:	e8 3f 35 00 00       	call   366b <mkdir>
     12c:	83 c4 10             	add    $0x10,%esp
     12f:	85 c0                	test   %eax,%eax
     131:	78 4e                	js     181 <iputtest+0x71>
  if(chdir("iputdir") < 0){
     133:	83 ec 0c             	sub    $0xc,%esp
     136:	68 6f 3b 00 00       	push   $0x3b6f
     13b:	e8 33 35 00 00       	call   3673 <chdir>
     140:	83 c4 10             	add    $0x10,%esp
     143:	85 c0                	test   %eax,%eax
     145:	78 70                	js     1b7 <iputtest+0xa7>
  if(unlink("../iputdir") < 0){
     147:	83 ec 0c             	sub    $0xc,%esp
     14a:	68 6c 3b 00 00       	push   $0x3b6c
     14f:	e8 ff 34 00 00       	call   3653 <unlink>
     154:	83 c4 10             	add    $0x10,%esp
     157:	85 c0                	test   %eax,%eax
     159:	78 4a                	js     1a5 <iputtest+0x95>
  if(chdir("/") < 0){
     15b:	83 ec 0c             	sub    $0xc,%esp
     15e:	68 91 3b 00 00       	push   $0x3b91
     163:	e8 0b 35 00 00       	call   3673 <chdir>
     168:	83 c4 10             	add    $0x10,%esp
     16b:	85 c0                	test   %eax,%eax
     16d:	78 24                	js     193 <iputtest+0x83>
  printf("iput test ok\n");
     16f:	83 ec 0c             	sub    $0xc,%esp
     172:	68 14 3c 00 00       	push   $0x3c14
     177:	e8 24 38 00 00       	call   39a0 <printf>
}
     17c:	83 c4 10             	add    $0x10,%esp
     17f:	c9                   	leave  
     180:	c3                   	ret    
    printf("mkdir failed\n");
     181:	83 ec 0c             	sub    $0xc,%esp
     184:	68 48 3b 00 00       	push   $0x3b48
     189:	e8 12 38 00 00       	call   39a0 <printf>
    exit();
     18e:	e8 70 34 00 00       	call   3603 <exit>
    printf("chdir / failed\n");
     193:	83 ec 0c             	sub    $0xc,%esp
     196:	68 93 3b 00 00       	push   $0x3b93
     19b:	e8 00 38 00 00       	call   39a0 <printf>
    exit();
     1a0:	e8 5e 34 00 00       	call   3603 <exit>
    printf("unlink ../iputdir failed\n");
     1a5:	83 ec 0c             	sub    $0xc,%esp
     1a8:	68 77 3b 00 00       	push   $0x3b77
     1ad:	e8 ee 37 00 00       	call   39a0 <printf>
    exit();
     1b2:	e8 4c 34 00 00       	call   3603 <exit>
    printf("chdir iputdir failed\n");
     1b7:	83 ec 0c             	sub    $0xc,%esp
     1ba:	68 56 3b 00 00       	push   $0x3b56
     1bf:	e8 dc 37 00 00       	call   39a0 <printf>
    exit();
     1c4:	e8 3a 34 00 00       	call   3603 <exit>
     1c9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

000001d0 <exitiputtest>:
{
     1d0:	55                   	push   %ebp
     1d1:	89 e5                	mov    %esp,%ebp
     1d3:	83 ec 14             	sub    $0x14,%esp
  printf("exitiput test\n");
     1d6:	68 a3 3b 00 00       	push   $0x3ba3
     1db:	e8 c0 37 00 00       	call   39a0 <printf>
  pid = fork();
     1e0:	e8 16 34 00 00       	call   35fb <fork>
  if(pid < 0){
     1e5:	83 c4 10             	add    $0x10,%esp
     1e8:	85 c0                	test   %eax,%eax
     1ea:	78 76                	js     262 <exitiputtest+0x92>
  if(pid == 0){
     1ec:	75 42                	jne    230 <exitiputtest+0x60>
    if(mkdir("iputdir") < 0){
     1ee:	83 ec 0c             	sub    $0xc,%esp
     1f1:	68 6f 3b 00 00       	push   $0x3b6f
     1f6:	e8 70 34 00 00       	call   366b <mkdir>
     1fb:	83 c4 10             	add    $0x10,%esp
     1fe:	85 c0                	test   %eax,%eax
     200:	78 72                	js     274 <exitiputtest+0xa4>
    if(chdir("iputdir") < 0){
     202:	83 ec 0c             	sub    $0xc,%esp
     205:	68 6f 3b 00 00       	push   $0x3b6f
     20a:	e8 64 34 00 00       	call   3673 <chdir>
     20f:	83 c4 10             	add    $0x10,%esp
     212:	85 c0                	test   %eax,%eax
     214:	78 70                	js     286 <exitiputtest+0xb6>
    if(unlink("../iputdir") < 0){
     216:	83 ec 0c             	sub    $0xc,%esp
     219:	68 6c 3b 00 00       	push   $0x3b6c
     21e:	e8 30 34 00 00       	call   3653 <unlink>
     223:	83 c4 10             	add    $0x10,%esp
     226:	85 c0                	test   %eax,%eax
     228:	78 26                	js     250 <exitiputtest+0x80>
    exit();
     22a:	e8 d4 33 00 00       	call   3603 <exit>
     22f:	90                   	nop
  wait();
     230:	e8 d6 33 00 00       	call   360b <wait>
  printf("exitiput test ok\n");
     235:	83 ec 0c             	sub    $0xc,%esp
     238:	68 c6 3b 00 00       	push   $0x3bc6
     23d:	e8 5e 37 00 00       	call   39a0 <printf>
}
     242:	83 c4 10             	add    $0x10,%esp
     245:	c9                   	leave  
     246:	c3                   	ret    
     247:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     24e:	66 90                	xchg   %ax,%ax
      printf("unlink ../iputdir failed\n");
     250:	83 ec 0c             	sub    $0xc,%esp
     253:	68 77 3b 00 00       	push   $0x3b77
     258:	e8 43 37 00 00       	call   39a0 <printf>
      exit();
     25d:	e8 a1 33 00 00       	call   3603 <exit>
    printf("fork failed\n");
     262:	83 ec 0c             	sub    $0xc,%esp
     265:	68 89 4a 00 00       	push   $0x4a89
     26a:	e8 31 37 00 00       	call   39a0 <printf>
    exit();
     26f:	e8 8f 33 00 00       	call   3603 <exit>
      printf("mkdir failed\n");
     274:	83 ec 0c             	sub    $0xc,%esp
     277:	68 48 3b 00 00       	push   $0x3b48
     27c:	e8 1f 37 00 00       	call   39a0 <printf>
      exit();
     281:	e8 7d 33 00 00       	call   3603 <exit>
      printf("child chdir failed\n");
     286:	83 ec 0c             	sub    $0xc,%esp
     289:	68 b2 3b 00 00       	push   $0x3bb2
     28e:	e8 0d 37 00 00       	call   39a0 <printf>
      exit();
     293:	e8 6b 33 00 00       	call   3603 <exit>
     298:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     29f:	90                   	nop

000002a0 <openiputtest>:
{
     2a0:	55                   	push   %ebp
     2a1:	89 e5                	mov    %esp,%ebp
     2a3:	83 ec 14             	sub    $0x14,%esp
  printf("openiput test\n");
     2a6:	68 d8 3b 00 00       	push   $0x3bd8
     2ab:	e8 f0 36 00 00       	call   39a0 <printf>
  if(mkdir("oidir") < 0){
     2b0:	c7 04 24 e7 3b 00 00 	movl   $0x3be7,(%esp)
     2b7:	e8 af 33 00 00       	call   366b <mkdir>
     2bc:	83 c4 10             	add    $0x10,%esp
     2bf:	85 c0                	test   %eax,%eax
     2c1:	0f 88 88 00 00 00    	js     34f <openiputtest+0xaf>
  pid = fork();
     2c7:	e8 2f 33 00 00       	call   35fb <fork>
  if(pid < 0){
     2cc:	85 c0                	test   %eax,%eax
     2ce:	78 6d                	js     33d <openiputtest+0x9d>
  if(pid == 0){
     2d0:	75 2e                	jne    300 <openiputtest+0x60>
    int fd = open("oidir", O_RDWR);
     2d2:	83 ec 08             	sub    $0x8,%esp
     2d5:	6a 02                	push   $0x2
     2d7:	68 e7 3b 00 00       	push   $0x3be7
     2dc:	e8 62 33 00 00       	call   3643 <open>
    if(fd >= 0){
     2e1:	83 c4 10             	add    $0x10,%esp
     2e4:	85 c0                	test   %eax,%eax
     2e6:	78 50                	js     338 <openiputtest+0x98>
      printf("open directory for write succeeded\n");
     2e8:	83 ec 0c             	sub    $0xc,%esp
     2eb:	68 6c 4b 00 00       	push   $0x4b6c
     2f0:	e8 ab 36 00 00       	call   39a0 <printf>
      exit();
     2f5:	e8 09 33 00 00       	call   3603 <exit>
     2fa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  sleep(1);
     300:	83 ec 0c             	sub    $0xc,%esp
     303:	6a 01                	push   $0x1
     305:	e8 89 33 00 00       	call   3693 <sleep>
  if(unlink("oidir") != 0){
     30a:	c7 04 24 e7 3b 00 00 	movl   $0x3be7,(%esp)
     311:	e8 3d 33 00 00       	call   3653 <unlink>
     316:	83 c4 10             	add    $0x10,%esp
     319:	85 c0                	test   %eax,%eax
     31b:	75 44                	jne    361 <openiputtest+0xc1>
  wait();
     31d:	e8 e9 32 00 00       	call   360b <wait>
  printf("openiput test ok\n");
     322:	83 ec 0c             	sub    $0xc,%esp
     325:	68 10 3c 00 00       	push   $0x3c10
     32a:	e8 71 36 00 00       	call   39a0 <printf>
}
     32f:	83 c4 10             	add    $0x10,%esp
     332:	c9                   	leave  
     333:	c3                   	ret    
     334:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    exit();
     338:	e8 c6 32 00 00       	call   3603 <exit>
    printf("fork failed\n");
     33d:	83 ec 0c             	sub    $0xc,%esp
     340:	68 89 4a 00 00       	push   $0x4a89
     345:	e8 56 36 00 00       	call   39a0 <printf>
    exit();
     34a:	e8 b4 32 00 00       	call   3603 <exit>
    printf("mkdir oidir failed\n");
     34f:	83 ec 0c             	sub    $0xc,%esp
     352:	68 ed 3b 00 00       	push   $0x3bed
     357:	e8 44 36 00 00       	call   39a0 <printf>
    exit();
     35c:	e8 a2 32 00 00       	call   3603 <exit>
    printf("unlink failed\n");
     361:	83 ec 0c             	sub    $0xc,%esp
     364:	68 01 3c 00 00       	push   $0x3c01
     369:	e8 32 36 00 00       	call   39a0 <printf>
    exit();
     36e:	e8 90 32 00 00       	call   3603 <exit>
     373:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     37a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00000380 <opentest>:
{
     380:	55                   	push   %ebp
     381:	89 e5                	mov    %esp,%ebp
     383:	83 ec 14             	sub    $0x14,%esp
  printf("open test\n");
     386:	68 22 3c 00 00       	push   $0x3c22
     38b:	e8 10 36 00 00       	call   39a0 <printf>
  fd = open("echo", 0);
     390:	59                   	pop    %ecx
     391:	58                   	pop    %eax
     392:	6a 00                	push   $0x0
     394:	68 2d 3c 00 00       	push   $0x3c2d
     399:	e8 a5 32 00 00       	call   3643 <open>
  if(fd < 0){
     39e:	83 c4 10             	add    $0x10,%esp
     3a1:	85 c0                	test   %eax,%eax
     3a3:	78 30                	js     3d5 <opentest+0x55>
  close(fd);
     3a5:	83 ec 0c             	sub    $0xc,%esp
     3a8:	50                   	push   %eax
     3a9:	e8 7d 32 00 00       	call   362b <close>
  fd = open("doesnotexist", 0);
     3ae:	58                   	pop    %eax
     3af:	5a                   	pop    %edx
     3b0:	6a 00                	push   $0x0
     3b2:	68 45 3c 00 00       	push   $0x3c45
     3b7:	e8 87 32 00 00       	call   3643 <open>
  if(fd >= 0){
     3bc:	83 c4 10             	add    $0x10,%esp
     3bf:	85 c0                	test   %eax,%eax
     3c1:	79 24                	jns    3e7 <opentest+0x67>
  printf("open test ok\n");
     3c3:	83 ec 0c             	sub    $0xc,%esp
     3c6:	68 70 3c 00 00       	push   $0x3c70
     3cb:	e8 d0 35 00 00       	call   39a0 <printf>
}
     3d0:	83 c4 10             	add    $0x10,%esp
     3d3:	c9                   	leave  
     3d4:	c3                   	ret    
    printf("open echo failed!\n");
     3d5:	83 ec 0c             	sub    $0xc,%esp
     3d8:	68 32 3c 00 00       	push   $0x3c32
     3dd:	e8 be 35 00 00       	call   39a0 <printf>
    exit();
     3e2:	e8 1c 32 00 00       	call   3603 <exit>
    printf("open doesnotexist succeeded!\n");
     3e7:	83 ec 0c             	sub    $0xc,%esp
     3ea:	68 52 3c 00 00       	push   $0x3c52
     3ef:	e8 ac 35 00 00       	call   39a0 <printf>
    exit();
     3f4:	e8 0a 32 00 00       	call   3603 <exit>
     3f9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000400 <writetest>:
{
     400:	55                   	push   %ebp
     401:	89 e5                	mov    %esp,%ebp
     403:	56                   	push   %esi
     404:	53                   	push   %ebx
  printf("small file test\n");
     405:	83 ec 0c             	sub    $0xc,%esp
     408:	68 7e 3c 00 00       	push   $0x3c7e
     40d:	e8 8e 35 00 00       	call   39a0 <printf>
  fd = open("small", O_CREATE|O_RDWR);
     412:	59                   	pop    %ecx
     413:	5b                   	pop    %ebx
     414:	68 02 02 00 00       	push   $0x202
     419:	68 8f 3c 00 00       	push   $0x3c8f
     41e:	e8 20 32 00 00       	call   3643 <open>
  if(fd >= 0){
     423:	83 c4 10             	add    $0x10,%esp
     426:	85 c0                	test   %eax,%eax
     428:	0f 88 4f 01 00 00    	js     57d <writetest+0x17d>
    printf("creat small succeeded; ok\n");
     42e:	83 ec 0c             	sub    $0xc,%esp
     431:	89 c6                	mov    %eax,%esi
  for(i = 0; i < 100; i++){
     433:	31 db                	xor    %ebx,%ebx
    printf("creat small succeeded; ok\n");
     435:	68 95 3c 00 00       	push   $0x3c95
     43a:	e8 61 35 00 00       	call   39a0 <printf>
     43f:	83 c4 10             	add    $0x10,%esp
     442:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    if(write(fd, "aaaaaaaaaa", 10) != 10){
     448:	83 ec 04             	sub    $0x4,%esp
     44b:	6a 0a                	push   $0xa
     44d:	68 cc 3c 00 00       	push   $0x3ccc
     452:	56                   	push   %esi
     453:	e8 cb 31 00 00       	call   3623 <write>
     458:	83 c4 10             	add    $0x10,%esp
     45b:	83 f8 0a             	cmp    $0xa,%eax
     45e:	0f 85 bd 00 00 00    	jne    521 <writetest+0x121>
    if(write(fd, "bbbbbbbbbb", 10) != 10){
     464:	83 ec 04             	sub    $0x4,%esp
     467:	6a 0a                	push   $0xa
     469:	68 d7 3c 00 00       	push   $0x3cd7
     46e:	56                   	push   %esi
     46f:	e8 af 31 00 00       	call   3623 <write>
     474:	83 c4 10             	add    $0x10,%esp
     477:	83 f8 0a             	cmp    $0xa,%eax
     47a:	0f 85 b4 00 00 00    	jne    534 <writetest+0x134>
  for(i = 0; i < 100; i++){
     480:	83 c3 01             	add    $0x1,%ebx
     483:	83 fb 64             	cmp    $0x64,%ebx
     486:	75 c0                	jne    448 <writetest+0x48>
  printf("writes ok\n");
     488:	83 ec 0c             	sub    $0xc,%esp
     48b:	68 e2 3c 00 00       	push   $0x3ce2
     490:	e8 0b 35 00 00       	call   39a0 <printf>
  close(fd);
     495:	89 34 24             	mov    %esi,(%esp)
     498:	e8 8e 31 00 00       	call   362b <close>
  fd = open("small", O_RDONLY);
     49d:	58                   	pop    %eax
     49e:	5a                   	pop    %edx
     49f:	6a 00                	push   $0x0
     4a1:	68 8f 3c 00 00       	push   $0x3c8f
     4a6:	e8 98 31 00 00       	call   3643 <open>
  if(fd >= 0){
     4ab:	83 c4 10             	add    $0x10,%esp
  fd = open("small", O_RDONLY);
     4ae:	89 c3                	mov    %eax,%ebx
  if(fd >= 0){
     4b0:	85 c0                	test   %eax,%eax
     4b2:	0f 88 8f 00 00 00    	js     547 <writetest+0x147>
    printf("open small succeeded ok\n");
     4b8:	83 ec 0c             	sub    $0xc,%esp
     4bb:	68 ed 3c 00 00       	push   $0x3ced
     4c0:	e8 db 34 00 00       	call   39a0 <printf>
  i = read(fd, buf, 2000);
     4c5:	83 c4 0c             	add    $0xc,%esp
     4c8:	68 d0 07 00 00       	push   $0x7d0
     4cd:	68 a0 7a 00 00       	push   $0x7aa0
     4d2:	53                   	push   %ebx
     4d3:	e8 43 31 00 00       	call   361b <read>
  if(i == 2000){
     4d8:	83 c4 10             	add    $0x10,%esp
     4db:	3d d0 07 00 00       	cmp    $0x7d0,%eax
     4e0:	75 77                	jne    559 <writetest+0x159>
    printf("read succeeded ok\n");
     4e2:	83 ec 0c             	sub    $0xc,%esp
     4e5:	68 21 3d 00 00       	push   $0x3d21
     4ea:	e8 b1 34 00 00       	call   39a0 <printf>
  close(fd);
     4ef:	89 1c 24             	mov    %ebx,(%esp)
     4f2:	e8 34 31 00 00       	call   362b <close>
  if(unlink("small") < 0){
     4f7:	c7 04 24 8f 3c 00 00 	movl   $0x3c8f,(%esp)
     4fe:	e8 50 31 00 00       	call   3653 <unlink>
     503:	83 c4 10             	add    $0x10,%esp
     506:	85 c0                	test   %eax,%eax
     508:	78 61                	js     56b <writetest+0x16b>
  printf("small file test ok\n");
     50a:	83 ec 0c             	sub    $0xc,%esp
     50d:	68 49 3d 00 00       	push   $0x3d49
     512:	e8 89 34 00 00       	call   39a0 <printf>
}
     517:	83 c4 10             	add    $0x10,%esp
     51a:	8d 65 f8             	lea    -0x8(%ebp),%esp
     51d:	5b                   	pop    %ebx
     51e:	5e                   	pop    %esi
     51f:	5d                   	pop    %ebp
     520:	c3                   	ret    
      printf("error: write aa %d new file failed\n", i);
     521:	83 ec 08             	sub    $0x8,%esp
     524:	53                   	push   %ebx
     525:	68 90 4b 00 00       	push   $0x4b90
     52a:	e8 71 34 00 00       	call   39a0 <printf>
      exit();
     52f:	e8 cf 30 00 00       	call   3603 <exit>
      printf("error: write bb %d new file failed\n", i);
     534:	83 ec 08             	sub    $0x8,%esp
     537:	53                   	push   %ebx
     538:	68 b4 4b 00 00       	push   $0x4bb4
     53d:	e8 5e 34 00 00       	call   39a0 <printf>
      exit();
     542:	e8 bc 30 00 00       	call   3603 <exit>
    printf("error: open small failed!\n");
     547:	83 ec 0c             	sub    $0xc,%esp
     54a:	68 06 3d 00 00       	push   $0x3d06
     54f:	e8 4c 34 00 00       	call   39a0 <printf>
    exit();
     554:	e8 aa 30 00 00       	call   3603 <exit>
    printf("read failed\n");
     559:	83 ec 0c             	sub    $0xc,%esp
     55c:	68 4d 40 00 00       	push   $0x404d
     561:	e8 3a 34 00 00       	call   39a0 <printf>
    exit();
     566:	e8 98 30 00 00       	call   3603 <exit>
    printf("unlink small failed\n");
     56b:	83 ec 0c             	sub    $0xc,%esp
     56e:	68 34 3d 00 00       	push   $0x3d34
     573:	e8 28 34 00 00       	call   39a0 <printf>
    exit();
     578:	e8 86 30 00 00       	call   3603 <exit>
    printf("error: creat small failed!\n");
     57d:	83 ec 0c             	sub    $0xc,%esp
     580:	68 b0 3c 00 00       	push   $0x3cb0
     585:	e8 16 34 00 00       	call   39a0 <printf>
    exit();
     58a:	e8 74 30 00 00       	call   3603 <exit>
     58f:	90                   	nop

00000590 <writetest1>:
{
     590:	55                   	push   %ebp
     591:	89 e5                	mov    %esp,%ebp
     593:	56                   	push   %esi
     594:	53                   	push   %ebx
  printf("big files test\n");
     595:	83 ec 0c             	sub    $0xc,%esp
     598:	68 5d 3d 00 00       	push   $0x3d5d
     59d:	e8 fe 33 00 00       	call   39a0 <printf>
  fd = open("big", O_CREATE|O_RDWR);
     5a2:	5b                   	pop    %ebx
     5a3:	5e                   	pop    %esi
     5a4:	68 02 02 00 00       	push   $0x202
     5a9:	68 d7 3d 00 00       	push   $0x3dd7
     5ae:	e8 90 30 00 00       	call   3643 <open>
  if(fd < 0){
     5b3:	83 c4 10             	add    $0x10,%esp
     5b6:	85 c0                	test   %eax,%eax
     5b8:	0f 88 3c 01 00 00    	js     6fa <writetest1+0x16a>
     5be:	89 c6                	mov    %eax,%esi
  for(i = 0; i < MAXFILE; i++){
     5c0:	31 db                	xor    %ebx,%ebx
     5c2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    if(write(fd, buf, 512) != 512){
     5c8:	83 ec 04             	sub    $0x4,%esp
    ((int*)buf)[0] = i;
     5cb:	89 1d a0 7a 00 00    	mov    %ebx,0x7aa0
    if(write(fd, buf, 512) != 512){
     5d1:	68 00 02 00 00       	push   $0x200
     5d6:	68 a0 7a 00 00       	push   $0x7aa0
     5db:	56                   	push   %esi
     5dc:	e8 42 30 00 00       	call   3623 <write>
     5e1:	83 c4 10             	add    $0x10,%esp
     5e4:	3d 00 02 00 00       	cmp    $0x200,%eax
     5e9:	0f 85 a9 00 00 00    	jne    698 <writetest1+0x108>
  for(i = 0; i < MAXFILE; i++){
     5ef:	83 c3 01             	add    $0x1,%ebx
     5f2:	81 fb 8c 00 00 00    	cmp    $0x8c,%ebx
     5f8:	75 ce                	jne    5c8 <writetest1+0x38>
  close(fd);
     5fa:	83 ec 0c             	sub    $0xc,%esp
     5fd:	56                   	push   %esi
     5fe:	e8 28 30 00 00       	call   362b <close>
  fd = open("big", O_RDONLY);
     603:	5a                   	pop    %edx
     604:	59                   	pop    %ecx
     605:	6a 00                	push   $0x0
     607:	68 d7 3d 00 00       	push   $0x3dd7
     60c:	e8 32 30 00 00       	call   3643 <open>
  if(fd < 0){
     611:	83 c4 10             	add    $0x10,%esp
  fd = open("big", O_RDONLY);
     614:	89 c3                	mov    %eax,%ebx
  if(fd < 0){
     616:	85 c0                	test   %eax,%eax
     618:	0f 88 ca 00 00 00    	js     6e8 <writetest1+0x158>
  n = 0;
     61e:	31 f6                	xor    %esi,%esi
     620:	eb 1d                	jmp    63f <writetest1+0xaf>
     622:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    } else if(i != 512){
     628:	3d 00 02 00 00       	cmp    $0x200,%eax
     62d:	0f 85 8c 00 00 00    	jne    6bf <writetest1+0x12f>
    if(((int*)buf)[0] != n){
     633:	a1 a0 7a 00 00       	mov    0x7aa0,%eax
     638:	39 f0                	cmp    %esi,%eax
     63a:	75 6f                	jne    6ab <writetest1+0x11b>
    n++;
     63c:	83 c6 01             	add    $0x1,%esi
    i = read(fd, buf, 512);
     63f:	83 ec 04             	sub    $0x4,%esp
     642:	68 00 02 00 00       	push   $0x200
     647:	68 a0 7a 00 00       	push   $0x7aa0
     64c:	53                   	push   %ebx
     64d:	e8 c9 2f 00 00       	call   361b <read>
    if(i == 0){
     652:	83 c4 10             	add    $0x10,%esp
     655:	85 c0                	test   %eax,%eax
     657:	75 cf                	jne    628 <writetest1+0x98>
      if(n == MAXFILE - 1){
     659:	81 fe 8b 00 00 00    	cmp    $0x8b,%esi
     65f:	74 71                	je     6d2 <writetest1+0x142>
  close(fd);
     661:	83 ec 0c             	sub    $0xc,%esp
     664:	53                   	push   %ebx
     665:	e8 c1 2f 00 00       	call   362b <close>
  if(unlink("big") < 0){
     66a:	c7 04 24 d7 3d 00 00 	movl   $0x3dd7,(%esp)
     671:	e8 dd 2f 00 00       	call   3653 <unlink>
     676:	83 c4 10             	add    $0x10,%esp
     679:	85 c0                	test   %eax,%eax
     67b:	0f 88 8b 00 00 00    	js     70c <writetest1+0x17c>
  printf("big files ok\n");
     681:	83 ec 0c             	sub    $0xc,%esp
     684:	68 fe 3d 00 00       	push   $0x3dfe
     689:	e8 12 33 00 00       	call   39a0 <printf>
}
     68e:	83 c4 10             	add    $0x10,%esp
     691:	8d 65 f8             	lea    -0x8(%ebp),%esp
     694:	5b                   	pop    %ebx
     695:	5e                   	pop    %esi
     696:	5d                   	pop    %ebp
     697:	c3                   	ret    
      printf("error: write big file failed\n", i);
     698:	83 ec 08             	sub    $0x8,%esp
     69b:	53                   	push   %ebx
     69c:	68 87 3d 00 00       	push   $0x3d87
     6a1:	e8 fa 32 00 00       	call   39a0 <printf>
      exit();
     6a6:	e8 58 2f 00 00       	call   3603 <exit>
      printf("read content of block %d is %d\n",
     6ab:	83 ec 04             	sub    $0x4,%esp
     6ae:	50                   	push   %eax
     6af:	56                   	push   %esi
     6b0:	68 d8 4b 00 00       	push   $0x4bd8
     6b5:	e8 e6 32 00 00       	call   39a0 <printf>
      exit();
     6ba:	e8 44 2f 00 00       	call   3603 <exit>
      printf("read failed %d\n", i);
     6bf:	83 ec 08             	sub    $0x8,%esp
     6c2:	50                   	push   %eax
     6c3:	68 db 3d 00 00       	push   $0x3ddb
     6c8:	e8 d3 32 00 00       	call   39a0 <printf>
      exit();
     6cd:	e8 31 2f 00 00       	call   3603 <exit>
        printf("read only %d blocks from big", n);
     6d2:	50                   	push   %eax
     6d3:	50                   	push   %eax
     6d4:	68 8b 00 00 00       	push   $0x8b
     6d9:	68 be 3d 00 00       	push   $0x3dbe
     6de:	e8 bd 32 00 00       	call   39a0 <printf>
        exit();
     6e3:	e8 1b 2f 00 00       	call   3603 <exit>
    printf("error: open big failed!\n");
     6e8:	83 ec 0c             	sub    $0xc,%esp
     6eb:	68 a5 3d 00 00       	push   $0x3da5
     6f0:	e8 ab 32 00 00       	call   39a0 <printf>
    exit();
     6f5:	e8 09 2f 00 00       	call   3603 <exit>
    printf("error: creat big failed!\n");
     6fa:	83 ec 0c             	sub    $0xc,%esp
     6fd:	68 6d 3d 00 00       	push   $0x3d6d
     702:	e8 99 32 00 00       	call   39a0 <printf>
    exit();
     707:	e8 f7 2e 00 00       	call   3603 <exit>
    printf("unlink big failed\n");
     70c:	83 ec 0c             	sub    $0xc,%esp
     70f:	68 eb 3d 00 00       	push   $0x3deb
     714:	e8 87 32 00 00       	call   39a0 <printf>
    exit();
     719:	e8 e5 2e 00 00       	call   3603 <exit>
     71e:	66 90                	xchg   %ax,%ax

00000720 <createtest>:
{
     720:	55                   	push   %ebp
     721:	89 e5                	mov    %esp,%ebp
     723:	53                   	push   %ebx
  name[2] = '\0';
     724:	bb 30 00 00 00       	mov    $0x30,%ebx
{
     729:	83 ec 10             	sub    $0x10,%esp
  printf("many creates, followed by unlink test\n");
     72c:	68 f8 4b 00 00       	push   $0x4bf8
     731:	e8 6a 32 00 00       	call   39a0 <printf>
  name[0] = 'a';
     736:	c6 05 90 7a 00 00 61 	movb   $0x61,0x7a90
  name[2] = '\0';
     73d:	83 c4 10             	add    $0x10,%esp
     740:	c6 05 92 7a 00 00 00 	movb   $0x0,0x7a92
  for(i = 0; i < 52; i++){
     747:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     74e:	66 90                	xchg   %ax,%ax
    fd = open(name, O_CREATE|O_RDWR);
     750:	83 ec 08             	sub    $0x8,%esp
    name[1] = '0' + i;
     753:	88 1d 91 7a 00 00    	mov    %bl,0x7a91
  for(i = 0; i < 52; i++){
     759:	83 c3 01             	add    $0x1,%ebx
    fd = open(name, O_CREATE|O_RDWR);
     75c:	68 02 02 00 00       	push   $0x202
     761:	68 90 7a 00 00       	push   $0x7a90
     766:	e8 d8 2e 00 00       	call   3643 <open>
    close(fd);
     76b:	89 04 24             	mov    %eax,(%esp)
     76e:	e8 b8 2e 00 00       	call   362b <close>
  for(i = 0; i < 52; i++){
     773:	83 c4 10             	add    $0x10,%esp
     776:	80 fb 64             	cmp    $0x64,%bl
     779:	75 d5                	jne    750 <createtest+0x30>
  name[0] = 'a';
     77b:	c6 05 90 7a 00 00 61 	movb   $0x61,0x7a90
  name[2] = '\0';
     782:	bb 30 00 00 00       	mov    $0x30,%ebx
     787:	c6 05 92 7a 00 00 00 	movb   $0x0,0x7a92
  for(i = 0; i < 52; i++){
     78e:	66 90                	xchg   %ax,%ax
    unlink(name);
     790:	83 ec 0c             	sub    $0xc,%esp
    name[1] = '0' + i;
     793:	88 1d 91 7a 00 00    	mov    %bl,0x7a91
  for(i = 0; i < 52; i++){
     799:	83 c3 01             	add    $0x1,%ebx
    unlink(name);
     79c:	68 90 7a 00 00       	push   $0x7a90
     7a1:	e8 ad 2e 00 00       	call   3653 <unlink>
  for(i = 0; i < 52; i++){
     7a6:	83 c4 10             	add    $0x10,%esp
     7a9:	80 fb 64             	cmp    $0x64,%bl
     7ac:	75 e2                	jne    790 <createtest+0x70>
  printf("many creates, followed by unlink; ok\n");
     7ae:	83 ec 0c             	sub    $0xc,%esp
     7b1:	68 20 4c 00 00       	push   $0x4c20
     7b6:	e8 e5 31 00 00       	call   39a0 <printf>
}
     7bb:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     7be:	83 c4 10             	add    $0x10,%esp
     7c1:	c9                   	leave  
     7c2:	c3                   	ret    
     7c3:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     7ca:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

000007d0 <dirtest>:
{
     7d0:	55                   	push   %ebp
     7d1:	89 e5                	mov    %esp,%ebp
     7d3:	83 ec 14             	sub    $0x14,%esp
  printf("mkdir test\n");
     7d6:	68 0c 3e 00 00       	push   $0x3e0c
     7db:	e8 c0 31 00 00       	call   39a0 <printf>
  if(mkdir("dir0") < 0){
     7e0:	c7 04 24 18 3e 00 00 	movl   $0x3e18,(%esp)
     7e7:	e8 7f 2e 00 00       	call   366b <mkdir>
     7ec:	83 c4 10             	add    $0x10,%esp
     7ef:	85 c0                	test   %eax,%eax
     7f1:	78 4e                	js     841 <dirtest+0x71>
  if(chdir("dir0") < 0){
     7f3:	83 ec 0c             	sub    $0xc,%esp
     7f6:	68 18 3e 00 00       	push   $0x3e18
     7fb:	e8 73 2e 00 00       	call   3673 <chdir>
     800:	83 c4 10             	add    $0x10,%esp
     803:	85 c0                	test   %eax,%eax
     805:	78 70                	js     877 <dirtest+0xa7>
  if(chdir("..") < 0){
     807:	83 ec 0c             	sub    $0xc,%esp
     80a:	68 bd 43 00 00       	push   $0x43bd
     80f:	e8 5f 2e 00 00       	call   3673 <chdir>
     814:	83 c4 10             	add    $0x10,%esp
     817:	85 c0                	test   %eax,%eax
     819:	78 4a                	js     865 <dirtest+0x95>
  if(unlink("dir0") < 0){
     81b:	83 ec 0c             	sub    $0xc,%esp
     81e:	68 18 3e 00 00       	push   $0x3e18
     823:	e8 2b 2e 00 00       	call   3653 <unlink>
     828:	83 c4 10             	add    $0x10,%esp
     82b:	85 c0                	test   %eax,%eax
     82d:	78 24                	js     853 <dirtest+0x83>
  printf("mkdir test ok\n");
     82f:	83 ec 0c             	sub    $0xc,%esp
     832:	68 55 3e 00 00       	push   $0x3e55
     837:	e8 64 31 00 00       	call   39a0 <printf>
}
     83c:	83 c4 10             	add    $0x10,%esp
     83f:	c9                   	leave  
     840:	c3                   	ret    
    printf("mkdir failed\n");
     841:	83 ec 0c             	sub    $0xc,%esp
     844:	68 48 3b 00 00       	push   $0x3b48
     849:	e8 52 31 00 00       	call   39a0 <printf>
    exit();
     84e:	e8 b0 2d 00 00       	call   3603 <exit>
    printf("unlink dir0 failed\n");
     853:	83 ec 0c             	sub    $0xc,%esp
     856:	68 41 3e 00 00       	push   $0x3e41
     85b:	e8 40 31 00 00       	call   39a0 <printf>
    exit();
     860:	e8 9e 2d 00 00       	call   3603 <exit>
    printf("chdir .. failed\n");
     865:	83 ec 0c             	sub    $0xc,%esp
     868:	68 30 3e 00 00       	push   $0x3e30
     86d:	e8 2e 31 00 00       	call   39a0 <printf>
    exit();
     872:	e8 8c 2d 00 00       	call   3603 <exit>
    printf("chdir dir0 failed\n");
     877:	83 ec 0c             	sub    $0xc,%esp
     87a:	68 1d 3e 00 00       	push   $0x3e1d
     87f:	e8 1c 31 00 00       	call   39a0 <printf>
    exit();
     884:	e8 7a 2d 00 00       	call   3603 <exit>
     889:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000890 <exectest>:
{
     890:	55                   	push   %ebp
     891:	89 e5                	mov    %esp,%ebp
     893:	83 ec 14             	sub    $0x14,%esp
  printf("exec test\n");
     896:	68 64 3e 00 00       	push   $0x3e64
     89b:	e8 00 31 00 00       	call   39a0 <printf>
  if(exec("echo", echoargv) < 0){
     8a0:	58                   	pop    %eax
     8a1:	5a                   	pop    %edx
     8a2:	68 5c 53 00 00       	push   $0x535c
     8a7:	68 2d 3c 00 00       	push   $0x3c2d
     8ac:	e8 8a 2d 00 00       	call   363b <exec>
     8b1:	83 c4 10             	add    $0x10,%esp
     8b4:	85 c0                	test   %eax,%eax
     8b6:	78 02                	js     8ba <exectest+0x2a>
}
     8b8:	c9                   	leave  
     8b9:	c3                   	ret    
    printf("exec echo failed\n");
     8ba:	83 ec 0c             	sub    $0xc,%esp
     8bd:	68 6f 3e 00 00       	push   $0x3e6f
     8c2:	e8 d9 30 00 00       	call   39a0 <printf>
    exit();
     8c7:	e8 37 2d 00 00       	call   3603 <exit>
     8cc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

000008d0 <pipe1>:
{
     8d0:	55                   	push   %ebp
     8d1:	89 e5                	mov    %esp,%ebp
     8d3:	57                   	push   %edi
     8d4:	56                   	push   %esi
  if(pipe(fds) != 0){
     8d5:	8d 45 e0             	lea    -0x20(%ebp),%eax
{
     8d8:	53                   	push   %ebx
     8d9:	83 ec 38             	sub    $0x38,%esp
  if(pipe(fds) != 0){
     8dc:	50                   	push   %eax
     8dd:	e8 31 2d 00 00       	call   3613 <pipe>
     8e2:	83 c4 10             	add    $0x10,%esp
     8e5:	85 c0                	test   %eax,%eax
     8e7:	0f 85 29 01 00 00    	jne    a16 <pipe1+0x146>
  pid = fork();
     8ed:	e8 09 2d 00 00       	call   35fb <fork>
  if(pid == 0){
     8f2:	85 c0                	test   %eax,%eax
     8f4:	0f 84 83 00 00 00    	je     97d <pipe1+0xad>
  } else if(pid > 0){
     8fa:	0f 8e 28 01 00 00    	jle    a28 <pipe1+0x158>
    close(fds[1]);
     900:	83 ec 0c             	sub    $0xc,%esp
     903:	ff 75 e4             	push   -0x1c(%ebp)
  seq = 0;
     906:	31 db                	xor    %ebx,%ebx
    cc = 1;
     908:	be 01 00 00 00       	mov    $0x1,%esi
    close(fds[1]);
     90d:	e8 19 2d 00 00       	call   362b <close>
    total = 0;
     912:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
    while((n = read(fds[0], buf, cc)) > 0){
     919:	83 c4 10             	add    $0x10,%esp
     91c:	83 ec 04             	sub    $0x4,%esp
     91f:	56                   	push   %esi
     920:	68 a0 7a 00 00       	push   $0x7aa0
     925:	ff 75 e0             	push   -0x20(%ebp)
     928:	e8 ee 2c 00 00       	call   361b <read>
     92d:	83 c4 10             	add    $0x10,%esp
     930:	89 c7                	mov    %eax,%edi
     932:	85 c0                	test   %eax,%eax
     934:	0f 8e 9b 00 00 00    	jle    9d5 <pipe1+0x105>
     93a:	8d 0c 1f             	lea    (%edi,%ebx,1),%ecx
      for(i = 0; i < n; i++){
     93d:	31 c0                	xor    %eax,%eax
     93f:	90                   	nop
        if((buf[i] & 0xff) != (seq++ & 0xff)){
     940:	89 da                	mov    %ebx,%edx
     942:	83 c3 01             	add    $0x1,%ebx
     945:	38 90 a0 7a 00 00    	cmp    %dl,0x7aa0(%eax)
     94b:	75 18                	jne    965 <pipe1+0x95>
      for(i = 0; i < n; i++){
     94d:	83 c0 01             	add    $0x1,%eax
     950:	39 d9                	cmp    %ebx,%ecx
     952:	75 ec                	jne    940 <pipe1+0x70>
      cc = cc * 2;
     954:	01 f6                	add    %esi,%esi
     956:	b8 00 20 00 00       	mov    $0x2000,%eax
      total += n;
     95b:	01 7d d4             	add    %edi,-0x2c(%ebp)
     95e:	39 c6                	cmp    %eax,%esi
     960:	0f 4f f0             	cmovg  %eax,%esi
     963:	eb b7                	jmp    91c <pipe1+0x4c>
          printf("pipe1 oops 2\n");
     965:	83 ec 0c             	sub    $0xc,%esp
     968:	68 9e 3e 00 00       	push   $0x3e9e
     96d:	e8 2e 30 00 00       	call   39a0 <printf>
     972:	83 c4 10             	add    $0x10,%esp
}
     975:	8d 65 f4             	lea    -0xc(%ebp),%esp
     978:	5b                   	pop    %ebx
     979:	5e                   	pop    %esi
     97a:	5f                   	pop    %edi
     97b:	5d                   	pop    %ebp
     97c:	c3                   	ret    
    close(fds[0]);
     97d:	83 ec 0c             	sub    $0xc,%esp
     980:	ff 75 e0             	push   -0x20(%ebp)
  seq = 0;
     983:	31 db                	xor    %ebx,%ebx
    close(fds[0]);
     985:	e8 a1 2c 00 00       	call   362b <close>
     98a:	83 c4 10             	add    $0x10,%esp
      for(i = 0; i < 1033; i++)
     98d:	31 c0                	xor    %eax,%eax
     98f:	90                   	nop
        buf[i] = seq++;
     990:	8d 14 18             	lea    (%eax,%ebx,1),%edx
      for(i = 0; i < 1033; i++)
     993:	83 c0 01             	add    $0x1,%eax
        buf[i] = seq++;
     996:	88 90 9f 7a 00 00    	mov    %dl,0x7a9f(%eax)
      for(i = 0; i < 1033; i++)
     99c:	3d 09 04 00 00       	cmp    $0x409,%eax
     9a1:	75 ed                	jne    990 <pipe1+0xc0>
      if(write(fds[1], buf, 1033) != 1033){
     9a3:	83 ec 04             	sub    $0x4,%esp
        buf[i] = seq++;
     9a6:	81 c3 09 04 00 00    	add    $0x409,%ebx
      if(write(fds[1], buf, 1033) != 1033){
     9ac:	68 09 04 00 00       	push   $0x409
     9b1:	68 a0 7a 00 00       	push   $0x7aa0
     9b6:	ff 75 e4             	push   -0x1c(%ebp)
     9b9:	e8 65 2c 00 00       	call   3623 <write>
     9be:	83 c4 10             	add    $0x10,%esp
     9c1:	3d 09 04 00 00       	cmp    $0x409,%eax
     9c6:	75 72                	jne    a3a <pipe1+0x16a>
    for(n = 0; n < 5; n++){
     9c8:	81 fb 2d 14 00 00    	cmp    $0x142d,%ebx
     9ce:	75 bd                	jne    98d <pipe1+0xbd>
    exit();
     9d0:	e8 2e 2c 00 00       	call   3603 <exit>
    if(total != 5 * 1033){
     9d5:	81 7d d4 2d 14 00 00 	cmpl   $0x142d,-0x2c(%ebp)
     9dc:	75 24                	jne    a02 <pipe1+0x132>
    close(fds[0]);
     9de:	83 ec 0c             	sub    $0xc,%esp
     9e1:	ff 75 e0             	push   -0x20(%ebp)
     9e4:	e8 42 2c 00 00       	call   362b <close>
    wait();
     9e9:	e8 1d 2c 00 00       	call   360b <wait>
  printf("pipe1 ok\n");
     9ee:	c7 04 24 c3 3e 00 00 	movl   $0x3ec3,(%esp)
     9f5:	e8 a6 2f 00 00       	call   39a0 <printf>
     9fa:	83 c4 10             	add    $0x10,%esp
     9fd:	e9 73 ff ff ff       	jmp    975 <pipe1+0xa5>
      printf("pipe1 oops 3 total %d\n", total);
     a02:	50                   	push   %eax
     a03:	50                   	push   %eax
     a04:	ff 75 d4             	push   -0x2c(%ebp)
     a07:	68 ac 3e 00 00       	push   $0x3eac
     a0c:	e8 8f 2f 00 00       	call   39a0 <printf>
      exit();
     a11:	e8 ed 2b 00 00       	call   3603 <exit>
    printf("pipe() failed\n");
     a16:	83 ec 0c             	sub    $0xc,%esp
     a19:	68 81 3e 00 00       	push   $0x3e81
     a1e:	e8 7d 2f 00 00       	call   39a0 <printf>
    exit();
     a23:	e8 db 2b 00 00       	call   3603 <exit>
    printf("fork() failed\n");
     a28:	83 ec 0c             	sub    $0xc,%esp
     a2b:	68 cd 3e 00 00       	push   $0x3ecd
     a30:	e8 6b 2f 00 00       	call   39a0 <printf>
    exit();
     a35:	e8 c9 2b 00 00       	call   3603 <exit>
        printf("pipe1 oops 1\n");
     a3a:	83 ec 0c             	sub    $0xc,%esp
     a3d:	68 90 3e 00 00       	push   $0x3e90
     a42:	e8 59 2f 00 00       	call   39a0 <printf>
        exit();
     a47:	e8 b7 2b 00 00       	call   3603 <exit>
     a4c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000a50 <preempt>:
{
     a50:	55                   	push   %ebp
     a51:	89 e5                	mov    %esp,%ebp
     a53:	57                   	push   %edi
     a54:	56                   	push   %esi
     a55:	53                   	push   %ebx
     a56:	83 ec 28             	sub    $0x28,%esp
  printf("preempt: ");
     a59:	68 dc 3e 00 00       	push   $0x3edc
     a5e:	e8 3d 2f 00 00       	call   39a0 <printf>
  pid1 = fork();
     a63:	e8 93 2b 00 00       	call   35fb <fork>
  if(pid1 == 0)
     a68:	83 c4 10             	add    $0x10,%esp
     a6b:	85 c0                	test   %eax,%eax
     a6d:	75 09                	jne    a78 <preempt+0x28>
    for(;;)
     a6f:	eb fe                	jmp    a6f <preempt+0x1f>
     a71:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     a78:	89 c3                	mov    %eax,%ebx
  pid2 = fork();
     a7a:	e8 7c 2b 00 00       	call   35fb <fork>
     a7f:	89 c6                	mov    %eax,%esi
  if(pid2 == 0)
     a81:	85 c0                	test   %eax,%eax
     a83:	75 0b                	jne    a90 <preempt+0x40>
    for(;;)
     a85:	eb fe                	jmp    a85 <preempt+0x35>
     a87:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     a8e:	66 90                	xchg   %ax,%ax
  pipe(pfds);
     a90:	83 ec 0c             	sub    $0xc,%esp
     a93:	8d 45 e0             	lea    -0x20(%ebp),%eax
     a96:	50                   	push   %eax
     a97:	e8 77 2b 00 00       	call   3613 <pipe>
  pid3 = fork();
     a9c:	e8 5a 2b 00 00       	call   35fb <fork>
  if(pid3 == 0){
     aa1:	83 c4 10             	add    $0x10,%esp
  pid3 = fork();
     aa4:	89 c7                	mov    %eax,%edi
  if(pid3 == 0){
     aa6:	85 c0                	test   %eax,%eax
     aa8:	75 3e                	jne    ae8 <preempt+0x98>
    close(pfds[0]);
     aaa:	83 ec 0c             	sub    $0xc,%esp
     aad:	ff 75 e0             	push   -0x20(%ebp)
     ab0:	e8 76 2b 00 00       	call   362b <close>
    if(write(pfds[1], "x", 1) != 1)
     ab5:	83 c4 0c             	add    $0xc,%esp
     ab8:	6a 01                	push   $0x1
     aba:	68 a1 44 00 00       	push   $0x44a1
     abf:	ff 75 e4             	push   -0x1c(%ebp)
     ac2:	e8 5c 2b 00 00       	call   3623 <write>
     ac7:	83 c4 10             	add    $0x10,%esp
     aca:	83 f8 01             	cmp    $0x1,%eax
     acd:	0f 85 b0 00 00 00    	jne    b83 <preempt+0x133>
    close(pfds[1]);
     ad3:	83 ec 0c             	sub    $0xc,%esp
     ad6:	ff 75 e4             	push   -0x1c(%ebp)
     ad9:	e8 4d 2b 00 00       	call   362b <close>
     ade:	83 c4 10             	add    $0x10,%esp
    for(;;)
     ae1:	eb fe                	jmp    ae1 <preempt+0x91>
     ae3:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
     ae7:	90                   	nop
  close(pfds[1]);
     ae8:	83 ec 0c             	sub    $0xc,%esp
     aeb:	ff 75 e4             	push   -0x1c(%ebp)
     aee:	e8 38 2b 00 00       	call   362b <close>
  if(read(pfds[0], buf, sizeof(buf)) != 1){
     af3:	83 c4 0c             	add    $0xc,%esp
     af6:	68 00 20 00 00       	push   $0x2000
     afb:	68 a0 7a 00 00       	push   $0x7aa0
     b00:	ff 75 e0             	push   -0x20(%ebp)
     b03:	e8 13 2b 00 00       	call   361b <read>
     b08:	83 c4 10             	add    $0x10,%esp
     b0b:	83 f8 01             	cmp    $0x1,%eax
     b0e:	75 61                	jne    b71 <preempt+0x121>
  close(pfds[0]);
     b10:	83 ec 0c             	sub    $0xc,%esp
     b13:	ff 75 e0             	push   -0x20(%ebp)
     b16:	e8 10 2b 00 00       	call   362b <close>
  printf("kill... ");
     b1b:	c7 04 24 0d 3f 00 00 	movl   $0x3f0d,(%esp)
     b22:	e8 79 2e 00 00       	call   39a0 <printf>
  kill(pid1);
     b27:	89 1c 24             	mov    %ebx,(%esp)
     b2a:	e8 04 2b 00 00       	call   3633 <kill>
  kill(pid2);
     b2f:	89 34 24             	mov    %esi,(%esp)
     b32:	e8 fc 2a 00 00       	call   3633 <kill>
  kill(pid3);
     b37:	89 3c 24             	mov    %edi,(%esp)
     b3a:	e8 f4 2a 00 00       	call   3633 <kill>
  printf("wait... ");
     b3f:	c7 04 24 16 3f 00 00 	movl   $0x3f16,(%esp)
     b46:	e8 55 2e 00 00       	call   39a0 <printf>
  wait();
     b4b:	e8 bb 2a 00 00       	call   360b <wait>
  wait();
     b50:	e8 b6 2a 00 00       	call   360b <wait>
  wait();
     b55:	e8 b1 2a 00 00       	call   360b <wait>
  printf("preempt ok\n");
     b5a:	c7 04 24 1f 3f 00 00 	movl   $0x3f1f,(%esp)
     b61:	e8 3a 2e 00 00       	call   39a0 <printf>
     b66:	83 c4 10             	add    $0x10,%esp
}
     b69:	8d 65 f4             	lea    -0xc(%ebp),%esp
     b6c:	5b                   	pop    %ebx
     b6d:	5e                   	pop    %esi
     b6e:	5f                   	pop    %edi
     b6f:	5d                   	pop    %ebp
     b70:	c3                   	ret    
    printf("preempt read error");
     b71:	83 ec 0c             	sub    $0xc,%esp
     b74:	68 fa 3e 00 00       	push   $0x3efa
     b79:	e8 22 2e 00 00       	call   39a0 <printf>
     b7e:	83 c4 10             	add    $0x10,%esp
     b81:	eb e6                	jmp    b69 <preempt+0x119>
      printf("preempt write error");
     b83:	83 ec 0c             	sub    $0xc,%esp
     b86:	68 e6 3e 00 00       	push   $0x3ee6
     b8b:	e8 10 2e 00 00       	call   39a0 <printf>
     b90:	83 c4 10             	add    $0x10,%esp
     b93:	e9 3b ff ff ff       	jmp    ad3 <preempt+0x83>
     b98:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     b9f:	90                   	nop

00000ba0 <exitwait>:
{
     ba0:	55                   	push   %ebp
     ba1:	89 e5                	mov    %esp,%ebp
     ba3:	56                   	push   %esi
     ba4:	be 64 00 00 00       	mov    $0x64,%esi
     ba9:	53                   	push   %ebx
     baa:	eb 14                	jmp    bc0 <exitwait+0x20>
     bac:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    if(pid){
     bb0:	74 64                	je     c16 <exitwait+0x76>
      if(wait() != pid){
     bb2:	e8 54 2a 00 00       	call   360b <wait>
     bb7:	39 d8                	cmp    %ebx,%eax
     bb9:	75 2d                	jne    be8 <exitwait+0x48>
  for(i = 0; i < 100; i++){
     bbb:	83 ee 01             	sub    $0x1,%esi
     bbe:	74 3f                	je     bff <exitwait+0x5f>
    pid = fork();
     bc0:	e8 36 2a 00 00       	call   35fb <fork>
     bc5:	89 c3                	mov    %eax,%ebx
    if(pid < 0){
     bc7:	85 c0                	test   %eax,%eax
     bc9:	79 e5                	jns    bb0 <exitwait+0x10>
      printf("fork failed\n");
     bcb:	83 ec 0c             	sub    $0xc,%esp
     bce:	68 89 4a 00 00       	push   $0x4a89
     bd3:	e8 c8 2d 00 00       	call   39a0 <printf>
      return;
     bd8:	83 c4 10             	add    $0x10,%esp
}
     bdb:	8d 65 f8             	lea    -0x8(%ebp),%esp
     bde:	5b                   	pop    %ebx
     bdf:	5e                   	pop    %esi
     be0:	5d                   	pop    %ebp
     be1:	c3                   	ret    
     be2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        printf("wait wrong pid\n");
     be8:	83 ec 0c             	sub    $0xc,%esp
     beb:	68 2b 3f 00 00       	push   $0x3f2b
     bf0:	e8 ab 2d 00 00       	call   39a0 <printf>
        return;
     bf5:	83 c4 10             	add    $0x10,%esp
}
     bf8:	8d 65 f8             	lea    -0x8(%ebp),%esp
     bfb:	5b                   	pop    %ebx
     bfc:	5e                   	pop    %esi
     bfd:	5d                   	pop    %ebp
     bfe:	c3                   	ret    
  printf("exitwait ok\n");
     bff:	83 ec 0c             	sub    $0xc,%esp
     c02:	68 3b 3f 00 00       	push   $0x3f3b
     c07:	e8 94 2d 00 00       	call   39a0 <printf>
     c0c:	83 c4 10             	add    $0x10,%esp
}
     c0f:	8d 65 f8             	lea    -0x8(%ebp),%esp
     c12:	5b                   	pop    %ebx
     c13:	5e                   	pop    %esi
     c14:	5d                   	pop    %ebp
     c15:	c3                   	ret    
      exit();
     c16:	e8 e8 29 00 00       	call   3603 <exit>
     c1b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
     c1f:	90                   	nop

00000c20 <mem>:
{
     c20:	55                   	push   %ebp
     c21:	89 e5                	mov    %esp,%ebp
     c23:	56                   	push   %esi
     c24:	31 f6                	xor    %esi,%esi
     c26:	53                   	push   %ebx
  printf("mem test\n");
     c27:	83 ec 0c             	sub    $0xc,%esp
     c2a:	68 48 3f 00 00       	push   $0x3f48
     c2f:	e8 6c 2d 00 00       	call   39a0 <printf>
  ppid = getpid();
     c34:	e8 4a 2a 00 00       	call   3683 <getpid>
     c39:	89 c3                	mov    %eax,%ebx
  if((pid = fork()) == 0){
     c3b:	e8 bb 29 00 00       	call   35fb <fork>
     c40:	83 c4 10             	add    $0x10,%esp
     c43:	85 c0                	test   %eax,%eax
     c45:	74 0d                	je     c54 <mem+0x34>
     c47:	e9 8c 00 00 00       	jmp    cd8 <mem+0xb8>
     c4c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
      *(char**)m2 = m1;
     c50:	89 30                	mov    %esi,(%eax)
     c52:	89 c6                	mov    %eax,%esi
    while((m2 = malloc(10001)) != 0){
     c54:	83 ec 0c             	sub    $0xc,%esp
     c57:	68 11 27 00 00       	push   $0x2711
     c5c:	e8 ef 2d 00 00       	call   3a50 <malloc>
     c61:	83 c4 10             	add    $0x10,%esp
     c64:	85 c0                	test   %eax,%eax
     c66:	75 e8                	jne    c50 <mem+0x30>
    while(m1){
     c68:	85 f6                	test   %esi,%esi
     c6a:	74 18                	je     c84 <mem+0x64>
     c6c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
      m2 = *(char**)m1;
     c70:	89 f0                	mov    %esi,%eax
      free(m1);
     c72:	83 ec 0c             	sub    $0xc,%esp
      m2 = *(char**)m1;
     c75:	8b 36                	mov    (%esi),%esi
      free(m1);
     c77:	50                   	push   %eax
     c78:	e8 43 2d 00 00       	call   39c0 <free>
    while(m1){
     c7d:	83 c4 10             	add    $0x10,%esp
     c80:	85 f6                	test   %esi,%esi
     c82:	75 ec                	jne    c70 <mem+0x50>
    m1 = malloc(1024*20);
     c84:	83 ec 0c             	sub    $0xc,%esp
     c87:	68 00 50 00 00       	push   $0x5000
     c8c:	e8 bf 2d 00 00       	call   3a50 <malloc>
    if(m1 == 0){
     c91:	83 c4 10             	add    $0x10,%esp
     c94:	85 c0                	test   %eax,%eax
     c96:	74 20                	je     cb8 <mem+0x98>
    free(m1);
     c98:	83 ec 0c             	sub    $0xc,%esp
     c9b:	50                   	push   %eax
     c9c:	e8 1f 2d 00 00       	call   39c0 <free>
    printf("mem ok\n");
     ca1:	c7 04 24 6c 3f 00 00 	movl   $0x3f6c,(%esp)
     ca8:	e8 f3 2c 00 00       	call   39a0 <printf>
    exit();
     cad:	e8 51 29 00 00       	call   3603 <exit>
     cb2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      printf("couldn't allocate mem?!!\n");
     cb8:	83 ec 0c             	sub    $0xc,%esp
     cbb:	68 52 3f 00 00       	push   $0x3f52
     cc0:	e8 db 2c 00 00       	call   39a0 <printf>
      kill(ppid);
     cc5:	89 1c 24             	mov    %ebx,(%esp)
     cc8:	e8 66 29 00 00       	call   3633 <kill>
      exit();
     ccd:	e8 31 29 00 00       	call   3603 <exit>
     cd2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
}
     cd8:	8d 65 f8             	lea    -0x8(%ebp),%esp
     cdb:	5b                   	pop    %ebx
     cdc:	5e                   	pop    %esi
     cdd:	5d                   	pop    %ebp
    wait();
     cde:	e9 28 29 00 00       	jmp    360b <wait>
     ce3:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     cea:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00000cf0 <sharedfd>:
{
     cf0:	55                   	push   %ebp
     cf1:	89 e5                	mov    %esp,%ebp
     cf3:	57                   	push   %edi
     cf4:	56                   	push   %esi
     cf5:	53                   	push   %ebx
     cf6:	83 ec 38             	sub    $0x38,%esp
  printf("sharedfd test\n");
     cf9:	68 74 3f 00 00       	push   $0x3f74
     cfe:	e8 9d 2c 00 00       	call   39a0 <printf>
  unlink("sharedfd");
     d03:	c7 04 24 83 3f 00 00 	movl   $0x3f83,(%esp)
     d0a:	e8 44 29 00 00       	call   3653 <unlink>
  fd = open("sharedfd", O_CREATE|O_RDWR);
     d0f:	5e                   	pop    %esi
     d10:	5f                   	pop    %edi
     d11:	68 02 02 00 00       	push   $0x202
     d16:	68 83 3f 00 00       	push   $0x3f83
     d1b:	e8 23 29 00 00       	call   3643 <open>
  if(fd < 0){
     d20:	83 c4 10             	add    $0x10,%esp
     d23:	85 c0                	test   %eax,%eax
     d25:	0f 88 2a 01 00 00    	js     e55 <sharedfd+0x165>
     d2b:	89 c7                	mov    %eax,%edi
  memset(buf, pid==0?'c':'p', sizeof(buf));
     d2d:	8d 75 de             	lea    -0x22(%ebp),%esi
     d30:	bb e8 03 00 00       	mov    $0x3e8,%ebx
  pid = fork();
     d35:	e8 c1 28 00 00       	call   35fb <fork>
  memset(buf, pid==0?'c':'p', sizeof(buf));
     d3a:	83 f8 01             	cmp    $0x1,%eax
  pid = fork();
     d3d:	89 45 d4             	mov    %eax,-0x2c(%ebp)
  memset(buf, pid==0?'c':'p', sizeof(buf));
     d40:	19 c0                	sbb    %eax,%eax
     d42:	83 ec 04             	sub    $0x4,%esp
     d45:	83 e0 f3             	and    $0xfffffff3,%eax
     d48:	6a 0a                	push   $0xa
     d4a:	83 c0 70             	add    $0x70,%eax
     d4d:	50                   	push   %eax
     d4e:	56                   	push   %esi
     d4f:	e8 1c 27 00 00       	call   3470 <memset>
     d54:	83 c4 10             	add    $0x10,%esp
     d57:	eb 0c                	jmp    d65 <sharedfd+0x75>
     d59:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  for(i = 0; i < 1000; i++){
     d60:	83 eb 01             	sub    $0x1,%ebx
     d63:	74 24                	je     d89 <sharedfd+0x99>
    if(write(fd, buf, sizeof(buf)) != sizeof(buf)){
     d65:	83 ec 04             	sub    $0x4,%esp
     d68:	6a 0a                	push   $0xa
     d6a:	56                   	push   %esi
     d6b:	57                   	push   %edi
     d6c:	e8 b2 28 00 00       	call   3623 <write>
     d71:	83 c4 10             	add    $0x10,%esp
     d74:	83 f8 0a             	cmp    $0xa,%eax
     d77:	74 e7                	je     d60 <sharedfd+0x70>
      printf("fstests: write sharedfd failed\n");
     d79:	83 ec 0c             	sub    $0xc,%esp
     d7c:	68 74 4c 00 00       	push   $0x4c74
     d81:	e8 1a 2c 00 00       	call   39a0 <printf>
      break;
     d86:	83 c4 10             	add    $0x10,%esp
  if(pid == 0)
     d89:	8b 5d d4             	mov    -0x2c(%ebp),%ebx
     d8c:	85 db                	test   %ebx,%ebx
     d8e:	0f 84 f1 00 00 00    	je     e85 <sharedfd+0x195>
    wait();
     d94:	e8 72 28 00 00       	call   360b <wait>
  close(fd);
     d99:	83 ec 0c             	sub    $0xc,%esp
  nc = np = 0;
     d9c:	31 db                	xor    %ebx,%ebx
  close(fd);
     d9e:	57                   	push   %edi
     d9f:	8d 7d e8             	lea    -0x18(%ebp),%edi
     da2:	e8 84 28 00 00       	call   362b <close>
  fd = open("sharedfd", 0);
     da7:	5a                   	pop    %edx
     da8:	59                   	pop    %ecx
     da9:	6a 00                	push   $0x0
     dab:	68 83 3f 00 00       	push   $0x3f83
     db0:	e8 8e 28 00 00       	call   3643 <open>
  if(fd < 0){
     db5:	83 c4 10             	add    $0x10,%esp
  nc = np = 0;
     db8:	31 d2                	xor    %edx,%edx
  fd = open("sharedfd", 0);
     dba:	89 45 d0             	mov    %eax,-0x30(%ebp)
  if(fd < 0){
     dbd:	85 c0                	test   %eax,%eax
     dbf:	0f 88 a8 00 00 00    	js     e6d <sharedfd+0x17d>
     dc5:	8d 76 00             	lea    0x0(%esi),%esi
  while((n = read(fd, buf, sizeof(buf))) > 0){
     dc8:	83 ec 04             	sub    $0x4,%esp
     dcb:	89 55 d4             	mov    %edx,-0x2c(%ebp)
     dce:	6a 0a                	push   $0xa
     dd0:	56                   	push   %esi
     dd1:	ff 75 d0             	push   -0x30(%ebp)
     dd4:	e8 42 28 00 00       	call   361b <read>
     dd9:	83 c4 10             	add    $0x10,%esp
     ddc:	85 c0                	test   %eax,%eax
     dde:	7e 30                	jle    e10 <sharedfd+0x120>
     de0:	8b 55 d4             	mov    -0x2c(%ebp),%edx
     de3:	89 f0                	mov    %esi,%eax
     de5:	eb 1b                	jmp    e02 <sharedfd+0x112>
     de7:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     dee:	66 90                	xchg   %ax,%ax
        np++;
     df0:	80 f9 70             	cmp    $0x70,%cl
     df3:	0f 94 c1             	sete   %cl
     df6:	0f b6 c9             	movzbl %cl,%ecx
     df9:	01 cb                	add    %ecx,%ebx
    for(i = 0; i < sizeof(buf); i++){
     dfb:	83 c0 01             	add    $0x1,%eax
     dfe:	39 f8                	cmp    %edi,%eax
     e00:	74 c6                	je     dc8 <sharedfd+0xd8>
      if(buf[i] == 'c')
     e02:	0f b6 08             	movzbl (%eax),%ecx
     e05:	80 f9 63             	cmp    $0x63,%cl
     e08:	75 e6                	jne    df0 <sharedfd+0x100>
        nc++;
     e0a:	83 c2 01             	add    $0x1,%edx
      if(buf[i] == 'p')
     e0d:	eb ec                	jmp    dfb <sharedfd+0x10b>
     e0f:	90                   	nop
  close(fd);
     e10:	83 ec 0c             	sub    $0xc,%esp
     e13:	ff 75 d0             	push   -0x30(%ebp)
     e16:	e8 10 28 00 00       	call   362b <close>
  unlink("sharedfd");
     e1b:	c7 04 24 83 3f 00 00 	movl   $0x3f83,(%esp)
     e22:	e8 2c 28 00 00       	call   3653 <unlink>
  if(nc == 10000 && np == 10000){
     e27:	8b 55 d4             	mov    -0x2c(%ebp),%edx
     e2a:	83 c4 10             	add    $0x10,%esp
     e2d:	81 fa 10 27 00 00    	cmp    $0x2710,%edx
     e33:	75 55                	jne    e8a <sharedfd+0x19a>
     e35:	81 fb 10 27 00 00    	cmp    $0x2710,%ebx
     e3b:	75 4d                	jne    e8a <sharedfd+0x19a>
    printf("sharedfd ok\n");
     e3d:	83 ec 0c             	sub    $0xc,%esp
     e40:	68 8c 3f 00 00       	push   $0x3f8c
     e45:	e8 56 2b 00 00       	call   39a0 <printf>
     e4a:	83 c4 10             	add    $0x10,%esp
}
     e4d:	8d 65 f4             	lea    -0xc(%ebp),%esp
     e50:	5b                   	pop    %ebx
     e51:	5e                   	pop    %esi
     e52:	5f                   	pop    %edi
     e53:	5d                   	pop    %ebp
     e54:	c3                   	ret    
    printf("fstests: cannot open sharedfd for writing");
     e55:	83 ec 0c             	sub    $0xc,%esp
     e58:	68 48 4c 00 00       	push   $0x4c48
     e5d:	e8 3e 2b 00 00       	call   39a0 <printf>
    return;
     e62:	83 c4 10             	add    $0x10,%esp
}
     e65:	8d 65 f4             	lea    -0xc(%ebp),%esp
     e68:	5b                   	pop    %ebx
     e69:	5e                   	pop    %esi
     e6a:	5f                   	pop    %edi
     e6b:	5d                   	pop    %ebp
     e6c:	c3                   	ret    
    printf("fstests: cannot open sharedfd for reading\n");
     e6d:	83 ec 0c             	sub    $0xc,%esp
     e70:	68 94 4c 00 00       	push   $0x4c94
     e75:	e8 26 2b 00 00       	call   39a0 <printf>
    return;
     e7a:	83 c4 10             	add    $0x10,%esp
}
     e7d:	8d 65 f4             	lea    -0xc(%ebp),%esp
     e80:	5b                   	pop    %ebx
     e81:	5e                   	pop    %esi
     e82:	5f                   	pop    %edi
     e83:	5d                   	pop    %ebp
     e84:	c3                   	ret    
    exit();
     e85:	e8 79 27 00 00       	call   3603 <exit>
    printf("sharedfd oops %d %d\n", nc, np);
     e8a:	50                   	push   %eax
     e8b:	53                   	push   %ebx
     e8c:	52                   	push   %edx
     e8d:	68 99 3f 00 00       	push   $0x3f99
     e92:	e8 09 2b 00 00       	call   39a0 <printf>
    exit();
     e97:	e8 67 27 00 00       	call   3603 <exit>
     e9c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000ea0 <fourfiles>:
{
     ea0:	55                   	push   %ebp
     ea1:	89 e5                	mov    %esp,%ebp
     ea3:	57                   	push   %edi
     ea4:	56                   	push   %esi
  printf("fourfiles test\n");
     ea5:	be ae 3f 00 00       	mov    $0x3fae,%esi
{
     eaa:	53                   	push   %ebx
  for(pi = 0; pi < 4; pi++){
     eab:	31 db                	xor    %ebx,%ebx
{
     ead:	83 ec 38             	sub    $0x38,%esp
  char *names[] = { "f0", "f1", "f2", "f3" };
     eb0:	c7 45 d8 ae 3f 00 00 	movl   $0x3fae,-0x28(%ebp)
  printf("fourfiles test\n");
     eb7:	68 b4 3f 00 00       	push   $0x3fb4
  char *names[] = { "f0", "f1", "f2", "f3" };
     ebc:	c7 45 dc f7 40 00 00 	movl   $0x40f7,-0x24(%ebp)
     ec3:	c7 45 e0 fb 40 00 00 	movl   $0x40fb,-0x20(%ebp)
     eca:	c7 45 e4 b1 3f 00 00 	movl   $0x3fb1,-0x1c(%ebp)
  printf("fourfiles test\n");
     ed1:	e8 ca 2a 00 00       	call   39a0 <printf>
     ed6:	83 c4 10             	add    $0x10,%esp
    unlink(fname);
     ed9:	83 ec 0c             	sub    $0xc,%esp
     edc:	56                   	push   %esi
     edd:	e8 71 27 00 00       	call   3653 <unlink>
    pid = fork();
     ee2:	e8 14 27 00 00       	call   35fb <fork>
    if(pid < 0){
     ee7:	83 c4 10             	add    $0x10,%esp
     eea:	85 c0                	test   %eax,%eax
     eec:	0f 88 5e 01 00 00    	js     1050 <fourfiles+0x1b0>
    if(pid == 0){
     ef2:	0f 84 e7 00 00 00    	je     fdf <fourfiles+0x13f>
  for(pi = 0; pi < 4; pi++){
     ef8:	83 c3 01             	add    $0x1,%ebx
     efb:	83 fb 04             	cmp    $0x4,%ebx
     efe:	74 06                	je     f06 <fourfiles+0x66>
    fname = names[pi];
     f00:	8b 74 9d d8          	mov    -0x28(%ebp,%ebx,4),%esi
     f04:	eb d3                	jmp    ed9 <fourfiles+0x39>
    wait();
     f06:	e8 00 27 00 00       	call   360b <wait>
  for(i = 0; i < 2; i++){
     f0b:	31 f6                	xor    %esi,%esi
    wait();
     f0d:	e8 f9 26 00 00       	call   360b <wait>
     f12:	e8 f4 26 00 00       	call   360b <wait>
     f17:	e8 ef 26 00 00       	call   360b <wait>
    fname = names[i];
     f1c:	8b 44 b5 d8          	mov    -0x28(%ebp,%esi,4),%eax
    fd = open(fname, 0);
     f20:	83 ec 08             	sub    $0x8,%esp
    total = 0;
     f23:	31 db                	xor    %ebx,%ebx
    fd = open(fname, 0);
     f25:	6a 00                	push   $0x0
     f27:	50                   	push   %eax
    fname = names[i];
     f28:	89 45 d0             	mov    %eax,-0x30(%ebp)
    fd = open(fname, 0);
     f2b:	e8 13 27 00 00       	call   3643 <open>
    while((n = read(fd, buf, sizeof(buf))) > 0){
     f30:	83 c4 10             	add    $0x10,%esp
    fd = open(fname, 0);
     f33:	89 45 d4             	mov    %eax,-0x2c(%ebp)
    while((n = read(fd, buf, sizeof(buf))) > 0){
     f36:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     f3d:	8d 76 00             	lea    0x0(%esi),%esi
     f40:	83 ec 04             	sub    $0x4,%esp
     f43:	68 00 20 00 00       	push   $0x2000
     f48:	68 a0 7a 00 00       	push   $0x7aa0
     f4d:	ff 75 d4             	push   -0x2c(%ebp)
     f50:	e8 c6 26 00 00       	call   361b <read>
     f55:	83 c4 10             	add    $0x10,%esp
     f58:	89 c7                	mov    %eax,%edi
     f5a:	85 c0                	test   %eax,%eax
     f5c:	7e 20                	jle    f7e <fourfiles+0xde>
      for(j = 0; j < n; j++){
     f5e:	31 c0                	xor    %eax,%eax
        if(buf[j] != '0'+i){
     f60:	83 fe 01             	cmp    $0x1,%esi
     f63:	0f be 88 a0 7a 00 00 	movsbl 0x7aa0(%eax),%ecx
     f6a:	19 d2                	sbb    %edx,%edx
     f6c:	83 c2 31             	add    $0x31,%edx
     f6f:	39 d1                	cmp    %edx,%ecx
     f71:	75 5a                	jne    fcd <fourfiles+0x12d>
      for(j = 0; j < n; j++){
     f73:	83 c0 01             	add    $0x1,%eax
     f76:	39 c7                	cmp    %eax,%edi
     f78:	75 e6                	jne    f60 <fourfiles+0xc0>
      total += n;
     f7a:	01 fb                	add    %edi,%ebx
     f7c:	eb c2                	jmp    f40 <fourfiles+0xa0>
    close(fd);
     f7e:	83 ec 0c             	sub    $0xc,%esp
     f81:	ff 75 d4             	push   -0x2c(%ebp)
     f84:	e8 a2 26 00 00       	call   362b <close>
    if(total != 12*500){
     f89:	83 c4 10             	add    $0x10,%esp
     f8c:	81 fb 70 17 00 00    	cmp    $0x1770,%ebx
     f92:	0f 85 ca 00 00 00    	jne    1062 <fourfiles+0x1c2>
    unlink(fname);
     f98:	83 ec 0c             	sub    $0xc,%esp
     f9b:	ff 75 d0             	push   -0x30(%ebp)
     f9e:	e8 b0 26 00 00       	call   3653 <unlink>
  for(i = 0; i < 2; i++){
     fa3:	83 c4 10             	add    $0x10,%esp
     fa6:	83 fe 01             	cmp    $0x1,%esi
     fa9:	75 18                	jne    fc3 <fourfiles+0x123>
  printf("fourfiles ok\n");
     fab:	83 ec 0c             	sub    $0xc,%esp
     fae:	68 f2 3f 00 00       	push   $0x3ff2
     fb3:	e8 e8 29 00 00       	call   39a0 <printf>
}
     fb8:	83 c4 10             	add    $0x10,%esp
     fbb:	8d 65 f4             	lea    -0xc(%ebp),%esp
     fbe:	5b                   	pop    %ebx
     fbf:	5e                   	pop    %esi
     fc0:	5f                   	pop    %edi
     fc1:	5d                   	pop    %ebp
     fc2:	c3                   	ret    
     fc3:	be 01 00 00 00       	mov    $0x1,%esi
     fc8:	e9 4f ff ff ff       	jmp    f1c <fourfiles+0x7c>
          printf("wrong char\n");
     fcd:	83 ec 0c             	sub    $0xc,%esp
     fd0:	68 d5 3f 00 00       	push   $0x3fd5
     fd5:	e8 c6 29 00 00       	call   39a0 <printf>
          exit();
     fda:	e8 24 26 00 00       	call   3603 <exit>
      fd = open(fname, O_CREATE | O_RDWR);
     fdf:	83 ec 08             	sub    $0x8,%esp
     fe2:	68 02 02 00 00       	push   $0x202
     fe7:	56                   	push   %esi
     fe8:	e8 56 26 00 00       	call   3643 <open>
      if(fd < 0){
     fed:	83 c4 10             	add    $0x10,%esp
      fd = open(fname, O_CREATE | O_RDWR);
     ff0:	89 c6                	mov    %eax,%esi
      if(fd < 0){
     ff2:	85 c0                	test   %eax,%eax
     ff4:	78 45                	js     103b <fourfiles+0x19b>
      memset(buf, '0'+pi, 512);
     ff6:	83 ec 04             	sub    $0x4,%esp
     ff9:	83 c3 30             	add    $0x30,%ebx
     ffc:	68 00 02 00 00       	push   $0x200
    1001:	53                   	push   %ebx
    1002:	bb 0c 00 00 00       	mov    $0xc,%ebx
    1007:	68 a0 7a 00 00       	push   $0x7aa0
    100c:	e8 5f 24 00 00       	call   3470 <memset>
    1011:	83 c4 10             	add    $0x10,%esp
        if((n = write(fd, buf, 500)) != 500){
    1014:	83 ec 04             	sub    $0x4,%esp
    1017:	68 f4 01 00 00       	push   $0x1f4
    101c:	68 a0 7a 00 00       	push   $0x7aa0
    1021:	56                   	push   %esi
    1022:	e8 fc 25 00 00       	call   3623 <write>
    1027:	83 c4 10             	add    $0x10,%esp
    102a:	3d f4 01 00 00       	cmp    $0x1f4,%eax
    102f:	75 43                	jne    1074 <fourfiles+0x1d4>
      for(i = 0; i < 12; i++){
    1031:	83 eb 01             	sub    $0x1,%ebx
    1034:	75 de                	jne    1014 <fourfiles+0x174>
      exit();
    1036:	e8 c8 25 00 00       	call   3603 <exit>
        printf("create failed\n");
    103b:	83 ec 0c             	sub    $0xc,%esp
    103e:	68 4f 42 00 00       	push   $0x424f
    1043:	e8 58 29 00 00       	call   39a0 <printf>
        exit();
    1048:	e8 b6 25 00 00       	call   3603 <exit>
    104d:	8d 76 00             	lea    0x0(%esi),%esi
      printf("fork failed\n");
    1050:	83 ec 0c             	sub    $0xc,%esp
    1053:	68 89 4a 00 00       	push   $0x4a89
    1058:	e8 43 29 00 00       	call   39a0 <printf>
      exit();
    105d:	e8 a1 25 00 00       	call   3603 <exit>
      printf("wrong length %d\n", total);
    1062:	50                   	push   %eax
    1063:	50                   	push   %eax
    1064:	53                   	push   %ebx
    1065:	68 e1 3f 00 00       	push   $0x3fe1
    106a:	e8 31 29 00 00       	call   39a0 <printf>
      exit();
    106f:	e8 8f 25 00 00       	call   3603 <exit>
          printf("write failed %d\n", n);
    1074:	52                   	push   %edx
    1075:	52                   	push   %edx
    1076:	50                   	push   %eax
    1077:	68 c4 3f 00 00       	push   $0x3fc4
    107c:	e8 1f 29 00 00       	call   39a0 <printf>
          exit();
    1081:	e8 7d 25 00 00       	call   3603 <exit>
    1086:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    108d:	8d 76 00             	lea    0x0(%esi),%esi

00001090 <createdelete>:
{
    1090:	55                   	push   %ebp
    1091:	89 e5                	mov    %esp,%ebp
    1093:	57                   	push   %edi
    1094:	56                   	push   %esi
    1095:	53                   	push   %ebx
  for(pi = 0; pi < 4; pi++){
    1096:	31 db                	xor    %ebx,%ebx
{
    1098:	83 ec 48             	sub    $0x48,%esp
  printf("createdelete test\n");
    109b:	68 00 40 00 00       	push   $0x4000
    10a0:	e8 fb 28 00 00       	call   39a0 <printf>
    10a5:	83 c4 10             	add    $0x10,%esp
    pid = fork();
    10a8:	e8 4e 25 00 00       	call   35fb <fork>
    if(pid < 0){
    10ad:	85 c0                	test   %eax,%eax
    10af:	0f 88 b3 01 00 00    	js     1268 <createdelete+0x1d8>
    if(pid == 0){
    10b5:	0f 84 05 01 00 00    	je     11c0 <createdelete+0x130>
  for(pi = 0; pi < 4; pi++){
    10bb:	83 c3 01             	add    $0x1,%ebx
    10be:	83 fb 04             	cmp    $0x4,%ebx
    10c1:	75 e5                	jne    10a8 <createdelete+0x18>
    wait();
    10c3:	e8 43 25 00 00       	call   360b <wait>
  for(i = 0; i < N; i++){
    10c8:	31 f6                	xor    %esi,%esi
    10ca:	8d 7d c8             	lea    -0x38(%ebp),%edi
    wait();
    10cd:	e8 39 25 00 00       	call   360b <wait>
    10d2:	e8 34 25 00 00       	call   360b <wait>
    10d7:	e8 2f 25 00 00       	call   360b <wait>
  name[0] = name[1] = name[2] = 0;
    10dc:	c6 45 ca 00          	movb   $0x0,-0x36(%ebp)
      if((i == 0 || i >= N/2) && fd < 0){
    10e0:	85 f6                	test   %esi,%esi
    10e2:	8d 46 30             	lea    0x30(%esi),%eax
    10e5:	0f 94 c3             	sete   %bl
    10e8:	83 fe 09             	cmp    $0x9,%esi
    10eb:	88 45 c7             	mov    %al,-0x39(%ebp)
    10ee:	0f 9f c0             	setg   %al
    10f1:	09 c3                	or     %eax,%ebx
      } else if((i >= 1 && i < N/2) && fd >= 0){
    10f3:	8d 46 ff             	lea    -0x1(%esi),%eax
    10f6:	89 45 c0             	mov    %eax,-0x40(%ebp)
      if((i == 0 || i >= N/2) && fd < 0){
    10f9:	88 5d c6             	mov    %bl,-0x3a(%ebp)
    10fc:	bb 70 00 00 00       	mov    $0x70,%ebx
      fd = open(name, 0);
    1101:	83 ec 08             	sub    $0x8,%esp
      name[1] = '0' + i;
    1104:	0f b6 45 c7          	movzbl -0x39(%ebp),%eax
      name[0] = 'p' + pi;
    1108:	88 5d c8             	mov    %bl,-0x38(%ebp)
      fd = open(name, 0);
    110b:	6a 00                	push   $0x0
    110d:	57                   	push   %edi
      name[1] = '0' + i;
    110e:	88 45 c9             	mov    %al,-0x37(%ebp)
      fd = open(name, 0);
    1111:	e8 2d 25 00 00       	call   3643 <open>
      if((i == 0 || i >= N/2) && fd < 0){
    1116:	83 c4 10             	add    $0x10,%esp
    1119:	80 7d c6 00          	cmpb   $0x0,-0x3a(%ebp)
    111d:	0f 84 7d 00 00 00    	je     11a0 <createdelete+0x110>
    1123:	85 c0                	test   %eax,%eax
    1125:	0f 88 2a 01 00 00    	js     1255 <createdelete+0x1c5>
      } else if((i >= 1 && i < N/2) && fd >= 0){
    112b:	83 7d c0 08          	cmpl   $0x8,-0x40(%ebp)
    112f:	76 73                	jbe    11a4 <createdelete+0x114>
        close(fd);
    1131:	83 ec 0c             	sub    $0xc,%esp
    1134:	50                   	push   %eax
    1135:	e8 f1 24 00 00       	call   362b <close>
    113a:	83 c4 10             	add    $0x10,%esp
    for(pi = 0; pi < 4; pi++){
    113d:	83 c3 01             	add    $0x1,%ebx
    1140:	80 fb 74             	cmp    $0x74,%bl
    1143:	75 bc                	jne    1101 <createdelete+0x71>
  for(i = 0; i < N; i++){
    1145:	83 c6 01             	add    $0x1,%esi
    1148:	83 fe 14             	cmp    $0x14,%esi
    114b:	75 93                	jne    10e0 <createdelete+0x50>
    114d:	be 70 00 00 00       	mov    $0x70,%esi
    1152:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    for(pi = 0; pi < 4; pi++){
    1158:	8d 46 c0             	lea    -0x40(%esi),%eax
      name[0] = 'p' + i;
    115b:	bb 04 00 00 00       	mov    $0x4,%ebx
    1160:	88 45 c7             	mov    %al,-0x39(%ebp)
      unlink(name);
    1163:	83 ec 0c             	sub    $0xc,%esp
      name[0] = 'p' + i;
    1166:	89 f0                	mov    %esi,%eax
      unlink(name);
    1168:	57                   	push   %edi
      name[0] = 'p' + i;
    1169:	88 45 c8             	mov    %al,-0x38(%ebp)
      name[1] = '0' + i;
    116c:	0f b6 45 c7          	movzbl -0x39(%ebp),%eax
    1170:	88 45 c9             	mov    %al,-0x37(%ebp)
      unlink(name);
    1173:	e8 db 24 00 00       	call   3653 <unlink>
    for(pi = 0; pi < 4; pi++){
    1178:	83 c4 10             	add    $0x10,%esp
    117b:	83 eb 01             	sub    $0x1,%ebx
    117e:	75 e3                	jne    1163 <createdelete+0xd3>
  for(i = 0; i < N; i++){
    1180:	83 c6 01             	add    $0x1,%esi
    1183:	89 f0                	mov    %esi,%eax
    1185:	3c 84                	cmp    $0x84,%al
    1187:	75 cf                	jne    1158 <createdelete+0xc8>
  printf("createdelete ok\n");
    1189:	83 ec 0c             	sub    $0xc,%esp
    118c:	68 13 40 00 00       	push   $0x4013
    1191:	e8 0a 28 00 00       	call   39a0 <printf>
}
    1196:	8d 65 f4             	lea    -0xc(%ebp),%esp
    1199:	5b                   	pop    %ebx
    119a:	5e                   	pop    %esi
    119b:	5f                   	pop    %edi
    119c:	5d                   	pop    %ebp
    119d:	c3                   	ret    
    119e:	66 90                	xchg   %ax,%ax
      } else if((i >= 1 && i < N/2) && fd >= 0){
    11a0:	85 c0                	test   %eax,%eax
    11a2:	78 99                	js     113d <createdelete+0xad>
        printf("oops createdelete %s did exist\n", name);
    11a4:	50                   	push   %eax
    11a5:	50                   	push   %eax
    11a6:	57                   	push   %edi
    11a7:	68 e4 4c 00 00       	push   $0x4ce4
    11ac:	e8 ef 27 00 00       	call   39a0 <printf>
        exit();
    11b1:	e8 4d 24 00 00       	call   3603 <exit>
    11b6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    11bd:	8d 76 00             	lea    0x0(%esi),%esi
      name[0] = 'p' + pi;
    11c0:	83 c3 70             	add    $0x70,%ebx
      name[2] = '\0';
    11c3:	c6 45 ca 00          	movb   $0x0,-0x36(%ebp)
    11c7:	be 01 00 00 00       	mov    $0x1,%esi
    11cc:	8d 7d c8             	lea    -0x38(%ebp),%edi
      name[0] = 'p' + pi;
    11cf:	88 5d c8             	mov    %bl,-0x38(%ebp)
      name[2] = '\0';
    11d2:	31 db                	xor    %ebx,%ebx
    11d4:	eb 15                	jmp    11eb <createdelete+0x15b>
    11d6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    11dd:	8d 76 00             	lea    0x0(%esi),%esi
      for(i = 0; i < N; i++){
    11e0:	83 fe 14             	cmp    $0x14,%esi
    11e3:	74 6b                	je     1250 <createdelete+0x1c0>
    11e5:	83 c3 01             	add    $0x1,%ebx
    11e8:	83 c6 01             	add    $0x1,%esi
        fd = open(name, O_CREATE | O_RDWR);
    11eb:	83 ec 08             	sub    $0x8,%esp
        name[1] = '0' + i;
    11ee:	8d 43 30             	lea    0x30(%ebx),%eax
        fd = open(name, O_CREATE | O_RDWR);
    11f1:	68 02 02 00 00       	push   $0x202
    11f6:	57                   	push   %edi
        name[1] = '0' + i;
    11f7:	88 45 c9             	mov    %al,-0x37(%ebp)
        fd = open(name, O_CREATE | O_RDWR);
    11fa:	e8 44 24 00 00       	call   3643 <open>
        if(fd < 0){
    11ff:	83 c4 10             	add    $0x10,%esp
    1202:	85 c0                	test   %eax,%eax
    1204:	78 74                	js     127a <createdelete+0x1ea>
        close(fd);
    1206:	83 ec 0c             	sub    $0xc,%esp
    1209:	50                   	push   %eax
    120a:	e8 1c 24 00 00       	call   362b <close>
        if(i > 0 && (i % 2 ) == 0){
    120f:	83 c4 10             	add    $0x10,%esp
    1212:	85 db                	test   %ebx,%ebx
    1214:	74 cf                	je     11e5 <createdelete+0x155>
    1216:	f6 c3 01             	test   $0x1,%bl
    1219:	75 c5                	jne    11e0 <createdelete+0x150>
          if(unlink(name) < 0){
    121b:	83 ec 0c             	sub    $0xc,%esp
          name[1] = '0' + (i / 2);
    121e:	89 d8                	mov    %ebx,%eax
          if(unlink(name) < 0){
    1220:	57                   	push   %edi
          name[1] = '0' + (i / 2);
    1221:	d1 f8                	sar    %eax
    1223:	83 c0 30             	add    $0x30,%eax
    1226:	88 45 c9             	mov    %al,-0x37(%ebp)
          if(unlink(name) < 0){
    1229:	e8 25 24 00 00       	call   3653 <unlink>
    122e:	83 c4 10             	add    $0x10,%esp
    1231:	85 c0                	test   %eax,%eax
    1233:	79 ab                	jns    11e0 <createdelete+0x150>
            printf("unlink failed\n");
    1235:	83 ec 0c             	sub    $0xc,%esp
    1238:	68 01 3c 00 00       	push   $0x3c01
    123d:	e8 5e 27 00 00       	call   39a0 <printf>
            exit();
    1242:	e8 bc 23 00 00       	call   3603 <exit>
    1247:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    124e:	66 90                	xchg   %ax,%ax
      exit();
    1250:	e8 ae 23 00 00       	call   3603 <exit>
        printf("oops createdelete %s didn't exist\n", name);
    1255:	83 ec 08             	sub    $0x8,%esp
    1258:	57                   	push   %edi
    1259:	68 c0 4c 00 00       	push   $0x4cc0
    125e:	e8 3d 27 00 00       	call   39a0 <printf>
        exit();
    1263:	e8 9b 23 00 00       	call   3603 <exit>
      printf("fork failed\n");
    1268:	83 ec 0c             	sub    $0xc,%esp
    126b:	68 89 4a 00 00       	push   $0x4a89
    1270:	e8 2b 27 00 00       	call   39a0 <printf>
      exit();
    1275:	e8 89 23 00 00       	call   3603 <exit>
          printf("create failed\n");
    127a:	83 ec 0c             	sub    $0xc,%esp
    127d:	68 4f 42 00 00       	push   $0x424f
    1282:	e8 19 27 00 00       	call   39a0 <printf>
          exit();
    1287:	e8 77 23 00 00       	call   3603 <exit>
    128c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00001290 <unlinkread>:
{
    1290:	55                   	push   %ebp
    1291:	89 e5                	mov    %esp,%ebp
    1293:	56                   	push   %esi
    1294:	53                   	push   %ebx
  printf("unlinkread test\n");
    1295:	83 ec 0c             	sub    $0xc,%esp
    1298:	68 24 40 00 00       	push   $0x4024
    129d:	e8 fe 26 00 00       	call   39a0 <printf>
  fd = open("unlinkread", O_CREATE | O_RDWR);
    12a2:	59                   	pop    %ecx
    12a3:	5b                   	pop    %ebx
    12a4:	68 02 02 00 00       	push   $0x202
    12a9:	68 35 40 00 00       	push   $0x4035
    12ae:	e8 90 23 00 00       	call   3643 <open>
  if(fd < 0){
    12b3:	83 c4 10             	add    $0x10,%esp
    12b6:	85 c0                	test   %eax,%eax
    12b8:	0f 88 e4 00 00 00    	js     13a2 <unlinkread+0x112>
  write(fd, "hello", 5);
    12be:	83 ec 04             	sub    $0x4,%esp
    12c1:	89 c3                	mov    %eax,%ebx
    12c3:	6a 05                	push   $0x5
    12c5:	68 5a 40 00 00       	push   $0x405a
    12ca:	50                   	push   %eax
    12cb:	e8 53 23 00 00       	call   3623 <write>
  close(fd);
    12d0:	89 1c 24             	mov    %ebx,(%esp)
    12d3:	e8 53 23 00 00       	call   362b <close>
  fd = open("unlinkread", O_RDWR);
    12d8:	58                   	pop    %eax
    12d9:	5a                   	pop    %edx
    12da:	6a 02                	push   $0x2
    12dc:	68 35 40 00 00       	push   $0x4035
    12e1:	e8 5d 23 00 00       	call   3643 <open>
  if(fd < 0){
    12e6:	83 c4 10             	add    $0x10,%esp
  fd = open("unlinkread", O_RDWR);
    12e9:	89 c3                	mov    %eax,%ebx
  if(fd < 0){
    12eb:	85 c0                	test   %eax,%eax
    12ed:	0f 88 09 01 00 00    	js     13fc <unlinkread+0x16c>
  if(unlink("unlinkread") != 0){
    12f3:	83 ec 0c             	sub    $0xc,%esp
    12f6:	68 35 40 00 00       	push   $0x4035
    12fb:	e8 53 23 00 00       	call   3653 <unlink>
    1300:	83 c4 10             	add    $0x10,%esp
    1303:	85 c0                	test   %eax,%eax
    1305:	0f 85 df 00 00 00    	jne    13ea <unlinkread+0x15a>
  fd1 = open("unlinkread", O_CREATE | O_RDWR);
    130b:	83 ec 08             	sub    $0x8,%esp
    130e:	68 02 02 00 00       	push   $0x202
    1313:	68 35 40 00 00       	push   $0x4035
    1318:	e8 26 23 00 00       	call   3643 <open>
  write(fd1, "yyy", 3);
    131d:	83 c4 0c             	add    $0xc,%esp
    1320:	6a 03                	push   $0x3
  fd1 = open("unlinkread", O_CREATE | O_RDWR);
    1322:	89 c6                	mov    %eax,%esi
  write(fd1, "yyy", 3);
    1324:	68 92 40 00 00       	push   $0x4092
    1329:	50                   	push   %eax
    132a:	e8 f4 22 00 00       	call   3623 <write>
  close(fd1);
    132f:	89 34 24             	mov    %esi,(%esp)
    1332:	e8 f4 22 00 00       	call   362b <close>
  if(read(fd, buf, sizeof(buf)) != 5){
    1337:	83 c4 0c             	add    $0xc,%esp
    133a:	68 00 20 00 00       	push   $0x2000
    133f:	68 a0 7a 00 00       	push   $0x7aa0
    1344:	53                   	push   %ebx
    1345:	e8 d1 22 00 00       	call   361b <read>
    134a:	83 c4 10             	add    $0x10,%esp
    134d:	83 f8 05             	cmp    $0x5,%eax
    1350:	0f 85 82 00 00 00    	jne    13d8 <unlinkread+0x148>
  if(buf[0] != 'h'){
    1356:	80 3d a0 7a 00 00 68 	cmpb   $0x68,0x7aa0
    135d:	75 67                	jne    13c6 <unlinkread+0x136>
  if(write(fd, buf, 10) != 10){
    135f:	83 ec 04             	sub    $0x4,%esp
    1362:	6a 0a                	push   $0xa
    1364:	68 a0 7a 00 00       	push   $0x7aa0
    1369:	53                   	push   %ebx
    136a:	e8 b4 22 00 00       	call   3623 <write>
    136f:	83 c4 10             	add    $0x10,%esp
    1372:	83 f8 0a             	cmp    $0xa,%eax
    1375:	75 3d                	jne    13b4 <unlinkread+0x124>
  close(fd);
    1377:	83 ec 0c             	sub    $0xc,%esp
    137a:	53                   	push   %ebx
    137b:	e8 ab 22 00 00       	call   362b <close>
  unlink("unlinkread");
    1380:	c7 04 24 35 40 00 00 	movl   $0x4035,(%esp)
    1387:	e8 c7 22 00 00       	call   3653 <unlink>
  printf("unlinkread ok\n");
    138c:	c7 04 24 dd 40 00 00 	movl   $0x40dd,(%esp)
    1393:	e8 08 26 00 00       	call   39a0 <printf>
}
    1398:	83 c4 10             	add    $0x10,%esp
    139b:	8d 65 f8             	lea    -0x8(%ebp),%esp
    139e:	5b                   	pop    %ebx
    139f:	5e                   	pop    %esi
    13a0:	5d                   	pop    %ebp
    13a1:	c3                   	ret    
    printf("create unlinkread failed\n");
    13a2:	83 ec 0c             	sub    $0xc,%esp
    13a5:	68 40 40 00 00       	push   $0x4040
    13aa:	e8 f1 25 00 00       	call   39a0 <printf>
    exit();
    13af:	e8 4f 22 00 00       	call   3603 <exit>
    printf("unlinkread write failed\n");
    13b4:	83 ec 0c             	sub    $0xc,%esp
    13b7:	68 c4 40 00 00       	push   $0x40c4
    13bc:	e8 df 25 00 00       	call   39a0 <printf>
    exit();
    13c1:	e8 3d 22 00 00       	call   3603 <exit>
    printf("unlinkread wrong data\n");
    13c6:	83 ec 0c             	sub    $0xc,%esp
    13c9:	68 ad 40 00 00       	push   $0x40ad
    13ce:	e8 cd 25 00 00       	call   39a0 <printf>
    exit();
    13d3:	e8 2b 22 00 00       	call   3603 <exit>
    printf("unlinkread read failed");
    13d8:	83 ec 0c             	sub    $0xc,%esp
    13db:	68 96 40 00 00       	push   $0x4096
    13e0:	e8 bb 25 00 00       	call   39a0 <printf>
    exit();
    13e5:	e8 19 22 00 00       	call   3603 <exit>
    printf("unlink unlinkread failed\n");
    13ea:	83 ec 0c             	sub    $0xc,%esp
    13ed:	68 78 40 00 00       	push   $0x4078
    13f2:	e8 a9 25 00 00       	call   39a0 <printf>
    exit();
    13f7:	e8 07 22 00 00       	call   3603 <exit>
    printf("open unlinkread failed\n");
    13fc:	83 ec 0c             	sub    $0xc,%esp
    13ff:	68 60 40 00 00       	push   $0x4060
    1404:	e8 97 25 00 00       	call   39a0 <printf>
    exit();
    1409:	e8 f5 21 00 00       	call   3603 <exit>
    140e:	66 90                	xchg   %ax,%ax

00001410 <linktest>:
{
    1410:	55                   	push   %ebp
    1411:	89 e5                	mov    %esp,%ebp
    1413:	53                   	push   %ebx
    1414:	83 ec 10             	sub    $0x10,%esp
  printf("linktest\n");
    1417:	68 ec 40 00 00       	push   $0x40ec
    141c:	e8 7f 25 00 00       	call   39a0 <printf>
  unlink("lf1");
    1421:	c7 04 24 f6 40 00 00 	movl   $0x40f6,(%esp)
    1428:	e8 26 22 00 00       	call   3653 <unlink>
  unlink("lf2");
    142d:	c7 04 24 fa 40 00 00 	movl   $0x40fa,(%esp)
    1434:	e8 1a 22 00 00       	call   3653 <unlink>
  fd = open("lf1", O_CREATE|O_RDWR);
    1439:	58                   	pop    %eax
    143a:	5a                   	pop    %edx
    143b:	68 02 02 00 00       	push   $0x202
    1440:	68 f6 40 00 00       	push   $0x40f6
    1445:	e8 f9 21 00 00       	call   3643 <open>
  if(fd < 0){
    144a:	83 c4 10             	add    $0x10,%esp
    144d:	85 c0                	test   %eax,%eax
    144f:	0f 88 1c 01 00 00    	js     1571 <linktest+0x161>
  if(write(fd, "hello", 5) != 5){
    1455:	83 ec 04             	sub    $0x4,%esp
    1458:	89 c3                	mov    %eax,%ebx
    145a:	6a 05                	push   $0x5
    145c:	68 5a 40 00 00       	push   $0x405a
    1461:	50                   	push   %eax
    1462:	e8 bc 21 00 00       	call   3623 <write>
    1467:	83 c4 10             	add    $0x10,%esp
    146a:	83 f8 05             	cmp    $0x5,%eax
    146d:	0f 85 8e 01 00 00    	jne    1601 <linktest+0x1f1>
  close(fd);
    1473:	83 ec 0c             	sub    $0xc,%esp
    1476:	53                   	push   %ebx
    1477:	e8 af 21 00 00       	call   362b <close>
  if(link("lf1", "lf2") < 0){
    147c:	59                   	pop    %ecx
    147d:	5b                   	pop    %ebx
    147e:	68 fa 40 00 00       	push   $0x40fa
    1483:	68 f6 40 00 00       	push   $0x40f6
    1488:	e8 d6 21 00 00       	call   3663 <link>
    148d:	83 c4 10             	add    $0x10,%esp
    1490:	85 c0                	test   %eax,%eax
    1492:	0f 88 57 01 00 00    	js     15ef <linktest+0x1df>
  unlink("lf1");
    1498:	83 ec 0c             	sub    $0xc,%esp
    149b:	68 f6 40 00 00       	push   $0x40f6
    14a0:	e8 ae 21 00 00       	call   3653 <unlink>
  if(open("lf1", 0) >= 0){
    14a5:	58                   	pop    %eax
    14a6:	5a                   	pop    %edx
    14a7:	6a 00                	push   $0x0
    14a9:	68 f6 40 00 00       	push   $0x40f6
    14ae:	e8 90 21 00 00       	call   3643 <open>
    14b3:	83 c4 10             	add    $0x10,%esp
    14b6:	85 c0                	test   %eax,%eax
    14b8:	0f 89 1f 01 00 00    	jns    15dd <linktest+0x1cd>
  fd = open("lf2", 0);
    14be:	83 ec 08             	sub    $0x8,%esp
    14c1:	6a 00                	push   $0x0
    14c3:	68 fa 40 00 00       	push   $0x40fa
    14c8:	e8 76 21 00 00       	call   3643 <open>
  if(fd < 0){
    14cd:	83 c4 10             	add    $0x10,%esp
  fd = open("lf2", 0);
    14d0:	89 c3                	mov    %eax,%ebx
  if(fd < 0){
    14d2:	85 c0                	test   %eax,%eax
    14d4:	0f 88 f1 00 00 00    	js     15cb <linktest+0x1bb>
  if(read(fd, buf, sizeof(buf)) != 5){
    14da:	83 ec 04             	sub    $0x4,%esp
    14dd:	68 00 20 00 00       	push   $0x2000
    14e2:	68 a0 7a 00 00       	push   $0x7aa0
    14e7:	50                   	push   %eax
    14e8:	e8 2e 21 00 00       	call   361b <read>
    14ed:	83 c4 10             	add    $0x10,%esp
    14f0:	83 f8 05             	cmp    $0x5,%eax
    14f3:	0f 85 c0 00 00 00    	jne    15b9 <linktest+0x1a9>
  close(fd);
    14f9:	83 ec 0c             	sub    $0xc,%esp
    14fc:	53                   	push   %ebx
    14fd:	e8 29 21 00 00       	call   362b <close>
  if(link("lf2", "lf2") >= 0){
    1502:	59                   	pop    %ecx
    1503:	5b                   	pop    %ebx
    1504:	68 fa 40 00 00       	push   $0x40fa
    1509:	68 fa 40 00 00       	push   $0x40fa
    150e:	e8 50 21 00 00       	call   3663 <link>
    1513:	83 c4 10             	add    $0x10,%esp
    1516:	85 c0                	test   %eax,%eax
    1518:	0f 89 89 00 00 00    	jns    15a7 <linktest+0x197>
  unlink("lf2");
    151e:	83 ec 0c             	sub    $0xc,%esp
    1521:	68 fa 40 00 00       	push   $0x40fa
    1526:	e8 28 21 00 00       	call   3653 <unlink>
  if(link("lf2", "lf1") >= 0){
    152b:	58                   	pop    %eax
    152c:	5a                   	pop    %edx
    152d:	68 f6 40 00 00       	push   $0x40f6
    1532:	68 fa 40 00 00       	push   $0x40fa
    1537:	e8 27 21 00 00       	call   3663 <link>
    153c:	83 c4 10             	add    $0x10,%esp
    153f:	85 c0                	test   %eax,%eax
    1541:	79 52                	jns    1595 <linktest+0x185>
  if(link(".", "lf1") >= 0){
    1543:	83 ec 08             	sub    $0x8,%esp
    1546:	68 f6 40 00 00       	push   $0x40f6
    154b:	68 be 43 00 00       	push   $0x43be
    1550:	e8 0e 21 00 00       	call   3663 <link>
    1555:	83 c4 10             	add    $0x10,%esp
    1558:	85 c0                	test   %eax,%eax
    155a:	79 27                	jns    1583 <linktest+0x173>
  printf("linktest ok\n");
    155c:	83 ec 0c             	sub    $0xc,%esp
    155f:	68 94 41 00 00       	push   $0x4194
    1564:	e8 37 24 00 00       	call   39a0 <printf>
}
    1569:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    156c:	83 c4 10             	add    $0x10,%esp
    156f:	c9                   	leave  
    1570:	c3                   	ret    
    printf("create lf1 failed\n");
    1571:	83 ec 0c             	sub    $0xc,%esp
    1574:	68 fe 40 00 00       	push   $0x40fe
    1579:	e8 22 24 00 00       	call   39a0 <printf>
    exit();
    157e:	e8 80 20 00 00       	call   3603 <exit>
    printf("link . lf1 succeeded! oops\n");
    1583:	83 ec 0c             	sub    $0xc,%esp
    1586:	68 78 41 00 00       	push   $0x4178
    158b:	e8 10 24 00 00       	call   39a0 <printf>
    exit();
    1590:	e8 6e 20 00 00       	call   3603 <exit>
    printf("link non-existant succeeded! oops\n");
    1595:	83 ec 0c             	sub    $0xc,%esp
    1598:	68 2c 4d 00 00       	push   $0x4d2c
    159d:	e8 fe 23 00 00       	call   39a0 <printf>
    exit();
    15a2:	e8 5c 20 00 00       	call   3603 <exit>
    printf("link lf2 lf2 succeeded! oops\n");
    15a7:	83 ec 0c             	sub    $0xc,%esp
    15aa:	68 5a 41 00 00       	push   $0x415a
    15af:	e8 ec 23 00 00       	call   39a0 <printf>
    exit();
    15b4:	e8 4a 20 00 00       	call   3603 <exit>
    printf("read lf2 failed\n");
    15b9:	83 ec 0c             	sub    $0xc,%esp
    15bc:	68 49 41 00 00       	push   $0x4149
    15c1:	e8 da 23 00 00       	call   39a0 <printf>
    exit();
    15c6:	e8 38 20 00 00       	call   3603 <exit>
    printf("open lf2 failed\n");
    15cb:	83 ec 0c             	sub    $0xc,%esp
    15ce:	68 38 41 00 00       	push   $0x4138
    15d3:	e8 c8 23 00 00       	call   39a0 <printf>
    exit();
    15d8:	e8 26 20 00 00       	call   3603 <exit>
    printf("unlinked lf1 but it is still there!\n");
    15dd:	83 ec 0c             	sub    $0xc,%esp
    15e0:	68 04 4d 00 00       	push   $0x4d04
    15e5:	e8 b6 23 00 00       	call   39a0 <printf>
    exit();
    15ea:	e8 14 20 00 00       	call   3603 <exit>
    printf("link lf1 lf2 failed\n");
    15ef:	83 ec 0c             	sub    $0xc,%esp
    15f2:	68 23 41 00 00       	push   $0x4123
    15f7:	e8 a4 23 00 00       	call   39a0 <printf>
    exit();
    15fc:	e8 02 20 00 00       	call   3603 <exit>
    printf("write lf1 failed\n");
    1601:	83 ec 0c             	sub    $0xc,%esp
    1604:	68 11 41 00 00       	push   $0x4111
    1609:	e8 92 23 00 00       	call   39a0 <printf>
    exit();
    160e:	e8 f0 1f 00 00       	call   3603 <exit>
    1613:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    161a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00001620 <concreate>:
{
    1620:	55                   	push   %ebp
    1621:	89 e5                	mov    %esp,%ebp
    1623:	57                   	push   %edi
    1624:	56                   	push   %esi
  for(i = 0; i < 40; i++){
    1625:	31 f6                	xor    %esi,%esi
{
    1627:	53                   	push   %ebx
    1628:	8d 5d ad             	lea    -0x53(%ebp),%ebx
    162b:	83 ec 68             	sub    $0x68,%esp
  printf("concreate test\n");
    162e:	68 a1 41 00 00       	push   $0x41a1
    1633:	e8 68 23 00 00       	call   39a0 <printf>
  file[0] = 'C';
    1638:	c6 45 ad 43          	movb   $0x43,-0x53(%ebp)
  file[2] = '\0';
    163c:	83 c4 10             	add    $0x10,%esp
    163f:	c6 45 af 00          	movb   $0x0,-0x51(%ebp)
  for(i = 0; i < 40; i++){
    1643:	eb 46                	jmp    168b <concreate+0x6b>
    1645:	8d 76 00             	lea    0x0(%esi),%esi
    1648:	69 c6 ab aa aa aa    	imul   $0xaaaaaaab,%esi,%eax
    if(pid && (i % 3) == 1){
    164e:	3d ab aa aa aa       	cmp    $0xaaaaaaab,%eax
    1653:	0f 83 a7 00 00 00    	jae    1700 <concreate+0xe0>
      fd = open(file, O_CREATE | O_RDWR);
    1659:	83 ec 08             	sub    $0x8,%esp
    165c:	68 02 02 00 00       	push   $0x202
    1661:	53                   	push   %ebx
    1662:	e8 dc 1f 00 00       	call   3643 <open>
      if(fd < 0){
    1667:	83 c4 10             	add    $0x10,%esp
    166a:	85 c0                	test   %eax,%eax
    166c:	78 5f                	js     16cd <concreate+0xad>
      close(fd);
    166e:	83 ec 0c             	sub    $0xc,%esp
  for(i = 0; i < 40; i++){
    1671:	83 c6 01             	add    $0x1,%esi
      close(fd);
    1674:	50                   	push   %eax
    1675:	e8 b1 1f 00 00       	call   362b <close>
    167a:	83 c4 10             	add    $0x10,%esp
      wait();
    167d:	e8 89 1f 00 00       	call   360b <wait>
  for(i = 0; i < 40; i++){
    1682:	83 fe 28             	cmp    $0x28,%esi
    1685:	0f 84 97 00 00 00    	je     1722 <concreate+0x102>
    unlink(file);
    168b:	83 ec 0c             	sub    $0xc,%esp
    file[1] = '0' + i;
    168e:	8d 46 30             	lea    0x30(%esi),%eax
    unlink(file);
    1691:	53                   	push   %ebx
    file[1] = '0' + i;
    1692:	88 45 ae             	mov    %al,-0x52(%ebp)
    unlink(file);
    1695:	e8 b9 1f 00 00       	call   3653 <unlink>
    pid = fork();
    169a:	e8 5c 1f 00 00       	call   35fb <fork>
    if(pid && (i % 3) == 1){
    169f:	83 c4 10             	add    $0x10,%esp
    16a2:	85 c0                	test   %eax,%eax
    16a4:	75 a2                	jne    1648 <concreate+0x28>
      link("C0", file);
    16a6:	69 f6 cd cc cc cc    	imul   $0xcccccccd,%esi,%esi
    } else if(pid == 0 && (i % 5) == 1){
    16ac:	81 fe cd cc cc cc    	cmp    $0xcccccccd,%esi
    16b2:	73 2c                	jae    16e0 <concreate+0xc0>
      fd = open(file, O_CREATE | O_RDWR);
    16b4:	83 ec 08             	sub    $0x8,%esp
    16b7:	68 02 02 00 00       	push   $0x202
    16bc:	53                   	push   %ebx
    16bd:	e8 81 1f 00 00       	call   3643 <open>
      if(fd < 0){
    16c2:	83 c4 10             	add    $0x10,%esp
    16c5:	85 c0                	test   %eax,%eax
    16c7:	0f 89 28 02 00 00    	jns    18f5 <concreate+0x2d5>
        printf("concreate create %s failed\n", file);
    16cd:	83 ec 08             	sub    $0x8,%esp
    16d0:	53                   	push   %ebx
    16d1:	68 b4 41 00 00       	push   $0x41b4
    16d6:	e8 c5 22 00 00       	call   39a0 <printf>
        exit();
    16db:	e8 23 1f 00 00       	call   3603 <exit>
      link("C0", file);
    16e0:	83 ec 08             	sub    $0x8,%esp
    16e3:	53                   	push   %ebx
    16e4:	68 b1 41 00 00       	push   $0x41b1
    16e9:	e8 75 1f 00 00       	call   3663 <link>
    16ee:	83 c4 10             	add    $0x10,%esp
      exit();
    16f1:	e8 0d 1f 00 00       	call   3603 <exit>
    16f6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    16fd:	8d 76 00             	lea    0x0(%esi),%esi
      link("C0", file);
    1700:	83 ec 08             	sub    $0x8,%esp
  for(i = 0; i < 40; i++){
    1703:	83 c6 01             	add    $0x1,%esi
      link("C0", file);
    1706:	53                   	push   %ebx
    1707:	68 b1 41 00 00       	push   $0x41b1
    170c:	e8 52 1f 00 00       	call   3663 <link>
    1711:	83 c4 10             	add    $0x10,%esp
      wait();
    1714:	e8 f2 1e 00 00       	call   360b <wait>
  for(i = 0; i < 40; i++){
    1719:	83 fe 28             	cmp    $0x28,%esi
    171c:	0f 85 69 ff ff ff    	jne    168b <concreate+0x6b>
  memset(fa, 0, sizeof(fa));
    1722:	83 ec 04             	sub    $0x4,%esp
    1725:	8d 45 c0             	lea    -0x40(%ebp),%eax
    1728:	8d 7d b0             	lea    -0x50(%ebp),%edi
    172b:	6a 28                	push   $0x28
    172d:	6a 00                	push   $0x0
    172f:	50                   	push   %eax
    1730:	e8 3b 1d 00 00       	call   3470 <memset>
  fd = open(".", 0);
    1735:	59                   	pop    %ecx
    1736:	5e                   	pop    %esi
    1737:	6a 00                	push   $0x0
    1739:	68 be 43 00 00       	push   $0x43be
    173e:	e8 00 1f 00 00       	call   3643 <open>
  n = 0;
    1743:	c7 45 a4 00 00 00 00 	movl   $0x0,-0x5c(%ebp)
  while(read(fd, &de, sizeof(de)) > 0){
    174a:	83 c4 10             	add    $0x10,%esp
  fd = open(".", 0);
    174d:	89 c6                	mov    %eax,%esi
  while(read(fd, &de, sizeof(de)) > 0){
    174f:	90                   	nop
    1750:	83 ec 04             	sub    $0x4,%esp
    1753:	6a 10                	push   $0x10
    1755:	57                   	push   %edi
    1756:	56                   	push   %esi
    1757:	e8 bf 1e 00 00       	call   361b <read>
    175c:	83 c4 10             	add    $0x10,%esp
    175f:	85 c0                	test   %eax,%eax
    1761:	7e 3d                	jle    17a0 <concreate+0x180>
    if(de.inum == 0)
    1763:	66 83 7d b0 00       	cmpw   $0x0,-0x50(%ebp)
    1768:	74 e6                	je     1750 <concreate+0x130>
    if(de.name[0] == 'C' && de.name[2] == '\0'){
    176a:	80 7d b2 43          	cmpb   $0x43,-0x4e(%ebp)
    176e:	75 e0                	jne    1750 <concreate+0x130>
    1770:	80 7d b4 00          	cmpb   $0x0,-0x4c(%ebp)
    1774:	75 da                	jne    1750 <concreate+0x130>
      i = de.name[1] - '0';
    1776:	0f be 45 b3          	movsbl -0x4d(%ebp),%eax
    177a:	83 e8 30             	sub    $0x30,%eax
      if(i < 0 || i >= sizeof(fa)){
    177d:	83 f8 27             	cmp    $0x27,%eax
    1780:	0f 87 59 01 00 00    	ja     18df <concreate+0x2bf>
      if(fa[i]){
    1786:	80 7c 05 c0 00       	cmpb   $0x0,-0x40(%ebp,%eax,1)
    178b:	0f 85 38 01 00 00    	jne    18c9 <concreate+0x2a9>
      n++;
    1791:	83 45 a4 01          	addl   $0x1,-0x5c(%ebp)
      fa[i] = 1;
    1795:	c6 44 05 c0 01       	movb   $0x1,-0x40(%ebp,%eax,1)
      n++;
    179a:	eb b4                	jmp    1750 <concreate+0x130>
    179c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  close(fd);
    17a0:	83 ec 0c             	sub    $0xc,%esp
    17a3:	56                   	push   %esi
    17a4:	e8 82 1e 00 00       	call   362b <close>
  if(n != 40){
    17a9:	83 c4 10             	add    $0x10,%esp
    17ac:	83 7d a4 28          	cmpl   $0x28,-0x5c(%ebp)
    17b0:	0f 85 01 01 00 00    	jne    18b7 <concreate+0x297>
  for(i = 0; i < 40; i++){
    17b6:	31 f6                	xor    %esi,%esi
    17b8:	eb 4c                	jmp    1806 <concreate+0x1e6>
    17ba:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
       ((i % 3) == 1 && pid != 0)){
    17c0:	85 ff                	test   %edi,%edi
    17c2:	74 05                	je     17c9 <concreate+0x1a9>
    17c4:	83 f8 01             	cmp    $0x1,%eax
    17c7:	74 6c                	je     1835 <concreate+0x215>
      unlink(file);
    17c9:	83 ec 0c             	sub    $0xc,%esp
    17cc:	53                   	push   %ebx
    17cd:	e8 81 1e 00 00       	call   3653 <unlink>
      unlink(file);
    17d2:	89 1c 24             	mov    %ebx,(%esp)
    17d5:	e8 79 1e 00 00       	call   3653 <unlink>
      unlink(file);
    17da:	89 1c 24             	mov    %ebx,(%esp)
    17dd:	e8 71 1e 00 00       	call   3653 <unlink>
      unlink(file);
    17e2:	89 1c 24             	mov    %ebx,(%esp)
    17e5:	e8 69 1e 00 00       	call   3653 <unlink>
    17ea:	83 c4 10             	add    $0x10,%esp
    if(pid == 0)
    17ed:	85 ff                	test   %edi,%edi
    17ef:	0f 84 fc fe ff ff    	je     16f1 <concreate+0xd1>
      wait();
    17f5:	e8 11 1e 00 00       	call   360b <wait>
  for(i = 0; i < 40; i++){
    17fa:	83 c6 01             	add    $0x1,%esi
    17fd:	83 fe 28             	cmp    $0x28,%esi
    1800:	0f 84 8a 00 00 00    	je     1890 <concreate+0x270>
    file[1] = '0' + i;
    1806:	8d 46 30             	lea    0x30(%esi),%eax
    1809:	88 45 ae             	mov    %al,-0x52(%ebp)
    pid = fork();
    180c:	e8 ea 1d 00 00       	call   35fb <fork>
    1811:	89 c7                	mov    %eax,%edi
    if(pid < 0){
    1813:	85 c0                	test   %eax,%eax
    1815:	0f 88 8a 00 00 00    	js     18a5 <concreate+0x285>
    if(((i % 3) == 0 && pid == 0) ||
    181b:	b8 ab aa aa aa       	mov    $0xaaaaaaab,%eax
    1820:	f7 e6                	mul    %esi
    1822:	89 d0                	mov    %edx,%eax
    1824:	83 e2 fe             	and    $0xfffffffe,%edx
    1827:	d1 e8                	shr    %eax
    1829:	01 c2                	add    %eax,%edx
    182b:	89 f0                	mov    %esi,%eax
    182d:	29 d0                	sub    %edx,%eax
    182f:	89 c1                	mov    %eax,%ecx
    1831:	09 f9                	or     %edi,%ecx
    1833:	75 8b                	jne    17c0 <concreate+0x1a0>
      close(open(file, 0));
    1835:	83 ec 08             	sub    $0x8,%esp
    1838:	6a 00                	push   $0x0
    183a:	53                   	push   %ebx
    183b:	e8 03 1e 00 00       	call   3643 <open>
    1840:	89 04 24             	mov    %eax,(%esp)
    1843:	e8 e3 1d 00 00       	call   362b <close>
      close(open(file, 0));
    1848:	58                   	pop    %eax
    1849:	5a                   	pop    %edx
    184a:	6a 00                	push   $0x0
    184c:	53                   	push   %ebx
    184d:	e8 f1 1d 00 00       	call   3643 <open>
    1852:	89 04 24             	mov    %eax,(%esp)
    1855:	e8 d1 1d 00 00       	call   362b <close>
      close(open(file, 0));
    185a:	59                   	pop    %ecx
    185b:	58                   	pop    %eax
    185c:	6a 00                	push   $0x0
    185e:	53                   	push   %ebx
    185f:	e8 df 1d 00 00       	call   3643 <open>
    1864:	89 04 24             	mov    %eax,(%esp)
    1867:	e8 bf 1d 00 00       	call   362b <close>
      close(open(file, 0));
    186c:	58                   	pop    %eax
    186d:	5a                   	pop    %edx
    186e:	6a 00                	push   $0x0
    1870:	53                   	push   %ebx
    1871:	e8 cd 1d 00 00       	call   3643 <open>
    1876:	89 04 24             	mov    %eax,(%esp)
    1879:	e8 ad 1d 00 00       	call   362b <close>
    187e:	83 c4 10             	add    $0x10,%esp
    1881:	e9 67 ff ff ff       	jmp    17ed <concreate+0x1cd>
    1886:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    188d:	8d 76 00             	lea    0x0(%esi),%esi
  printf("concreate ok\n");
    1890:	83 ec 0c             	sub    $0xc,%esp
    1893:	68 06 42 00 00       	push   $0x4206
    1898:	e8 03 21 00 00       	call   39a0 <printf>
}
    189d:	8d 65 f4             	lea    -0xc(%ebp),%esp
    18a0:	5b                   	pop    %ebx
    18a1:	5e                   	pop    %esi
    18a2:	5f                   	pop    %edi
    18a3:	5d                   	pop    %ebp
    18a4:	c3                   	ret    
      printf("fork failed\n");
    18a5:	83 ec 0c             	sub    $0xc,%esp
    18a8:	68 89 4a 00 00       	push   $0x4a89
    18ad:	e8 ee 20 00 00       	call   39a0 <printf>
      exit();
    18b2:	e8 4c 1d 00 00       	call   3603 <exit>
    printf("concreate not enough files in directory listing\n");
    18b7:	83 ec 0c             	sub    $0xc,%esp
    18ba:	68 50 4d 00 00       	push   $0x4d50
    18bf:	e8 dc 20 00 00       	call   39a0 <printf>
    exit();
    18c4:	e8 3a 1d 00 00       	call   3603 <exit>
        printf("concreate duplicate file %s\n", de.name);
    18c9:	83 ec 08             	sub    $0x8,%esp
    18cc:	8d 45 b2             	lea    -0x4e(%ebp),%eax
    18cf:	50                   	push   %eax
    18d0:	68 e9 41 00 00       	push   $0x41e9
    18d5:	e8 c6 20 00 00       	call   39a0 <printf>
        exit();
    18da:	e8 24 1d 00 00       	call   3603 <exit>
        printf("concreate weird file %s\n", de.name);
    18df:	83 ec 08             	sub    $0x8,%esp
    18e2:	8d 45 b2             	lea    -0x4e(%ebp),%eax
    18e5:	50                   	push   %eax
    18e6:	68 d0 41 00 00       	push   $0x41d0
    18eb:	e8 b0 20 00 00       	call   39a0 <printf>
        exit();
    18f0:	e8 0e 1d 00 00       	call   3603 <exit>
      close(fd);
    18f5:	83 ec 0c             	sub    $0xc,%esp
    18f8:	50                   	push   %eax
    18f9:	e8 2d 1d 00 00       	call   362b <close>
    18fe:	83 c4 10             	add    $0x10,%esp
    1901:	e9 eb fd ff ff       	jmp    16f1 <concreate+0xd1>
    1906:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    190d:	8d 76 00             	lea    0x0(%esi),%esi

00001910 <linkunlink>:
{
    1910:	55                   	push   %ebp
    1911:	89 e5                	mov    %esp,%ebp
    1913:	57                   	push   %edi
    1914:	56                   	push   %esi
    1915:	53                   	push   %ebx
    1916:	83 ec 28             	sub    $0x28,%esp
  printf("linkunlink test\n");
    1919:	68 14 42 00 00       	push   $0x4214
    191e:	e8 7d 20 00 00       	call   39a0 <printf>
  unlink("x");
    1923:	c7 04 24 a1 44 00 00 	movl   $0x44a1,(%esp)
    192a:	e8 24 1d 00 00       	call   3653 <unlink>
  pid = fork();
    192f:	e8 c7 1c 00 00       	call   35fb <fork>
  if(pid < 0){
    1934:	83 c4 10             	add    $0x10,%esp
  pid = fork();
    1937:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  if(pid < 0){
    193a:	85 c0                	test   %eax,%eax
    193c:	0f 88 b8 00 00 00    	js     19fa <linkunlink+0xea>
  unsigned int x = (pid ? 1 : 97);
    1942:	83 7d e4 01          	cmpl   $0x1,-0x1c(%ebp)
    1946:	bb 64 00 00 00       	mov    $0x64,%ebx
    if((x % 3) == 0){
    194b:	be ab aa aa aa       	mov    $0xaaaaaaab,%esi
  unsigned int x = (pid ? 1 : 97);
    1950:	19 ff                	sbb    %edi,%edi
    1952:	83 e7 60             	and    $0x60,%edi
    1955:	83 c7 01             	add    $0x1,%edi
    1958:	eb 20                	jmp    197a <linkunlink+0x6a>
    195a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    } else if((x % 3) == 1){
    1960:	83 f8 01             	cmp    $0x1,%eax
    1963:	74 7b                	je     19e0 <linkunlink+0xd0>
      unlink("x");
    1965:	83 ec 0c             	sub    $0xc,%esp
    1968:	68 a1 44 00 00       	push   $0x44a1
    196d:	e8 e1 1c 00 00       	call   3653 <unlink>
    1972:	83 c4 10             	add    $0x10,%esp
  for(i = 0; i < 100; i++){
    1975:	83 eb 01             	sub    $0x1,%ebx
    1978:	74 41                	je     19bb <linkunlink+0xab>
    x = x * 1103515245 + 12345;
    197a:	69 cf 6d 4e c6 41    	imul   $0x41c64e6d,%edi,%ecx
    1980:	8d b9 39 30 00 00    	lea    0x3039(%ecx),%edi
    if((x % 3) == 0){
    1986:	89 f8                	mov    %edi,%eax
    1988:	f7 e6                	mul    %esi
    198a:	89 d0                	mov    %edx,%eax
    198c:	83 e2 fe             	and    $0xfffffffe,%edx
    198f:	d1 e8                	shr    %eax
    1991:	01 c2                	add    %eax,%edx
    1993:	89 f8                	mov    %edi,%eax
    1995:	29 d0                	sub    %edx,%eax
    1997:	75 c7                	jne    1960 <linkunlink+0x50>
      close(open("x", O_RDWR | O_CREATE));
    1999:	83 ec 08             	sub    $0x8,%esp
    199c:	68 02 02 00 00       	push   $0x202
    19a1:	68 a1 44 00 00       	push   $0x44a1
    19a6:	e8 98 1c 00 00       	call   3643 <open>
    19ab:	89 04 24             	mov    %eax,(%esp)
    19ae:	e8 78 1c 00 00       	call   362b <close>
    19b3:	83 c4 10             	add    $0x10,%esp
  for(i = 0; i < 100; i++){
    19b6:	83 eb 01             	sub    $0x1,%ebx
    19b9:	75 bf                	jne    197a <linkunlink+0x6a>
  if(pid)
    19bb:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    19be:	85 c0                	test   %eax,%eax
    19c0:	74 4a                	je     1a0c <linkunlink+0xfc>
    wait();
    19c2:	e8 44 1c 00 00       	call   360b <wait>
  printf("linkunlink ok\n");
    19c7:	83 ec 0c             	sub    $0xc,%esp
    19ca:	68 29 42 00 00       	push   $0x4229
    19cf:	e8 cc 1f 00 00       	call   39a0 <printf>
}
    19d4:	8d 65 f4             	lea    -0xc(%ebp),%esp
    19d7:	5b                   	pop    %ebx
    19d8:	5e                   	pop    %esi
    19d9:	5f                   	pop    %edi
    19da:	5d                   	pop    %ebp
    19db:	c3                   	ret    
    19dc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
      link("cat", "x");
    19e0:	83 ec 08             	sub    $0x8,%esp
    19e3:	68 a1 44 00 00       	push   $0x44a1
    19e8:	68 25 42 00 00       	push   $0x4225
    19ed:	e8 71 1c 00 00       	call   3663 <link>
    19f2:	83 c4 10             	add    $0x10,%esp
    19f5:	e9 7b ff ff ff       	jmp    1975 <linkunlink+0x65>
    printf("fork failed\n");
    19fa:	83 ec 0c             	sub    $0xc,%esp
    19fd:	68 89 4a 00 00       	push   $0x4a89
    1a02:	e8 99 1f 00 00       	call   39a0 <printf>
    exit();
    1a07:	e8 f7 1b 00 00       	call   3603 <exit>
    exit();
    1a0c:	e8 f2 1b 00 00       	call   3603 <exit>
    1a11:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    1a18:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    1a1f:	90                   	nop

00001a20 <bigdir>:
{
    1a20:	55                   	push   %ebp
    1a21:	89 e5                	mov    %esp,%ebp
    1a23:	57                   	push   %edi
    1a24:	56                   	push   %esi
    1a25:	53                   	push   %ebx
    1a26:	83 ec 28             	sub    $0x28,%esp
  printf("bigdir test\n");
    1a29:	68 38 42 00 00       	push   $0x4238
    1a2e:	e8 6d 1f 00 00       	call   39a0 <printf>
  unlink("bd");
    1a33:	c7 04 24 45 42 00 00 	movl   $0x4245,(%esp)
    1a3a:	e8 14 1c 00 00       	call   3653 <unlink>
  fd = open("bd", O_CREATE);
    1a3f:	58                   	pop    %eax
    1a40:	5a                   	pop    %edx
    1a41:	68 00 02 00 00       	push   $0x200
    1a46:	68 45 42 00 00       	push   $0x4245
    1a4b:	e8 f3 1b 00 00       	call   3643 <open>
  if(fd < 0){
    1a50:	83 c4 10             	add    $0x10,%esp
    1a53:	85 c0                	test   %eax,%eax
    1a55:	0f 88 da 00 00 00    	js     1b35 <bigdir+0x115>
  close(fd);
    1a5b:	83 ec 0c             	sub    $0xc,%esp
  for(i = 0; i < 500; i++){
    1a5e:	31 f6                	xor    %esi,%esi
    1a60:	8d 7d de             	lea    -0x22(%ebp),%edi
  close(fd);
    1a63:	50                   	push   %eax
    1a64:	e8 c2 1b 00 00       	call   362b <close>
    1a69:	83 c4 10             	add    $0x10,%esp
    1a6c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    name[1] = '0' + (i / 64);
    1a70:	89 f0                	mov    %esi,%eax
    if(link("bd", name) != 0){
    1a72:	83 ec 08             	sub    $0x8,%esp
    name[0] = 'x';
    1a75:	c6 45 de 78          	movb   $0x78,-0x22(%ebp)
    name[1] = '0' + (i / 64);
    1a79:	c1 f8 06             	sar    $0x6,%eax
    if(link("bd", name) != 0){
    1a7c:	57                   	push   %edi
    name[1] = '0' + (i / 64);
    1a7d:	83 c0 30             	add    $0x30,%eax
    if(link("bd", name) != 0){
    1a80:	68 45 42 00 00       	push   $0x4245
    name[1] = '0' + (i / 64);
    1a85:	88 45 df             	mov    %al,-0x21(%ebp)
    name[2] = '0' + (i % 64);
    1a88:	89 f0                	mov    %esi,%eax
    1a8a:	83 e0 3f             	and    $0x3f,%eax
    name[3] = '\0';
    1a8d:	c6 45 e1 00          	movb   $0x0,-0x1f(%ebp)
    name[2] = '0' + (i % 64);
    1a91:	83 c0 30             	add    $0x30,%eax
    1a94:	88 45 e0             	mov    %al,-0x20(%ebp)
    if(link("bd", name) != 0){
    1a97:	e8 c7 1b 00 00       	call   3663 <link>
    1a9c:	83 c4 10             	add    $0x10,%esp
    1a9f:	89 c3                	mov    %eax,%ebx
    1aa1:	85 c0                	test   %eax,%eax
    1aa3:	75 6c                	jne    1b11 <bigdir+0xf1>
  for(i = 0; i < 500; i++){
    1aa5:	83 c6 01             	add    $0x1,%esi
    1aa8:	81 fe f4 01 00 00    	cmp    $0x1f4,%esi
    1aae:	75 c0                	jne    1a70 <bigdir+0x50>
  unlink("bd");
    1ab0:	83 ec 0c             	sub    $0xc,%esp
    1ab3:	68 45 42 00 00       	push   $0x4245
    1ab8:	e8 96 1b 00 00       	call   3653 <unlink>
    1abd:	83 c4 10             	add    $0x10,%esp
    name[1] = '0' + (i / 64);
    1ac0:	89 d8                	mov    %ebx,%eax
    if(unlink(name) != 0){
    1ac2:	83 ec 0c             	sub    $0xc,%esp
    name[0] = 'x';
    1ac5:	c6 45 de 78          	movb   $0x78,-0x22(%ebp)
    name[1] = '0' + (i / 64);
    1ac9:	c1 f8 06             	sar    $0x6,%eax
    if(unlink(name) != 0){
    1acc:	57                   	push   %edi
    name[1] = '0' + (i / 64);
    1acd:	83 c0 30             	add    $0x30,%eax
    name[3] = '\0';
    1ad0:	c6 45 e1 00          	movb   $0x0,-0x1f(%ebp)
    name[1] = '0' + (i / 64);
    1ad4:	88 45 df             	mov    %al,-0x21(%ebp)
    name[2] = '0' + (i % 64);
    1ad7:	89 d8                	mov    %ebx,%eax
    1ad9:	83 e0 3f             	and    $0x3f,%eax
    1adc:	83 c0 30             	add    $0x30,%eax
    1adf:	88 45 e0             	mov    %al,-0x20(%ebp)
    if(unlink(name) != 0){
    1ae2:	e8 6c 1b 00 00       	call   3653 <unlink>
    1ae7:	83 c4 10             	add    $0x10,%esp
    1aea:	85 c0                	test   %eax,%eax
    1aec:	75 35                	jne    1b23 <bigdir+0x103>
  for(i = 0; i < 500; i++){
    1aee:	83 c3 01             	add    $0x1,%ebx
    1af1:	81 fb f4 01 00 00    	cmp    $0x1f4,%ebx
    1af7:	75 c7                	jne    1ac0 <bigdir+0xa0>
  printf("bigdir ok\n");
    1af9:	83 ec 0c             	sub    $0xc,%esp
    1afc:	68 87 42 00 00       	push   $0x4287
    1b01:	e8 9a 1e 00 00       	call   39a0 <printf>
    1b06:	83 c4 10             	add    $0x10,%esp
}
    1b09:	8d 65 f4             	lea    -0xc(%ebp),%esp
    1b0c:	5b                   	pop    %ebx
    1b0d:	5e                   	pop    %esi
    1b0e:	5f                   	pop    %edi
    1b0f:	5d                   	pop    %ebp
    1b10:	c3                   	ret    
      printf("bigdir link failed\n");
    1b11:	83 ec 0c             	sub    $0xc,%esp
    1b14:	68 5e 42 00 00       	push   $0x425e
    1b19:	e8 82 1e 00 00       	call   39a0 <printf>
      exit();
    1b1e:	e8 e0 1a 00 00       	call   3603 <exit>
      printf("bigdir unlink failed");
    1b23:	83 ec 0c             	sub    $0xc,%esp
    1b26:	68 72 42 00 00       	push   $0x4272
    1b2b:	e8 70 1e 00 00       	call   39a0 <printf>
      exit();
    1b30:	e8 ce 1a 00 00       	call   3603 <exit>
    printf("bigdir create failed\n");
    1b35:	83 ec 0c             	sub    $0xc,%esp
    1b38:	68 48 42 00 00       	push   $0x4248
    1b3d:	e8 5e 1e 00 00       	call   39a0 <printf>
    exit();
    1b42:	e8 bc 1a 00 00       	call   3603 <exit>
    1b47:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    1b4e:	66 90                	xchg   %ax,%ax

00001b50 <subdir>:
{
    1b50:	55                   	push   %ebp
    1b51:	89 e5                	mov    %esp,%ebp
    1b53:	53                   	push   %ebx
    1b54:	83 ec 10             	sub    $0x10,%esp
  printf("subdir test\n");
    1b57:	68 92 42 00 00       	push   $0x4292
    1b5c:	e8 3f 1e 00 00       	call   39a0 <printf>
  unlink("ff");
    1b61:	c7 04 24 1b 43 00 00 	movl   $0x431b,(%esp)
    1b68:	e8 e6 1a 00 00       	call   3653 <unlink>
  if(mkdir("dd") != 0){
    1b6d:	c7 04 24 b8 43 00 00 	movl   $0x43b8,(%esp)
    1b74:	e8 f2 1a 00 00       	call   366b <mkdir>
    1b79:	83 c4 10             	add    $0x10,%esp
    1b7c:	85 c0                	test   %eax,%eax
    1b7e:	0f 85 9b 05 00 00    	jne    211f <subdir+0x5cf>
  fd = open("dd/ff", O_CREATE | O_RDWR);
    1b84:	83 ec 08             	sub    $0x8,%esp
    1b87:	68 02 02 00 00       	push   $0x202
    1b8c:	68 f1 42 00 00       	push   $0x42f1
    1b91:	e8 ad 1a 00 00       	call   3643 <open>
  if(fd < 0){
    1b96:	83 c4 10             	add    $0x10,%esp
  fd = open("dd/ff", O_CREATE | O_RDWR);
    1b99:	89 c3                	mov    %eax,%ebx
  if(fd < 0){
    1b9b:	85 c0                	test   %eax,%eax
    1b9d:	0f 88 6a 05 00 00    	js     210d <subdir+0x5bd>
  write(fd, "ff", 2);
    1ba3:	83 ec 04             	sub    $0x4,%esp
    1ba6:	6a 02                	push   $0x2
    1ba8:	68 1b 43 00 00       	push   $0x431b
    1bad:	50                   	push   %eax
    1bae:	e8 70 1a 00 00       	call   3623 <write>
  close(fd);
    1bb3:	89 1c 24             	mov    %ebx,(%esp)
    1bb6:	e8 70 1a 00 00       	call   362b <close>
  if(unlink("dd") >= 0){
    1bbb:	c7 04 24 b8 43 00 00 	movl   $0x43b8,(%esp)
    1bc2:	e8 8c 1a 00 00       	call   3653 <unlink>
    1bc7:	83 c4 10             	add    $0x10,%esp
    1bca:	85 c0                	test   %eax,%eax
    1bcc:	0f 89 29 05 00 00    	jns    20fb <subdir+0x5ab>
  if(mkdir("/dd/dd") != 0){
    1bd2:	83 ec 0c             	sub    $0xc,%esp
    1bd5:	68 cc 42 00 00       	push   $0x42cc
    1bda:	e8 8c 1a 00 00       	call   366b <mkdir>
    1bdf:	83 c4 10             	add    $0x10,%esp
    1be2:	85 c0                	test   %eax,%eax
    1be4:	0f 85 ff 04 00 00    	jne    20e9 <subdir+0x599>
  fd = open("dd/dd/ff", O_CREATE | O_RDWR);
    1bea:	83 ec 08             	sub    $0x8,%esp
    1bed:	68 02 02 00 00       	push   $0x202
    1bf2:	68 ee 42 00 00       	push   $0x42ee
    1bf7:	e8 47 1a 00 00       	call   3643 <open>
  if(fd < 0){
    1bfc:	83 c4 10             	add    $0x10,%esp
  fd = open("dd/dd/ff", O_CREATE | O_RDWR);
    1bff:	89 c3                	mov    %eax,%ebx
  if(fd < 0){
    1c01:	85 c0                	test   %eax,%eax
    1c03:	0f 88 1a 04 00 00    	js     2023 <subdir+0x4d3>
  write(fd, "FF", 2);
    1c09:	83 ec 04             	sub    $0x4,%esp
    1c0c:	6a 02                	push   $0x2
    1c0e:	68 0f 43 00 00       	push   $0x430f
    1c13:	50                   	push   %eax
    1c14:	e8 0a 1a 00 00       	call   3623 <write>
  close(fd);
    1c19:	89 1c 24             	mov    %ebx,(%esp)
    1c1c:	e8 0a 1a 00 00       	call   362b <close>
  fd = open("dd/dd/../ff", 0);
    1c21:	58                   	pop    %eax
    1c22:	5a                   	pop    %edx
    1c23:	6a 00                	push   $0x0
    1c25:	68 12 43 00 00       	push   $0x4312
    1c2a:	e8 14 1a 00 00       	call   3643 <open>
  if(fd < 0){
    1c2f:	83 c4 10             	add    $0x10,%esp
  fd = open("dd/dd/../ff", 0);
    1c32:	89 c3                	mov    %eax,%ebx
  if(fd < 0){
    1c34:	85 c0                	test   %eax,%eax
    1c36:	0f 88 d5 03 00 00    	js     2011 <subdir+0x4c1>
  cc = read(fd, buf, sizeof(buf));
    1c3c:	83 ec 04             	sub    $0x4,%esp
    1c3f:	68 00 20 00 00       	push   $0x2000
    1c44:	68 a0 7a 00 00       	push   $0x7aa0
    1c49:	50                   	push   %eax
    1c4a:	e8 cc 19 00 00       	call   361b <read>
  if(cc != 2 || buf[0] != 'f'){
    1c4f:	83 c4 10             	add    $0x10,%esp
    1c52:	83 f8 02             	cmp    $0x2,%eax
    1c55:	0f 85 38 03 00 00    	jne    1f93 <subdir+0x443>
    1c5b:	80 3d a0 7a 00 00 66 	cmpb   $0x66,0x7aa0
    1c62:	0f 85 2b 03 00 00    	jne    1f93 <subdir+0x443>
  close(fd);
    1c68:	83 ec 0c             	sub    $0xc,%esp
    1c6b:	53                   	push   %ebx
    1c6c:	e8 ba 19 00 00       	call   362b <close>
  if(link("dd/dd/ff", "dd/dd/ffff") != 0){
    1c71:	59                   	pop    %ecx
    1c72:	5b                   	pop    %ebx
    1c73:	68 52 43 00 00       	push   $0x4352
    1c78:	68 ee 42 00 00       	push   $0x42ee
    1c7d:	e8 e1 19 00 00       	call   3663 <link>
    1c82:	83 c4 10             	add    $0x10,%esp
    1c85:	85 c0                	test   %eax,%eax
    1c87:	0f 85 ba 03 00 00    	jne    2047 <subdir+0x4f7>
  if(unlink("dd/dd/ff") != 0){
    1c8d:	83 ec 0c             	sub    $0xc,%esp
    1c90:	68 ee 42 00 00       	push   $0x42ee
    1c95:	e8 b9 19 00 00       	call   3653 <unlink>
    1c9a:	83 c4 10             	add    $0x10,%esp
    1c9d:	85 c0                	test   %eax,%eax
    1c9f:	0f 85 12 03 00 00    	jne    1fb7 <subdir+0x467>
  if(open("dd/dd/ff", O_RDONLY) >= 0){
    1ca5:	83 ec 08             	sub    $0x8,%esp
    1ca8:	6a 00                	push   $0x0
    1caa:	68 ee 42 00 00       	push   $0x42ee
    1caf:	e8 8f 19 00 00       	call   3643 <open>
    1cb4:	83 c4 10             	add    $0x10,%esp
    1cb7:	85 c0                	test   %eax,%eax
    1cb9:	0f 89 18 04 00 00    	jns    20d7 <subdir+0x587>
  if(chdir("dd") != 0){
    1cbf:	83 ec 0c             	sub    $0xc,%esp
    1cc2:	68 b8 43 00 00       	push   $0x43b8
    1cc7:	e8 a7 19 00 00       	call   3673 <chdir>
    1ccc:	83 c4 10             	add    $0x10,%esp
    1ccf:	85 c0                	test   %eax,%eax
    1cd1:	0f 85 ee 03 00 00    	jne    20c5 <subdir+0x575>
  if(chdir("dd/../../dd") != 0){
    1cd7:	83 ec 0c             	sub    $0xc,%esp
    1cda:	68 86 43 00 00       	push   $0x4386
    1cdf:	e8 8f 19 00 00       	call   3673 <chdir>
    1ce4:	83 c4 10             	add    $0x10,%esp
    1ce7:	85 c0                	test   %eax,%eax
    1ce9:	0f 85 b6 02 00 00    	jne    1fa5 <subdir+0x455>
  if(chdir("dd/../../../dd") != 0){
    1cef:	83 ec 0c             	sub    $0xc,%esp
    1cf2:	68 ac 43 00 00       	push   $0x43ac
    1cf7:	e8 77 19 00 00       	call   3673 <chdir>
    1cfc:	83 c4 10             	add    $0x10,%esp
    1cff:	85 c0                	test   %eax,%eax
    1d01:	0f 85 9e 02 00 00    	jne    1fa5 <subdir+0x455>
  if(chdir("./..") != 0){
    1d07:	83 ec 0c             	sub    $0xc,%esp
    1d0a:	68 bb 43 00 00       	push   $0x43bb
    1d0f:	e8 5f 19 00 00       	call   3673 <chdir>
    1d14:	83 c4 10             	add    $0x10,%esp
    1d17:	85 c0                	test   %eax,%eax
    1d19:	0f 85 16 03 00 00    	jne    2035 <subdir+0x4e5>
  fd = open("dd/dd/ffff", 0);
    1d1f:	83 ec 08             	sub    $0x8,%esp
    1d22:	6a 00                	push   $0x0
    1d24:	68 52 43 00 00       	push   $0x4352
    1d29:	e8 15 19 00 00       	call   3643 <open>
  if(fd < 0){
    1d2e:	83 c4 10             	add    $0x10,%esp
  fd = open("dd/dd/ffff", 0);
    1d31:	89 c3                	mov    %eax,%ebx
  if(fd < 0){
    1d33:	85 c0                	test   %eax,%eax
    1d35:	0f 88 bc 04 00 00    	js     21f7 <subdir+0x6a7>
  if(read(fd, buf, sizeof(buf)) != 2){
    1d3b:	83 ec 04             	sub    $0x4,%esp
    1d3e:	68 00 20 00 00       	push   $0x2000
    1d43:	68 a0 7a 00 00       	push   $0x7aa0
    1d48:	50                   	push   %eax
    1d49:	e8 cd 18 00 00       	call   361b <read>
    1d4e:	83 c4 10             	add    $0x10,%esp
    1d51:	83 f8 02             	cmp    $0x2,%eax
    1d54:	0f 85 8b 04 00 00    	jne    21e5 <subdir+0x695>
  close(fd);
    1d5a:	83 ec 0c             	sub    $0xc,%esp
    1d5d:	53                   	push   %ebx
    1d5e:	e8 c8 18 00 00       	call   362b <close>
  if(open("dd/dd/ff", O_RDONLY) >= 0){
    1d63:	58                   	pop    %eax
    1d64:	5a                   	pop    %edx
    1d65:	6a 00                	push   $0x0
    1d67:	68 ee 42 00 00       	push   $0x42ee
    1d6c:	e8 d2 18 00 00       	call   3643 <open>
    1d71:	83 c4 10             	add    $0x10,%esp
    1d74:	85 c0                	test   %eax,%eax
    1d76:	0f 89 5f 02 00 00    	jns    1fdb <subdir+0x48b>
  if(open("dd/ff/ff", O_CREATE|O_RDWR) >= 0){
    1d7c:	83 ec 08             	sub    $0x8,%esp
    1d7f:	68 02 02 00 00       	push   $0x202
    1d84:	68 06 44 00 00       	push   $0x4406
    1d89:	e8 b5 18 00 00       	call   3643 <open>
    1d8e:	83 c4 10             	add    $0x10,%esp
    1d91:	85 c0                	test   %eax,%eax
    1d93:	0f 89 30 02 00 00    	jns    1fc9 <subdir+0x479>
  if(open("dd/xx/ff", O_CREATE|O_RDWR) >= 0){
    1d99:	83 ec 08             	sub    $0x8,%esp
    1d9c:	68 02 02 00 00       	push   $0x202
    1da1:	68 2b 44 00 00       	push   $0x442b
    1da6:	e8 98 18 00 00       	call   3643 <open>
    1dab:	83 c4 10             	add    $0x10,%esp
    1dae:	85 c0                	test   %eax,%eax
    1db0:	0f 89 fd 02 00 00    	jns    20b3 <subdir+0x563>
  if(open("dd", O_CREATE) >= 0){
    1db6:	83 ec 08             	sub    $0x8,%esp
    1db9:	68 00 02 00 00       	push   $0x200
    1dbe:	68 b8 43 00 00       	push   $0x43b8
    1dc3:	e8 7b 18 00 00       	call   3643 <open>
    1dc8:	83 c4 10             	add    $0x10,%esp
    1dcb:	85 c0                	test   %eax,%eax
    1dcd:	0f 89 ce 02 00 00    	jns    20a1 <subdir+0x551>
  if(open("dd", O_RDWR) >= 0){
    1dd3:	83 ec 08             	sub    $0x8,%esp
    1dd6:	6a 02                	push   $0x2
    1dd8:	68 b8 43 00 00       	push   $0x43b8
    1ddd:	e8 61 18 00 00       	call   3643 <open>
    1de2:	83 c4 10             	add    $0x10,%esp
    1de5:	85 c0                	test   %eax,%eax
    1de7:	0f 89 a2 02 00 00    	jns    208f <subdir+0x53f>
  if(open("dd", O_WRONLY) >= 0){
    1ded:	83 ec 08             	sub    $0x8,%esp
    1df0:	6a 01                	push   $0x1
    1df2:	68 b8 43 00 00       	push   $0x43b8
    1df7:	e8 47 18 00 00       	call   3643 <open>
    1dfc:	83 c4 10             	add    $0x10,%esp
    1dff:	85 c0                	test   %eax,%eax
    1e01:	0f 89 76 02 00 00    	jns    207d <subdir+0x52d>
  if(link("dd/ff/ff", "dd/dd/xx") == 0){
    1e07:	83 ec 08             	sub    $0x8,%esp
    1e0a:	68 9a 44 00 00       	push   $0x449a
    1e0f:	68 06 44 00 00       	push   $0x4406
    1e14:	e8 4a 18 00 00       	call   3663 <link>
    1e19:	83 c4 10             	add    $0x10,%esp
    1e1c:	85 c0                	test   %eax,%eax
    1e1e:	0f 84 47 02 00 00    	je     206b <subdir+0x51b>
  if(link("dd/xx/ff", "dd/dd/xx") == 0){
    1e24:	83 ec 08             	sub    $0x8,%esp
    1e27:	68 9a 44 00 00       	push   $0x449a
    1e2c:	68 2b 44 00 00       	push   $0x442b
    1e31:	e8 2d 18 00 00       	call   3663 <link>
    1e36:	83 c4 10             	add    $0x10,%esp
    1e39:	85 c0                	test   %eax,%eax
    1e3b:	0f 84 18 02 00 00    	je     2059 <subdir+0x509>
  if(link("dd/ff", "dd/dd/ffff") == 0){
    1e41:	83 ec 08             	sub    $0x8,%esp
    1e44:	68 52 43 00 00       	push   $0x4352
    1e49:	68 f1 42 00 00       	push   $0x42f1
    1e4e:	e8 10 18 00 00       	call   3663 <link>
    1e53:	83 c4 10             	add    $0x10,%esp
    1e56:	85 c0                	test   %eax,%eax
    1e58:	0f 84 a1 01 00 00    	je     1fff <subdir+0x4af>
  if(mkdir("dd/ff/ff") == 0){
    1e5e:	83 ec 0c             	sub    $0xc,%esp
    1e61:	68 06 44 00 00       	push   $0x4406
    1e66:	e8 00 18 00 00       	call   366b <mkdir>
    1e6b:	83 c4 10             	add    $0x10,%esp
    1e6e:	85 c0                	test   %eax,%eax
    1e70:	0f 84 77 01 00 00    	je     1fed <subdir+0x49d>
  if(mkdir("dd/xx/ff") == 0){
    1e76:	83 ec 0c             	sub    $0xc,%esp
    1e79:	68 2b 44 00 00       	push   $0x442b
    1e7e:	e8 e8 17 00 00       	call   366b <mkdir>
    1e83:	83 c4 10             	add    $0x10,%esp
    1e86:	85 c0                	test   %eax,%eax
    1e88:	0f 84 45 03 00 00    	je     21d3 <subdir+0x683>
  if(mkdir("dd/dd/ffff") == 0){
    1e8e:	83 ec 0c             	sub    $0xc,%esp
    1e91:	68 52 43 00 00       	push   $0x4352
    1e96:	e8 d0 17 00 00       	call   366b <mkdir>
    1e9b:	83 c4 10             	add    $0x10,%esp
    1e9e:	85 c0                	test   %eax,%eax
    1ea0:	0f 84 1b 03 00 00    	je     21c1 <subdir+0x671>
  if(unlink("dd/xx/ff") == 0){
    1ea6:	83 ec 0c             	sub    $0xc,%esp
    1ea9:	68 2b 44 00 00       	push   $0x442b
    1eae:	e8 a0 17 00 00       	call   3653 <unlink>
    1eb3:	83 c4 10             	add    $0x10,%esp
    1eb6:	85 c0                	test   %eax,%eax
    1eb8:	0f 84 f1 02 00 00    	je     21af <subdir+0x65f>
  if(unlink("dd/ff/ff") == 0){
    1ebe:	83 ec 0c             	sub    $0xc,%esp
    1ec1:	68 06 44 00 00       	push   $0x4406
    1ec6:	e8 88 17 00 00       	call   3653 <unlink>
    1ecb:	83 c4 10             	add    $0x10,%esp
    1ece:	85 c0                	test   %eax,%eax
    1ed0:	0f 84 c7 02 00 00    	je     219d <subdir+0x64d>
  if(chdir("dd/ff") == 0){
    1ed6:	83 ec 0c             	sub    $0xc,%esp
    1ed9:	68 f1 42 00 00       	push   $0x42f1
    1ede:	e8 90 17 00 00       	call   3673 <chdir>
    1ee3:	83 c4 10             	add    $0x10,%esp
    1ee6:	85 c0                	test   %eax,%eax
    1ee8:	0f 84 9d 02 00 00    	je     218b <subdir+0x63b>
  if(chdir("dd/xx") == 0){
    1eee:	83 ec 0c             	sub    $0xc,%esp
    1ef1:	68 9d 44 00 00       	push   $0x449d
    1ef6:	e8 78 17 00 00       	call   3673 <chdir>
    1efb:	83 c4 10             	add    $0x10,%esp
    1efe:	85 c0                	test   %eax,%eax
    1f00:	0f 84 73 02 00 00    	je     2179 <subdir+0x629>
  if(unlink("dd/dd/ffff") != 0){
    1f06:	83 ec 0c             	sub    $0xc,%esp
    1f09:	68 52 43 00 00       	push   $0x4352
    1f0e:	e8 40 17 00 00       	call   3653 <unlink>
    1f13:	83 c4 10             	add    $0x10,%esp
    1f16:	85 c0                	test   %eax,%eax
    1f18:	0f 85 99 00 00 00    	jne    1fb7 <subdir+0x467>
  if(unlink("dd/ff") != 0){
    1f1e:	83 ec 0c             	sub    $0xc,%esp
    1f21:	68 f1 42 00 00       	push   $0x42f1
    1f26:	e8 28 17 00 00       	call   3653 <unlink>
    1f2b:	83 c4 10             	add    $0x10,%esp
    1f2e:	85 c0                	test   %eax,%eax
    1f30:	0f 85 31 02 00 00    	jne    2167 <subdir+0x617>
  if(unlink("dd") == 0){
    1f36:	83 ec 0c             	sub    $0xc,%esp
    1f39:	68 b8 43 00 00       	push   $0x43b8
    1f3e:	e8 10 17 00 00       	call   3653 <unlink>
    1f43:	83 c4 10             	add    $0x10,%esp
    1f46:	85 c0                	test   %eax,%eax
    1f48:	0f 84 07 02 00 00    	je     2155 <subdir+0x605>
  if(unlink("dd/dd") < 0){
    1f4e:	83 ec 0c             	sub    $0xc,%esp
    1f51:	68 cd 42 00 00       	push   $0x42cd
    1f56:	e8 f8 16 00 00       	call   3653 <unlink>
    1f5b:	83 c4 10             	add    $0x10,%esp
    1f5e:	85 c0                	test   %eax,%eax
    1f60:	0f 88 dd 01 00 00    	js     2143 <subdir+0x5f3>
  if(unlink("dd") < 0){
    1f66:	83 ec 0c             	sub    $0xc,%esp
    1f69:	68 b8 43 00 00       	push   $0x43b8
    1f6e:	e8 e0 16 00 00       	call   3653 <unlink>
    1f73:	83 c4 10             	add    $0x10,%esp
    1f76:	85 c0                	test   %eax,%eax
    1f78:	0f 88 b3 01 00 00    	js     2131 <subdir+0x5e1>
  printf("subdir ok\n");
    1f7e:	83 ec 0c             	sub    $0xc,%esp
    1f81:	68 9a 45 00 00       	push   $0x459a
    1f86:	e8 15 1a 00 00       	call   39a0 <printf>
}
    1f8b:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    1f8e:	83 c4 10             	add    $0x10,%esp
    1f91:	c9                   	leave  
    1f92:	c3                   	ret    
    printf("dd/dd/../ff wrong content\n");
    1f93:	83 ec 0c             	sub    $0xc,%esp
    1f96:	68 37 43 00 00       	push   $0x4337
    1f9b:	e8 00 1a 00 00       	call   39a0 <printf>
    exit();
    1fa0:	e8 5e 16 00 00       	call   3603 <exit>
    printf("chdir dd/../../dd failed\n");
    1fa5:	83 ec 0c             	sub    $0xc,%esp
    1fa8:	68 92 43 00 00       	push   $0x4392
    1fad:	e8 ee 19 00 00       	call   39a0 <printf>
    exit();
    1fb2:	e8 4c 16 00 00       	call   3603 <exit>
    printf("unlink dd/dd/ff failed\n");
    1fb7:	83 ec 0c             	sub    $0xc,%esp
    1fba:	68 5d 43 00 00       	push   $0x435d
    1fbf:	e8 dc 19 00 00       	call   39a0 <printf>
    exit();
    1fc4:	e8 3a 16 00 00       	call   3603 <exit>
    printf("create dd/ff/ff succeeded!\n");
    1fc9:	83 ec 0c             	sub    $0xc,%esp
    1fcc:	68 0f 44 00 00       	push   $0x440f
    1fd1:	e8 ca 19 00 00       	call   39a0 <printf>
    exit();
    1fd6:	e8 28 16 00 00       	call   3603 <exit>
    printf("open (unlinked) dd/dd/ff succeeded!\n");
    1fdb:	83 ec 0c             	sub    $0xc,%esp
    1fde:	68 f4 4d 00 00       	push   $0x4df4
    1fe3:	e8 b8 19 00 00       	call   39a0 <printf>
    exit();
    1fe8:	e8 16 16 00 00       	call   3603 <exit>
    printf("mkdir dd/ff/ff succeeded!\n");
    1fed:	83 ec 0c             	sub    $0xc,%esp
    1ff0:	68 a3 44 00 00       	push   $0x44a3
    1ff5:	e8 a6 19 00 00       	call   39a0 <printf>
    exit();
    1ffa:	e8 04 16 00 00       	call   3603 <exit>
    printf("link dd/ff dd/dd/ffff succeeded!\n");
    1fff:	83 ec 0c             	sub    $0xc,%esp
    2002:	68 64 4e 00 00       	push   $0x4e64
    2007:	e8 94 19 00 00       	call   39a0 <printf>
    exit();
    200c:	e8 f2 15 00 00       	call   3603 <exit>
    printf("open dd/dd/../ff failed\n");
    2011:	83 ec 0c             	sub    $0xc,%esp
    2014:	68 1e 43 00 00       	push   $0x431e
    2019:	e8 82 19 00 00       	call   39a0 <printf>
    exit();
    201e:	e8 e0 15 00 00       	call   3603 <exit>
    printf("create dd/dd/ff failed\n");
    2023:	83 ec 0c             	sub    $0xc,%esp
    2026:	68 f7 42 00 00       	push   $0x42f7
    202b:	e8 70 19 00 00       	call   39a0 <printf>
    exit();
    2030:	e8 ce 15 00 00       	call   3603 <exit>
    printf("chdir ./.. failed\n");
    2035:	83 ec 0c             	sub    $0xc,%esp
    2038:	68 c0 43 00 00       	push   $0x43c0
    203d:	e8 5e 19 00 00       	call   39a0 <printf>
    exit();
    2042:	e8 bc 15 00 00       	call   3603 <exit>
    printf("link dd/dd/ff dd/dd/ffff failed\n");
    2047:	83 ec 0c             	sub    $0xc,%esp
    204a:	68 ac 4d 00 00       	push   $0x4dac
    204f:	e8 4c 19 00 00       	call   39a0 <printf>
    exit();
    2054:	e8 aa 15 00 00       	call   3603 <exit>
    printf("link dd/xx/ff dd/dd/xx succeeded!\n");
    2059:	83 ec 0c             	sub    $0xc,%esp
    205c:	68 40 4e 00 00       	push   $0x4e40
    2061:	e8 3a 19 00 00       	call   39a0 <printf>
    exit();
    2066:	e8 98 15 00 00       	call   3603 <exit>
    printf("link dd/ff/ff dd/dd/xx succeeded!\n");
    206b:	83 ec 0c             	sub    $0xc,%esp
    206e:	68 1c 4e 00 00       	push   $0x4e1c
    2073:	e8 28 19 00 00       	call   39a0 <printf>
    exit();
    2078:	e8 86 15 00 00       	call   3603 <exit>
    printf("open dd wronly succeeded!\n");
    207d:	83 ec 0c             	sub    $0xc,%esp
    2080:	68 7f 44 00 00       	push   $0x447f
    2085:	e8 16 19 00 00       	call   39a0 <printf>
    exit();
    208a:	e8 74 15 00 00       	call   3603 <exit>
    printf("open dd rdwr succeeded!\n");
    208f:	83 ec 0c             	sub    $0xc,%esp
    2092:	68 66 44 00 00       	push   $0x4466
    2097:	e8 04 19 00 00       	call   39a0 <printf>
    exit();
    209c:	e8 62 15 00 00       	call   3603 <exit>
    printf("create dd succeeded!\n");
    20a1:	83 ec 0c             	sub    $0xc,%esp
    20a4:	68 50 44 00 00       	push   $0x4450
    20a9:	e8 f2 18 00 00       	call   39a0 <printf>
    exit();
    20ae:	e8 50 15 00 00       	call   3603 <exit>
    printf("create dd/xx/ff succeeded!\n");
    20b3:	83 ec 0c             	sub    $0xc,%esp
    20b6:	68 34 44 00 00       	push   $0x4434
    20bb:	e8 e0 18 00 00       	call   39a0 <printf>
    exit();
    20c0:	e8 3e 15 00 00       	call   3603 <exit>
    printf("chdir dd failed\n");
    20c5:	83 ec 0c             	sub    $0xc,%esp
    20c8:	68 75 43 00 00       	push   $0x4375
    20cd:	e8 ce 18 00 00       	call   39a0 <printf>
    exit();
    20d2:	e8 2c 15 00 00       	call   3603 <exit>
    printf("open (unlinked) dd/dd/ff succeeded\n");
    20d7:	83 ec 0c             	sub    $0xc,%esp
    20da:	68 d0 4d 00 00       	push   $0x4dd0
    20df:	e8 bc 18 00 00       	call   39a0 <printf>
    exit();
    20e4:	e8 1a 15 00 00       	call   3603 <exit>
    printf("subdir mkdir dd/dd failed\n");
    20e9:	83 ec 0c             	sub    $0xc,%esp
    20ec:	68 d3 42 00 00       	push   $0x42d3
    20f1:	e8 aa 18 00 00       	call   39a0 <printf>
    exit();
    20f6:	e8 08 15 00 00       	call   3603 <exit>
    printf("unlink dd (non-empty dir) succeeded!\n");
    20fb:	83 ec 0c             	sub    $0xc,%esp
    20fe:	68 84 4d 00 00       	push   $0x4d84
    2103:	e8 98 18 00 00       	call   39a0 <printf>
    exit();
    2108:	e8 f6 14 00 00       	call   3603 <exit>
    printf("create dd/ff failed\n");
    210d:	83 ec 0c             	sub    $0xc,%esp
    2110:	68 b7 42 00 00       	push   $0x42b7
    2115:	e8 86 18 00 00       	call   39a0 <printf>
    exit();
    211a:	e8 e4 14 00 00       	call   3603 <exit>
    printf("subdir mkdir dd failed\n");
    211f:	83 ec 0c             	sub    $0xc,%esp
    2122:	68 9f 42 00 00       	push   $0x429f
    2127:	e8 74 18 00 00       	call   39a0 <printf>
    exit();
    212c:	e8 d2 14 00 00       	call   3603 <exit>
    printf("unlink dd failed\n");
    2131:	83 ec 0c             	sub    $0xc,%esp
    2134:	68 88 45 00 00       	push   $0x4588
    2139:	e8 62 18 00 00       	call   39a0 <printf>
    exit();
    213e:	e8 c0 14 00 00       	call   3603 <exit>
    printf("unlink dd/dd failed\n");
    2143:	83 ec 0c             	sub    $0xc,%esp
    2146:	68 73 45 00 00       	push   $0x4573
    214b:	e8 50 18 00 00       	call   39a0 <printf>
    exit();
    2150:	e8 ae 14 00 00       	call   3603 <exit>
    printf("unlink non-empty dd succeeded!\n");
    2155:	83 ec 0c             	sub    $0xc,%esp
    2158:	68 88 4e 00 00       	push   $0x4e88
    215d:	e8 3e 18 00 00       	call   39a0 <printf>
    exit();
    2162:	e8 9c 14 00 00       	call   3603 <exit>
    printf("unlink dd/ff failed\n");
    2167:	83 ec 0c             	sub    $0xc,%esp
    216a:	68 5e 45 00 00       	push   $0x455e
    216f:	e8 2c 18 00 00       	call   39a0 <printf>
    exit();
    2174:	e8 8a 14 00 00       	call   3603 <exit>
    printf("chdir dd/xx succeeded!\n");
    2179:	83 ec 0c             	sub    $0xc,%esp
    217c:	68 46 45 00 00       	push   $0x4546
    2181:	e8 1a 18 00 00       	call   39a0 <printf>
    exit();
    2186:	e8 78 14 00 00       	call   3603 <exit>
    printf("chdir dd/ff succeeded!\n");
    218b:	83 ec 0c             	sub    $0xc,%esp
    218e:	68 2e 45 00 00       	push   $0x452e
    2193:	e8 08 18 00 00       	call   39a0 <printf>
    exit();
    2198:	e8 66 14 00 00       	call   3603 <exit>
    printf("unlink dd/ff/ff succeeded!\n");
    219d:	83 ec 0c             	sub    $0xc,%esp
    21a0:	68 12 45 00 00       	push   $0x4512
    21a5:	e8 f6 17 00 00       	call   39a0 <printf>
    exit();
    21aa:	e8 54 14 00 00       	call   3603 <exit>
    printf("unlink dd/xx/ff succeeded!\n");
    21af:	83 ec 0c             	sub    $0xc,%esp
    21b2:	68 f6 44 00 00       	push   $0x44f6
    21b7:	e8 e4 17 00 00       	call   39a0 <printf>
    exit();
    21bc:	e8 42 14 00 00       	call   3603 <exit>
    printf("mkdir dd/dd/ffff succeeded!\n");
    21c1:	83 ec 0c             	sub    $0xc,%esp
    21c4:	68 d9 44 00 00       	push   $0x44d9
    21c9:	e8 d2 17 00 00       	call   39a0 <printf>
    exit();
    21ce:	e8 30 14 00 00       	call   3603 <exit>
    printf("mkdir dd/xx/ff succeeded!\n");
    21d3:	83 ec 0c             	sub    $0xc,%esp
    21d6:	68 be 44 00 00       	push   $0x44be
    21db:	e8 c0 17 00 00       	call   39a0 <printf>
    exit();
    21e0:	e8 1e 14 00 00       	call   3603 <exit>
    printf("read dd/dd/ffff wrong len\n");
    21e5:	83 ec 0c             	sub    $0xc,%esp
    21e8:	68 eb 43 00 00       	push   $0x43eb
    21ed:	e8 ae 17 00 00       	call   39a0 <printf>
    exit();
    21f2:	e8 0c 14 00 00       	call   3603 <exit>
    printf("open dd/dd/ffff failed\n");
    21f7:	83 ec 0c             	sub    $0xc,%esp
    21fa:	68 d3 43 00 00       	push   $0x43d3
    21ff:	e8 9c 17 00 00       	call   39a0 <printf>
    exit();
    2204:	e8 fa 13 00 00       	call   3603 <exit>
    2209:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00002210 <bigwrite>:
{
    2210:	55                   	push   %ebp
    2211:	89 e5                	mov    %esp,%ebp
    2213:	56                   	push   %esi
    2214:	53                   	push   %ebx
  for(sz = 499; sz < 12*512; sz += 471){
    2215:	bb f3 01 00 00       	mov    $0x1f3,%ebx
  printf("bigwrite test\n");
    221a:	83 ec 0c             	sub    $0xc,%esp
    221d:	68 a5 45 00 00       	push   $0x45a5
    2222:	e8 79 17 00 00       	call   39a0 <printf>
  unlink("bigwrite");
    2227:	c7 04 24 b4 45 00 00 	movl   $0x45b4,(%esp)
    222e:	e8 20 14 00 00       	call   3653 <unlink>
    2233:	83 c4 10             	add    $0x10,%esp
    2236:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    223d:	8d 76 00             	lea    0x0(%esi),%esi
    fd = open("bigwrite", O_CREATE | O_RDWR);
    2240:	83 ec 08             	sub    $0x8,%esp
    2243:	68 02 02 00 00       	push   $0x202
    2248:	68 b4 45 00 00       	push   $0x45b4
    224d:	e8 f1 13 00 00       	call   3643 <open>
    if(fd < 0){
    2252:	83 c4 10             	add    $0x10,%esp
    fd = open("bigwrite", O_CREATE | O_RDWR);
    2255:	89 c6                	mov    %eax,%esi
    if(fd < 0){
    2257:	85 c0                	test   %eax,%eax
    2259:	78 7d                	js     22d8 <bigwrite+0xc8>
      int cc = write(fd, buf, sz);
    225b:	83 ec 04             	sub    $0x4,%esp
    225e:	53                   	push   %ebx
    225f:	68 a0 7a 00 00       	push   $0x7aa0
    2264:	50                   	push   %eax
    2265:	e8 b9 13 00 00       	call   3623 <write>
      if(cc != sz){
    226a:	83 c4 10             	add    $0x10,%esp
    226d:	39 d8                	cmp    %ebx,%eax
    226f:	75 53                	jne    22c4 <bigwrite+0xb4>
      int cc = write(fd, buf, sz);
    2271:	83 ec 04             	sub    $0x4,%esp
    2274:	53                   	push   %ebx
    2275:	68 a0 7a 00 00       	push   $0x7aa0
    227a:	56                   	push   %esi
    227b:	e8 a3 13 00 00       	call   3623 <write>
      if(cc != sz){
    2280:	83 c4 10             	add    $0x10,%esp
    2283:	39 d8                	cmp    %ebx,%eax
    2285:	75 3d                	jne    22c4 <bigwrite+0xb4>
    close(fd);
    2287:	83 ec 0c             	sub    $0xc,%esp
  for(sz = 499; sz < 12*512; sz += 471){
    228a:	81 c3 d7 01 00 00    	add    $0x1d7,%ebx
    close(fd);
    2290:	56                   	push   %esi
    2291:	e8 95 13 00 00       	call   362b <close>
    unlink("bigwrite");
    2296:	c7 04 24 b4 45 00 00 	movl   $0x45b4,(%esp)
    229d:	e8 b1 13 00 00       	call   3653 <unlink>
  for(sz = 499; sz < 12*512; sz += 471){
    22a2:	83 c4 10             	add    $0x10,%esp
    22a5:	81 fb 07 18 00 00    	cmp    $0x1807,%ebx
    22ab:	75 93                	jne    2240 <bigwrite+0x30>
  printf("bigwrite ok\n");
    22ad:	83 ec 0c             	sub    $0xc,%esp
    22b0:	68 e7 45 00 00       	push   $0x45e7
    22b5:	e8 e6 16 00 00       	call   39a0 <printf>
}
    22ba:	83 c4 10             	add    $0x10,%esp
    22bd:	8d 65 f8             	lea    -0x8(%ebp),%esp
    22c0:	5b                   	pop    %ebx
    22c1:	5e                   	pop    %esi
    22c2:	5d                   	pop    %ebp
    22c3:	c3                   	ret    
        printf("write(%d) ret %d\n", sz, cc);
    22c4:	83 ec 04             	sub    $0x4,%esp
    22c7:	50                   	push   %eax
    22c8:	53                   	push   %ebx
    22c9:	68 d5 45 00 00       	push   $0x45d5
    22ce:	e8 cd 16 00 00       	call   39a0 <printf>
        exit();
    22d3:	e8 2b 13 00 00       	call   3603 <exit>
      printf("cannot create bigwrite\n");
    22d8:	83 ec 0c             	sub    $0xc,%esp
    22db:	68 bd 45 00 00       	push   $0x45bd
    22e0:	e8 bb 16 00 00       	call   39a0 <printf>
      exit();
    22e5:	e8 19 13 00 00       	call   3603 <exit>
    22ea:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

000022f0 <bigfile>:
{
    22f0:	55                   	push   %ebp
    22f1:	89 e5                	mov    %esp,%ebp
    22f3:	57                   	push   %edi
    22f4:	56                   	push   %esi
    22f5:	53                   	push   %ebx
    22f6:	83 ec 18             	sub    $0x18,%esp
  printf("bigfile test\n");
    22f9:	68 f4 45 00 00       	push   $0x45f4
    22fe:	e8 9d 16 00 00       	call   39a0 <printf>
  unlink("bigfile");
    2303:	c7 04 24 10 46 00 00 	movl   $0x4610,(%esp)
    230a:	e8 44 13 00 00       	call   3653 <unlink>
  fd = open("bigfile", O_CREATE | O_RDWR);
    230f:	59                   	pop    %ecx
    2310:	5b                   	pop    %ebx
    2311:	68 02 02 00 00       	push   $0x202
    2316:	68 10 46 00 00       	push   $0x4610
    231b:	e8 23 13 00 00       	call   3643 <open>
  if(fd < 0){
    2320:	83 c4 10             	add    $0x10,%esp
    2323:	85 c0                	test   %eax,%eax
    2325:	0f 88 55 01 00 00    	js     2480 <bigfile+0x190>
    232b:	89 c6                	mov    %eax,%esi
  for(i = 0; i < 20; i++){
    232d:	31 db                	xor    %ebx,%ebx
    232f:	90                   	nop
    memset(buf, i, 600);
    2330:	83 ec 04             	sub    $0x4,%esp
    2333:	68 58 02 00 00       	push   $0x258
    2338:	53                   	push   %ebx
    2339:	68 a0 7a 00 00       	push   $0x7aa0
    233e:	e8 2d 11 00 00       	call   3470 <memset>
    if(write(fd, buf, 600) != 600){
    2343:	83 c4 0c             	add    $0xc,%esp
    2346:	68 58 02 00 00       	push   $0x258
    234b:	68 a0 7a 00 00       	push   $0x7aa0
    2350:	56                   	push   %esi
    2351:	e8 cd 12 00 00       	call   3623 <write>
    2356:	83 c4 10             	add    $0x10,%esp
    2359:	3d 58 02 00 00       	cmp    $0x258,%eax
    235e:	0f 85 f8 00 00 00    	jne    245c <bigfile+0x16c>
  for(i = 0; i < 20; i++){
    2364:	83 c3 01             	add    $0x1,%ebx
    2367:	83 fb 14             	cmp    $0x14,%ebx
    236a:	75 c4                	jne    2330 <bigfile+0x40>
  close(fd);
    236c:	83 ec 0c             	sub    $0xc,%esp
    236f:	56                   	push   %esi
    2370:	e8 b6 12 00 00       	call   362b <close>
  fd = open("bigfile", 0);
    2375:	58                   	pop    %eax
    2376:	5a                   	pop    %edx
    2377:	6a 00                	push   $0x0
    2379:	68 10 46 00 00       	push   $0x4610
    237e:	e8 c0 12 00 00       	call   3643 <open>
  if(fd < 0){
    2383:	83 c4 10             	add    $0x10,%esp
  fd = open("bigfile", 0);
    2386:	89 c6                	mov    %eax,%esi
  if(fd < 0){
    2388:	85 c0                	test   %eax,%eax
    238a:	0f 88 de 00 00 00    	js     246e <bigfile+0x17e>
  total = 0;
    2390:	31 db                	xor    %ebx,%ebx
  for(i = 0; ; i++){
    2392:	31 ff                	xor    %edi,%edi
    2394:	eb 38                	jmp    23ce <bigfile+0xde>
    2396:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    239d:	8d 76 00             	lea    0x0(%esi),%esi
    if(cc != 300){
    23a0:	3d 2c 01 00 00       	cmp    $0x12c,%eax
    23a5:	0f 85 8d 00 00 00    	jne    2438 <bigfile+0x148>
    if(buf[0] != i/2 || buf[299] != i/2){
    23ab:	89 fa                	mov    %edi,%edx
    23ad:	0f be 05 a0 7a 00 00 	movsbl 0x7aa0,%eax
    23b4:	d1 fa                	sar    %edx
    23b6:	39 d0                	cmp    %edx,%eax
    23b8:	75 6c                	jne    2426 <bigfile+0x136>
    23ba:	0f be 15 cb 7b 00 00 	movsbl 0x7bcb,%edx
    23c1:	39 d0                	cmp    %edx,%eax
    23c3:	75 61                	jne    2426 <bigfile+0x136>
    total += cc;
    23c5:	81 c3 2c 01 00 00    	add    $0x12c,%ebx
  for(i = 0; ; i++){
    23cb:	83 c7 01             	add    $0x1,%edi
    cc = read(fd, buf, 300);
    23ce:	83 ec 04             	sub    $0x4,%esp
    23d1:	68 2c 01 00 00       	push   $0x12c
    23d6:	68 a0 7a 00 00       	push   $0x7aa0
    23db:	56                   	push   %esi
    23dc:	e8 3a 12 00 00       	call   361b <read>
    if(cc < 0){
    23e1:	83 c4 10             	add    $0x10,%esp
    23e4:	85 c0                	test   %eax,%eax
    23e6:	78 62                	js     244a <bigfile+0x15a>
    if(cc == 0)
    23e8:	75 b6                	jne    23a0 <bigfile+0xb0>
  close(fd);
    23ea:	83 ec 0c             	sub    $0xc,%esp
    23ed:	56                   	push   %esi
    23ee:	e8 38 12 00 00       	call   362b <close>
  if(total != 20*600){
    23f3:	83 c4 10             	add    $0x10,%esp
    23f6:	81 fb e0 2e 00 00    	cmp    $0x2ee0,%ebx
    23fc:	0f 85 90 00 00 00    	jne    2492 <bigfile+0x1a2>
  unlink("bigfile");
    2402:	83 ec 0c             	sub    $0xc,%esp
    2405:	68 10 46 00 00       	push   $0x4610
    240a:	e8 44 12 00 00       	call   3653 <unlink>
  printf("bigfile test ok\n");
    240f:	c7 04 24 9f 46 00 00 	movl   $0x469f,(%esp)
    2416:	e8 85 15 00 00       	call   39a0 <printf>
}
    241b:	83 c4 10             	add    $0x10,%esp
    241e:	8d 65 f4             	lea    -0xc(%ebp),%esp
    2421:	5b                   	pop    %ebx
    2422:	5e                   	pop    %esi
    2423:	5f                   	pop    %edi
    2424:	5d                   	pop    %ebp
    2425:	c3                   	ret    
      printf("read bigfile wrong data\n");
    2426:	83 ec 0c             	sub    $0xc,%esp
    2429:	68 6c 46 00 00       	push   $0x466c
    242e:	e8 6d 15 00 00       	call   39a0 <printf>
      exit();
    2433:	e8 cb 11 00 00       	call   3603 <exit>
      printf("short read bigfile\n");
    2438:	83 ec 0c             	sub    $0xc,%esp
    243b:	68 58 46 00 00       	push   $0x4658
    2440:	e8 5b 15 00 00       	call   39a0 <printf>
      exit();
    2445:	e8 b9 11 00 00       	call   3603 <exit>
      printf("read bigfile failed\n");
    244a:	83 ec 0c             	sub    $0xc,%esp
    244d:	68 43 46 00 00       	push   $0x4643
    2452:	e8 49 15 00 00       	call   39a0 <printf>
      exit();
    2457:	e8 a7 11 00 00       	call   3603 <exit>
      printf("write bigfile failed\n");
    245c:	83 ec 0c             	sub    $0xc,%esp
    245f:	68 18 46 00 00       	push   $0x4618
    2464:	e8 37 15 00 00       	call   39a0 <printf>
      exit();
    2469:	e8 95 11 00 00       	call   3603 <exit>
    printf("cannot open bigfile\n");
    246e:	83 ec 0c             	sub    $0xc,%esp
    2471:	68 2e 46 00 00       	push   $0x462e
    2476:	e8 25 15 00 00       	call   39a0 <printf>
    exit();
    247b:	e8 83 11 00 00       	call   3603 <exit>
    printf("cannot create bigfile");
    2480:	83 ec 0c             	sub    $0xc,%esp
    2483:	68 02 46 00 00       	push   $0x4602
    2488:	e8 13 15 00 00       	call   39a0 <printf>
    exit();
    248d:	e8 71 11 00 00       	call   3603 <exit>
    printf("read bigfile wrong total\n");
    2492:	83 ec 0c             	sub    $0xc,%esp
    2495:	68 85 46 00 00       	push   $0x4685
    249a:	e8 01 15 00 00       	call   39a0 <printf>
    exit();
    249f:	e8 5f 11 00 00       	call   3603 <exit>
    24a4:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    24ab:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    24af:	90                   	nop

000024b0 <fourteen>:
{
    24b0:	55                   	push   %ebp
    24b1:	89 e5                	mov    %esp,%ebp
    24b3:	83 ec 14             	sub    $0x14,%esp
  printf("fourteen test\n");
    24b6:	68 b0 46 00 00       	push   $0x46b0
    24bb:	e8 e0 14 00 00       	call   39a0 <printf>
  if(mkdir("12345678901234") != 0){
    24c0:	c7 04 24 eb 46 00 00 	movl   $0x46eb,(%esp)
    24c7:	e8 9f 11 00 00       	call   366b <mkdir>
    24cc:	83 c4 10             	add    $0x10,%esp
    24cf:	85 c0                	test   %eax,%eax
    24d1:	0f 85 95 00 00 00    	jne    256c <fourteen+0xbc>
  if(mkdir("12345678901234/123456789012345") != 0){
    24d7:	83 ec 0c             	sub    $0xc,%esp
    24da:	68 a8 4e 00 00       	push   $0x4ea8
    24df:	e8 87 11 00 00       	call   366b <mkdir>
    24e4:	83 c4 10             	add    $0x10,%esp
    24e7:	85 c0                	test   %eax,%eax
    24e9:	0f 85 d7 00 00 00    	jne    25c6 <fourteen+0x116>
  fd = open("123456789012345/123456789012345/123456789012345", O_CREATE);
    24ef:	83 ec 08             	sub    $0x8,%esp
    24f2:	68 00 02 00 00       	push   $0x200
    24f7:	68 f8 4e 00 00       	push   $0x4ef8
    24fc:	e8 42 11 00 00       	call   3643 <open>
  if(fd < 0){
    2501:	83 c4 10             	add    $0x10,%esp
    2504:	85 c0                	test   %eax,%eax
    2506:	0f 88 a8 00 00 00    	js     25b4 <fourteen+0x104>
  close(fd);
    250c:	83 ec 0c             	sub    $0xc,%esp
    250f:	50                   	push   %eax
    2510:	e8 16 11 00 00       	call   362b <close>
  fd = open("12345678901234/12345678901234/12345678901234", 0);
    2515:	58                   	pop    %eax
    2516:	5a                   	pop    %edx
    2517:	6a 00                	push   $0x0
    2519:	68 68 4f 00 00       	push   $0x4f68
    251e:	e8 20 11 00 00       	call   3643 <open>
  if(fd < 0){
    2523:	83 c4 10             	add    $0x10,%esp
    2526:	85 c0                	test   %eax,%eax
    2528:	78 78                	js     25a2 <fourteen+0xf2>
  close(fd);
    252a:	83 ec 0c             	sub    $0xc,%esp
    252d:	50                   	push   %eax
    252e:	e8 f8 10 00 00       	call   362b <close>
  if(mkdir("12345678901234/12345678901234") == 0){
    2533:	c7 04 24 dc 46 00 00 	movl   $0x46dc,(%esp)
    253a:	e8 2c 11 00 00       	call   366b <mkdir>
    253f:	83 c4 10             	add    $0x10,%esp
    2542:	85 c0                	test   %eax,%eax
    2544:	74 4a                	je     2590 <fourteen+0xe0>
  if(mkdir("123456789012345/12345678901234") == 0){
    2546:	83 ec 0c             	sub    $0xc,%esp
    2549:	68 04 50 00 00       	push   $0x5004
    254e:	e8 18 11 00 00       	call   366b <mkdir>
    2553:	83 c4 10             	add    $0x10,%esp
    2556:	85 c0                	test   %eax,%eax
    2558:	74 24                	je     257e <fourteen+0xce>
  printf("fourteen ok\n");
    255a:	83 ec 0c             	sub    $0xc,%esp
    255d:	68 fa 46 00 00       	push   $0x46fa
    2562:	e8 39 14 00 00       	call   39a0 <printf>
}
    2567:	83 c4 10             	add    $0x10,%esp
    256a:	c9                   	leave  
    256b:	c3                   	ret    
    printf("mkdir 12345678901234 failed\n");
    256c:	83 ec 0c             	sub    $0xc,%esp
    256f:	68 bf 46 00 00       	push   $0x46bf
    2574:	e8 27 14 00 00       	call   39a0 <printf>
    exit();
    2579:	e8 85 10 00 00       	call   3603 <exit>
    printf("mkdir 12345678901234/123456789012345 succeeded!\n");
    257e:	83 ec 0c             	sub    $0xc,%esp
    2581:	68 24 50 00 00       	push   $0x5024
    2586:	e8 15 14 00 00       	call   39a0 <printf>
    exit();
    258b:	e8 73 10 00 00       	call   3603 <exit>
    printf("mkdir 12345678901234/12345678901234 succeeded!\n");
    2590:	83 ec 0c             	sub    $0xc,%esp
    2593:	68 d4 4f 00 00       	push   $0x4fd4
    2598:	e8 03 14 00 00       	call   39a0 <printf>
    exit();
    259d:	e8 61 10 00 00       	call   3603 <exit>
    printf("open 12345678901234/12345678901234/12345678901234 failed\n");
    25a2:	83 ec 0c             	sub    $0xc,%esp
    25a5:	68 98 4f 00 00       	push   $0x4f98
    25aa:	e8 f1 13 00 00       	call   39a0 <printf>
    exit();
    25af:	e8 4f 10 00 00       	call   3603 <exit>
    printf("create 123456789012345/123456789012345/123456789012345 failed\n");
    25b4:	83 ec 0c             	sub    $0xc,%esp
    25b7:	68 28 4f 00 00       	push   $0x4f28
    25bc:	e8 df 13 00 00       	call   39a0 <printf>
    exit();
    25c1:	e8 3d 10 00 00       	call   3603 <exit>
    printf("mkdir 12345678901234/123456789012345 failed\n");
    25c6:	83 ec 0c             	sub    $0xc,%esp
    25c9:	68 c8 4e 00 00       	push   $0x4ec8
    25ce:	e8 cd 13 00 00       	call   39a0 <printf>
    exit();
    25d3:	e8 2b 10 00 00       	call   3603 <exit>
    25d8:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    25df:	90                   	nop

000025e0 <rmdot>:
{
    25e0:	55                   	push   %ebp
    25e1:	89 e5                	mov    %esp,%ebp
    25e3:	83 ec 14             	sub    $0x14,%esp
  printf("rmdot test\n");
    25e6:	68 07 47 00 00       	push   $0x4707
    25eb:	e8 b0 13 00 00       	call   39a0 <printf>
  if(mkdir("dots") != 0){
    25f0:	c7 04 24 13 47 00 00 	movl   $0x4713,(%esp)
    25f7:	e8 6f 10 00 00       	call   366b <mkdir>
    25fc:	83 c4 10             	add    $0x10,%esp
    25ff:	85 c0                	test   %eax,%eax
    2601:	0f 85 ae 00 00 00    	jne    26b5 <rmdot+0xd5>
  if(chdir("dots") != 0){
    2607:	83 ec 0c             	sub    $0xc,%esp
    260a:	68 13 47 00 00       	push   $0x4713
    260f:	e8 5f 10 00 00       	call   3673 <chdir>
    2614:	83 c4 10             	add    $0x10,%esp
    2617:	85 c0                	test   %eax,%eax
    2619:	0f 85 14 01 00 00    	jne    2733 <rmdot+0x153>
  if(unlink(".") == 0){
    261f:	83 ec 0c             	sub    $0xc,%esp
    2622:	68 be 43 00 00       	push   $0x43be
    2627:	e8 27 10 00 00       	call   3653 <unlink>
    262c:	83 c4 10             	add    $0x10,%esp
    262f:	85 c0                	test   %eax,%eax
    2631:	0f 84 ea 00 00 00    	je     2721 <rmdot+0x141>
  if(unlink("..") == 0){
    2637:	83 ec 0c             	sub    $0xc,%esp
    263a:	68 bd 43 00 00       	push   $0x43bd
    263f:	e8 0f 10 00 00       	call   3653 <unlink>
    2644:	83 c4 10             	add    $0x10,%esp
    2647:	85 c0                	test   %eax,%eax
    2649:	0f 84 c0 00 00 00    	je     270f <rmdot+0x12f>
  if(chdir("/") != 0){
    264f:	83 ec 0c             	sub    $0xc,%esp
    2652:	68 91 3b 00 00       	push   $0x3b91
    2657:	e8 17 10 00 00       	call   3673 <chdir>
    265c:	83 c4 10             	add    $0x10,%esp
    265f:	85 c0                	test   %eax,%eax
    2661:	0f 85 96 00 00 00    	jne    26fd <rmdot+0x11d>
  if(unlink("dots/.") == 0){
    2667:	83 ec 0c             	sub    $0xc,%esp
    266a:	68 5b 47 00 00       	push   $0x475b
    266f:	e8 df 0f 00 00       	call   3653 <unlink>
    2674:	83 c4 10             	add    $0x10,%esp
    2677:	85 c0                	test   %eax,%eax
    2679:	74 70                	je     26eb <rmdot+0x10b>
  if(unlink("dots/..") == 0){
    267b:	83 ec 0c             	sub    $0xc,%esp
    267e:	68 79 47 00 00       	push   $0x4779
    2683:	e8 cb 0f 00 00       	call   3653 <unlink>
    2688:	83 c4 10             	add    $0x10,%esp
    268b:	85 c0                	test   %eax,%eax
    268d:	74 4a                	je     26d9 <rmdot+0xf9>
  if(unlink("dots") != 0){
    268f:	83 ec 0c             	sub    $0xc,%esp
    2692:	68 13 47 00 00       	push   $0x4713
    2697:	e8 b7 0f 00 00       	call   3653 <unlink>
    269c:	83 c4 10             	add    $0x10,%esp
    269f:	85 c0                	test   %eax,%eax
    26a1:	75 24                	jne    26c7 <rmdot+0xe7>
  printf("rmdot ok\n");
    26a3:	83 ec 0c             	sub    $0xc,%esp
    26a6:	68 ae 47 00 00       	push   $0x47ae
    26ab:	e8 f0 12 00 00       	call   39a0 <printf>
}
    26b0:	83 c4 10             	add    $0x10,%esp
    26b3:	c9                   	leave  
    26b4:	c3                   	ret    
    printf("mkdir dots failed\n");
    26b5:	83 ec 0c             	sub    $0xc,%esp
    26b8:	68 18 47 00 00       	push   $0x4718
    26bd:	e8 de 12 00 00       	call   39a0 <printf>
    exit();
    26c2:	e8 3c 0f 00 00       	call   3603 <exit>
    printf("unlink dots failed!\n");
    26c7:	83 ec 0c             	sub    $0xc,%esp
    26ca:	68 99 47 00 00       	push   $0x4799
    26cf:	e8 cc 12 00 00       	call   39a0 <printf>
    exit();
    26d4:	e8 2a 0f 00 00       	call   3603 <exit>
    printf("unlink dots/.. worked!\n");
    26d9:	83 ec 0c             	sub    $0xc,%esp
    26dc:	68 81 47 00 00       	push   $0x4781
    26e1:	e8 ba 12 00 00       	call   39a0 <printf>
    exit();
    26e6:	e8 18 0f 00 00       	call   3603 <exit>
    printf("unlink dots/. worked!\n");
    26eb:	83 ec 0c             	sub    $0xc,%esp
    26ee:	68 62 47 00 00       	push   $0x4762
    26f3:	e8 a8 12 00 00       	call   39a0 <printf>
    exit();
    26f8:	e8 06 0f 00 00       	call   3603 <exit>
    printf("chdir / failed\n");
    26fd:	83 ec 0c             	sub    $0xc,%esp
    2700:	68 93 3b 00 00       	push   $0x3b93
    2705:	e8 96 12 00 00       	call   39a0 <printf>
    exit();
    270a:	e8 f4 0e 00 00       	call   3603 <exit>
    printf("rm .. worked!\n");
    270f:	83 ec 0c             	sub    $0xc,%esp
    2712:	68 4c 47 00 00       	push   $0x474c
    2717:	e8 84 12 00 00       	call   39a0 <printf>
    exit();
    271c:	e8 e2 0e 00 00       	call   3603 <exit>
    printf("rm . worked!\n");
    2721:	83 ec 0c             	sub    $0xc,%esp
    2724:	68 3e 47 00 00       	push   $0x473e
    2729:	e8 72 12 00 00       	call   39a0 <printf>
    exit();
    272e:	e8 d0 0e 00 00       	call   3603 <exit>
    printf("chdir dots failed\n");
    2733:	83 ec 0c             	sub    $0xc,%esp
    2736:	68 2b 47 00 00       	push   $0x472b
    273b:	e8 60 12 00 00       	call   39a0 <printf>
    exit();
    2740:	e8 be 0e 00 00       	call   3603 <exit>
    2745:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    274c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00002750 <dirfile>:
{
    2750:	55                   	push   %ebp
    2751:	89 e5                	mov    %esp,%ebp
    2753:	53                   	push   %ebx
    2754:	83 ec 10             	sub    $0x10,%esp
  printf("dir vs file\n");
    2757:	68 b8 47 00 00       	push   $0x47b8
    275c:	e8 3f 12 00 00       	call   39a0 <printf>
  fd = open("dirfile", O_CREATE);
    2761:	58                   	pop    %eax
    2762:	5a                   	pop    %edx
    2763:	68 00 02 00 00       	push   $0x200
    2768:	68 c5 47 00 00       	push   $0x47c5
    276d:	e8 d1 0e 00 00       	call   3643 <open>
  if(fd < 0){
    2772:	83 c4 10             	add    $0x10,%esp
    2775:	85 c0                	test   %eax,%eax
    2777:	0f 88 3f 01 00 00    	js     28bc <dirfile+0x16c>
  close(fd);
    277d:	83 ec 0c             	sub    $0xc,%esp
    2780:	50                   	push   %eax
    2781:	e8 a5 0e 00 00       	call   362b <close>
  if(chdir("dirfile") == 0){
    2786:	c7 04 24 c5 47 00 00 	movl   $0x47c5,(%esp)
    278d:	e8 e1 0e 00 00       	call   3673 <chdir>
    2792:	83 c4 10             	add    $0x10,%esp
    2795:	85 c0                	test   %eax,%eax
    2797:	0f 84 0d 01 00 00    	je     28aa <dirfile+0x15a>
  fd = open("dirfile/xx", 0);
    279d:	83 ec 08             	sub    $0x8,%esp
    27a0:	6a 00                	push   $0x0
    27a2:	68 fe 47 00 00       	push   $0x47fe
    27a7:	e8 97 0e 00 00       	call   3643 <open>
  if(fd >= 0){
    27ac:	83 c4 10             	add    $0x10,%esp
    27af:	85 c0                	test   %eax,%eax
    27b1:	0f 89 e1 00 00 00    	jns    2898 <dirfile+0x148>
  fd = open("dirfile/xx", O_CREATE);
    27b7:	83 ec 08             	sub    $0x8,%esp
    27ba:	68 00 02 00 00       	push   $0x200
    27bf:	68 fe 47 00 00       	push   $0x47fe
    27c4:	e8 7a 0e 00 00       	call   3643 <open>
  if(fd >= 0){
    27c9:	83 c4 10             	add    $0x10,%esp
    27cc:	85 c0                	test   %eax,%eax
    27ce:	0f 89 c4 00 00 00    	jns    2898 <dirfile+0x148>
  if(mkdir("dirfile/xx") == 0){
    27d4:	83 ec 0c             	sub    $0xc,%esp
    27d7:	68 fe 47 00 00       	push   $0x47fe
    27dc:	e8 8a 0e 00 00       	call   366b <mkdir>
    27e1:	83 c4 10             	add    $0x10,%esp
    27e4:	85 c0                	test   %eax,%eax
    27e6:	0f 84 3c 01 00 00    	je     2928 <dirfile+0x1d8>
  if(unlink("dirfile/xx") == 0){
    27ec:	83 ec 0c             	sub    $0xc,%esp
    27ef:	68 fe 47 00 00       	push   $0x47fe
    27f4:	e8 5a 0e 00 00       	call   3653 <unlink>
    27f9:	83 c4 10             	add    $0x10,%esp
    27fc:	85 c0                	test   %eax,%eax
    27fe:	0f 84 12 01 00 00    	je     2916 <dirfile+0x1c6>
  if(link("README", "dirfile/xx") == 0){
    2804:	83 ec 08             	sub    $0x8,%esp
    2807:	68 fe 47 00 00       	push   $0x47fe
    280c:	68 62 48 00 00       	push   $0x4862
    2811:	e8 4d 0e 00 00       	call   3663 <link>
    2816:	83 c4 10             	add    $0x10,%esp
    2819:	85 c0                	test   %eax,%eax
    281b:	0f 84 e3 00 00 00    	je     2904 <dirfile+0x1b4>
  if(unlink("dirfile") != 0){
    2821:	83 ec 0c             	sub    $0xc,%esp
    2824:	68 c5 47 00 00       	push   $0x47c5
    2829:	e8 25 0e 00 00       	call   3653 <unlink>
    282e:	83 c4 10             	add    $0x10,%esp
    2831:	85 c0                	test   %eax,%eax
    2833:	0f 85 b9 00 00 00    	jne    28f2 <dirfile+0x1a2>
  fd = open(".", O_RDWR);
    2839:	83 ec 08             	sub    $0x8,%esp
    283c:	6a 02                	push   $0x2
    283e:	68 be 43 00 00       	push   $0x43be
    2843:	e8 fb 0d 00 00       	call   3643 <open>
  if(fd >= 0){
    2848:	83 c4 10             	add    $0x10,%esp
    284b:	85 c0                	test   %eax,%eax
    284d:	0f 89 8d 00 00 00    	jns    28e0 <dirfile+0x190>
  fd = open(".", 0);
    2853:	83 ec 08             	sub    $0x8,%esp
    2856:	6a 00                	push   $0x0
    2858:	68 be 43 00 00       	push   $0x43be
    285d:	e8 e1 0d 00 00       	call   3643 <open>
  if(write(fd, "x", 1) > 0){
    2862:	83 c4 0c             	add    $0xc,%esp
    2865:	6a 01                	push   $0x1
  fd = open(".", 0);
    2867:	89 c3                	mov    %eax,%ebx
  if(write(fd, "x", 1) > 0){
    2869:	68 a1 44 00 00       	push   $0x44a1
    286e:	50                   	push   %eax
    286f:	e8 af 0d 00 00       	call   3623 <write>
    2874:	83 c4 10             	add    $0x10,%esp
    2877:	85 c0                	test   %eax,%eax
    2879:	7f 53                	jg     28ce <dirfile+0x17e>
  close(fd);
    287b:	83 ec 0c             	sub    $0xc,%esp
    287e:	53                   	push   %ebx
    287f:	e8 a7 0d 00 00       	call   362b <close>
  printf("dir vs file OK\n");
    2884:	c7 04 24 95 48 00 00 	movl   $0x4895,(%esp)
    288b:	e8 10 11 00 00       	call   39a0 <printf>
}
    2890:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    2893:	83 c4 10             	add    $0x10,%esp
    2896:	c9                   	leave  
    2897:	c3                   	ret    
    printf("create dirfile/xx succeeded!\n");
    2898:	83 ec 0c             	sub    $0xc,%esp
    289b:	68 09 48 00 00       	push   $0x4809
    28a0:	e8 fb 10 00 00       	call   39a0 <printf>
    exit();
    28a5:	e8 59 0d 00 00       	call   3603 <exit>
    printf("chdir dirfile succeeded!\n");
    28aa:	83 ec 0c             	sub    $0xc,%esp
    28ad:	68 e4 47 00 00       	push   $0x47e4
    28b2:	e8 e9 10 00 00       	call   39a0 <printf>
    exit();
    28b7:	e8 47 0d 00 00       	call   3603 <exit>
    printf("create dirfile failed\n");
    28bc:	83 ec 0c             	sub    $0xc,%esp
    28bf:	68 cd 47 00 00       	push   $0x47cd
    28c4:	e8 d7 10 00 00       	call   39a0 <printf>
    exit();
    28c9:	e8 35 0d 00 00       	call   3603 <exit>
    printf("write . succeeded!\n");
    28ce:	83 ec 0c             	sub    $0xc,%esp
    28d1:	68 81 48 00 00       	push   $0x4881
    28d6:	e8 c5 10 00 00       	call   39a0 <printf>
    exit();
    28db:	e8 23 0d 00 00       	call   3603 <exit>
    printf("open . for writing succeeded!\n");
    28e0:	83 ec 0c             	sub    $0xc,%esp
    28e3:	68 78 50 00 00       	push   $0x5078
    28e8:	e8 b3 10 00 00       	call   39a0 <printf>
    exit();
    28ed:	e8 11 0d 00 00       	call   3603 <exit>
    printf("unlink dirfile failed!\n");
    28f2:	83 ec 0c             	sub    $0xc,%esp
    28f5:	68 69 48 00 00       	push   $0x4869
    28fa:	e8 a1 10 00 00       	call   39a0 <printf>
    exit();
    28ff:	e8 ff 0c 00 00       	call   3603 <exit>
    printf("link to dirfile/xx succeeded!\n");
    2904:	83 ec 0c             	sub    $0xc,%esp
    2907:	68 58 50 00 00       	push   $0x5058
    290c:	e8 8f 10 00 00       	call   39a0 <printf>
    exit();
    2911:	e8 ed 0c 00 00       	call   3603 <exit>
    printf("unlink dirfile/xx succeeded!\n");
    2916:	83 ec 0c             	sub    $0xc,%esp
    2919:	68 44 48 00 00       	push   $0x4844
    291e:	e8 7d 10 00 00       	call   39a0 <printf>
    exit();
    2923:	e8 db 0c 00 00       	call   3603 <exit>
    printf("mkdir dirfile/xx succeeded!\n");
    2928:	83 ec 0c             	sub    $0xc,%esp
    292b:	68 27 48 00 00       	push   $0x4827
    2930:	e8 6b 10 00 00       	call   39a0 <printf>
    exit();
    2935:	e8 c9 0c 00 00       	call   3603 <exit>
    293a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00002940 <iref>:
{
    2940:	55                   	push   %ebp
    2941:	89 e5                	mov    %esp,%ebp
    2943:	53                   	push   %ebx
  printf("empty file name\n");
    2944:	bb 33 00 00 00       	mov    $0x33,%ebx
{
    2949:	83 ec 10             	sub    $0x10,%esp
  printf("empty file name\n");
    294c:	68 a5 48 00 00       	push   $0x48a5
    2951:	e8 4a 10 00 00       	call   39a0 <printf>
    2956:	83 c4 10             	add    $0x10,%esp
    2959:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    if(mkdir("irefd") != 0){
    2960:	83 ec 0c             	sub    $0xc,%esp
    2963:	68 b6 48 00 00       	push   $0x48b6
    2968:	e8 fe 0c 00 00       	call   366b <mkdir>
    296d:	83 c4 10             	add    $0x10,%esp
    2970:	85 c0                	test   %eax,%eax
    2972:	0f 85 b9 00 00 00    	jne    2a31 <iref+0xf1>
    if(chdir("irefd") != 0){
    2978:	83 ec 0c             	sub    $0xc,%esp
    297b:	68 b6 48 00 00       	push   $0x48b6
    2980:	e8 ee 0c 00 00       	call   3673 <chdir>
    2985:	83 c4 10             	add    $0x10,%esp
    2988:	85 c0                	test   %eax,%eax
    298a:	0f 85 b3 00 00 00    	jne    2a43 <iref+0x103>
    mkdir("");
    2990:	83 ec 0c             	sub    $0xc,%esp
    2993:	68 6b 3f 00 00       	push   $0x3f6b
    2998:	e8 ce 0c 00 00       	call   366b <mkdir>
    link("README", "");
    299d:	58                   	pop    %eax
    299e:	5a                   	pop    %edx
    299f:	68 6b 3f 00 00       	push   $0x3f6b
    29a4:	68 62 48 00 00       	push   $0x4862
    29a9:	e8 b5 0c 00 00       	call   3663 <link>
    fd = open("", O_CREATE);
    29ae:	59                   	pop    %ecx
    29af:	58                   	pop    %eax
    29b0:	68 00 02 00 00       	push   $0x200
    29b5:	68 6b 3f 00 00       	push   $0x3f6b
    29ba:	e8 84 0c 00 00       	call   3643 <open>
    if(fd >= 0)
    29bf:	83 c4 10             	add    $0x10,%esp
    29c2:	85 c0                	test   %eax,%eax
    29c4:	78 0c                	js     29d2 <iref+0x92>
      close(fd);
    29c6:	83 ec 0c             	sub    $0xc,%esp
    29c9:	50                   	push   %eax
    29ca:	e8 5c 0c 00 00       	call   362b <close>
    29cf:	83 c4 10             	add    $0x10,%esp
    fd = open("xx", O_CREATE);
    29d2:	83 ec 08             	sub    $0x8,%esp
    29d5:	68 00 02 00 00       	push   $0x200
    29da:	68 a0 44 00 00       	push   $0x44a0
    29df:	e8 5f 0c 00 00       	call   3643 <open>
    if(fd >= 0)
    29e4:	83 c4 10             	add    $0x10,%esp
    29e7:	85 c0                	test   %eax,%eax
    29e9:	78 0c                	js     29f7 <iref+0xb7>
      close(fd);
    29eb:	83 ec 0c             	sub    $0xc,%esp
    29ee:	50                   	push   %eax
    29ef:	e8 37 0c 00 00       	call   362b <close>
    29f4:	83 c4 10             	add    $0x10,%esp
    unlink("xx");
    29f7:	83 ec 0c             	sub    $0xc,%esp
    29fa:	68 a0 44 00 00       	push   $0x44a0
    29ff:	e8 4f 0c 00 00       	call   3653 <unlink>
  for(i = 0; i < 50 + 1; i++){
    2a04:	83 c4 10             	add    $0x10,%esp
    2a07:	83 eb 01             	sub    $0x1,%ebx
    2a0a:	0f 85 50 ff ff ff    	jne    2960 <iref+0x20>
  chdir("/");
    2a10:	83 ec 0c             	sub    $0xc,%esp
    2a13:	68 91 3b 00 00       	push   $0x3b91
    2a18:	e8 56 0c 00 00       	call   3673 <chdir>
  printf("empty file name OK\n");
    2a1d:	c7 04 24 e4 48 00 00 	movl   $0x48e4,(%esp)
    2a24:	e8 77 0f 00 00       	call   39a0 <printf>
}
    2a29:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    2a2c:	83 c4 10             	add    $0x10,%esp
    2a2f:	c9                   	leave  
    2a30:	c3                   	ret    
      printf("mkdir irefd failed\n");
    2a31:	83 ec 0c             	sub    $0xc,%esp
    2a34:	68 bc 48 00 00       	push   $0x48bc
    2a39:	e8 62 0f 00 00       	call   39a0 <printf>
      exit();
    2a3e:	e8 c0 0b 00 00       	call   3603 <exit>
      printf("chdir irefd failed\n");
    2a43:	83 ec 0c             	sub    $0xc,%esp
    2a46:	68 d0 48 00 00       	push   $0x48d0
    2a4b:	e8 50 0f 00 00       	call   39a0 <printf>
      exit();
    2a50:	e8 ae 0b 00 00       	call   3603 <exit>
    2a55:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    2a5c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00002a60 <forktest>:
{
    2a60:	55                   	push   %ebp
    2a61:	89 e5                	mov    %esp,%ebp
    2a63:	53                   	push   %ebx
  for(n=0; n<1000; n++){
    2a64:	31 db                	xor    %ebx,%ebx
{
    2a66:	83 ec 10             	sub    $0x10,%esp
  printf("fork test\n");
    2a69:	68 f8 48 00 00       	push   $0x48f8
    2a6e:	e8 2d 0f 00 00       	call   39a0 <printf>
    2a73:	83 c4 10             	add    $0x10,%esp
    2a76:	eb 15                	jmp    2a8d <forktest+0x2d>
    2a78:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    2a7f:	90                   	nop
    if(pid == 0)
    2a80:	74 48                	je     2aca <forktest+0x6a>
  for(n=0; n<1000; n++){
    2a82:	83 c3 01             	add    $0x1,%ebx
    2a85:	81 fb e8 03 00 00    	cmp    $0x3e8,%ebx
    2a8b:	74 66                	je     2af3 <forktest+0x93>
    pid = fork();
    2a8d:	e8 69 0b 00 00       	call   35fb <fork>
    if(pid < 0)
    2a92:	85 c0                	test   %eax,%eax
    2a94:	79 ea                	jns    2a80 <forktest+0x20>
  for(; n > 0; n--){
    2a96:	85 db                	test   %ebx,%ebx
    2a98:	74 14                	je     2aae <forktest+0x4e>
    2a9a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    if(wait() < 0){
    2aa0:	e8 66 0b 00 00       	call   360b <wait>
    2aa5:	85 c0                	test   %eax,%eax
    2aa7:	78 26                	js     2acf <forktest+0x6f>
  for(; n > 0; n--){
    2aa9:	83 eb 01             	sub    $0x1,%ebx
    2aac:	75 f2                	jne    2aa0 <forktest+0x40>
  if(wait() != -1){
    2aae:	e8 58 0b 00 00       	call   360b <wait>
    2ab3:	83 f8 ff             	cmp    $0xffffffff,%eax
    2ab6:	75 29                	jne    2ae1 <forktest+0x81>
  printf("fork test OK\n");
    2ab8:	83 ec 0c             	sub    $0xc,%esp
    2abb:	68 2a 49 00 00       	push   $0x492a
    2ac0:	e8 db 0e 00 00       	call   39a0 <printf>
}
    2ac5:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    2ac8:	c9                   	leave  
    2ac9:	c3                   	ret    
      exit();
    2aca:	e8 34 0b 00 00       	call   3603 <exit>
      printf("wait stopped early\n");
    2acf:	83 ec 0c             	sub    $0xc,%esp
    2ad2:	68 03 49 00 00       	push   $0x4903
    2ad7:	e8 c4 0e 00 00       	call   39a0 <printf>
      exit();
    2adc:	e8 22 0b 00 00       	call   3603 <exit>
    printf("wait got too many\n");
    2ae1:	83 ec 0c             	sub    $0xc,%esp
    2ae4:	68 17 49 00 00       	push   $0x4917
    2ae9:	e8 b2 0e 00 00       	call   39a0 <printf>
    exit();
    2aee:	e8 10 0b 00 00       	call   3603 <exit>
    printf("fork claimed to work 1000 times!\n");
    2af3:	83 ec 0c             	sub    $0xc,%esp
    2af6:	68 98 50 00 00       	push   $0x5098
    2afb:	e8 a0 0e 00 00       	call   39a0 <printf>
    exit();
    2b00:	e8 fe 0a 00 00       	call   3603 <exit>
    2b05:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    2b0c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00002b10 <sbrktest>:
{
    2b10:	55                   	push   %ebp
    2b11:	89 e5                	mov    %esp,%ebp
    2b13:	57                   	push   %edi
    2b14:	56                   	push   %esi
  for(i = 0; i < 5000; i++){
    2b15:	31 f6                	xor    %esi,%esi
{
    2b17:	53                   	push   %ebx
    2b18:	83 ec 68             	sub    $0x68,%esp
  printf("sbrk test\n");
    2b1b:	68 38 49 00 00       	push   $0x4938
    2b20:	e8 7b 0e 00 00       	call   39a0 <printf>
  oldbrk = sbrk(0);
    2b25:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    2b2c:	e8 5a 0b 00 00       	call   368b <sbrk>
  a = sbrk(0);
    2b31:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  oldbrk = sbrk(0);
    2b38:	89 45 a4             	mov    %eax,-0x5c(%ebp)
  a = sbrk(0);
    2b3b:	e8 4b 0b 00 00       	call   368b <sbrk>
    2b40:	83 c4 10             	add    $0x10,%esp
    2b43:	89 c3                	mov    %eax,%ebx
  for(i = 0; i < 5000; i++){
    2b45:	eb 0b                	jmp    2b52 <sbrktest+0x42>
    2b47:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    2b4e:	66 90                	xchg   %ax,%ax
    a = b + 1;
    2b50:	89 c3                	mov    %eax,%ebx
    b = sbrk(1);
    2b52:	83 ec 0c             	sub    $0xc,%esp
    2b55:	6a 01                	push   $0x1
    2b57:	e8 2f 0b 00 00       	call   368b <sbrk>
    if(b != a){
    2b5c:	83 c4 10             	add    $0x10,%esp
    2b5f:	39 d8                	cmp    %ebx,%eax
    2b61:	0f 85 99 02 00 00    	jne    2e00 <sbrktest+0x2f0>
  for(i = 0; i < 5000; i++){
    2b67:	83 c6 01             	add    $0x1,%esi
    *b = 1;
    2b6a:	c6 03 01             	movb   $0x1,(%ebx)
    a = b + 1;
    2b6d:	8d 43 01             	lea    0x1(%ebx),%eax
  for(i = 0; i < 5000; i++){
    2b70:	81 fe 88 13 00 00    	cmp    $0x1388,%esi
    2b76:	75 d8                	jne    2b50 <sbrktest+0x40>
  pid = fork();
    2b78:	e8 7e 0a 00 00       	call   35fb <fork>
    2b7d:	89 c6                	mov    %eax,%esi
  if(pid < 0){
    2b7f:	85 c0                	test   %eax,%eax
    2b81:	0f 88 e0 02 00 00    	js     2e67 <sbrktest+0x357>
  c = sbrk(1);
    2b87:	83 ec 0c             	sub    $0xc,%esp
  if(c != a + 1){
    2b8a:	83 c3 02             	add    $0x2,%ebx
  c = sbrk(1);
    2b8d:	6a 01                	push   $0x1
    2b8f:	e8 f7 0a 00 00       	call   368b <sbrk>
  c = sbrk(1);
    2b94:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    2b9b:	e8 eb 0a 00 00       	call   368b <sbrk>
  if(c != a + 1){
    2ba0:	83 c4 10             	add    $0x10,%esp
    2ba3:	39 c3                	cmp    %eax,%ebx
    2ba5:	0f 85 09 03 00 00    	jne    2eb4 <sbrktest+0x3a4>
  if(pid == 0)
    2bab:	85 f6                	test   %esi,%esi
    2bad:	0f 84 fc 02 00 00    	je     2eaf <sbrktest+0x39f>
  wait();
    2bb3:	e8 53 0a 00 00       	call   360b <wait>
  a = sbrk(0);
    2bb8:	83 ec 0c             	sub    $0xc,%esp
    2bbb:	6a 00                	push   $0x0
    2bbd:	e8 c9 0a 00 00       	call   368b <sbrk>
    2bc2:	89 c3                	mov    %eax,%ebx
  amt = (BIG) - (uint)a;
    2bc4:	b8 00 00 40 06       	mov    $0x6400000,%eax
    2bc9:	29 d8                	sub    %ebx,%eax
  p = sbrk(amt);
    2bcb:	89 04 24             	mov    %eax,(%esp)
    2bce:	e8 b8 0a 00 00       	call   368b <sbrk>
  if (p != a) {
    2bd3:	83 c4 10             	add    $0x10,%esp
    2bd6:	39 c3                	cmp    %eax,%ebx
    2bd8:	0f 85 77 02 00 00    	jne    2e55 <sbrktest+0x345>
  a = sbrk(0);
    2bde:	83 ec 0c             	sub    $0xc,%esp
  *lastaddr = 99;
    2be1:	c6 05 ff ff 3f 06 63 	movb   $0x63,0x63fffff
  a = sbrk(0);
    2be8:	6a 00                	push   $0x0
    2bea:	e8 9c 0a 00 00       	call   368b <sbrk>
  c = sbrk(-4096);
    2bef:	c7 04 24 00 f0 ff ff 	movl   $0xfffff000,(%esp)
  a = sbrk(0);
    2bf6:	89 c3                	mov    %eax,%ebx
  c = sbrk(-4096);
    2bf8:	e8 8e 0a 00 00       	call   368b <sbrk>
  if(c == (char*)0xffffffff){
    2bfd:	83 c4 10             	add    $0x10,%esp
    2c00:	83 f8 ff             	cmp    $0xffffffff,%eax
    2c03:	0f 84 e1 02 00 00    	je     2eea <sbrktest+0x3da>
  c = sbrk(0);
    2c09:	83 ec 0c             	sub    $0xc,%esp
    2c0c:	6a 00                	push   $0x0
    2c0e:	e8 78 0a 00 00       	call   368b <sbrk>
  if(c != a - 4096){
    2c13:	8d 93 00 f0 ff ff    	lea    -0x1000(%ebx),%edx
    2c19:	83 c4 10             	add    $0x10,%esp
    2c1c:	39 d0                	cmp    %edx,%eax
    2c1e:	0f 85 b4 02 00 00    	jne    2ed8 <sbrktest+0x3c8>
  a = sbrk(0);
    2c24:	83 ec 0c             	sub    $0xc,%esp
    2c27:	6a 00                	push   $0x0
    2c29:	e8 5d 0a 00 00       	call   368b <sbrk>
  c = sbrk(4096);
    2c2e:	c7 04 24 00 10 00 00 	movl   $0x1000,(%esp)
  a = sbrk(0);
    2c35:	89 c3                	mov    %eax,%ebx
  c = sbrk(4096);
    2c37:	e8 4f 0a 00 00       	call   368b <sbrk>
  if(c != a || sbrk(0) != a + 4096){
    2c3c:	83 c4 10             	add    $0x10,%esp
  c = sbrk(4096);
    2c3f:	89 c6                	mov    %eax,%esi
  if(c != a || sbrk(0) != a + 4096){
    2c41:	39 c3                	cmp    %eax,%ebx
    2c43:	0f 85 7d 02 00 00    	jne    2ec6 <sbrktest+0x3b6>
    2c49:	83 ec 0c             	sub    $0xc,%esp
    2c4c:	6a 00                	push   $0x0
    2c4e:	e8 38 0a 00 00       	call   368b <sbrk>
    2c53:	8d 93 00 10 00 00    	lea    0x1000(%ebx),%edx
    2c59:	83 c4 10             	add    $0x10,%esp
    2c5c:	39 c2                	cmp    %eax,%edx
    2c5e:	0f 85 62 02 00 00    	jne    2ec6 <sbrktest+0x3b6>
  if(*lastaddr == 99){
    2c64:	80 3d ff ff 3f 06 63 	cmpb   $0x63,0x63fffff
    2c6b:	0f 84 08 02 00 00    	je     2e79 <sbrktest+0x369>
  a = sbrk(0);
    2c71:	83 ec 0c             	sub    $0xc,%esp
    2c74:	6a 00                	push   $0x0
    2c76:	e8 10 0a 00 00       	call   368b <sbrk>
  c = sbrk(-(sbrk(0) - oldbrk));
    2c7b:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  a = sbrk(0);
    2c82:	89 c3                	mov    %eax,%ebx
  c = sbrk(-(sbrk(0) - oldbrk));
    2c84:	e8 02 0a 00 00       	call   368b <sbrk>
    2c89:	89 c2                	mov    %eax,%edx
    2c8b:	8b 45 a4             	mov    -0x5c(%ebp),%eax
    2c8e:	29 d0                	sub    %edx,%eax
    2c90:	89 04 24             	mov    %eax,(%esp)
    2c93:	e8 f3 09 00 00       	call   368b <sbrk>
  if(c != a){
    2c98:	83 c4 10             	add    $0x10,%esp
    2c9b:	39 c3                	cmp    %eax,%ebx
    2c9d:	0f 85 a0 01 00 00    	jne    2e43 <sbrktest+0x333>
  for(a = (char*)(KERNBASE); a < (char*) (KERNBASE+2000000); a += 50000){
    2ca3:	bb 00 00 00 80       	mov    $0x80000000,%ebx
    2ca8:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    2caf:	90                   	nop
    ppid = getpid();
    2cb0:	e8 ce 09 00 00       	call   3683 <getpid>
    2cb5:	89 c6                	mov    %eax,%esi
    pid = fork();
    2cb7:	e8 3f 09 00 00       	call   35fb <fork>
    if(pid < 0){
    2cbc:	85 c0                	test   %eax,%eax
    2cbe:	0f 88 4e 01 00 00    	js     2e12 <sbrktest+0x302>
    if(pid == 0){
    2cc4:	0f 84 5a 01 00 00    	je     2e24 <sbrktest+0x314>
    wait();
    2cca:	e8 3c 09 00 00       	call   360b <wait>
  for(a = (char*)(KERNBASE); a < (char*) (KERNBASE+2000000); a += 50000){
    2ccf:	81 c3 50 c3 00 00    	add    $0xc350,%ebx
    2cd5:	81 fb 80 84 1e 80    	cmp    $0x801e8480,%ebx
    2cdb:	75 d3                	jne    2cb0 <sbrktest+0x1a0>
  if(pipe(fds) != 0){
    2cdd:	83 ec 0c             	sub    $0xc,%esp
    2ce0:	8d 45 b8             	lea    -0x48(%ebp),%eax
    2ce3:	50                   	push   %eax
    2ce4:	e8 2a 09 00 00       	call   3613 <pipe>
    2ce9:	83 c4 10             	add    $0x10,%esp
    2cec:	85 c0                	test   %eax,%eax
    2cee:	0f 85 a9 01 00 00    	jne    2e9d <sbrktest+0x38d>
    2cf4:	8d 5d c0             	lea    -0x40(%ebp),%ebx
    2cf7:	8d 75 e8             	lea    -0x18(%ebp),%esi
    2cfa:	89 df                	mov    %ebx,%edi
    2cfc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    if((pids[i] = fork()) == 0){
    2d00:	e8 f6 08 00 00       	call   35fb <fork>
    2d05:	89 07                	mov    %eax,(%edi)
    2d07:	85 c0                	test   %eax,%eax
    2d09:	0f 84 8b 00 00 00    	je     2d9a <sbrktest+0x28a>
    if(pids[i] != -1)
    2d0f:	83 f8 ff             	cmp    $0xffffffff,%eax
    2d12:	74 14                	je     2d28 <sbrktest+0x218>
      read(fds[0], &scratch, 1);
    2d14:	83 ec 04             	sub    $0x4,%esp
    2d17:	8d 45 b7             	lea    -0x49(%ebp),%eax
    2d1a:	6a 01                	push   $0x1
    2d1c:	50                   	push   %eax
    2d1d:	ff 75 b8             	push   -0x48(%ebp)
    2d20:	e8 f6 08 00 00       	call   361b <read>
    2d25:	83 c4 10             	add    $0x10,%esp
  for(i = 0; i < sizeof(pids)/sizeof(pids[0]); i++){
    2d28:	83 c7 04             	add    $0x4,%edi
    2d2b:	39 f7                	cmp    %esi,%edi
    2d2d:	75 d1                	jne    2d00 <sbrktest+0x1f0>
  c = sbrk(4096);
    2d2f:	83 ec 0c             	sub    $0xc,%esp
    2d32:	68 00 10 00 00       	push   $0x1000
    2d37:	e8 4f 09 00 00       	call   368b <sbrk>
    2d3c:	83 c4 10             	add    $0x10,%esp
    2d3f:	89 c7                	mov    %eax,%edi
  for(i = 0; i < sizeof(pids)/sizeof(pids[0]); i++){
    2d41:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    if(pids[i] == -1)
    2d48:	8b 03                	mov    (%ebx),%eax
    2d4a:	83 f8 ff             	cmp    $0xffffffff,%eax
    2d4d:	74 11                	je     2d60 <sbrktest+0x250>
    kill(pids[i]);
    2d4f:	83 ec 0c             	sub    $0xc,%esp
    2d52:	50                   	push   %eax
    2d53:	e8 db 08 00 00       	call   3633 <kill>
    wait();
    2d58:	e8 ae 08 00 00       	call   360b <wait>
    2d5d:	83 c4 10             	add    $0x10,%esp
  for(i = 0; i < sizeof(pids)/sizeof(pids[0]); i++){
    2d60:	83 c3 04             	add    $0x4,%ebx
    2d63:	39 de                	cmp    %ebx,%esi
    2d65:	75 e1                	jne    2d48 <sbrktest+0x238>
  if(c == (char*)0xffffffff){
    2d67:	83 ff ff             	cmp    $0xffffffff,%edi
    2d6a:	0f 84 1b 01 00 00    	je     2e8b <sbrktest+0x37b>
  if(sbrk(0) > oldbrk)
    2d70:	83 ec 0c             	sub    $0xc,%esp
    2d73:	6a 00                	push   $0x0
    2d75:	e8 11 09 00 00       	call   368b <sbrk>
    2d7a:	83 c4 10             	add    $0x10,%esp
    2d7d:	39 45 a4             	cmp    %eax,-0x5c(%ebp)
    2d80:	72 60                	jb     2de2 <sbrktest+0x2d2>
  printf("sbrk test OK\n");
    2d82:	83 ec 0c             	sub    $0xc,%esp
    2d85:	68 e0 49 00 00       	push   $0x49e0
    2d8a:	e8 11 0c 00 00       	call   39a0 <printf>
}
    2d8f:	83 c4 10             	add    $0x10,%esp
    2d92:	8d 65 f4             	lea    -0xc(%ebp),%esp
    2d95:	5b                   	pop    %ebx
    2d96:	5e                   	pop    %esi
    2d97:	5f                   	pop    %edi
    2d98:	5d                   	pop    %ebp
    2d99:	c3                   	ret    
      sbrk(BIG - (uint)sbrk(0));
    2d9a:	83 ec 0c             	sub    $0xc,%esp
    2d9d:	6a 00                	push   $0x0
    2d9f:	e8 e7 08 00 00       	call   368b <sbrk>
    2da4:	89 c2                	mov    %eax,%edx
    2da6:	b8 00 00 40 06       	mov    $0x6400000,%eax
    2dab:	29 d0                	sub    %edx,%eax
    2dad:	89 04 24             	mov    %eax,(%esp)
    2db0:	e8 d6 08 00 00       	call   368b <sbrk>
      write(fds[1], "x", 1);
    2db5:	83 c4 0c             	add    $0xc,%esp
    2db8:	6a 01                	push   $0x1
    2dba:	68 a1 44 00 00       	push   $0x44a1
    2dbf:	ff 75 bc             	push   -0x44(%ebp)
    2dc2:	e8 5c 08 00 00       	call   3623 <write>
    2dc7:	83 c4 10             	add    $0x10,%esp
    2dca:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      for(;;) sleep(1000);
    2dd0:	83 ec 0c             	sub    $0xc,%esp
    2dd3:	68 e8 03 00 00       	push   $0x3e8
    2dd8:	e8 b6 08 00 00       	call   3693 <sleep>
    2ddd:	83 c4 10             	add    $0x10,%esp
    2de0:	eb ee                	jmp    2dd0 <sbrktest+0x2c0>
    sbrk(-(sbrk(0) - oldbrk));
    2de2:	83 ec 0c             	sub    $0xc,%esp
    2de5:	6a 00                	push   $0x0
    2de7:	e8 9f 08 00 00       	call   368b <sbrk>
    2dec:	89 c2                	mov    %eax,%edx
    2dee:	8b 45 a4             	mov    -0x5c(%ebp),%eax
    2df1:	29 d0                	sub    %edx,%eax
    2df3:	89 04 24             	mov    %eax,(%esp)
    2df6:	e8 90 08 00 00       	call   368b <sbrk>
    2dfb:	83 c4 10             	add    $0x10,%esp
    2dfe:	eb 82                	jmp    2d82 <sbrktest+0x272>
      printf("sbrk test failed %d %x %x\n", i, a, b);
    2e00:	50                   	push   %eax
    2e01:	53                   	push   %ebx
    2e02:	56                   	push   %esi
    2e03:	68 43 49 00 00       	push   $0x4943
    2e08:	e8 93 0b 00 00       	call   39a0 <printf>
      exit();
    2e0d:	e8 f1 07 00 00       	call   3603 <exit>
      printf("fork failed\n");
    2e12:	83 ec 0c             	sub    $0xc,%esp
    2e15:	68 89 4a 00 00       	push   $0x4a89
    2e1a:	e8 81 0b 00 00       	call   39a0 <printf>
      exit();
    2e1f:	e8 df 07 00 00       	call   3603 <exit>
      printf("oops could read %x = %x\n", a, *a);
    2e24:	0f be 03             	movsbl (%ebx),%eax
    2e27:	83 ec 04             	sub    $0x4,%esp
    2e2a:	50                   	push   %eax
    2e2b:	53                   	push   %ebx
    2e2c:	68 ac 49 00 00       	push   $0x49ac
    2e31:	e8 6a 0b 00 00       	call   39a0 <printf>
      kill(ppid);
    2e36:	89 34 24             	mov    %esi,(%esp)
    2e39:	e8 f5 07 00 00       	call   3633 <kill>
      exit();
    2e3e:	e8 c0 07 00 00       	call   3603 <exit>
    printf("sbrk downsize failed, a %x c %x\n", a, c);
    2e43:	52                   	push   %edx
    2e44:	50                   	push   %eax
    2e45:	53                   	push   %ebx
    2e46:	68 8c 51 00 00       	push   $0x518c
    2e4b:	e8 50 0b 00 00       	call   39a0 <printf>
    exit();
    2e50:	e8 ae 07 00 00       	call   3603 <exit>
    printf("sbrk test failed to grow big address space; enough phys mem?\n");
    2e55:	83 ec 0c             	sub    $0xc,%esp
    2e58:	68 bc 50 00 00       	push   $0x50bc
    2e5d:	e8 3e 0b 00 00       	call   39a0 <printf>
    exit();
    2e62:	e8 9c 07 00 00       	call   3603 <exit>
    printf("sbrk test fork failed\n");
    2e67:	83 ec 0c             	sub    $0xc,%esp
    2e6a:	68 5e 49 00 00       	push   $0x495e
    2e6f:	e8 2c 0b 00 00       	call   39a0 <printf>
    exit();
    2e74:	e8 8a 07 00 00       	call   3603 <exit>
    printf("sbrk de-allocation didn't really deallocate\n");
    2e79:	83 ec 0c             	sub    $0xc,%esp
    2e7c:	68 5c 51 00 00       	push   $0x515c
    2e81:	e8 1a 0b 00 00       	call   39a0 <printf>
    exit();
    2e86:	e8 78 07 00 00       	call   3603 <exit>
    printf("failed sbrk leaked memory\n");
    2e8b:	83 ec 0c             	sub    $0xc,%esp
    2e8e:	68 c5 49 00 00       	push   $0x49c5
    2e93:	e8 08 0b 00 00       	call   39a0 <printf>
    exit();
    2e98:	e8 66 07 00 00       	call   3603 <exit>
    printf("pipe() failed\n");
    2e9d:	83 ec 0c             	sub    $0xc,%esp
    2ea0:	68 81 3e 00 00       	push   $0x3e81
    2ea5:	e8 f6 0a 00 00       	call   39a0 <printf>
    exit();
    2eaa:	e8 54 07 00 00       	call   3603 <exit>
    exit();
    2eaf:	e8 4f 07 00 00       	call   3603 <exit>
    printf("sbrk test failed post-fork\n");
    2eb4:	83 ec 0c             	sub    $0xc,%esp
    2eb7:	68 75 49 00 00       	push   $0x4975
    2ebc:	e8 df 0a 00 00       	call   39a0 <printf>
    exit();
    2ec1:	e8 3d 07 00 00       	call   3603 <exit>
    printf("sbrk re-allocation failed, a %x c %x\n", a, c);
    2ec6:	51                   	push   %ecx
    2ec7:	56                   	push   %esi
    2ec8:	53                   	push   %ebx
    2ec9:	68 34 51 00 00       	push   $0x5134
    2ece:	e8 cd 0a 00 00       	call   39a0 <printf>
    exit();
    2ed3:	e8 2b 07 00 00       	call   3603 <exit>
    printf("sbrk deallocation produced wrong address, a %x c %x\n", a, c);
    2ed8:	56                   	push   %esi
    2ed9:	50                   	push   %eax
    2eda:	53                   	push   %ebx
    2edb:	68 fc 50 00 00       	push   $0x50fc
    2ee0:	e8 bb 0a 00 00       	call   39a0 <printf>
    exit();
    2ee5:	e8 19 07 00 00       	call   3603 <exit>
    printf("sbrk could not deallocate\n");
    2eea:	83 ec 0c             	sub    $0xc,%esp
    2eed:	68 91 49 00 00       	push   $0x4991
    2ef2:	e8 a9 0a 00 00       	call   39a0 <printf>
    exit();
    2ef7:	e8 07 07 00 00       	call   3603 <exit>
    2efc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00002f00 <validateint>:
}
    2f00:	c3                   	ret    
    2f01:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    2f08:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    2f0f:	90                   	nop

00002f10 <validatetest>:
{
    2f10:	55                   	push   %ebp
    2f11:	89 e5                	mov    %esp,%ebp
    2f13:	56                   	push   %esi
  for(p = 0; p <= (uint)hi; p += 4096){
    2f14:	31 f6                	xor    %esi,%esi
{
    2f16:	53                   	push   %ebx
  printf("validate test\n");
    2f17:	83 ec 0c             	sub    $0xc,%esp
    2f1a:	68 ee 49 00 00       	push   $0x49ee
    2f1f:	e8 7c 0a 00 00       	call   39a0 <printf>
    2f24:	83 c4 10             	add    $0x10,%esp
    2f27:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    2f2e:	66 90                	xchg   %ax,%ax
    if((pid = fork()) == 0){
    2f30:	e8 c6 06 00 00       	call   35fb <fork>
    2f35:	89 c3                	mov    %eax,%ebx
    2f37:	85 c0                	test   %eax,%eax
    2f39:	74 5d                	je     2f98 <validatetest+0x88>
    sleep(0);
    2f3b:	83 ec 0c             	sub    $0xc,%esp
    2f3e:	6a 00                	push   $0x0
    2f40:	e8 4e 07 00 00       	call   3693 <sleep>
    sleep(0);
    2f45:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    2f4c:	e8 42 07 00 00       	call   3693 <sleep>
    kill(pid);
    2f51:	89 1c 24             	mov    %ebx,(%esp)
    2f54:	e8 da 06 00 00       	call   3633 <kill>
    wait();
    2f59:	e8 ad 06 00 00       	call   360b <wait>
    if(link("nosuchfile", (char*)p) != -1){
    2f5e:	58                   	pop    %eax
    2f5f:	5a                   	pop    %edx
    2f60:	56                   	push   %esi
    2f61:	68 fd 49 00 00       	push   $0x49fd
    2f66:	e8 f8 06 00 00       	call   3663 <link>
    2f6b:	83 c4 10             	add    $0x10,%esp
    2f6e:	83 f8 ff             	cmp    $0xffffffff,%eax
    2f71:	75 2a                	jne    2f9d <validatetest+0x8d>
  for(p = 0; p <= (uint)hi; p += 4096){
    2f73:	81 c6 00 10 00 00    	add    $0x1000,%esi
    2f79:	81 fe 00 40 11 00    	cmp    $0x114000,%esi
    2f7f:	75 af                	jne    2f30 <validatetest+0x20>
  printf("validate ok\n");
    2f81:	83 ec 0c             	sub    $0xc,%esp
    2f84:	68 21 4a 00 00       	push   $0x4a21
    2f89:	e8 12 0a 00 00       	call   39a0 <printf>
}
    2f8e:	83 c4 10             	add    $0x10,%esp
    2f91:	8d 65 f8             	lea    -0x8(%ebp),%esp
    2f94:	5b                   	pop    %ebx
    2f95:	5e                   	pop    %esi
    2f96:	5d                   	pop    %ebp
    2f97:	c3                   	ret    
      exit();
    2f98:	e8 66 06 00 00       	call   3603 <exit>
      printf("link should not succeed\n");
    2f9d:	83 ec 0c             	sub    $0xc,%esp
    2fa0:	68 08 4a 00 00       	push   $0x4a08
    2fa5:	e8 f6 09 00 00       	call   39a0 <printf>
      exit();
    2faa:	e8 54 06 00 00       	call   3603 <exit>
    2faf:	90                   	nop

00002fb0 <bsstest>:
{
    2fb0:	55                   	push   %ebp
    2fb1:	89 e5                	mov    %esp,%ebp
    2fb3:	83 ec 14             	sub    $0x14,%esp
  printf("bss test\n");
    2fb6:	68 2e 4a 00 00       	push   $0x4a2e
    2fbb:	e8 e0 09 00 00       	call   39a0 <printf>
    2fc0:	83 c4 10             	add    $0x10,%esp
  for(i = 0; i < sizeof(uninit); i++){
    2fc3:	31 c0                	xor    %eax,%eax
    2fc5:	8d 76 00             	lea    0x0(%esi),%esi
    if(uninit[i] != '\0'){
    2fc8:	80 b8 80 53 00 00 00 	cmpb   $0x0,0x5380(%eax)
    2fcf:	75 1c                	jne    2fed <bsstest+0x3d>
  for(i = 0; i < sizeof(uninit); i++){
    2fd1:	83 c0 01             	add    $0x1,%eax
    2fd4:	3d 10 27 00 00       	cmp    $0x2710,%eax
    2fd9:	75 ed                	jne    2fc8 <bsstest+0x18>
  printf("bss test ok\n");
    2fdb:	83 ec 0c             	sub    $0xc,%esp
    2fde:	68 49 4a 00 00       	push   $0x4a49
    2fe3:	e8 b8 09 00 00       	call   39a0 <printf>
}
    2fe8:	83 c4 10             	add    $0x10,%esp
    2feb:	c9                   	leave  
    2fec:	c3                   	ret    
      printf("bss test failed\n");
    2fed:	83 ec 0c             	sub    $0xc,%esp
    2ff0:	68 38 4a 00 00       	push   $0x4a38
    2ff5:	e8 a6 09 00 00       	call   39a0 <printf>
      exit();
    2ffa:	e8 04 06 00 00       	call   3603 <exit>
    2fff:	90                   	nop

00003000 <bigargtest>:
{
    3000:	55                   	push   %ebp
    3001:	89 e5                	mov    %esp,%ebp
    3003:	83 ec 14             	sub    $0x14,%esp
  unlink("bigarg-ok");
    3006:	68 56 4a 00 00       	push   $0x4a56
    300b:	e8 43 06 00 00       	call   3653 <unlink>
  pid = fork();
    3010:	e8 e6 05 00 00       	call   35fb <fork>
  if(pid == 0){
    3015:	83 c4 10             	add    $0x10,%esp
    3018:	85 c0                	test   %eax,%eax
    301a:	74 44                	je     3060 <bigargtest+0x60>
  } else if(pid < 0){
    301c:	0f 88 b5 00 00 00    	js     30d7 <bigargtest+0xd7>
  wait();
    3022:	e8 e4 05 00 00       	call   360b <wait>
  fd = open("bigarg-ok", 0);
    3027:	83 ec 08             	sub    $0x8,%esp
    302a:	6a 00                	push   $0x0
    302c:	68 56 4a 00 00       	push   $0x4a56
    3031:	e8 0d 06 00 00       	call   3643 <open>
  if(fd < 0){
    3036:	83 c4 10             	add    $0x10,%esp
    3039:	85 c0                	test   %eax,%eax
    303b:	0f 88 84 00 00 00    	js     30c5 <bigargtest+0xc5>
  close(fd);
    3041:	83 ec 0c             	sub    $0xc,%esp
    3044:	50                   	push   %eax
    3045:	e8 e1 05 00 00       	call   362b <close>
  unlink("bigarg-ok");
    304a:	c7 04 24 56 4a 00 00 	movl   $0x4a56,(%esp)
    3051:	e8 fd 05 00 00       	call   3653 <unlink>
}
    3056:	83 c4 10             	add    $0x10,%esp
    3059:	c9                   	leave  
    305a:	c3                   	ret    
    305b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    305f:	90                   	nop
      args[i] = "bigargs test: failed\n                                                                                                                                                                                                       ";
    3060:	c7 04 85 a0 9a 00 00 	movl   $0x51b0,0x9aa0(,%eax,4)
    3067:	b0 51 00 00 
    for(i = 0; i < MAXARG-1; i++)
    306b:	83 c0 01             	add    $0x1,%eax
    306e:	83 f8 1f             	cmp    $0x1f,%eax
    3071:	75 ed                	jne    3060 <bigargtest+0x60>
    args[MAXARG-1] = 0;
    3073:	c7 05 1c 9b 00 00 00 	movl   $0x0,0x9b1c
    307a:	00 00 00 
    printf("bigarg test\n");
    307d:	83 ec 0c             	sub    $0xc,%esp
    3080:	68 60 4a 00 00       	push   $0x4a60
    3085:	e8 16 09 00 00       	call   39a0 <printf>
    exec("echo", args);
    308a:	58                   	pop    %eax
    308b:	5a                   	pop    %edx
    308c:	68 a0 9a 00 00       	push   $0x9aa0
    3091:	68 2d 3c 00 00       	push   $0x3c2d
    3096:	e8 a0 05 00 00       	call   363b <exec>
    printf("bigarg test ok\n");
    309b:	c7 04 24 6d 4a 00 00 	movl   $0x4a6d,(%esp)
    30a2:	e8 f9 08 00 00       	call   39a0 <printf>
    fd = open("bigarg-ok", O_CREATE);
    30a7:	59                   	pop    %ecx
    30a8:	58                   	pop    %eax
    30a9:	68 00 02 00 00       	push   $0x200
    30ae:	68 56 4a 00 00       	push   $0x4a56
    30b3:	e8 8b 05 00 00       	call   3643 <open>
    close(fd);
    30b8:	89 04 24             	mov    %eax,(%esp)
    30bb:	e8 6b 05 00 00       	call   362b <close>
    exit();
    30c0:	e8 3e 05 00 00       	call   3603 <exit>
    printf("bigarg test failed!\n");
    30c5:	83 ec 0c             	sub    $0xc,%esp
    30c8:	68 96 4a 00 00       	push   $0x4a96
    30cd:	e8 ce 08 00 00       	call   39a0 <printf>
    exit();
    30d2:	e8 2c 05 00 00       	call   3603 <exit>
    printf("bigargtest: fork failed\n");
    30d7:	83 ec 0c             	sub    $0xc,%esp
    30da:	68 7d 4a 00 00       	push   $0x4a7d
    30df:	e8 bc 08 00 00       	call   39a0 <printf>
    exit();
    30e4:	e8 1a 05 00 00       	call   3603 <exit>
    30e9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

000030f0 <fsfull>:
{
    30f0:	55                   	push   %ebp
    30f1:	89 e5                	mov    %esp,%ebp
    30f3:	57                   	push   %edi
    30f4:	56                   	push   %esi
  for(nfiles = 0; ; nfiles++){
    30f5:	31 f6                	xor    %esi,%esi
{
    30f7:	53                   	push   %ebx
    30f8:	83 ec 58             	sub    $0x58,%esp
  printf("fsfull test\n");
    30fb:	68 ab 4a 00 00       	push   $0x4aab
    3100:	e8 9b 08 00 00       	call   39a0 <printf>
    3105:	83 c4 10             	add    $0x10,%esp
    3108:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    310f:	90                   	nop
    name[1] = '0' + nfiles / 1000;
    3110:	b8 d3 4d 62 10       	mov    $0x10624dd3,%eax
    name[3] = '0' + (nfiles % 100) / 10;
    3115:	b9 cd cc cc cc       	mov    $0xcccccccd,%ecx
    printf("writing %s\n", name);
    311a:	83 ec 08             	sub    $0x8,%esp
    name[0] = 'f';
    311d:	c6 45 a8 66          	movb   $0x66,-0x58(%ebp)
    name[1] = '0' + nfiles / 1000;
    3121:	f7 e6                	mul    %esi
    name[5] = '\0';
    3123:	c6 45 ad 00          	movb   $0x0,-0x53(%ebp)
    name[1] = '0' + nfiles / 1000;
    3127:	c1 ea 06             	shr    $0x6,%edx
    312a:	8d 42 30             	lea    0x30(%edx),%eax
    312d:	88 45 a9             	mov    %al,-0x57(%ebp)
    name[2] = '0' + (nfiles % 1000) / 100;
    3130:	69 c2 e8 03 00 00    	imul   $0x3e8,%edx,%eax
    3136:	89 f2                	mov    %esi,%edx
    3138:	29 c2                	sub    %eax,%edx
    313a:	b8 1f 85 eb 51       	mov    $0x51eb851f,%eax
    313f:	f7 e2                	mul    %edx
    name[3] = '0' + (nfiles % 100) / 10;
    3141:	b8 1f 85 eb 51       	mov    $0x51eb851f,%eax
    name[2] = '0' + (nfiles % 1000) / 100;
    3146:	c1 ea 05             	shr    $0x5,%edx
    3149:	83 c2 30             	add    $0x30,%edx
    314c:	88 55 aa             	mov    %dl,-0x56(%ebp)
    name[3] = '0' + (nfiles % 100) / 10;
    314f:	f7 e6                	mul    %esi
    3151:	c1 ea 05             	shr    $0x5,%edx
    3154:	6b c2 64             	imul   $0x64,%edx,%eax
    3157:	89 f2                	mov    %esi,%edx
    3159:	29 c2                	sub    %eax,%edx
    315b:	89 d0                	mov    %edx,%eax
    315d:	f7 e1                	mul    %ecx
    name[4] = '0' + (nfiles % 10);
    315f:	89 f0                	mov    %esi,%eax
    name[3] = '0' + (nfiles % 100) / 10;
    3161:	c1 ea 03             	shr    $0x3,%edx
    3164:	83 c2 30             	add    $0x30,%edx
    3167:	88 55 ab             	mov    %dl,-0x55(%ebp)
    name[4] = '0' + (nfiles % 10);
    316a:	f7 e1                	mul    %ecx
    316c:	89 f0                	mov    %esi,%eax
    316e:	c1 ea 03             	shr    $0x3,%edx
    3171:	8d 14 92             	lea    (%edx,%edx,4),%edx
    3174:	01 d2                	add    %edx,%edx
    3176:	29 d0                	sub    %edx,%eax
    3178:	83 c0 30             	add    $0x30,%eax
    317b:	88 45 ac             	mov    %al,-0x54(%ebp)
    printf("writing %s\n", name);
    317e:	8d 45 a8             	lea    -0x58(%ebp),%eax
    3181:	50                   	push   %eax
    3182:	68 b8 4a 00 00       	push   $0x4ab8
    3187:	e8 14 08 00 00       	call   39a0 <printf>
    int fd = open(name, O_CREATE|O_RDWR);
    318c:	58                   	pop    %eax
    318d:	8d 45 a8             	lea    -0x58(%ebp),%eax
    3190:	5a                   	pop    %edx
    3191:	68 02 02 00 00       	push   $0x202
    3196:	50                   	push   %eax
    3197:	e8 a7 04 00 00       	call   3643 <open>
    if(fd < 0){
    319c:	83 c4 10             	add    $0x10,%esp
    int fd = open(name, O_CREATE|O_RDWR);
    319f:	89 c7                	mov    %eax,%edi
    if(fd < 0){
    31a1:	85 c0                	test   %eax,%eax
    31a3:	78 4f                	js     31f4 <fsfull+0x104>
    int total = 0;
    31a5:	31 db                	xor    %ebx,%ebx
    31a7:	eb 09                	jmp    31b2 <fsfull+0xc2>
    31a9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      total += cc;
    31b0:	01 c3                	add    %eax,%ebx
      int cc = write(fd, buf, 512);
    31b2:	83 ec 04             	sub    $0x4,%esp
    31b5:	68 00 02 00 00       	push   $0x200
    31ba:	68 a0 7a 00 00       	push   $0x7aa0
    31bf:	57                   	push   %edi
    31c0:	e8 5e 04 00 00       	call   3623 <write>
      if(cc < 512)
    31c5:	83 c4 10             	add    $0x10,%esp
    31c8:	3d ff 01 00 00       	cmp    $0x1ff,%eax
    31cd:	7f e1                	jg     31b0 <fsfull+0xc0>
    printf("wrote %d bytes\n", total);
    31cf:	83 ec 08             	sub    $0x8,%esp
    31d2:	53                   	push   %ebx
    31d3:	68 d4 4a 00 00       	push   $0x4ad4
    31d8:	e8 c3 07 00 00       	call   39a0 <printf>
    close(fd);
    31dd:	89 3c 24             	mov    %edi,(%esp)
    31e0:	e8 46 04 00 00       	call   362b <close>
    if(total == 0)
    31e5:	83 c4 10             	add    $0x10,%esp
    31e8:	85 db                	test   %ebx,%ebx
    31ea:	74 1c                	je     3208 <fsfull+0x118>
  for(nfiles = 0; ; nfiles++){
    31ec:	83 c6 01             	add    $0x1,%esi
    31ef:	e9 1c ff ff ff       	jmp    3110 <fsfull+0x20>
      printf("open %s failed\n", name);
    31f4:	83 ec 08             	sub    $0x8,%esp
    31f7:	8d 45 a8             	lea    -0x58(%ebp),%eax
    31fa:	50                   	push   %eax
    31fb:	68 c4 4a 00 00       	push   $0x4ac4
    3200:	e8 9b 07 00 00       	call   39a0 <printf>
      break;
    3205:	83 c4 10             	add    $0x10,%esp
    name[1] = '0' + nfiles / 1000;
    3208:	bf d3 4d 62 10       	mov    $0x10624dd3,%edi
    name[2] = '0' + (nfiles % 1000) / 100;
    320d:	bb 1f 85 eb 51       	mov    $0x51eb851f,%ebx
    3212:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    name[1] = '0' + nfiles / 1000;
    3218:	89 f0                	mov    %esi,%eax
    unlink(name);
    321a:	83 ec 0c             	sub    $0xc,%esp
    name[0] = 'f';
    321d:	c6 45 a8 66          	movb   $0x66,-0x58(%ebp)
    name[1] = '0' + nfiles / 1000;
    3221:	f7 e7                	mul    %edi
    name[5] = '\0';
    3223:	c6 45 ad 00          	movb   $0x0,-0x53(%ebp)
    name[1] = '0' + nfiles / 1000;
    3227:	c1 ea 06             	shr    $0x6,%edx
    322a:	8d 42 30             	lea    0x30(%edx),%eax
    322d:	88 45 a9             	mov    %al,-0x57(%ebp)
    name[2] = '0' + (nfiles % 1000) / 100;
    3230:	69 c2 e8 03 00 00    	imul   $0x3e8,%edx,%eax
    3236:	89 f2                	mov    %esi,%edx
    3238:	29 c2                	sub    %eax,%edx
    323a:	89 d0                	mov    %edx,%eax
    323c:	f7 e3                	mul    %ebx
    name[3] = '0' + (nfiles % 100) / 10;
    323e:	89 f0                	mov    %esi,%eax
    name[2] = '0' + (nfiles % 1000) / 100;
    3240:	c1 ea 05             	shr    $0x5,%edx
    3243:	83 c2 30             	add    $0x30,%edx
    3246:	88 55 aa             	mov    %dl,-0x56(%ebp)
    name[3] = '0' + (nfiles % 100) / 10;
    3249:	f7 e3                	mul    %ebx
    324b:	c1 ea 05             	shr    $0x5,%edx
    324e:	6b ca 64             	imul   $0x64,%edx,%ecx
    3251:	89 f2                	mov    %esi,%edx
    3253:	29 ca                	sub    %ecx,%edx
    3255:	b9 cd cc cc cc       	mov    $0xcccccccd,%ecx
    325a:	89 d0                	mov    %edx,%eax
    325c:	f7 e1                	mul    %ecx
    name[4] = '0' + (nfiles % 10);
    325e:	89 f0                	mov    %esi,%eax
    name[3] = '0' + (nfiles % 100) / 10;
    3260:	c1 ea 03             	shr    $0x3,%edx
    3263:	83 c2 30             	add    $0x30,%edx
    3266:	88 55 ab             	mov    %dl,-0x55(%ebp)
    name[4] = '0' + (nfiles % 10);
    3269:	f7 e1                	mul    %ecx
    326b:	89 f0                	mov    %esi,%eax
    nfiles--;
    326d:	83 ee 01             	sub    $0x1,%esi
    name[4] = '0' + (nfiles % 10);
    3270:	c1 ea 03             	shr    $0x3,%edx
    3273:	8d 14 92             	lea    (%edx,%edx,4),%edx
    3276:	01 d2                	add    %edx,%edx
    3278:	29 d0                	sub    %edx,%eax
    327a:	83 c0 30             	add    $0x30,%eax
    327d:	88 45 ac             	mov    %al,-0x54(%ebp)
    unlink(name);
    3280:	8d 45 a8             	lea    -0x58(%ebp),%eax
    3283:	50                   	push   %eax
    3284:	e8 ca 03 00 00       	call   3653 <unlink>
  while(nfiles >= 0){
    3289:	83 c4 10             	add    $0x10,%esp
    328c:	83 fe ff             	cmp    $0xffffffff,%esi
    328f:	75 87                	jne    3218 <fsfull+0x128>
  printf("fsfull test finished\n");
    3291:	83 ec 0c             	sub    $0xc,%esp
    3294:	68 e4 4a 00 00       	push   $0x4ae4
    3299:	e8 02 07 00 00       	call   39a0 <printf>
}
    329e:	83 c4 10             	add    $0x10,%esp
    32a1:	8d 65 f4             	lea    -0xc(%ebp),%esp
    32a4:	5b                   	pop    %ebx
    32a5:	5e                   	pop    %esi
    32a6:	5f                   	pop    %edi
    32a7:	5d                   	pop    %ebp
    32a8:	c3                   	ret    
    32a9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

000032b0 <uio>:
{
    32b0:	55                   	push   %ebp
    32b1:	89 e5                	mov    %esp,%ebp
    32b3:	83 ec 14             	sub    $0x14,%esp
  printf("uio test\n");
    32b6:	68 fa 4a 00 00       	push   $0x4afa
    32bb:	e8 e0 06 00 00       	call   39a0 <printf>
  pid = fork();
    32c0:	e8 36 03 00 00       	call   35fb <fork>
  if(pid == 0){
    32c5:	83 c4 10             	add    $0x10,%esp
    32c8:	85 c0                	test   %eax,%eax
    32ca:	74 19                	je     32e5 <uio+0x35>
  } else if(pid < 0){
    32cc:	78 3b                	js     3309 <uio+0x59>
  wait();
    32ce:	e8 38 03 00 00       	call   360b <wait>
  printf("uio test done\n");
    32d3:	83 ec 0c             	sub    $0xc,%esp
    32d6:	68 04 4b 00 00       	push   $0x4b04
    32db:	e8 c0 06 00 00       	call   39a0 <printf>
}
    32e0:	83 c4 10             	add    $0x10,%esp
    32e3:	c9                   	leave  
    32e4:	c3                   	ret    
    asm volatile("outb %0,%1"::"a"(val), "d" (port));
    32e5:	b8 09 00 00 00       	mov    $0x9,%eax
    32ea:	ba 70 00 00 00       	mov    $0x70,%edx
    32ef:	ee                   	out    %al,(%dx)
    asm volatile("inb %1,%0" : "=a" (val) : "d" (port));
    32f0:	ba 71 00 00 00       	mov    $0x71,%edx
    32f5:	ec                   	in     (%dx),%al
    fprintf(2,"uio: uio succeeded; test FAILED\n");
    32f6:	52                   	push   %edx
    32f7:	52                   	push   %edx
    32f8:	68 90 52 00 00       	push   $0x5290
    32fd:	6a 02                	push   $0x2
    32ff:	e8 7c 06 00 00       	call   3980 <fprintf>
    exit();
    3304:	e8 fa 02 00 00       	call   3603 <exit>
    fprintf(2,"fork failed\n");
    3309:	50                   	push   %eax
    330a:	50                   	push   %eax
    330b:	68 89 4a 00 00       	push   $0x4a89
    3310:	6a 02                	push   $0x2
    3312:	e8 69 06 00 00       	call   3980 <fprintf>
    exit();
    3317:	e8 e7 02 00 00       	call   3603 <exit>
    331c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00003320 <argptest>:
{
    3320:	55                   	push   %ebp
    3321:	89 e5                	mov    %esp,%ebp
    3323:	53                   	push   %ebx
    3324:	83 ec 0c             	sub    $0xc,%esp
  fd = open("init", O_RDONLY);
    3327:	6a 00                	push   $0x0
    3329:	68 13 4b 00 00       	push   $0x4b13
    332e:	e8 10 03 00 00       	call   3643 <open>
  if (fd < 0) {
    3333:	83 c4 10             	add    $0x10,%esp
    3336:	85 c0                	test   %eax,%eax
    3338:	78 37                	js     3371 <argptest+0x51>
  read(fd, sbrk(0) - 1, -1);
    333a:	83 ec 0c             	sub    $0xc,%esp
    333d:	89 c3                	mov    %eax,%ebx
    333f:	6a 00                	push   $0x0
    3341:	e8 45 03 00 00       	call   368b <sbrk>
    3346:	83 c4 0c             	add    $0xc,%esp
    3349:	83 e8 01             	sub    $0x1,%eax
    334c:	6a ff                	push   $0xffffffff
    334e:	50                   	push   %eax
    334f:	53                   	push   %ebx
    3350:	e8 c6 02 00 00       	call   361b <read>
  close(fd);
    3355:	89 1c 24             	mov    %ebx,(%esp)
    3358:	e8 ce 02 00 00       	call   362b <close>
  printf("arg test passed\n");
    335d:	c7 04 24 25 4b 00 00 	movl   $0x4b25,(%esp)
    3364:	e8 37 06 00 00       	call   39a0 <printf>
}
    3369:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    336c:	83 c4 10             	add    $0x10,%esp
    336f:	c9                   	leave  
    3370:	c3                   	ret    
    fprintf(2, "open failed\n");
    3371:	50                   	push   %eax
    3372:	50                   	push   %eax
    3373:	68 18 4b 00 00       	push   $0x4b18
    3378:	6a 02                	push   $0x2
    337a:	e8 01 06 00 00       	call   3980 <fprintf>
    exit();
    337f:	e8 7f 02 00 00       	call   3603 <exit>
    3384:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    338b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    338f:	90                   	nop

00003390 <rand>:
  randstate = randstate * 1664525 + 1013904223;
    3390:	69 05 54 53 00 00 0d 	imul   $0x19660d,0x5354,%eax
    3397:	66 19 00 
    339a:	05 5f f3 6e 3c       	add    $0x3c6ef35f,%eax
    339f:	a3 54 53 00 00       	mov    %eax,0x5354
}
    33a4:	c3                   	ret    
    33a5:	66 90                	xchg   %ax,%ax
    33a7:	66 90                	xchg   %ax,%ax
    33a9:	66 90                	xchg   %ax,%ax
    33ab:	66 90                	xchg   %ax,%ax
    33ad:	66 90                	xchg   %ax,%ax
    33af:	90                   	nop

000033b0 <strcpy>:
#include "user/user.h"
#include "../kernel/x86.h"

char*
strcpy(char *s, const char *t)
{
    33b0:	55                   	push   %ebp
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
    33b1:	31 c0                	xor    %eax,%eax
{
    33b3:	89 e5                	mov    %esp,%ebp
    33b5:	53                   	push   %ebx
    33b6:	8b 4d 08             	mov    0x8(%ebp),%ecx
    33b9:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    33bc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  while((*s++ = *t++) != 0)
    33c0:	0f b6 14 03          	movzbl (%ebx,%eax,1),%edx
    33c4:	88 14 01             	mov    %dl,(%ecx,%eax,1)
    33c7:	83 c0 01             	add    $0x1,%eax
    33ca:	84 d2                	test   %dl,%dl
    33cc:	75 f2                	jne    33c0 <strcpy+0x10>
    ;
  return os;
}
    33ce:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    33d1:	89 c8                	mov    %ecx,%eax
    33d3:	c9                   	leave  
    33d4:	c3                   	ret    
    33d5:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    33dc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

000033e0 <strcmp>:

int
strcmp(const char *p, const char *q)
{
    33e0:	55                   	push   %ebp
    33e1:	89 e5                	mov    %esp,%ebp
    33e3:	53                   	push   %ebx
    33e4:	8b 55 08             	mov    0x8(%ebp),%edx
    33e7:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  while(*p && *p == *q)
    33ea:	0f b6 02             	movzbl (%edx),%eax
    33ed:	84 c0                	test   %al,%al
    33ef:	75 17                	jne    3408 <strcmp+0x28>
    33f1:	eb 3a                	jmp    342d <strcmp+0x4d>
    33f3:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    33f7:	90                   	nop
    33f8:	0f b6 42 01          	movzbl 0x1(%edx),%eax
    p++, q++;
    33fc:	83 c2 01             	add    $0x1,%edx
    33ff:	8d 59 01             	lea    0x1(%ecx),%ebx
  while(*p && *p == *q)
    3402:	84 c0                	test   %al,%al
    3404:	74 1a                	je     3420 <strcmp+0x40>
    p++, q++;
    3406:	89 d9                	mov    %ebx,%ecx
  while(*p && *p == *q)
    3408:	0f b6 19             	movzbl (%ecx),%ebx
    340b:	38 c3                	cmp    %al,%bl
    340d:	74 e9                	je     33f8 <strcmp+0x18>
  return (uchar)*p - (uchar)*q;
    340f:	29 d8                	sub    %ebx,%eax
}
    3411:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    3414:	c9                   	leave  
    3415:	c3                   	ret    
    3416:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    341d:	8d 76 00             	lea    0x0(%esi),%esi
  return (uchar)*p - (uchar)*q;
    3420:	0f b6 59 01          	movzbl 0x1(%ecx),%ebx
    3424:	31 c0                	xor    %eax,%eax
    3426:	29 d8                	sub    %ebx,%eax
}
    3428:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    342b:	c9                   	leave  
    342c:	c3                   	ret    
  return (uchar)*p - (uchar)*q;
    342d:	0f b6 19             	movzbl (%ecx),%ebx
    3430:	31 c0                	xor    %eax,%eax
    3432:	eb db                	jmp    340f <strcmp+0x2f>
    3434:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    343b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    343f:	90                   	nop

00003440 <strlen>:

uint
strlen(const char *s)
{
    3440:	55                   	push   %ebp
    3441:	89 e5                	mov    %esp,%ebp
    3443:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  for(n = 0; s[n]; n++)
    3446:	80 3a 00             	cmpb   $0x0,(%edx)
    3449:	74 15                	je     3460 <strlen+0x20>
    344b:	31 c0                	xor    %eax,%eax
    344d:	8d 76 00             	lea    0x0(%esi),%esi
    3450:	83 c0 01             	add    $0x1,%eax
    3453:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
    3457:	89 c1                	mov    %eax,%ecx
    3459:	75 f5                	jne    3450 <strlen+0x10>
    ;
  return n;
}
    345b:	89 c8                	mov    %ecx,%eax
    345d:	5d                   	pop    %ebp
    345e:	c3                   	ret    
    345f:	90                   	nop
  for(n = 0; s[n]; n++)
    3460:	31 c9                	xor    %ecx,%ecx
}
    3462:	5d                   	pop    %ebp
    3463:	89 c8                	mov    %ecx,%eax
    3465:	c3                   	ret    
    3466:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    346d:	8d 76 00             	lea    0x0(%esi),%esi

00003470 <memset>:

void*
memset(void *dst, int c, uint n)
{
    3470:	55                   	push   %ebp
    3471:	89 e5                	mov    %esp,%ebp
    3473:	57                   	push   %edi
    3474:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
    3477:	8b 4d 10             	mov    0x10(%ebp),%ecx
    347a:	8b 45 0c             	mov    0xc(%ebp),%eax
    347d:	89 d7                	mov    %edx,%edi
    347f:	fc                   	cld    
    3480:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
    3482:	8b 7d fc             	mov    -0x4(%ebp),%edi
    3485:	89 d0                	mov    %edx,%eax
    3487:	c9                   	leave  
    3488:	c3                   	ret    
    3489:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00003490 <strchr>:

char*
strchr(const char *s, char c)
{
    3490:	55                   	push   %ebp
    3491:	89 e5                	mov    %esp,%ebp
    3493:	8b 45 08             	mov    0x8(%ebp),%eax
    3496:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
    349a:	0f b6 10             	movzbl (%eax),%edx
    349d:	84 d2                	test   %dl,%dl
    349f:	75 12                	jne    34b3 <strchr+0x23>
    34a1:	eb 1d                	jmp    34c0 <strchr+0x30>
    34a3:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    34a7:	90                   	nop
    34a8:	0f b6 50 01          	movzbl 0x1(%eax),%edx
    34ac:	83 c0 01             	add    $0x1,%eax
    34af:	84 d2                	test   %dl,%dl
    34b1:	74 0d                	je     34c0 <strchr+0x30>
    if(*s == c)
    34b3:	38 d1                	cmp    %dl,%cl
    34b5:	75 f1                	jne    34a8 <strchr+0x18>
      return (char*)s;
  return 0;
}
    34b7:	5d                   	pop    %ebp
    34b8:	c3                   	ret    
    34b9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  return 0;
    34c0:	31 c0                	xor    %eax,%eax
}
    34c2:	5d                   	pop    %ebp
    34c3:	c3                   	ret    
    34c4:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    34cb:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    34cf:	90                   	nop

000034d0 <gets>:

char*
gets(char *buf, int max)
{
    34d0:	55                   	push   %ebp
    34d1:	89 e5                	mov    %esp,%ebp
    34d3:	57                   	push   %edi
    34d4:	56                   	push   %esi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    cc = read(0, &c, 1);
    34d5:	8d 7d e7             	lea    -0x19(%ebp),%edi
{
    34d8:	53                   	push   %ebx
  for(i=0; i+1 < max; ){
    34d9:	31 db                	xor    %ebx,%ebx
{
    34db:	83 ec 1c             	sub    $0x1c,%esp
  for(i=0; i+1 < max; ){
    34de:	eb 27                	jmp    3507 <gets+0x37>
    cc = read(0, &c, 1);
    34e0:	83 ec 04             	sub    $0x4,%esp
    34e3:	6a 01                	push   $0x1
    34e5:	57                   	push   %edi
    34e6:	6a 00                	push   $0x0
    34e8:	e8 2e 01 00 00       	call   361b <read>
    if(cc < 1)
    34ed:	83 c4 10             	add    $0x10,%esp
    34f0:	85 c0                	test   %eax,%eax
    34f2:	7e 1d                	jle    3511 <gets+0x41>
      break;
    buf[i++] = c;
    34f4:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
    34f8:	8b 55 08             	mov    0x8(%ebp),%edx
    34fb:	88 44 1a ff          	mov    %al,-0x1(%edx,%ebx,1)
    if(c == '\n' || c == '\r')
    34ff:	3c 0a                	cmp    $0xa,%al
    3501:	74 1d                	je     3520 <gets+0x50>
    3503:	3c 0d                	cmp    $0xd,%al
    3505:	74 19                	je     3520 <gets+0x50>
  for(i=0; i+1 < max; ){
    3507:	89 de                	mov    %ebx,%esi
    3509:	83 c3 01             	add    $0x1,%ebx
    350c:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
    350f:	7c cf                	jl     34e0 <gets+0x10>
      break;
  }
  buf[i] = '\0';
    3511:	8b 45 08             	mov    0x8(%ebp),%eax
    3514:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
  return buf;
}
    3518:	8d 65 f4             	lea    -0xc(%ebp),%esp
    351b:	5b                   	pop    %ebx
    351c:	5e                   	pop    %esi
    351d:	5f                   	pop    %edi
    351e:	5d                   	pop    %ebp
    351f:	c3                   	ret    
  buf[i] = '\0';
    3520:	8b 45 08             	mov    0x8(%ebp),%eax
    3523:	89 de                	mov    %ebx,%esi
    3525:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
}
    3529:	8d 65 f4             	lea    -0xc(%ebp),%esp
    352c:	5b                   	pop    %ebx
    352d:	5e                   	pop    %esi
    352e:	5f                   	pop    %edi
    352f:	5d                   	pop    %ebp
    3530:	c3                   	ret    
    3531:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    3538:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    353f:	90                   	nop

00003540 <stat>:

int
stat(const char *n, struct stat *st)
{
    3540:	55                   	push   %ebp
    3541:	89 e5                	mov    %esp,%ebp
    3543:	56                   	push   %esi
    3544:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
    3545:	83 ec 08             	sub    $0x8,%esp
    3548:	6a 00                	push   $0x0
    354a:	ff 75 08             	push   0x8(%ebp)
    354d:	e8 f1 00 00 00       	call   3643 <open>
  if(fd < 0)
    3552:	83 c4 10             	add    $0x10,%esp
    3555:	85 c0                	test   %eax,%eax
    3557:	78 27                	js     3580 <stat+0x40>
    return -1;
  r = fstat(fd, st);
    3559:	83 ec 08             	sub    $0x8,%esp
    355c:	ff 75 0c             	push   0xc(%ebp)
    355f:	89 c3                	mov    %eax,%ebx
    3561:	50                   	push   %eax
    3562:	e8 f4 00 00 00       	call   365b <fstat>
  close(fd);
    3567:	89 1c 24             	mov    %ebx,(%esp)
  r = fstat(fd, st);
    356a:	89 c6                	mov    %eax,%esi
  close(fd);
    356c:	e8 ba 00 00 00       	call   362b <close>
  return r;
    3571:	83 c4 10             	add    $0x10,%esp
}
    3574:	8d 65 f8             	lea    -0x8(%ebp),%esp
    3577:	89 f0                	mov    %esi,%eax
    3579:	5b                   	pop    %ebx
    357a:	5e                   	pop    %esi
    357b:	5d                   	pop    %ebp
    357c:	c3                   	ret    
    357d:	8d 76 00             	lea    0x0(%esi),%esi
    return -1;
    3580:	be ff ff ff ff       	mov    $0xffffffff,%esi
    3585:	eb ed                	jmp    3574 <stat+0x34>
    3587:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    358e:	66 90                	xchg   %ax,%ax

00003590 <atoi>:

int
atoi(const char *s)
{
    3590:	55                   	push   %ebp
    3591:	89 e5                	mov    %esp,%ebp
    3593:	53                   	push   %ebx
    3594:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
    3597:	0f be 02             	movsbl (%edx),%eax
    359a:	8d 48 d0             	lea    -0x30(%eax),%ecx
    359d:	80 f9 09             	cmp    $0x9,%cl
  n = 0;
    35a0:	b9 00 00 00 00       	mov    $0x0,%ecx
  while('0' <= *s && *s <= '9')
    35a5:	77 1e                	ja     35c5 <atoi+0x35>
    35a7:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    35ae:	66 90                	xchg   %ax,%ax
    n = n*10 + *s++ - '0';
    35b0:	83 c2 01             	add    $0x1,%edx
    35b3:	8d 0c 89             	lea    (%ecx,%ecx,4),%ecx
    35b6:	8d 4c 48 d0          	lea    -0x30(%eax,%ecx,2),%ecx
  while('0' <= *s && *s <= '9')
    35ba:	0f be 02             	movsbl (%edx),%eax
    35bd:	8d 58 d0             	lea    -0x30(%eax),%ebx
    35c0:	80 fb 09             	cmp    $0x9,%bl
    35c3:	76 eb                	jbe    35b0 <atoi+0x20>
  return n;
}
    35c5:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    35c8:	89 c8                	mov    %ecx,%eax
    35ca:	c9                   	leave  
    35cb:	c3                   	ret    
    35cc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

000035d0 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
    35d0:	55                   	push   %ebp
    35d1:	89 e5                	mov    %esp,%ebp
    35d3:	57                   	push   %edi
    35d4:	8b 45 10             	mov    0x10(%ebp),%eax
    35d7:	8b 55 08             	mov    0x8(%ebp),%edx
    35da:	56                   	push   %esi
    35db:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
    35de:	85 c0                	test   %eax,%eax
    35e0:	7e 13                	jle    35f5 <memmove+0x25>
    35e2:	01 d0                	add    %edx,%eax
  dst = vdst;
    35e4:	89 d7                	mov    %edx,%edi
    35e6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    35ed:	8d 76 00             	lea    0x0(%esi),%esi
    *dst++ = *src++;
    35f0:	a4                   	movsb  %ds:(%esi),%es:(%edi)
  while(n-- > 0)
    35f1:	39 f8                	cmp    %edi,%eax
    35f3:	75 fb                	jne    35f0 <memmove+0x20>
  return vdst;
}
    35f5:	5e                   	pop    %esi
    35f6:	89 d0                	mov    %edx,%eax
    35f8:	5f                   	pop    %edi
    35f9:	5d                   	pop    %ebp
    35fa:	c3                   	ret    

000035fb <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
    35fb:	b8 01 00 00 00       	mov    $0x1,%eax
    3600:	cd 40                	int    $0x40
    3602:	c3                   	ret    

00003603 <exit>:
SYSCALL(exit)
    3603:	b8 02 00 00 00       	mov    $0x2,%eax
    3608:	cd 40                	int    $0x40
    360a:	c3                   	ret    

0000360b <wait>:
SYSCALL(wait)
    360b:	b8 03 00 00 00       	mov    $0x3,%eax
    3610:	cd 40                	int    $0x40
    3612:	c3                   	ret    

00003613 <pipe>:
SYSCALL(pipe)
    3613:	b8 04 00 00 00       	mov    $0x4,%eax
    3618:	cd 40                	int    $0x40
    361a:	c3                   	ret    

0000361b <read>:
SYSCALL(read)
    361b:	b8 05 00 00 00       	mov    $0x5,%eax
    3620:	cd 40                	int    $0x40
    3622:	c3                   	ret    

00003623 <write>:
SYSCALL(write)
    3623:	b8 10 00 00 00       	mov    $0x10,%eax
    3628:	cd 40                	int    $0x40
    362a:	c3                   	ret    

0000362b <close>:
SYSCALL(close)
    362b:	b8 15 00 00 00       	mov    $0x15,%eax
    3630:	cd 40                	int    $0x40
    3632:	c3                   	ret    

00003633 <kill>:
SYSCALL(kill)
    3633:	b8 06 00 00 00       	mov    $0x6,%eax
    3638:	cd 40                	int    $0x40
    363a:	c3                   	ret    

0000363b <exec>:
SYSCALL(exec)
    363b:	b8 07 00 00 00       	mov    $0x7,%eax
    3640:	cd 40                	int    $0x40
    3642:	c3                   	ret    

00003643 <open>:
SYSCALL(open)
    3643:	b8 0f 00 00 00       	mov    $0xf,%eax
    3648:	cd 40                	int    $0x40
    364a:	c3                   	ret    

0000364b <mknod>:
SYSCALL(mknod)
    364b:	b8 11 00 00 00       	mov    $0x11,%eax
    3650:	cd 40                	int    $0x40
    3652:	c3                   	ret    

00003653 <unlink>:
SYSCALL(unlink)
    3653:	b8 12 00 00 00       	mov    $0x12,%eax
    3658:	cd 40                	int    $0x40
    365a:	c3                   	ret    

0000365b <fstat>:
SYSCALL(fstat)
    365b:	b8 08 00 00 00       	mov    $0x8,%eax
    3660:	cd 40                	int    $0x40
    3662:	c3                   	ret    

00003663 <link>:
SYSCALL(link)
    3663:	b8 13 00 00 00       	mov    $0x13,%eax
    3668:	cd 40                	int    $0x40
    366a:	c3                   	ret    

0000366b <mkdir>:
SYSCALL(mkdir)
    366b:	b8 14 00 00 00       	mov    $0x14,%eax
    3670:	cd 40                	int    $0x40
    3672:	c3                   	ret    

00003673 <chdir>:
SYSCALL(chdir)
    3673:	b8 09 00 00 00       	mov    $0x9,%eax
    3678:	cd 40                	int    $0x40
    367a:	c3                   	ret    

0000367b <dup>:
SYSCALL(dup)
    367b:	b8 0a 00 00 00       	mov    $0xa,%eax
    3680:	cd 40                	int    $0x40
    3682:	c3                   	ret    

00003683 <getpid>:
SYSCALL(getpid)
    3683:	b8 0b 00 00 00       	mov    $0xb,%eax
    3688:	cd 40                	int    $0x40
    368a:	c3                   	ret    

0000368b <sbrk>:
SYSCALL(sbrk)
    368b:	b8 0c 00 00 00       	mov    $0xc,%eax
    3690:	cd 40                	int    $0x40
    3692:	c3                   	ret    

00003693 <sleep>:
SYSCALL(sleep)
    3693:	b8 0d 00 00 00       	mov    $0xd,%eax
    3698:	cd 40                	int    $0x40
    369a:	c3                   	ret    

0000369b <uptime>:
SYSCALL(uptime)
    369b:	b8 0e 00 00 00       	mov    $0xe,%eax
    36a0:	cd 40                	int    $0x40
    36a2:	c3                   	ret    

000036a3 <cpuhalt>:
SYSCALL(cpuhalt)
    36a3:	b8 16 00 00 00       	mov    $0x16,%eax
    36a8:	cd 40                	int    $0x40
    36aa:	c3                   	ret    
    36ab:	66 90                	xchg   %ax,%ax
    36ad:	66 90                	xchg   %ax,%ax
    36af:	90                   	nop

000036b0 <printint.constprop.0>:
  for (i = 0; i < (sizeof(uint) * 2); i++, x <<= 4)
    putc(fd, digits[x >> (sizeof(uint) * 8 - 4)]);
}

static void
printint(int fd, int xx, int base, int sgn)
    36b0:	55                   	push   %ebp
    36b1:	89 e5                	mov    %esp,%ebp
    36b3:	57                   	push   %edi
    36b4:	56                   	push   %esi
    36b5:	53                   	push   %ebx
    36b6:	83 ec 3c             	sub    $0x3c,%esp
    36b9:	89 55 c4             	mov    %edx,-0x3c(%ebp)
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    36bc:	85 c0                	test   %eax,%eax
    36be:	0f 89 84 00 00 00    	jns    3748 <printint.constprop.0+0x98>
    36c4:	83 e1 01             	and    $0x1,%ecx
    36c7:	74 7f                	je     3748 <printint.constprop.0+0x98>
    neg = 1;
    36c9:	c7 45 bc 01 00 00 00 	movl   $0x1,-0x44(%ebp)
    x = -xx;
    36d0:	f7 d8                	neg    %eax
    36d2:	89 c1                	mov    %eax,%ecx
  } else {
    x = xx;
  }

  i = 0;
    36d4:	31 db                	xor    %ebx,%ebx
    36d6:	8d 75 d7             	lea    -0x29(%ebp),%esi
    36d9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  do{
    buf[i++] = digits[x % base];
    36e0:	89 c8                	mov    %ecx,%eax
    36e2:	31 d2                	xor    %edx,%edx
    36e4:	89 cf                	mov    %ecx,%edi
    36e6:	f7 75 c4             	divl   -0x3c(%ebp)
    36e9:	0f b6 92 40 53 00 00 	movzbl 0x5340(%edx),%edx
    36f0:	89 45 c0             	mov    %eax,-0x40(%ebp)
    36f3:	89 d8                	mov    %ebx,%eax
    36f5:	8d 5b 01             	lea    0x1(%ebx),%ebx
  }while((x /= base) != 0);
    36f8:	8b 4d c0             	mov    -0x40(%ebp),%ecx
    buf[i++] = digits[x % base];
    36fb:	88 14 1e             	mov    %dl,(%esi,%ebx,1)
  }while((x /= base) != 0);
    36fe:	3b 7d c4             	cmp    -0x3c(%ebp),%edi
    3701:	73 dd                	jae    36e0 <printint.constprop.0+0x30>
  if(neg)
    3703:	8b 4d bc             	mov    -0x44(%ebp),%ecx
    3706:	85 c9                	test   %ecx,%ecx
    3708:	74 0c                	je     3716 <printint.constprop.0+0x66>
    buf[i++] = '-';
    370a:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
    buf[i++] = digits[x % base];
    370f:	89 d8                	mov    %ebx,%eax
    buf[i++] = '-';
    3711:	ba 2d 00 00 00       	mov    $0x2d,%edx

  while(--i >= 0)
    3716:	8d 5c 05 d7          	lea    -0x29(%ebp,%eax,1),%ebx
    371a:	eb 0a                	jmp    3726 <printint.constprop.0+0x76>
    371c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    putc(fd, buf[i]);
    3720:	0f b6 13             	movzbl (%ebx),%edx
    3723:	83 eb 01             	sub    $0x1,%ebx
  write(fd, &c, 1);
    3726:	83 ec 04             	sub    $0x4,%esp
    3729:	88 55 d7             	mov    %dl,-0x29(%ebp)
    372c:	6a 01                	push   $0x1
    372e:	56                   	push   %esi
    372f:	6a 01                	push   $0x1
    3731:	e8 ed fe ff ff       	call   3623 <write>
  while(--i >= 0)
    3736:	83 c4 10             	add    $0x10,%esp
    3739:	39 de                	cmp    %ebx,%esi
    373b:	75 e3                	jne    3720 <printint.constprop.0+0x70>
}
    373d:	8d 65 f4             	lea    -0xc(%ebp),%esp
    3740:	5b                   	pop    %ebx
    3741:	5e                   	pop    %esi
    3742:	5f                   	pop    %edi
    3743:	5d                   	pop    %ebp
    3744:	c3                   	ret    
    3745:	8d 76 00             	lea    0x0(%esi),%esi
  neg = 0;
    3748:	c7 45 bc 00 00 00 00 	movl   $0x0,-0x44(%ebp)
    x = xx;
    374f:	89 c1                	mov    %eax,%ecx
    3751:	eb 81                	jmp    36d4 <printint.constprop.0+0x24>
    3753:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    375a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00003760 <vprintf.constprop.0>:
static void vprintf(int fd, const char *fmt, va_list ap)
    3760:	55                   	push   %ebp
    3761:	89 e5                	mov    %esp,%ebp
    3763:	57                   	push   %edi
    3764:	56                   	push   %esi
    3765:	53                   	push   %ebx
    3766:	83 ec 2c             	sub    $0x2c,%esp
    3769:	89 55 d4             	mov    %edx,-0x2c(%ebp)
{
  char *s;
  int c, i, state;

  state = 0;
  for(i = 0; fmt[i]; i++){
    376c:	0f b6 10             	movzbl (%eax),%edx
    376f:	84 d2                	test   %dl,%dl
    3771:	74 6c                	je     37df <vprintf.constprop.0+0x7f>
    3773:	8d 58 01             	lea    0x1(%eax),%ebx
    3776:	31 ff                	xor    %edi,%edi
    3778:	8d 75 e7             	lea    -0x19(%ebp),%esi
    377b:	eb 25                	jmp    37a2 <vprintf.constprop.0+0x42>
    377d:	8d 76 00             	lea    0x0(%esi),%esi
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
    3780:	83 f8 25             	cmp    $0x25,%eax
    3783:	74 4b                	je     37d0 <vprintf.constprop.0+0x70>
  write(fd, &c, 1);
    3785:	83 ec 04             	sub    $0x4,%esp
    3788:	88 55 e7             	mov    %dl,-0x19(%ebp)
    378b:	6a 01                	push   $0x1
    378d:	56                   	push   %esi
    378e:	6a 01                	push   $0x1
    3790:	e8 8e fe ff ff       	call   3623 <write>
        state = '%';
      } else {
        putc(fd, c);
    3795:	83 c4 10             	add    $0x10,%esp
  for(i = 0; fmt[i]; i++){
    3798:	0f b6 13             	movzbl (%ebx),%edx
    379b:	83 c3 01             	add    $0x1,%ebx
    379e:	84 d2                	test   %dl,%dl
    37a0:	74 3d                	je     37df <vprintf.constprop.0+0x7f>
    c = fmt[i] & 0xff;
    37a2:	0f b6 c2             	movzbl %dl,%eax
    if(state == 0){
    37a5:	85 ff                	test   %edi,%edi
    37a7:	74 d7                	je     3780 <vprintf.constprop.0+0x20>
      }
    } else if(state == '%'){
    37a9:	83 ff 25             	cmp    $0x25,%edi
    37ac:	75 ea                	jne    3798 <vprintf.constprop.0+0x38>
      if(c == 'd'){
    37ae:	83 f8 25             	cmp    $0x25,%eax
    37b1:	0f 84 a9 01 00 00    	je     3960 <vprintf.constprop.0+0x200>
    37b7:	83 e8 63             	sub    $0x63,%eax
    37ba:	83 f8 15             	cmp    $0x15,%eax
    37bd:	77 31                	ja     37f0 <vprintf.constprop.0+0x90>
    37bf:	ff 24 85 e8 52 00 00 	jmp    *0x52e8(,%eax,4)
    37c6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    37cd:	8d 76 00             	lea    0x0(%esi),%esi
  for(i = 0; fmt[i]; i++){
    37d0:	0f b6 13             	movzbl (%ebx),%edx
    37d3:	83 c3 01             	add    $0x1,%ebx
        state = '%';
    37d6:	bf 25 00 00 00       	mov    $0x25,%edi
  for(i = 0; fmt[i]; i++){
    37db:	84 d2                	test   %dl,%dl
    37dd:	75 c3                	jne    37a2 <vprintf.constprop.0+0x42>
        putc(fd, c);
      }
      state = 0;
    }
  }
}
    37df:	8d 65 f4             	lea    -0xc(%ebp),%esp
    37e2:	5b                   	pop    %ebx
    37e3:	5e                   	pop    %esi
    37e4:	5f                   	pop    %edi
    37e5:	5d                   	pop    %ebp
    37e6:	c3                   	ret    
    37e7:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    37ee:	66 90                	xchg   %ax,%ax
  write(fd, &c, 1);
    37f0:	83 ec 04             	sub    $0x4,%esp
    37f3:	88 55 d0             	mov    %dl,-0x30(%ebp)
    37f6:	6a 01                	push   $0x1
    37f8:	56                   	push   %esi
    37f9:	6a 01                	push   $0x1
    37fb:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
    37ff:	e8 1f fe ff ff       	call   3623 <write>
        putc(fd, c);
    3804:	0f b6 55 d0          	movzbl -0x30(%ebp),%edx
  write(fd, &c, 1);
    3808:	83 c4 0c             	add    $0xc,%esp
    380b:	88 55 e7             	mov    %dl,-0x19(%ebp)
    380e:	6a 01                	push   $0x1
      state = 0;
    3810:	31 ff                	xor    %edi,%edi
  write(fd, &c, 1);
    3812:	56                   	push   %esi
    3813:	6a 01                	push   $0x1
    3815:	e8 09 fe ff ff       	call   3623 <write>
        putc(fd, c);
    381a:	83 c4 10             	add    $0x10,%esp
    381d:	e9 76 ff ff ff       	jmp    3798 <vprintf.constprop.0+0x38>
    3822:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        putc(fd, va_arg(ap, uint));
    3828:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  write(fd, &c, 1);
    382b:	83 ec 04             	sub    $0x4,%esp
        putc(fd, va_arg(ap, uint));
    382e:	8d 78 04             	lea    0x4(%eax),%edi
    3831:	8b 00                	mov    (%eax),%eax
  write(fd, &c, 1);
    3833:	6a 01                	push   $0x1
    3835:	56                   	push   %esi
    3836:	6a 01                	push   $0x1
        putc(fd, va_arg(ap, uint));
    3838:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
    383b:	e8 e3 fd ff ff       	call   3623 <write>
        putc(fd, va_arg(ap, uint));
    3840:	89 7d d4             	mov    %edi,-0x2c(%ebp)
    3843:	83 c4 10             	add    $0x10,%esp
      state = 0;
    3846:	31 ff                	xor    %edi,%edi
    3848:	e9 4b ff ff ff       	jmp    3798 <vprintf.constprop.0+0x38>
    384d:	8d 76 00             	lea    0x0(%esi),%esi
        printint(fd, va_arg(ap, int), 10, 1);
    3850:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    3853:	b9 01 00 00 00       	mov    $0x1,%ecx
    3858:	8d 78 04             	lea    0x4(%eax),%edi
        printint(fd, va_arg(ap, uint), 10, 0);
    385b:	8b 00                	mov    (%eax),%eax
    385d:	ba 0a 00 00 00       	mov    $0xa,%edx
    3862:	e8 49 fe ff ff       	call   36b0 <printint.constprop.0>
    3867:	89 7d d4             	mov    %edi,-0x2c(%ebp)
      state = 0;
    386a:	31 ff                	xor    %edi,%edi
    386c:	e9 27 ff ff ff       	jmp    3798 <vprintf.constprop.0+0x38>
    3871:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        printint(fd, va_arg(ap, uint), 10, 0);
    3878:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    387b:	31 c9                	xor    %ecx,%ecx
    387d:	8d 78 04             	lea    0x4(%eax),%edi
    3880:	eb d9                	jmp    385b <vprintf.constprop.0+0xfb>
    3882:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        printptr(fd, va_arg(ap, uint));
    3888:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  write(fd, &c, 1);
    388b:	83 ec 04             	sub    $0x4,%esp
    388e:	c6 45 e7 30          	movb   $0x30,-0x19(%ebp)
        printptr(fd, va_arg(ap, uint));
    3892:	8b 38                	mov    (%eax),%edi
  write(fd, &c, 1);
    3894:	6a 01                	push   $0x1
        printptr(fd, va_arg(ap, uint));
    3896:	8d 48 04             	lea    0x4(%eax),%ecx
  write(fd, &c, 1);
    3899:	56                   	push   %esi
    389a:	6a 01                	push   $0x1
        printptr(fd, va_arg(ap, uint));
    389c:	89 4d d0             	mov    %ecx,-0x30(%ebp)
  write(fd, &c, 1);
    389f:	e8 7f fd ff ff       	call   3623 <write>
    38a4:	83 c4 0c             	add    $0xc,%esp
    38a7:	c6 45 e7 78          	movb   $0x78,-0x19(%ebp)
    38ab:	6a 01                	push   $0x1
    38ad:	56                   	push   %esi
    38ae:	6a 01                	push   $0x1
    38b0:	e8 6e fd ff ff       	call   3623 <write>
  putc(fd, 'x');
    38b5:	c7 45 d4 08 00 00 00 	movl   $0x8,-0x2c(%ebp)
    38bc:	83 c4 10             	add    $0x10,%esp
    38bf:	90                   	nop
  write(fd, &c, 1);
    38c0:	83 ec 04             	sub    $0x4,%esp
    putc(fd, digits[x >> (sizeof(uint) * 8 - 4)]);
    38c3:	89 f8                	mov    %edi,%eax
  for (i = 0; i < (sizeof(uint) * 2); i++, x <<= 4)
    38c5:	c1 e7 04             	shl    $0x4,%edi
  write(fd, &c, 1);
    38c8:	6a 01                	push   $0x1
    putc(fd, digits[x >> (sizeof(uint) * 8 - 4)]);
    38ca:	c1 e8 1c             	shr    $0x1c,%eax
  write(fd, &c, 1);
    38cd:	56                   	push   %esi
    38ce:	0f b6 80 40 53 00 00 	movzbl 0x5340(%eax),%eax
    38d5:	6a 01                	push   $0x1
    38d7:	88 45 e7             	mov    %al,-0x19(%ebp)
    38da:	e8 44 fd ff ff       	call   3623 <write>
  for (i = 0; i < (sizeof(uint) * 2); i++, x <<= 4)
    38df:	83 c4 10             	add    $0x10,%esp
    38e2:	83 6d d4 01          	subl   $0x1,-0x2c(%ebp)
    38e6:	75 d8                	jne    38c0 <vprintf.constprop.0+0x160>
        printptr(fd, va_arg(ap, uint));
    38e8:	8b 45 d0             	mov    -0x30(%ebp),%eax
      state = 0;
    38eb:	31 ff                	xor    %edi,%edi
        printptr(fd, va_arg(ap, uint));
    38ed:	89 45 d4             	mov    %eax,-0x2c(%ebp)
    38f0:	e9 a3 fe ff ff       	jmp    3798 <vprintf.constprop.0+0x38>
    38f5:	8d 76 00             	lea    0x0(%esi),%esi
        s = va_arg(ap, char*);
    38f8:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    38fb:	8b 38                	mov    (%eax),%edi
    38fd:	8d 48 04             	lea    0x4(%eax),%ecx
    3900:	89 4d d4             	mov    %ecx,-0x2c(%ebp)
        if(s == 0)
    3903:	85 ff                	test   %edi,%edi
    3905:	74 64                	je     396b <vprintf.constprop.0+0x20b>
        while(*s != 0){
    3907:	0f b6 07             	movzbl (%edi),%eax
    390a:	84 c0                	test   %al,%al
    390c:	74 1f                	je     392d <vprintf.constprop.0+0x1cd>
    390e:	66 90                	xchg   %ax,%ax
  write(fd, &c, 1);
    3910:	83 ec 04             	sub    $0x4,%esp
          s++;
    3913:	83 c7 01             	add    $0x1,%edi
    3916:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
    3919:	6a 01                	push   $0x1
    391b:	56                   	push   %esi
    391c:	6a 01                	push   $0x1
    391e:	e8 00 fd ff ff       	call   3623 <write>
        while(*s != 0){
    3923:	0f b6 07             	movzbl (%edi),%eax
    3926:	83 c4 10             	add    $0x10,%esp
    3929:	84 c0                	test   %al,%al
    392b:	75 e3                	jne    3910 <vprintf.constprop.0+0x1b0>
      state = 0;
    392d:	31 ff                	xor    %edi,%edi
    392f:	e9 64 fe ff ff       	jmp    3798 <vprintf.constprop.0+0x38>
    3934:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        printint(fd, va_arg(ap, int), 16, 0);
    3938:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    393b:	31 c9                	xor    %ecx,%ecx
    393d:	ba 10 00 00 00       	mov    $0x10,%edx
    3942:	8d 78 04             	lea    0x4(%eax),%edi
    3945:	8b 00                	mov    (%eax),%eax
    3947:	e8 64 fd ff ff       	call   36b0 <printint.constprop.0>
    394c:	89 7d d4             	mov    %edi,-0x2c(%ebp)
      state = 0;
    394f:	31 ff                	xor    %edi,%edi
    3951:	e9 42 fe ff ff       	jmp    3798 <vprintf.constprop.0+0x38>
    3956:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    395d:	8d 76 00             	lea    0x0(%esi),%esi
        putc(fd, c);
    3960:	88 55 e7             	mov    %dl,-0x19(%ebp)
  write(fd, &c, 1);
    3963:	83 ec 04             	sub    $0x4,%esp
    3966:	e9 a3 fe ff ff       	jmp    380e <vprintf.constprop.0+0xae>
          s = "(null)";
    396b:	bf de 52 00 00       	mov    $0x52de,%edi
        while(*s != 0){
    3970:	b8 28 00 00 00       	mov    $0x28,%eax
    3975:	eb 99                	jmp    3910 <vprintf.constprop.0+0x1b0>
    3977:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    397e:	66 90                	xchg   %ax,%ax

00003980 <fprintf>:
// Print to the given fd. Only understands %d,%x, %p, %s, %c.
void
fprintf(int fd, const char *fmt, ...)
{
    3980:	55                   	push   %ebp
    3981:	89 e5                	mov    %esp,%ebp
    3983:	83 ec 08             	sub    $0x8,%esp
 va_list ap;
 va_start(ap, fmt); 
 vprintf(1,fmt,ap);
    3986:	8b 45 0c             	mov    0xc(%ebp),%eax
    3989:	8d 55 10             	lea    0x10(%ebp),%edx
    398c:	e8 cf fd ff ff       	call   3760 <vprintf.constprop.0>
}
    3991:	c9                   	leave  
    3992:	c3                   	ret    
    3993:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    399a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

000039a0 <printf>:
void
printf(const char *fmt, ...)
{
    39a0:	55                   	push   %ebp
    39a1:	89 e5                	mov    %esp,%ebp
    39a3:	83 ec 08             	sub    $0x8,%esp
  va_list ap;
  va_start(ap, fmt); 
  vprintf(1,fmt,ap);
    39a6:	8b 45 08             	mov    0x8(%ebp),%eax
    39a9:	8d 55 0c             	lea    0xc(%ebp),%edx
    39ac:	e8 af fd ff ff       	call   3760 <vprintf.constprop.0>
}
    39b1:	c9                   	leave  
    39b2:	c3                   	ret    
    39b3:	66 90                	xchg   %ax,%ax
    39b5:	66 90                	xchg   %ax,%ax
    39b7:	66 90                	xchg   %ax,%ax
    39b9:	66 90                	xchg   %ax,%ax
    39bb:	66 90                	xchg   %ax,%ax
    39bd:	66 90                	xchg   %ax,%ax
    39bf:	90                   	nop

000039c0 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
    39c0:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    39c1:	a1 20 9b 00 00       	mov    0x9b20,%eax
{
    39c6:	89 e5                	mov    %esp,%ebp
    39c8:	57                   	push   %edi
    39c9:	56                   	push   %esi
    39ca:	53                   	push   %ebx
    39cb:	8b 5d 08             	mov    0x8(%ebp),%ebx
  bp = (Header*)ap - 1;
    39ce:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    39d1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    39d8:	89 c2                	mov    %eax,%edx
    39da:	8b 00                	mov    (%eax),%eax
    39dc:	39 ca                	cmp    %ecx,%edx
    39de:	73 30                	jae    3a10 <free+0x50>
    39e0:	39 c1                	cmp    %eax,%ecx
    39e2:	72 04                	jb     39e8 <free+0x28>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    39e4:	39 c2                	cmp    %eax,%edx
    39e6:	72 f0                	jb     39d8 <free+0x18>
      break;
  if(bp + bp->s.size == p->s.ptr){
    39e8:	8b 73 fc             	mov    -0x4(%ebx),%esi
    39eb:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
    39ee:	39 f8                	cmp    %edi,%eax
    39f0:	74 30                	je     3a22 <free+0x62>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
    39f2:	89 43 f8             	mov    %eax,-0x8(%ebx)
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
    39f5:	8b 42 04             	mov    0x4(%edx),%eax
    39f8:	8d 34 c2             	lea    (%edx,%eax,8),%esi
    39fb:	39 f1                	cmp    %esi,%ecx
    39fd:	74 3a                	je     3a39 <free+0x79>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
    39ff:	89 0a                	mov    %ecx,(%edx)
  } else
    p->s.ptr = bp;
  freep = p;
}
    3a01:	5b                   	pop    %ebx
  freep = p;
    3a02:	89 15 20 9b 00 00    	mov    %edx,0x9b20
}
    3a08:	5e                   	pop    %esi
    3a09:	5f                   	pop    %edi
    3a0a:	5d                   	pop    %ebp
    3a0b:	c3                   	ret    
    3a0c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    3a10:	39 c2                	cmp    %eax,%edx
    3a12:	72 c4                	jb     39d8 <free+0x18>
    3a14:	39 c1                	cmp    %eax,%ecx
    3a16:	73 c0                	jae    39d8 <free+0x18>
  if(bp + bp->s.size == p->s.ptr){
    3a18:	8b 73 fc             	mov    -0x4(%ebx),%esi
    3a1b:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
    3a1e:	39 f8                	cmp    %edi,%eax
    3a20:	75 d0                	jne    39f2 <free+0x32>
    bp->s.size += p->s.ptr->s.size;
    3a22:	03 70 04             	add    0x4(%eax),%esi
    3a25:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
    3a28:	8b 02                	mov    (%edx),%eax
    3a2a:	8b 00                	mov    (%eax),%eax
    3a2c:	89 43 f8             	mov    %eax,-0x8(%ebx)
  if(p + p->s.size == bp){
    3a2f:	8b 42 04             	mov    0x4(%edx),%eax
    3a32:	8d 34 c2             	lea    (%edx,%eax,8),%esi
    3a35:	39 f1                	cmp    %esi,%ecx
    3a37:	75 c6                	jne    39ff <free+0x3f>
    p->s.size += bp->s.size;
    3a39:	03 43 fc             	add    -0x4(%ebx),%eax
  freep = p;
    3a3c:	89 15 20 9b 00 00    	mov    %edx,0x9b20
    p->s.size += bp->s.size;
    3a42:	89 42 04             	mov    %eax,0x4(%edx)
    p->s.ptr = bp->s.ptr;
    3a45:	8b 4b f8             	mov    -0x8(%ebx),%ecx
    3a48:	89 0a                	mov    %ecx,(%edx)
}
    3a4a:	5b                   	pop    %ebx
    3a4b:	5e                   	pop    %esi
    3a4c:	5f                   	pop    %edi
    3a4d:	5d                   	pop    %ebp
    3a4e:	c3                   	ret    
    3a4f:	90                   	nop

00003a50 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
    3a50:	55                   	push   %ebp
    3a51:	89 e5                	mov    %esp,%ebp
    3a53:	57                   	push   %edi
    3a54:	56                   	push   %esi
    3a55:	53                   	push   %ebx
    3a56:	83 ec 1c             	sub    $0x1c,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    3a59:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
    3a5c:	8b 3d 20 9b 00 00    	mov    0x9b20,%edi
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    3a62:	8d 70 07             	lea    0x7(%eax),%esi
    3a65:	c1 ee 03             	shr    $0x3,%esi
    3a68:	83 c6 01             	add    $0x1,%esi
  if((prevp = freep) == 0){
    3a6b:	85 ff                	test   %edi,%edi
    3a6d:	0f 84 9d 00 00 00    	je     3b10 <malloc+0xc0>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    3a73:	8b 17                	mov    (%edi),%edx
    if(p->s.size >= nunits){
    3a75:	8b 4a 04             	mov    0x4(%edx),%ecx
    3a78:	39 f1                	cmp    %esi,%ecx
    3a7a:	73 6a                	jae    3ae6 <malloc+0x96>
    3a7c:	bb 00 10 00 00       	mov    $0x1000,%ebx
    3a81:	39 de                	cmp    %ebx,%esi
    3a83:	0f 43 de             	cmovae %esi,%ebx
  p = sbrk(nu * sizeof(Header));
    3a86:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
    3a8d:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    3a90:	eb 17                	jmp    3aa9 <malloc+0x59>
    3a92:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    3a98:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
    3a9a:	8b 48 04             	mov    0x4(%eax),%ecx
    3a9d:	39 f1                	cmp    %esi,%ecx
    3a9f:	73 4f                	jae    3af0 <malloc+0xa0>
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
    3aa1:	8b 3d 20 9b 00 00    	mov    0x9b20,%edi
    3aa7:	89 c2                	mov    %eax,%edx
    3aa9:	39 d7                	cmp    %edx,%edi
    3aab:	75 eb                	jne    3a98 <malloc+0x48>
  p = sbrk(nu * sizeof(Header));
    3aad:	83 ec 0c             	sub    $0xc,%esp
    3ab0:	ff 75 e4             	push   -0x1c(%ebp)
    3ab3:	e8 d3 fb ff ff       	call   368b <sbrk>
  if(p == (char*)-1)
    3ab8:	83 c4 10             	add    $0x10,%esp
    3abb:	83 f8 ff             	cmp    $0xffffffff,%eax
    3abe:	74 1c                	je     3adc <malloc+0x8c>
  hp->s.size = nu;
    3ac0:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
    3ac3:	83 ec 0c             	sub    $0xc,%esp
    3ac6:	83 c0 08             	add    $0x8,%eax
    3ac9:	50                   	push   %eax
    3aca:	e8 f1 fe ff ff       	call   39c0 <free>
  return freep;
    3acf:	8b 15 20 9b 00 00    	mov    0x9b20,%edx
      if((p = morecore(nunits)) == 0)
    3ad5:	83 c4 10             	add    $0x10,%esp
    3ad8:	85 d2                	test   %edx,%edx
    3ada:	75 bc                	jne    3a98 <malloc+0x48>
        return 0;
  }
}
    3adc:	8d 65 f4             	lea    -0xc(%ebp),%esp
        return 0;
    3adf:	31 c0                	xor    %eax,%eax
}
    3ae1:	5b                   	pop    %ebx
    3ae2:	5e                   	pop    %esi
    3ae3:	5f                   	pop    %edi
    3ae4:	5d                   	pop    %ebp
    3ae5:	c3                   	ret    
    if(p->s.size >= nunits){
    3ae6:	89 d0                	mov    %edx,%eax
    3ae8:	89 fa                	mov    %edi,%edx
    3aea:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      if(p->s.size == nunits)
    3af0:	39 ce                	cmp    %ecx,%esi
    3af2:	74 4c                	je     3b40 <malloc+0xf0>
        p->s.size -= nunits;
    3af4:	29 f1                	sub    %esi,%ecx
    3af6:	89 48 04             	mov    %ecx,0x4(%eax)
        p += p->s.size;
    3af9:	8d 04 c8             	lea    (%eax,%ecx,8),%eax
        p->s.size = nunits;
    3afc:	89 70 04             	mov    %esi,0x4(%eax)
      freep = prevp;
    3aff:	89 15 20 9b 00 00    	mov    %edx,0x9b20
}
    3b05:	8d 65 f4             	lea    -0xc(%ebp),%esp
      return (void*)(p + 1);
    3b08:	83 c0 08             	add    $0x8,%eax
}
    3b0b:	5b                   	pop    %ebx
    3b0c:	5e                   	pop    %esi
    3b0d:	5f                   	pop    %edi
    3b0e:	5d                   	pop    %ebp
    3b0f:	c3                   	ret    
    base.s.ptr = freep = prevp = &base;
    3b10:	c7 05 20 9b 00 00 24 	movl   $0x9b24,0x9b20
    3b17:	9b 00 00 
    base.s.size = 0;
    3b1a:	bf 24 9b 00 00       	mov    $0x9b24,%edi
    base.s.ptr = freep = prevp = &base;
    3b1f:	c7 05 24 9b 00 00 24 	movl   $0x9b24,0x9b24
    3b26:	9b 00 00 
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    3b29:	89 fa                	mov    %edi,%edx
    base.s.size = 0;
    3b2b:	c7 05 28 9b 00 00 00 	movl   $0x0,0x9b28
    3b32:	00 00 00 
    if(p->s.size >= nunits){
    3b35:	e9 42 ff ff ff       	jmp    3a7c <malloc+0x2c>
    3b3a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        prevp->s.ptr = p->s.ptr;
    3b40:	8b 08                	mov    (%eax),%ecx
    3b42:	89 0a                	mov    %ecx,(%edx)
    3b44:	eb b9                	jmp    3aff <malloc+0xaf>
