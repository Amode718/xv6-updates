
user/_init:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:

char *argv[] = { "sh", 0 };

int
main(void)
{
   0:	8d 4c 24 04          	lea    0x4(%esp),%ecx
   4:	83 e4 f0             	and    $0xfffffff0,%esp
   7:	ff 71 fc             	push   -0x4(%ecx)
   a:	55                   	push   %ebp
   b:	89 e5                	mov    %esp,%ebp
   d:	53                   	push   %ebx
   e:	51                   	push   %ecx
  int pid, wpid;

  if(open("console", O_RDWR) < 0){
   f:	83 ec 08             	sub    $0x8,%esp
  12:	6a 02                	push   $0x2
  14:	68 88 08 00 00       	push   $0x888
  19:	e8 65 03 00 00       	call   383 <open>
  1e:	83 c4 10             	add    $0x10,%esp
  21:	85 c0                	test   %eax,%eax
  23:	0f 88 95 00 00 00    	js     be <main+0xbe>
    mknod("console", 1, 1);
    open("console", O_RDWR);
  }
  dup(0);  // stdout
  29:	83 ec 0c             	sub    $0xc,%esp
  2c:	6a 00                	push   $0x0
  2e:	e8 88 03 00 00       	call   3bb <dup>
  dup(0);  // stderr
  33:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  3a:	e8 7c 03 00 00       	call   3bb <dup>
  3f:	83 c4 10             	add    $0x10,%esp
  42:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

  for(;;){
    /*printf("init: starting sh\n");*/
    printf("Beware!!!\n");
  48:	83 ec 0c             	sub    $0xc,%esp
  4b:	68 90 08 00 00       	push   $0x890
  50:	e8 8b 06 00 00       	call   6e0 <printf>
    pid = fork();
  55:	e8 e1 02 00 00       	call   33b <fork>
    if(pid < 0){
  5a:	83 c4 10             	add    $0x10,%esp
    pid = fork();
  5d:	89 c3                	mov    %eax,%ebx
    if(pid < 0){
  5f:	85 c0                	test   %eax,%eax
  61:	78 24                	js     87 <main+0x87>
      fprintf(2, "init: fork failed\n");
      exit();
    }
    if(pid == 0){
  63:	74 35                	je     9a <main+0x9a>
  65:	8d 76 00             	lea    0x0(%esi),%esi
      exec("sh", argv);
      fprintf(2, "init: exec sh failed\n");
      exit();
    }
    while((wpid=wait()) >= 0 && wpid != pid)
  68:	e8 de 02 00 00       	call   34b <wait>
  6d:	85 c0                	test   %eax,%eax
  6f:	78 d7                	js     48 <main+0x48>
  71:	39 c3                	cmp    %eax,%ebx
  73:	74 d3                	je     48 <main+0x48>
      printf("zombie!\n");
  75:	83 ec 0c             	sub    $0xc,%esp
  78:	68 c7 08 00 00       	push   $0x8c7
  7d:	e8 5e 06 00 00       	call   6e0 <printf>
  82:	83 c4 10             	add    $0x10,%esp
  85:	eb e1                	jmp    68 <main+0x68>
      fprintf(2, "init: fork failed\n");
  87:	53                   	push   %ebx
  88:	53                   	push   %ebx
  89:	68 9b 08 00 00       	push   $0x89b
  8e:	6a 02                	push   $0x2
  90:	e8 2b 06 00 00       	call   6c0 <fprintf>
      exit();
  95:	e8 a9 02 00 00       	call   343 <exit>
      exec("sh", argv);
  9a:	50                   	push   %eax
  9b:	50                   	push   %eax
  9c:	68 44 09 00 00       	push   $0x944
  a1:	68 ae 08 00 00       	push   $0x8ae
  a6:	e8 d0 02 00 00       	call   37b <exec>
      fprintf(2, "init: exec sh failed\n");
  ab:	5a                   	pop    %edx
  ac:	59                   	pop    %ecx
  ad:	68 b1 08 00 00       	push   $0x8b1
  b2:	6a 02                	push   $0x2
  b4:	e8 07 06 00 00       	call   6c0 <fprintf>
      exit();
  b9:	e8 85 02 00 00       	call   343 <exit>
    mknod("console", 1, 1);
  be:	50                   	push   %eax
  bf:	6a 01                	push   $0x1
  c1:	6a 01                	push   $0x1
  c3:	68 88 08 00 00       	push   $0x888
  c8:	e8 be 02 00 00       	call   38b <mknod>
    open("console", O_RDWR);
  cd:	58                   	pop    %eax
  ce:	5a                   	pop    %edx
  cf:	6a 02                	push   $0x2
  d1:	68 88 08 00 00       	push   $0x888
  d6:	e8 a8 02 00 00       	call   383 <open>
  db:	83 c4 10             	add    $0x10,%esp
  de:	e9 46 ff ff ff       	jmp    29 <main+0x29>
  e3:	66 90                	xchg   %ax,%ax
  e5:	66 90                	xchg   %ax,%ax
  e7:	66 90                	xchg   %ax,%ax
  e9:	66 90                	xchg   %ax,%ax
  eb:	66 90                	xchg   %ax,%ax
  ed:	66 90                	xchg   %ax,%ax
  ef:	90                   	nop

000000f0 <strcpy>:
#include "user/user.h"
#include "../kernel/x86.h"

char*
strcpy(char *s, const char *t)
{
  f0:	55                   	push   %ebp
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
  f1:	31 c0                	xor    %eax,%eax
{
  f3:	89 e5                	mov    %esp,%ebp
  f5:	53                   	push   %ebx
  f6:	8b 4d 08             	mov    0x8(%ebp),%ecx
  f9:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  fc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  while((*s++ = *t++) != 0)
 100:	0f b6 14 03          	movzbl (%ebx,%eax,1),%edx
 104:	88 14 01             	mov    %dl,(%ecx,%eax,1)
 107:	83 c0 01             	add    $0x1,%eax
 10a:	84 d2                	test   %dl,%dl
 10c:	75 f2                	jne    100 <strcpy+0x10>
    ;
  return os;
}
 10e:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 111:	89 c8                	mov    %ecx,%eax
 113:	c9                   	leave  
 114:	c3                   	ret    
 115:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 11c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000120 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 120:	55                   	push   %ebp
 121:	89 e5                	mov    %esp,%ebp
 123:	53                   	push   %ebx
 124:	8b 55 08             	mov    0x8(%ebp),%edx
 127:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  while(*p && *p == *q)
 12a:	0f b6 02             	movzbl (%edx),%eax
 12d:	84 c0                	test   %al,%al
 12f:	75 17                	jne    148 <strcmp+0x28>
 131:	eb 3a                	jmp    16d <strcmp+0x4d>
 133:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 137:	90                   	nop
 138:	0f b6 42 01          	movzbl 0x1(%edx),%eax
    p++, q++;
 13c:	83 c2 01             	add    $0x1,%edx
 13f:	8d 59 01             	lea    0x1(%ecx),%ebx
  while(*p && *p == *q)
 142:	84 c0                	test   %al,%al
 144:	74 1a                	je     160 <strcmp+0x40>
    p++, q++;
 146:	89 d9                	mov    %ebx,%ecx
  while(*p && *p == *q)
 148:	0f b6 19             	movzbl (%ecx),%ebx
 14b:	38 c3                	cmp    %al,%bl
 14d:	74 e9                	je     138 <strcmp+0x18>
  return (uchar)*p - (uchar)*q;
 14f:	29 d8                	sub    %ebx,%eax
}
 151:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 154:	c9                   	leave  
 155:	c3                   	ret    
 156:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 15d:	8d 76 00             	lea    0x0(%esi),%esi
  return (uchar)*p - (uchar)*q;
 160:	0f b6 59 01          	movzbl 0x1(%ecx),%ebx
 164:	31 c0                	xor    %eax,%eax
 166:	29 d8                	sub    %ebx,%eax
}
 168:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 16b:	c9                   	leave  
 16c:	c3                   	ret    
  return (uchar)*p - (uchar)*q;
 16d:	0f b6 19             	movzbl (%ecx),%ebx
 170:	31 c0                	xor    %eax,%eax
 172:	eb db                	jmp    14f <strcmp+0x2f>
 174:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 17b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 17f:	90                   	nop

00000180 <strlen>:

uint
strlen(const char *s)
{
 180:	55                   	push   %ebp
 181:	89 e5                	mov    %esp,%ebp
 183:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  for(n = 0; s[n]; n++)
 186:	80 3a 00             	cmpb   $0x0,(%edx)
 189:	74 15                	je     1a0 <strlen+0x20>
 18b:	31 c0                	xor    %eax,%eax
 18d:	8d 76 00             	lea    0x0(%esi),%esi
 190:	83 c0 01             	add    $0x1,%eax
 193:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
 197:	89 c1                	mov    %eax,%ecx
 199:	75 f5                	jne    190 <strlen+0x10>
    ;
  return n;
}
 19b:	89 c8                	mov    %ecx,%eax
 19d:	5d                   	pop    %ebp
 19e:	c3                   	ret    
 19f:	90                   	nop
  for(n = 0; s[n]; n++)
 1a0:	31 c9                	xor    %ecx,%ecx
}
 1a2:	5d                   	pop    %ebp
 1a3:	89 c8                	mov    %ecx,%eax
 1a5:	c3                   	ret    
 1a6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 1ad:	8d 76 00             	lea    0x0(%esi),%esi

000001b0 <memset>:

void*
memset(void *dst, int c, uint n)
{
 1b0:	55                   	push   %ebp
 1b1:	89 e5                	mov    %esp,%ebp
 1b3:	57                   	push   %edi
 1b4:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 1b7:	8b 4d 10             	mov    0x10(%ebp),%ecx
 1ba:	8b 45 0c             	mov    0xc(%ebp),%eax
 1bd:	89 d7                	mov    %edx,%edi
 1bf:	fc                   	cld    
 1c0:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 1c2:	8b 7d fc             	mov    -0x4(%ebp),%edi
 1c5:	89 d0                	mov    %edx,%eax
 1c7:	c9                   	leave  
 1c8:	c3                   	ret    
 1c9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

000001d0 <strchr>:

char*
strchr(const char *s, char c)
{
 1d0:	55                   	push   %ebp
 1d1:	89 e5                	mov    %esp,%ebp
 1d3:	8b 45 08             	mov    0x8(%ebp),%eax
 1d6:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 1da:	0f b6 10             	movzbl (%eax),%edx
 1dd:	84 d2                	test   %dl,%dl
 1df:	75 12                	jne    1f3 <strchr+0x23>
 1e1:	eb 1d                	jmp    200 <strchr+0x30>
 1e3:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 1e7:	90                   	nop
 1e8:	0f b6 50 01          	movzbl 0x1(%eax),%edx
 1ec:	83 c0 01             	add    $0x1,%eax
 1ef:	84 d2                	test   %dl,%dl
 1f1:	74 0d                	je     200 <strchr+0x30>
    if(*s == c)
 1f3:	38 d1                	cmp    %dl,%cl
 1f5:	75 f1                	jne    1e8 <strchr+0x18>
      return (char*)s;
  return 0;
}
 1f7:	5d                   	pop    %ebp
 1f8:	c3                   	ret    
 1f9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  return 0;
 200:	31 c0                	xor    %eax,%eax
}
 202:	5d                   	pop    %ebp
 203:	c3                   	ret    
 204:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 20b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 20f:	90                   	nop

00000210 <gets>:

char*
gets(char *buf, int max)
{
 210:	55                   	push   %ebp
 211:	89 e5                	mov    %esp,%ebp
 213:	57                   	push   %edi
 214:	56                   	push   %esi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    cc = read(0, &c, 1);
 215:	8d 7d e7             	lea    -0x19(%ebp),%edi
{
 218:	53                   	push   %ebx
  for(i=0; i+1 < max; ){
 219:	31 db                	xor    %ebx,%ebx
{
 21b:	83 ec 1c             	sub    $0x1c,%esp
  for(i=0; i+1 < max; ){
 21e:	eb 27                	jmp    247 <gets+0x37>
    cc = read(0, &c, 1);
 220:	83 ec 04             	sub    $0x4,%esp
 223:	6a 01                	push   $0x1
 225:	57                   	push   %edi
 226:	6a 00                	push   $0x0
 228:	e8 2e 01 00 00       	call   35b <read>
    if(cc < 1)
 22d:	83 c4 10             	add    $0x10,%esp
 230:	85 c0                	test   %eax,%eax
 232:	7e 1d                	jle    251 <gets+0x41>
      break;
    buf[i++] = c;
 234:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 238:	8b 55 08             	mov    0x8(%ebp),%edx
 23b:	88 44 1a ff          	mov    %al,-0x1(%edx,%ebx,1)
    if(c == '\n' || c == '\r')
 23f:	3c 0a                	cmp    $0xa,%al
 241:	74 1d                	je     260 <gets+0x50>
 243:	3c 0d                	cmp    $0xd,%al
 245:	74 19                	je     260 <gets+0x50>
  for(i=0; i+1 < max; ){
 247:	89 de                	mov    %ebx,%esi
 249:	83 c3 01             	add    $0x1,%ebx
 24c:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 24f:	7c cf                	jl     220 <gets+0x10>
      break;
  }
  buf[i] = '\0';
 251:	8b 45 08             	mov    0x8(%ebp),%eax
 254:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
  return buf;
}
 258:	8d 65 f4             	lea    -0xc(%ebp),%esp
 25b:	5b                   	pop    %ebx
 25c:	5e                   	pop    %esi
 25d:	5f                   	pop    %edi
 25e:	5d                   	pop    %ebp
 25f:	c3                   	ret    
  buf[i] = '\0';
 260:	8b 45 08             	mov    0x8(%ebp),%eax
 263:	89 de                	mov    %ebx,%esi
 265:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
}
 269:	8d 65 f4             	lea    -0xc(%ebp),%esp
 26c:	5b                   	pop    %ebx
 26d:	5e                   	pop    %esi
 26e:	5f                   	pop    %edi
 26f:	5d                   	pop    %ebp
 270:	c3                   	ret    
 271:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 278:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 27f:	90                   	nop

00000280 <stat>:

int
stat(const char *n, struct stat *st)
{
 280:	55                   	push   %ebp
 281:	89 e5                	mov    %esp,%ebp
 283:	56                   	push   %esi
 284:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 285:	83 ec 08             	sub    $0x8,%esp
 288:	6a 00                	push   $0x0
 28a:	ff 75 08             	push   0x8(%ebp)
 28d:	e8 f1 00 00 00       	call   383 <open>
  if(fd < 0)
 292:	83 c4 10             	add    $0x10,%esp
 295:	85 c0                	test   %eax,%eax
 297:	78 27                	js     2c0 <stat+0x40>
    return -1;
  r = fstat(fd, st);
 299:	83 ec 08             	sub    $0x8,%esp
 29c:	ff 75 0c             	push   0xc(%ebp)
 29f:	89 c3                	mov    %eax,%ebx
 2a1:	50                   	push   %eax
 2a2:	e8 f4 00 00 00       	call   39b <fstat>
  close(fd);
 2a7:	89 1c 24             	mov    %ebx,(%esp)
  r = fstat(fd, st);
 2aa:	89 c6                	mov    %eax,%esi
  close(fd);
 2ac:	e8 ba 00 00 00       	call   36b <close>
  return r;
 2b1:	83 c4 10             	add    $0x10,%esp
}
 2b4:	8d 65 f8             	lea    -0x8(%ebp),%esp
 2b7:	89 f0                	mov    %esi,%eax
 2b9:	5b                   	pop    %ebx
 2ba:	5e                   	pop    %esi
 2bb:	5d                   	pop    %ebp
 2bc:	c3                   	ret    
 2bd:	8d 76 00             	lea    0x0(%esi),%esi
    return -1;
 2c0:	be ff ff ff ff       	mov    $0xffffffff,%esi
 2c5:	eb ed                	jmp    2b4 <stat+0x34>
 2c7:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 2ce:	66 90                	xchg   %ax,%ax

000002d0 <atoi>:

int
atoi(const char *s)
{
 2d0:	55                   	push   %ebp
 2d1:	89 e5                	mov    %esp,%ebp
 2d3:	53                   	push   %ebx
 2d4:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 2d7:	0f be 02             	movsbl (%edx),%eax
 2da:	8d 48 d0             	lea    -0x30(%eax),%ecx
 2dd:	80 f9 09             	cmp    $0x9,%cl
  n = 0;
 2e0:	b9 00 00 00 00       	mov    $0x0,%ecx
  while('0' <= *s && *s <= '9')
 2e5:	77 1e                	ja     305 <atoi+0x35>
 2e7:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 2ee:	66 90                	xchg   %ax,%ax
    n = n*10 + *s++ - '0';
 2f0:	83 c2 01             	add    $0x1,%edx
 2f3:	8d 0c 89             	lea    (%ecx,%ecx,4),%ecx
 2f6:	8d 4c 48 d0          	lea    -0x30(%eax,%ecx,2),%ecx
  while('0' <= *s && *s <= '9')
 2fa:	0f be 02             	movsbl (%edx),%eax
 2fd:	8d 58 d0             	lea    -0x30(%eax),%ebx
 300:	80 fb 09             	cmp    $0x9,%bl
 303:	76 eb                	jbe    2f0 <atoi+0x20>
  return n;
}
 305:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 308:	89 c8                	mov    %ecx,%eax
 30a:	c9                   	leave  
 30b:	c3                   	ret    
 30c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000310 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 310:	55                   	push   %ebp
 311:	89 e5                	mov    %esp,%ebp
 313:	57                   	push   %edi
 314:	8b 45 10             	mov    0x10(%ebp),%eax
 317:	8b 55 08             	mov    0x8(%ebp),%edx
 31a:	56                   	push   %esi
 31b:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 31e:	85 c0                	test   %eax,%eax
 320:	7e 13                	jle    335 <memmove+0x25>
 322:	01 d0                	add    %edx,%eax
  dst = vdst;
 324:	89 d7                	mov    %edx,%edi
 326:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 32d:	8d 76 00             	lea    0x0(%esi),%esi
    *dst++ = *src++;
 330:	a4                   	movsb  %ds:(%esi),%es:(%edi)
  while(n-- > 0)
 331:	39 f8                	cmp    %edi,%eax
 333:	75 fb                	jne    330 <memmove+0x20>
  return vdst;
}
 335:	5e                   	pop    %esi
 336:	89 d0                	mov    %edx,%eax
 338:	5f                   	pop    %edi
 339:	5d                   	pop    %ebp
 33a:	c3                   	ret    

0000033b <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 33b:	b8 01 00 00 00       	mov    $0x1,%eax
 340:	cd 40                	int    $0x40
 342:	c3                   	ret    

00000343 <exit>:
SYSCALL(exit)
 343:	b8 02 00 00 00       	mov    $0x2,%eax
 348:	cd 40                	int    $0x40
 34a:	c3                   	ret    

0000034b <wait>:
SYSCALL(wait)
 34b:	b8 03 00 00 00       	mov    $0x3,%eax
 350:	cd 40                	int    $0x40
 352:	c3                   	ret    

00000353 <pipe>:
SYSCALL(pipe)
 353:	b8 04 00 00 00       	mov    $0x4,%eax
 358:	cd 40                	int    $0x40
 35a:	c3                   	ret    

0000035b <read>:
SYSCALL(read)
 35b:	b8 05 00 00 00       	mov    $0x5,%eax
 360:	cd 40                	int    $0x40
 362:	c3                   	ret    

00000363 <write>:
SYSCALL(write)
 363:	b8 10 00 00 00       	mov    $0x10,%eax
 368:	cd 40                	int    $0x40
 36a:	c3                   	ret    

0000036b <close>:
SYSCALL(close)
 36b:	b8 15 00 00 00       	mov    $0x15,%eax
 370:	cd 40                	int    $0x40
 372:	c3                   	ret    

00000373 <kill>:
SYSCALL(kill)
 373:	b8 06 00 00 00       	mov    $0x6,%eax
 378:	cd 40                	int    $0x40
 37a:	c3                   	ret    

0000037b <exec>:
SYSCALL(exec)
 37b:	b8 07 00 00 00       	mov    $0x7,%eax
 380:	cd 40                	int    $0x40
 382:	c3                   	ret    

00000383 <open>:
SYSCALL(open)
 383:	b8 0f 00 00 00       	mov    $0xf,%eax
 388:	cd 40                	int    $0x40
 38a:	c3                   	ret    

0000038b <mknod>:
SYSCALL(mknod)
 38b:	b8 11 00 00 00       	mov    $0x11,%eax
 390:	cd 40                	int    $0x40
 392:	c3                   	ret    

00000393 <unlink>:
SYSCALL(unlink)
 393:	b8 12 00 00 00       	mov    $0x12,%eax
 398:	cd 40                	int    $0x40
 39a:	c3                   	ret    

0000039b <fstat>:
SYSCALL(fstat)
 39b:	b8 08 00 00 00       	mov    $0x8,%eax
 3a0:	cd 40                	int    $0x40
 3a2:	c3                   	ret    

000003a3 <link>:
SYSCALL(link)
 3a3:	b8 13 00 00 00       	mov    $0x13,%eax
 3a8:	cd 40                	int    $0x40
 3aa:	c3                   	ret    

000003ab <mkdir>:
SYSCALL(mkdir)
 3ab:	b8 14 00 00 00       	mov    $0x14,%eax
 3b0:	cd 40                	int    $0x40
 3b2:	c3                   	ret    

000003b3 <chdir>:
SYSCALL(chdir)
 3b3:	b8 09 00 00 00       	mov    $0x9,%eax
 3b8:	cd 40                	int    $0x40
 3ba:	c3                   	ret    

000003bb <dup>:
SYSCALL(dup)
 3bb:	b8 0a 00 00 00       	mov    $0xa,%eax
 3c0:	cd 40                	int    $0x40
 3c2:	c3                   	ret    

000003c3 <getpid>:
SYSCALL(getpid)
 3c3:	b8 0b 00 00 00       	mov    $0xb,%eax
 3c8:	cd 40                	int    $0x40
 3ca:	c3                   	ret    

000003cb <sbrk>:
SYSCALL(sbrk)
 3cb:	b8 0c 00 00 00       	mov    $0xc,%eax
 3d0:	cd 40                	int    $0x40
 3d2:	c3                   	ret    

000003d3 <sleep>:
SYSCALL(sleep)
 3d3:	b8 0d 00 00 00       	mov    $0xd,%eax
 3d8:	cd 40                	int    $0x40
 3da:	c3                   	ret    

000003db <uptime>:
SYSCALL(uptime)
 3db:	b8 0e 00 00 00       	mov    $0xe,%eax
 3e0:	cd 40                	int    $0x40
 3e2:	c3                   	ret    

000003e3 <cpuhalt>:
SYSCALL(cpuhalt)
 3e3:	b8 16 00 00 00       	mov    $0x16,%eax
 3e8:	cd 40                	int    $0x40
 3ea:	c3                   	ret    
 3eb:	66 90                	xchg   %ax,%ax
 3ed:	66 90                	xchg   %ax,%ax
 3ef:	90                   	nop

000003f0 <printint.constprop.0>:
  for (i = 0; i < (sizeof(uint) * 2); i++, x <<= 4)
    putc(fd, digits[x >> (sizeof(uint) * 8 - 4)]);
}

static void
printint(int fd, int xx, int base, int sgn)
 3f0:	55                   	push   %ebp
 3f1:	89 e5                	mov    %esp,%ebp
 3f3:	57                   	push   %edi
 3f4:	56                   	push   %esi
 3f5:	53                   	push   %ebx
 3f6:	83 ec 3c             	sub    $0x3c,%esp
 3f9:	89 55 c4             	mov    %edx,-0x3c(%ebp)
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 3fc:	85 c0                	test   %eax,%eax
 3fe:	0f 89 84 00 00 00    	jns    488 <printint.constprop.0+0x98>
 404:	83 e1 01             	and    $0x1,%ecx
 407:	74 7f                	je     488 <printint.constprop.0+0x98>
    neg = 1;
 409:	c7 45 bc 01 00 00 00 	movl   $0x1,-0x44(%ebp)
    x = -xx;
 410:	f7 d8                	neg    %eax
 412:	89 c1                	mov    %eax,%ecx
  } else {
    x = xx;
  }

  i = 0;
 414:	31 db                	xor    %ebx,%ebx
 416:	8d 75 d7             	lea    -0x29(%ebp),%esi
 419:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  do{
    buf[i++] = digits[x % base];
 420:	89 c8                	mov    %ecx,%eax
 422:	31 d2                	xor    %edx,%edx
 424:	89 cf                	mov    %ecx,%edi
 426:	f7 75 c4             	divl   -0x3c(%ebp)
 429:	0f b6 92 30 09 00 00 	movzbl 0x930(%edx),%edx
 430:	89 45 c0             	mov    %eax,-0x40(%ebp)
 433:	89 d8                	mov    %ebx,%eax
 435:	8d 5b 01             	lea    0x1(%ebx),%ebx
  }while((x /= base) != 0);
 438:	8b 4d c0             	mov    -0x40(%ebp),%ecx
    buf[i++] = digits[x % base];
 43b:	88 14 1e             	mov    %dl,(%esi,%ebx,1)
  }while((x /= base) != 0);
 43e:	3b 7d c4             	cmp    -0x3c(%ebp),%edi
 441:	73 dd                	jae    420 <printint.constprop.0+0x30>
  if(neg)
 443:	8b 4d bc             	mov    -0x44(%ebp),%ecx
 446:	85 c9                	test   %ecx,%ecx
 448:	74 0c                	je     456 <printint.constprop.0+0x66>
    buf[i++] = '-';
 44a:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
    buf[i++] = digits[x % base];
 44f:	89 d8                	mov    %ebx,%eax
    buf[i++] = '-';
 451:	ba 2d 00 00 00       	mov    $0x2d,%edx

  while(--i >= 0)
 456:	8d 5c 05 d7          	lea    -0x29(%ebp,%eax,1),%ebx
 45a:	eb 0a                	jmp    466 <printint.constprop.0+0x76>
 45c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    putc(fd, buf[i]);
 460:	0f b6 13             	movzbl (%ebx),%edx
 463:	83 eb 01             	sub    $0x1,%ebx
  write(fd, &c, 1);
 466:	83 ec 04             	sub    $0x4,%esp
 469:	88 55 d7             	mov    %dl,-0x29(%ebp)
 46c:	6a 01                	push   $0x1
 46e:	56                   	push   %esi
 46f:	6a 01                	push   $0x1
 471:	e8 ed fe ff ff       	call   363 <write>
  while(--i >= 0)
 476:	83 c4 10             	add    $0x10,%esp
 479:	39 de                	cmp    %ebx,%esi
 47b:	75 e3                	jne    460 <printint.constprop.0+0x70>
}
 47d:	8d 65 f4             	lea    -0xc(%ebp),%esp
 480:	5b                   	pop    %ebx
 481:	5e                   	pop    %esi
 482:	5f                   	pop    %edi
 483:	5d                   	pop    %ebp
 484:	c3                   	ret    
 485:	8d 76 00             	lea    0x0(%esi),%esi
  neg = 0;
 488:	c7 45 bc 00 00 00 00 	movl   $0x0,-0x44(%ebp)
    x = xx;
 48f:	89 c1                	mov    %eax,%ecx
 491:	eb 81                	jmp    414 <printint.constprop.0+0x24>
 493:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 49a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

000004a0 <vprintf.constprop.0>:
static void vprintf(int fd, const char *fmt, va_list ap)
 4a0:	55                   	push   %ebp
 4a1:	89 e5                	mov    %esp,%ebp
 4a3:	57                   	push   %edi
 4a4:	56                   	push   %esi
 4a5:	53                   	push   %ebx
 4a6:	83 ec 2c             	sub    $0x2c,%esp
 4a9:	89 55 d4             	mov    %edx,-0x2c(%ebp)
{
  char *s;
  int c, i, state;

  state = 0;
  for(i = 0; fmt[i]; i++){
 4ac:	0f b6 10             	movzbl (%eax),%edx
 4af:	84 d2                	test   %dl,%dl
 4b1:	74 6c                	je     51f <vprintf.constprop.0+0x7f>
 4b3:	8d 58 01             	lea    0x1(%eax),%ebx
 4b6:	31 ff                	xor    %edi,%edi
 4b8:	8d 75 e7             	lea    -0x19(%ebp),%esi
 4bb:	eb 25                	jmp    4e2 <vprintf.constprop.0+0x42>
 4bd:	8d 76 00             	lea    0x0(%esi),%esi
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
 4c0:	83 f8 25             	cmp    $0x25,%eax
 4c3:	74 4b                	je     510 <vprintf.constprop.0+0x70>
  write(fd, &c, 1);
 4c5:	83 ec 04             	sub    $0x4,%esp
 4c8:	88 55 e7             	mov    %dl,-0x19(%ebp)
 4cb:	6a 01                	push   $0x1
 4cd:	56                   	push   %esi
 4ce:	6a 01                	push   $0x1
 4d0:	e8 8e fe ff ff       	call   363 <write>
        state = '%';
      } else {
        putc(fd, c);
 4d5:	83 c4 10             	add    $0x10,%esp
  for(i = 0; fmt[i]; i++){
 4d8:	0f b6 13             	movzbl (%ebx),%edx
 4db:	83 c3 01             	add    $0x1,%ebx
 4de:	84 d2                	test   %dl,%dl
 4e0:	74 3d                	je     51f <vprintf.constprop.0+0x7f>
    c = fmt[i] & 0xff;
 4e2:	0f b6 c2             	movzbl %dl,%eax
    if(state == 0){
 4e5:	85 ff                	test   %edi,%edi
 4e7:	74 d7                	je     4c0 <vprintf.constprop.0+0x20>
      }
    } else if(state == '%'){
 4e9:	83 ff 25             	cmp    $0x25,%edi
 4ec:	75 ea                	jne    4d8 <vprintf.constprop.0+0x38>
      if(c == 'd'){
 4ee:	83 f8 25             	cmp    $0x25,%eax
 4f1:	0f 84 a9 01 00 00    	je     6a0 <vprintf.constprop.0+0x200>
 4f7:	83 e8 63             	sub    $0x63,%eax
 4fa:	83 f8 15             	cmp    $0x15,%eax
 4fd:	77 31                	ja     530 <vprintf.constprop.0+0x90>
 4ff:	ff 24 85 d8 08 00 00 	jmp    *0x8d8(,%eax,4)
 506:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 50d:	8d 76 00             	lea    0x0(%esi),%esi
  for(i = 0; fmt[i]; i++){
 510:	0f b6 13             	movzbl (%ebx),%edx
 513:	83 c3 01             	add    $0x1,%ebx
        state = '%';
 516:	bf 25 00 00 00       	mov    $0x25,%edi
  for(i = 0; fmt[i]; i++){
 51b:	84 d2                	test   %dl,%dl
 51d:	75 c3                	jne    4e2 <vprintf.constprop.0+0x42>
        putc(fd, c);
      }
      state = 0;
    }
  }
}
 51f:	8d 65 f4             	lea    -0xc(%ebp),%esp
 522:	5b                   	pop    %ebx
 523:	5e                   	pop    %esi
 524:	5f                   	pop    %edi
 525:	5d                   	pop    %ebp
 526:	c3                   	ret    
 527:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 52e:	66 90                	xchg   %ax,%ax
  write(fd, &c, 1);
 530:	83 ec 04             	sub    $0x4,%esp
 533:	88 55 d0             	mov    %dl,-0x30(%ebp)
 536:	6a 01                	push   $0x1
 538:	56                   	push   %esi
 539:	6a 01                	push   $0x1
 53b:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
 53f:	e8 1f fe ff ff       	call   363 <write>
        putc(fd, c);
 544:	0f b6 55 d0          	movzbl -0x30(%ebp),%edx
  write(fd, &c, 1);
 548:	83 c4 0c             	add    $0xc,%esp
 54b:	88 55 e7             	mov    %dl,-0x19(%ebp)
 54e:	6a 01                	push   $0x1
      state = 0;
 550:	31 ff                	xor    %edi,%edi
  write(fd, &c, 1);
 552:	56                   	push   %esi
 553:	6a 01                	push   $0x1
 555:	e8 09 fe ff ff       	call   363 <write>
        putc(fd, c);
 55a:	83 c4 10             	add    $0x10,%esp
 55d:	e9 76 ff ff ff       	jmp    4d8 <vprintf.constprop.0+0x38>
 562:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        putc(fd, va_arg(ap, uint));
 568:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  write(fd, &c, 1);
 56b:	83 ec 04             	sub    $0x4,%esp
        putc(fd, va_arg(ap, uint));
 56e:	8d 78 04             	lea    0x4(%eax),%edi
 571:	8b 00                	mov    (%eax),%eax
  write(fd, &c, 1);
 573:	6a 01                	push   $0x1
 575:	56                   	push   %esi
 576:	6a 01                	push   $0x1
        putc(fd, va_arg(ap, uint));
 578:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
 57b:	e8 e3 fd ff ff       	call   363 <write>
        putc(fd, va_arg(ap, uint));
 580:	89 7d d4             	mov    %edi,-0x2c(%ebp)
 583:	83 c4 10             	add    $0x10,%esp
      state = 0;
 586:	31 ff                	xor    %edi,%edi
 588:	e9 4b ff ff ff       	jmp    4d8 <vprintf.constprop.0+0x38>
 58d:	8d 76 00             	lea    0x0(%esi),%esi
        printint(fd, va_arg(ap, int), 10, 1);
 590:	8b 45 d4             	mov    -0x2c(%ebp),%eax
 593:	b9 01 00 00 00       	mov    $0x1,%ecx
 598:	8d 78 04             	lea    0x4(%eax),%edi
        printint(fd, va_arg(ap, uint), 10, 0);
 59b:	8b 00                	mov    (%eax),%eax
 59d:	ba 0a 00 00 00       	mov    $0xa,%edx
 5a2:	e8 49 fe ff ff       	call   3f0 <printint.constprop.0>
 5a7:	89 7d d4             	mov    %edi,-0x2c(%ebp)
      state = 0;
 5aa:	31 ff                	xor    %edi,%edi
 5ac:	e9 27 ff ff ff       	jmp    4d8 <vprintf.constprop.0+0x38>
 5b1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        printint(fd, va_arg(ap, uint), 10, 0);
 5b8:	8b 45 d4             	mov    -0x2c(%ebp),%eax
 5bb:	31 c9                	xor    %ecx,%ecx
 5bd:	8d 78 04             	lea    0x4(%eax),%edi
 5c0:	eb d9                	jmp    59b <vprintf.constprop.0+0xfb>
 5c2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        printptr(fd, va_arg(ap, uint));
 5c8:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  write(fd, &c, 1);
 5cb:	83 ec 04             	sub    $0x4,%esp
 5ce:	c6 45 e7 30          	movb   $0x30,-0x19(%ebp)
        printptr(fd, va_arg(ap, uint));
 5d2:	8b 38                	mov    (%eax),%edi
  write(fd, &c, 1);
 5d4:	6a 01                	push   $0x1
        printptr(fd, va_arg(ap, uint));
 5d6:	8d 48 04             	lea    0x4(%eax),%ecx
  write(fd, &c, 1);
 5d9:	56                   	push   %esi
 5da:	6a 01                	push   $0x1
        printptr(fd, va_arg(ap, uint));
 5dc:	89 4d d0             	mov    %ecx,-0x30(%ebp)
  write(fd, &c, 1);
 5df:	e8 7f fd ff ff       	call   363 <write>
 5e4:	83 c4 0c             	add    $0xc,%esp
 5e7:	c6 45 e7 78          	movb   $0x78,-0x19(%ebp)
 5eb:	6a 01                	push   $0x1
 5ed:	56                   	push   %esi
 5ee:	6a 01                	push   $0x1
 5f0:	e8 6e fd ff ff       	call   363 <write>
  putc(fd, 'x');
 5f5:	c7 45 d4 08 00 00 00 	movl   $0x8,-0x2c(%ebp)
 5fc:	83 c4 10             	add    $0x10,%esp
 5ff:	90                   	nop
  write(fd, &c, 1);
 600:	83 ec 04             	sub    $0x4,%esp
    putc(fd, digits[x >> (sizeof(uint) * 8 - 4)]);
 603:	89 f8                	mov    %edi,%eax
  for (i = 0; i < (sizeof(uint) * 2); i++, x <<= 4)
 605:	c1 e7 04             	shl    $0x4,%edi
  write(fd, &c, 1);
 608:	6a 01                	push   $0x1
    putc(fd, digits[x >> (sizeof(uint) * 8 - 4)]);
 60a:	c1 e8 1c             	shr    $0x1c,%eax
  write(fd, &c, 1);
 60d:	56                   	push   %esi
 60e:	0f b6 80 30 09 00 00 	movzbl 0x930(%eax),%eax
 615:	6a 01                	push   $0x1
 617:	88 45 e7             	mov    %al,-0x19(%ebp)
 61a:	e8 44 fd ff ff       	call   363 <write>
  for (i = 0; i < (sizeof(uint) * 2); i++, x <<= 4)
 61f:	83 c4 10             	add    $0x10,%esp
 622:	83 6d d4 01          	subl   $0x1,-0x2c(%ebp)
 626:	75 d8                	jne    600 <vprintf.constprop.0+0x160>
        printptr(fd, va_arg(ap, uint));
 628:	8b 45 d0             	mov    -0x30(%ebp),%eax
      state = 0;
 62b:	31 ff                	xor    %edi,%edi
        printptr(fd, va_arg(ap, uint));
 62d:	89 45 d4             	mov    %eax,-0x2c(%ebp)
 630:	e9 a3 fe ff ff       	jmp    4d8 <vprintf.constprop.0+0x38>
 635:	8d 76 00             	lea    0x0(%esi),%esi
        s = va_arg(ap, char*);
 638:	8b 45 d4             	mov    -0x2c(%ebp),%eax
 63b:	8b 38                	mov    (%eax),%edi
 63d:	8d 48 04             	lea    0x4(%eax),%ecx
 640:	89 4d d4             	mov    %ecx,-0x2c(%ebp)
        if(s == 0)
 643:	85 ff                	test   %edi,%edi
 645:	74 64                	je     6ab <vprintf.constprop.0+0x20b>
        while(*s != 0){
 647:	0f b6 07             	movzbl (%edi),%eax
 64a:	84 c0                	test   %al,%al
 64c:	74 1f                	je     66d <vprintf.constprop.0+0x1cd>
 64e:	66 90                	xchg   %ax,%ax
  write(fd, &c, 1);
 650:	83 ec 04             	sub    $0x4,%esp
          s++;
 653:	83 c7 01             	add    $0x1,%edi
 656:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
 659:	6a 01                	push   $0x1
 65b:	56                   	push   %esi
 65c:	6a 01                	push   $0x1
 65e:	e8 00 fd ff ff       	call   363 <write>
        while(*s != 0){
 663:	0f b6 07             	movzbl (%edi),%eax
 666:	83 c4 10             	add    $0x10,%esp
 669:	84 c0                	test   %al,%al
 66b:	75 e3                	jne    650 <vprintf.constprop.0+0x1b0>
      state = 0;
 66d:	31 ff                	xor    %edi,%edi
 66f:	e9 64 fe ff ff       	jmp    4d8 <vprintf.constprop.0+0x38>
 674:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        printint(fd, va_arg(ap, int), 16, 0);
 678:	8b 45 d4             	mov    -0x2c(%ebp),%eax
 67b:	31 c9                	xor    %ecx,%ecx
 67d:	ba 10 00 00 00       	mov    $0x10,%edx
 682:	8d 78 04             	lea    0x4(%eax),%edi
 685:	8b 00                	mov    (%eax),%eax
 687:	e8 64 fd ff ff       	call   3f0 <printint.constprop.0>
 68c:	89 7d d4             	mov    %edi,-0x2c(%ebp)
      state = 0;
 68f:	31 ff                	xor    %edi,%edi
 691:	e9 42 fe ff ff       	jmp    4d8 <vprintf.constprop.0+0x38>
 696:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 69d:	8d 76 00             	lea    0x0(%esi),%esi
        putc(fd, c);
 6a0:	88 55 e7             	mov    %dl,-0x19(%ebp)
  write(fd, &c, 1);
 6a3:	83 ec 04             	sub    $0x4,%esp
 6a6:	e9 a3 fe ff ff       	jmp    54e <vprintf.constprop.0+0xae>
          s = "(null)";
 6ab:	bf d0 08 00 00       	mov    $0x8d0,%edi
        while(*s != 0){
 6b0:	b8 28 00 00 00       	mov    $0x28,%eax
 6b5:	eb 99                	jmp    650 <vprintf.constprop.0+0x1b0>
 6b7:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 6be:	66 90                	xchg   %ax,%ax

000006c0 <fprintf>:
// Print to the given fd. Only understands %d,%x, %p, %s, %c.
void
fprintf(int fd, const char *fmt, ...)
{
 6c0:	55                   	push   %ebp
 6c1:	89 e5                	mov    %esp,%ebp
 6c3:	83 ec 08             	sub    $0x8,%esp
 va_list ap;
 va_start(ap, fmt); 
 vprintf(1,fmt,ap);
 6c6:	8b 45 0c             	mov    0xc(%ebp),%eax
 6c9:	8d 55 10             	lea    0x10(%ebp),%edx
 6cc:	e8 cf fd ff ff       	call   4a0 <vprintf.constprop.0>
}
 6d1:	c9                   	leave  
 6d2:	c3                   	ret    
 6d3:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 6da:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

000006e0 <printf>:
void
printf(const char *fmt, ...)
{
 6e0:	55                   	push   %ebp
 6e1:	89 e5                	mov    %esp,%ebp
 6e3:	83 ec 08             	sub    $0x8,%esp
  va_list ap;
  va_start(ap, fmt); 
  vprintf(1,fmt,ap);
 6e6:	8b 45 08             	mov    0x8(%ebp),%eax
 6e9:	8d 55 0c             	lea    0xc(%ebp),%edx
 6ec:	e8 af fd ff ff       	call   4a0 <vprintf.constprop.0>
}
 6f1:	c9                   	leave  
 6f2:	c3                   	ret    
 6f3:	66 90                	xchg   %ax,%ax
 6f5:	66 90                	xchg   %ax,%ax
 6f7:	66 90                	xchg   %ax,%ax
 6f9:	66 90                	xchg   %ax,%ax
 6fb:	66 90                	xchg   %ax,%ax
 6fd:	66 90                	xchg   %ax,%ax
 6ff:	90                   	nop

00000700 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 700:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 701:	a1 4c 09 00 00       	mov    0x94c,%eax
{
 706:	89 e5                	mov    %esp,%ebp
 708:	57                   	push   %edi
 709:	56                   	push   %esi
 70a:	53                   	push   %ebx
 70b:	8b 5d 08             	mov    0x8(%ebp),%ebx
  bp = (Header*)ap - 1;
 70e:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 711:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 718:	89 c2                	mov    %eax,%edx
 71a:	8b 00                	mov    (%eax),%eax
 71c:	39 ca                	cmp    %ecx,%edx
 71e:	73 30                	jae    750 <free+0x50>
 720:	39 c1                	cmp    %eax,%ecx
 722:	72 04                	jb     728 <free+0x28>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 724:	39 c2                	cmp    %eax,%edx
 726:	72 f0                	jb     718 <free+0x18>
      break;
  if(bp + bp->s.size == p->s.ptr){
 728:	8b 73 fc             	mov    -0x4(%ebx),%esi
 72b:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 72e:	39 f8                	cmp    %edi,%eax
 730:	74 30                	je     762 <free+0x62>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
 732:	89 43 f8             	mov    %eax,-0x8(%ebx)
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
 735:	8b 42 04             	mov    0x4(%edx),%eax
 738:	8d 34 c2             	lea    (%edx,%eax,8),%esi
 73b:	39 f1                	cmp    %esi,%ecx
 73d:	74 3a                	je     779 <free+0x79>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
 73f:	89 0a                	mov    %ecx,(%edx)
  } else
    p->s.ptr = bp;
  freep = p;
}
 741:	5b                   	pop    %ebx
  freep = p;
 742:	89 15 4c 09 00 00    	mov    %edx,0x94c
}
 748:	5e                   	pop    %esi
 749:	5f                   	pop    %edi
 74a:	5d                   	pop    %ebp
 74b:	c3                   	ret    
 74c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 750:	39 c2                	cmp    %eax,%edx
 752:	72 c4                	jb     718 <free+0x18>
 754:	39 c1                	cmp    %eax,%ecx
 756:	73 c0                	jae    718 <free+0x18>
  if(bp + bp->s.size == p->s.ptr){
 758:	8b 73 fc             	mov    -0x4(%ebx),%esi
 75b:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 75e:	39 f8                	cmp    %edi,%eax
 760:	75 d0                	jne    732 <free+0x32>
    bp->s.size += p->s.ptr->s.size;
 762:	03 70 04             	add    0x4(%eax),%esi
 765:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 768:	8b 02                	mov    (%edx),%eax
 76a:	8b 00                	mov    (%eax),%eax
 76c:	89 43 f8             	mov    %eax,-0x8(%ebx)
  if(p + p->s.size == bp){
 76f:	8b 42 04             	mov    0x4(%edx),%eax
 772:	8d 34 c2             	lea    (%edx,%eax,8),%esi
 775:	39 f1                	cmp    %esi,%ecx
 777:	75 c6                	jne    73f <free+0x3f>
    p->s.size += bp->s.size;
 779:	03 43 fc             	add    -0x4(%ebx),%eax
  freep = p;
 77c:	89 15 4c 09 00 00    	mov    %edx,0x94c
    p->s.size += bp->s.size;
 782:	89 42 04             	mov    %eax,0x4(%edx)
    p->s.ptr = bp->s.ptr;
 785:	8b 4b f8             	mov    -0x8(%ebx),%ecx
 788:	89 0a                	mov    %ecx,(%edx)
}
 78a:	5b                   	pop    %ebx
 78b:	5e                   	pop    %esi
 78c:	5f                   	pop    %edi
 78d:	5d                   	pop    %ebp
 78e:	c3                   	ret    
 78f:	90                   	nop

00000790 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 790:	55                   	push   %ebp
 791:	89 e5                	mov    %esp,%ebp
 793:	57                   	push   %edi
 794:	56                   	push   %esi
 795:	53                   	push   %ebx
 796:	83 ec 1c             	sub    $0x1c,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 799:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
 79c:	8b 3d 4c 09 00 00    	mov    0x94c,%edi
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 7a2:	8d 70 07             	lea    0x7(%eax),%esi
 7a5:	c1 ee 03             	shr    $0x3,%esi
 7a8:	83 c6 01             	add    $0x1,%esi
  if((prevp = freep) == 0){
 7ab:	85 ff                	test   %edi,%edi
 7ad:	0f 84 9d 00 00 00    	je     850 <malloc+0xc0>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 7b3:	8b 17                	mov    (%edi),%edx
    if(p->s.size >= nunits){
 7b5:	8b 4a 04             	mov    0x4(%edx),%ecx
 7b8:	39 f1                	cmp    %esi,%ecx
 7ba:	73 6a                	jae    826 <malloc+0x96>
 7bc:	bb 00 10 00 00       	mov    $0x1000,%ebx
 7c1:	39 de                	cmp    %ebx,%esi
 7c3:	0f 43 de             	cmovae %esi,%ebx
  p = sbrk(nu * sizeof(Header));
 7c6:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
 7cd:	89 45 e4             	mov    %eax,-0x1c(%ebp)
 7d0:	eb 17                	jmp    7e9 <malloc+0x59>
 7d2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 7d8:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
 7da:	8b 48 04             	mov    0x4(%eax),%ecx
 7dd:	39 f1                	cmp    %esi,%ecx
 7df:	73 4f                	jae    830 <malloc+0xa0>
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 7e1:	8b 3d 4c 09 00 00    	mov    0x94c,%edi
 7e7:	89 c2                	mov    %eax,%edx
 7e9:	39 d7                	cmp    %edx,%edi
 7eb:	75 eb                	jne    7d8 <malloc+0x48>
  p = sbrk(nu * sizeof(Header));
 7ed:	83 ec 0c             	sub    $0xc,%esp
 7f0:	ff 75 e4             	push   -0x1c(%ebp)
 7f3:	e8 d3 fb ff ff       	call   3cb <sbrk>
  if(p == (char*)-1)
 7f8:	83 c4 10             	add    $0x10,%esp
 7fb:	83 f8 ff             	cmp    $0xffffffff,%eax
 7fe:	74 1c                	je     81c <malloc+0x8c>
  hp->s.size = nu;
 800:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 803:	83 ec 0c             	sub    $0xc,%esp
 806:	83 c0 08             	add    $0x8,%eax
 809:	50                   	push   %eax
 80a:	e8 f1 fe ff ff       	call   700 <free>
  return freep;
 80f:	8b 15 4c 09 00 00    	mov    0x94c,%edx
      if((p = morecore(nunits)) == 0)
 815:	83 c4 10             	add    $0x10,%esp
 818:	85 d2                	test   %edx,%edx
 81a:	75 bc                	jne    7d8 <malloc+0x48>
        return 0;
  }
}
 81c:	8d 65 f4             	lea    -0xc(%ebp),%esp
        return 0;
 81f:	31 c0                	xor    %eax,%eax
}
 821:	5b                   	pop    %ebx
 822:	5e                   	pop    %esi
 823:	5f                   	pop    %edi
 824:	5d                   	pop    %ebp
 825:	c3                   	ret    
    if(p->s.size >= nunits){
 826:	89 d0                	mov    %edx,%eax
 828:	89 fa                	mov    %edi,%edx
 82a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      if(p->s.size == nunits)
 830:	39 ce                	cmp    %ecx,%esi
 832:	74 4c                	je     880 <malloc+0xf0>
        p->s.size -= nunits;
 834:	29 f1                	sub    %esi,%ecx
 836:	89 48 04             	mov    %ecx,0x4(%eax)
        p += p->s.size;
 839:	8d 04 c8             	lea    (%eax,%ecx,8),%eax
        p->s.size = nunits;
 83c:	89 70 04             	mov    %esi,0x4(%eax)
      freep = prevp;
 83f:	89 15 4c 09 00 00    	mov    %edx,0x94c
}
 845:	8d 65 f4             	lea    -0xc(%ebp),%esp
      return (void*)(p + 1);
 848:	83 c0 08             	add    $0x8,%eax
}
 84b:	5b                   	pop    %ebx
 84c:	5e                   	pop    %esi
 84d:	5f                   	pop    %edi
 84e:	5d                   	pop    %ebp
 84f:	c3                   	ret    
    base.s.ptr = freep = prevp = &base;
 850:	c7 05 4c 09 00 00 50 	movl   $0x950,0x94c
 857:	09 00 00 
    base.s.size = 0;
 85a:	bf 50 09 00 00       	mov    $0x950,%edi
    base.s.ptr = freep = prevp = &base;
 85f:	c7 05 50 09 00 00 50 	movl   $0x950,0x950
 866:	09 00 00 
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 869:	89 fa                	mov    %edi,%edx
    base.s.size = 0;
 86b:	c7 05 54 09 00 00 00 	movl   $0x0,0x954
 872:	00 00 00 
    if(p->s.size >= nunits){
 875:	e9 42 ff ff ff       	jmp    7bc <malloc+0x2c>
 87a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        prevp->s.ptr = p->s.ptr;
 880:	8b 08                	mov    (%eax),%ecx
 882:	89 0a                	mov    %ecx,(%edx)
 884:	eb b9                	jmp    83f <malloc+0xaf>
