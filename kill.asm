
user/_kill:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
#include "kernel/stat.h"
#include "user/user.h"

int
main(int argc, char **argv)
{
   0:	8d 4c 24 04          	lea    0x4(%esp),%ecx
   4:	83 e4 f0             	and    $0xfffffff0,%esp
   7:	ff 71 fc             	push   -0x4(%ecx)
   a:	55                   	push   %ebp
   b:	89 e5                	mov    %esp,%ebp
   d:	57                   	push   %edi
   e:	56                   	push   %esi
   f:	53                   	push   %ebx
  10:	bb 01 00 00 00       	mov    $0x1,%ebx
  15:	51                   	push   %ecx
  16:	83 ec 08             	sub    $0x8,%esp
  19:	8b 31                	mov    (%ecx),%esi
  1b:	8b 79 04             	mov    0x4(%ecx),%edi
  int i;

  if(argc < 2){
  1e:	83 fe 01             	cmp    $0x1,%esi
  21:	7e 27                	jle    4a <main+0x4a>
  23:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  27:	90                   	nop
    fprintf(2, "usage: kill pid...\n");
    exit();
  }
  for(i=1; i<argc; i++)
    kill(atoi(argv[i]));
  28:	83 ec 0c             	sub    $0xc,%esp
  2b:	ff 34 9f             	push   (%edi,%ebx,4)
  for(i=1; i<argc; i++)
  2e:	83 c3 01             	add    $0x1,%ebx
    kill(atoi(argv[i]));
  31:	e8 0a 02 00 00       	call   240 <atoi>
  36:	89 04 24             	mov    %eax,(%esp)
  39:	e8 a5 02 00 00       	call   2e3 <kill>
  for(i=1; i<argc; i++)
  3e:	83 c4 10             	add    $0x10,%esp
  41:	39 de                	cmp    %ebx,%esi
  43:	75 e3                	jne    28 <main+0x28>
  exit();
  45:	e8 69 02 00 00       	call   2b3 <exit>
    fprintf(2, "usage: kill pid...\n");
  4a:	50                   	push   %eax
  4b:	50                   	push   %eax
  4c:	68 f8 07 00 00       	push   $0x7f8
  51:	6a 02                	push   $0x2
  53:	e8 d8 05 00 00       	call   630 <fprintf>
    exit();
  58:	e8 56 02 00 00       	call   2b3 <exit>
  5d:	66 90                	xchg   %ax,%ax
  5f:	90                   	nop

00000060 <strcpy>:
#include "user/user.h"
#include "../kernel/x86.h"

char*
strcpy(char *s, const char *t)
{
  60:	55                   	push   %ebp
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
  61:	31 c0                	xor    %eax,%eax
{
  63:	89 e5                	mov    %esp,%ebp
  65:	53                   	push   %ebx
  66:	8b 4d 08             	mov    0x8(%ebp),%ecx
  69:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  6c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  while((*s++ = *t++) != 0)
  70:	0f b6 14 03          	movzbl (%ebx,%eax,1),%edx
  74:	88 14 01             	mov    %dl,(%ecx,%eax,1)
  77:	83 c0 01             	add    $0x1,%eax
  7a:	84 d2                	test   %dl,%dl
  7c:	75 f2                	jne    70 <strcpy+0x10>
    ;
  return os;
}
  7e:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  81:	89 c8                	mov    %ecx,%eax
  83:	c9                   	leave  
  84:	c3                   	ret    
  85:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  8c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000090 <strcmp>:

int
strcmp(const char *p, const char *q)
{
  90:	55                   	push   %ebp
  91:	89 e5                	mov    %esp,%ebp
  93:	53                   	push   %ebx
  94:	8b 55 08             	mov    0x8(%ebp),%edx
  97:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  while(*p && *p == *q)
  9a:	0f b6 02             	movzbl (%edx),%eax
  9d:	84 c0                	test   %al,%al
  9f:	75 17                	jne    b8 <strcmp+0x28>
  a1:	eb 3a                	jmp    dd <strcmp+0x4d>
  a3:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  a7:	90                   	nop
  a8:	0f b6 42 01          	movzbl 0x1(%edx),%eax
    p++, q++;
  ac:	83 c2 01             	add    $0x1,%edx
  af:	8d 59 01             	lea    0x1(%ecx),%ebx
  while(*p && *p == *q)
  b2:	84 c0                	test   %al,%al
  b4:	74 1a                	je     d0 <strcmp+0x40>
    p++, q++;
  b6:	89 d9                	mov    %ebx,%ecx
  while(*p && *p == *q)
  b8:	0f b6 19             	movzbl (%ecx),%ebx
  bb:	38 c3                	cmp    %al,%bl
  bd:	74 e9                	je     a8 <strcmp+0x18>
  return (uchar)*p - (uchar)*q;
  bf:	29 d8                	sub    %ebx,%eax
}
  c1:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  c4:	c9                   	leave  
  c5:	c3                   	ret    
  c6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  cd:	8d 76 00             	lea    0x0(%esi),%esi
  return (uchar)*p - (uchar)*q;
  d0:	0f b6 59 01          	movzbl 0x1(%ecx),%ebx
  d4:	31 c0                	xor    %eax,%eax
  d6:	29 d8                	sub    %ebx,%eax
}
  d8:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  db:	c9                   	leave  
  dc:	c3                   	ret    
  return (uchar)*p - (uchar)*q;
  dd:	0f b6 19             	movzbl (%ecx),%ebx
  e0:	31 c0                	xor    %eax,%eax
  e2:	eb db                	jmp    bf <strcmp+0x2f>
  e4:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  eb:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  ef:	90                   	nop

000000f0 <strlen>:

uint
strlen(const char *s)
{
  f0:	55                   	push   %ebp
  f1:	89 e5                	mov    %esp,%ebp
  f3:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  for(n = 0; s[n]; n++)
  f6:	80 3a 00             	cmpb   $0x0,(%edx)
  f9:	74 15                	je     110 <strlen+0x20>
  fb:	31 c0                	xor    %eax,%eax
  fd:	8d 76 00             	lea    0x0(%esi),%esi
 100:	83 c0 01             	add    $0x1,%eax
 103:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
 107:	89 c1                	mov    %eax,%ecx
 109:	75 f5                	jne    100 <strlen+0x10>
    ;
  return n;
}
 10b:	89 c8                	mov    %ecx,%eax
 10d:	5d                   	pop    %ebp
 10e:	c3                   	ret    
 10f:	90                   	nop
  for(n = 0; s[n]; n++)
 110:	31 c9                	xor    %ecx,%ecx
}
 112:	5d                   	pop    %ebp
 113:	89 c8                	mov    %ecx,%eax
 115:	c3                   	ret    
 116:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 11d:	8d 76 00             	lea    0x0(%esi),%esi

00000120 <memset>:

void*
memset(void *dst, int c, uint n)
{
 120:	55                   	push   %ebp
 121:	89 e5                	mov    %esp,%ebp
 123:	57                   	push   %edi
 124:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 127:	8b 4d 10             	mov    0x10(%ebp),%ecx
 12a:	8b 45 0c             	mov    0xc(%ebp),%eax
 12d:	89 d7                	mov    %edx,%edi
 12f:	fc                   	cld    
 130:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 132:	8b 7d fc             	mov    -0x4(%ebp),%edi
 135:	89 d0                	mov    %edx,%eax
 137:	c9                   	leave  
 138:	c3                   	ret    
 139:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000140 <strchr>:

char*
strchr(const char *s, char c)
{
 140:	55                   	push   %ebp
 141:	89 e5                	mov    %esp,%ebp
 143:	8b 45 08             	mov    0x8(%ebp),%eax
 146:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 14a:	0f b6 10             	movzbl (%eax),%edx
 14d:	84 d2                	test   %dl,%dl
 14f:	75 12                	jne    163 <strchr+0x23>
 151:	eb 1d                	jmp    170 <strchr+0x30>
 153:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 157:	90                   	nop
 158:	0f b6 50 01          	movzbl 0x1(%eax),%edx
 15c:	83 c0 01             	add    $0x1,%eax
 15f:	84 d2                	test   %dl,%dl
 161:	74 0d                	je     170 <strchr+0x30>
    if(*s == c)
 163:	38 d1                	cmp    %dl,%cl
 165:	75 f1                	jne    158 <strchr+0x18>
      return (char*)s;
  return 0;
}
 167:	5d                   	pop    %ebp
 168:	c3                   	ret    
 169:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  return 0;
 170:	31 c0                	xor    %eax,%eax
}
 172:	5d                   	pop    %ebp
 173:	c3                   	ret    
 174:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 17b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 17f:	90                   	nop

00000180 <gets>:

char*
gets(char *buf, int max)
{
 180:	55                   	push   %ebp
 181:	89 e5                	mov    %esp,%ebp
 183:	57                   	push   %edi
 184:	56                   	push   %esi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    cc = read(0, &c, 1);
 185:	8d 7d e7             	lea    -0x19(%ebp),%edi
{
 188:	53                   	push   %ebx
  for(i=0; i+1 < max; ){
 189:	31 db                	xor    %ebx,%ebx
{
 18b:	83 ec 1c             	sub    $0x1c,%esp
  for(i=0; i+1 < max; ){
 18e:	eb 27                	jmp    1b7 <gets+0x37>
    cc = read(0, &c, 1);
 190:	83 ec 04             	sub    $0x4,%esp
 193:	6a 01                	push   $0x1
 195:	57                   	push   %edi
 196:	6a 00                	push   $0x0
 198:	e8 2e 01 00 00       	call   2cb <read>
    if(cc < 1)
 19d:	83 c4 10             	add    $0x10,%esp
 1a0:	85 c0                	test   %eax,%eax
 1a2:	7e 1d                	jle    1c1 <gets+0x41>
      break;
    buf[i++] = c;
 1a4:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 1a8:	8b 55 08             	mov    0x8(%ebp),%edx
 1ab:	88 44 1a ff          	mov    %al,-0x1(%edx,%ebx,1)
    if(c == '\n' || c == '\r')
 1af:	3c 0a                	cmp    $0xa,%al
 1b1:	74 1d                	je     1d0 <gets+0x50>
 1b3:	3c 0d                	cmp    $0xd,%al
 1b5:	74 19                	je     1d0 <gets+0x50>
  for(i=0; i+1 < max; ){
 1b7:	89 de                	mov    %ebx,%esi
 1b9:	83 c3 01             	add    $0x1,%ebx
 1bc:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 1bf:	7c cf                	jl     190 <gets+0x10>
      break;
  }
  buf[i] = '\0';
 1c1:	8b 45 08             	mov    0x8(%ebp),%eax
 1c4:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
  return buf;
}
 1c8:	8d 65 f4             	lea    -0xc(%ebp),%esp
 1cb:	5b                   	pop    %ebx
 1cc:	5e                   	pop    %esi
 1cd:	5f                   	pop    %edi
 1ce:	5d                   	pop    %ebp
 1cf:	c3                   	ret    
  buf[i] = '\0';
 1d0:	8b 45 08             	mov    0x8(%ebp),%eax
 1d3:	89 de                	mov    %ebx,%esi
 1d5:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
}
 1d9:	8d 65 f4             	lea    -0xc(%ebp),%esp
 1dc:	5b                   	pop    %ebx
 1dd:	5e                   	pop    %esi
 1de:	5f                   	pop    %edi
 1df:	5d                   	pop    %ebp
 1e0:	c3                   	ret    
 1e1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 1e8:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 1ef:	90                   	nop

000001f0 <stat>:

int
stat(const char *n, struct stat *st)
{
 1f0:	55                   	push   %ebp
 1f1:	89 e5                	mov    %esp,%ebp
 1f3:	56                   	push   %esi
 1f4:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 1f5:	83 ec 08             	sub    $0x8,%esp
 1f8:	6a 00                	push   $0x0
 1fa:	ff 75 08             	push   0x8(%ebp)
 1fd:	e8 f1 00 00 00       	call   2f3 <open>
  if(fd < 0)
 202:	83 c4 10             	add    $0x10,%esp
 205:	85 c0                	test   %eax,%eax
 207:	78 27                	js     230 <stat+0x40>
    return -1;
  r = fstat(fd, st);
 209:	83 ec 08             	sub    $0x8,%esp
 20c:	ff 75 0c             	push   0xc(%ebp)
 20f:	89 c3                	mov    %eax,%ebx
 211:	50                   	push   %eax
 212:	e8 f4 00 00 00       	call   30b <fstat>
  close(fd);
 217:	89 1c 24             	mov    %ebx,(%esp)
  r = fstat(fd, st);
 21a:	89 c6                	mov    %eax,%esi
  close(fd);
 21c:	e8 ba 00 00 00       	call   2db <close>
  return r;
 221:	83 c4 10             	add    $0x10,%esp
}
 224:	8d 65 f8             	lea    -0x8(%ebp),%esp
 227:	89 f0                	mov    %esi,%eax
 229:	5b                   	pop    %ebx
 22a:	5e                   	pop    %esi
 22b:	5d                   	pop    %ebp
 22c:	c3                   	ret    
 22d:	8d 76 00             	lea    0x0(%esi),%esi
    return -1;
 230:	be ff ff ff ff       	mov    $0xffffffff,%esi
 235:	eb ed                	jmp    224 <stat+0x34>
 237:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 23e:	66 90                	xchg   %ax,%ax

00000240 <atoi>:

int
atoi(const char *s)
{
 240:	55                   	push   %ebp
 241:	89 e5                	mov    %esp,%ebp
 243:	53                   	push   %ebx
 244:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 247:	0f be 02             	movsbl (%edx),%eax
 24a:	8d 48 d0             	lea    -0x30(%eax),%ecx
 24d:	80 f9 09             	cmp    $0x9,%cl
  n = 0;
 250:	b9 00 00 00 00       	mov    $0x0,%ecx
  while('0' <= *s && *s <= '9')
 255:	77 1e                	ja     275 <atoi+0x35>
 257:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 25e:	66 90                	xchg   %ax,%ax
    n = n*10 + *s++ - '0';
 260:	83 c2 01             	add    $0x1,%edx
 263:	8d 0c 89             	lea    (%ecx,%ecx,4),%ecx
 266:	8d 4c 48 d0          	lea    -0x30(%eax,%ecx,2),%ecx
  while('0' <= *s && *s <= '9')
 26a:	0f be 02             	movsbl (%edx),%eax
 26d:	8d 58 d0             	lea    -0x30(%eax),%ebx
 270:	80 fb 09             	cmp    $0x9,%bl
 273:	76 eb                	jbe    260 <atoi+0x20>
  return n;
}
 275:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 278:	89 c8                	mov    %ecx,%eax
 27a:	c9                   	leave  
 27b:	c3                   	ret    
 27c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000280 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 280:	55                   	push   %ebp
 281:	89 e5                	mov    %esp,%ebp
 283:	57                   	push   %edi
 284:	8b 45 10             	mov    0x10(%ebp),%eax
 287:	8b 55 08             	mov    0x8(%ebp),%edx
 28a:	56                   	push   %esi
 28b:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 28e:	85 c0                	test   %eax,%eax
 290:	7e 13                	jle    2a5 <memmove+0x25>
 292:	01 d0                	add    %edx,%eax
  dst = vdst;
 294:	89 d7                	mov    %edx,%edi
 296:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 29d:	8d 76 00             	lea    0x0(%esi),%esi
    *dst++ = *src++;
 2a0:	a4                   	movsb  %ds:(%esi),%es:(%edi)
  while(n-- > 0)
 2a1:	39 f8                	cmp    %edi,%eax
 2a3:	75 fb                	jne    2a0 <memmove+0x20>
  return vdst;
}
 2a5:	5e                   	pop    %esi
 2a6:	89 d0                	mov    %edx,%eax
 2a8:	5f                   	pop    %edi
 2a9:	5d                   	pop    %ebp
 2aa:	c3                   	ret    

000002ab <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 2ab:	b8 01 00 00 00       	mov    $0x1,%eax
 2b0:	cd 40                	int    $0x40
 2b2:	c3                   	ret    

000002b3 <exit>:
SYSCALL(exit)
 2b3:	b8 02 00 00 00       	mov    $0x2,%eax
 2b8:	cd 40                	int    $0x40
 2ba:	c3                   	ret    

000002bb <wait>:
SYSCALL(wait)
 2bb:	b8 03 00 00 00       	mov    $0x3,%eax
 2c0:	cd 40                	int    $0x40
 2c2:	c3                   	ret    

000002c3 <pipe>:
SYSCALL(pipe)
 2c3:	b8 04 00 00 00       	mov    $0x4,%eax
 2c8:	cd 40                	int    $0x40
 2ca:	c3                   	ret    

000002cb <read>:
SYSCALL(read)
 2cb:	b8 05 00 00 00       	mov    $0x5,%eax
 2d0:	cd 40                	int    $0x40
 2d2:	c3                   	ret    

000002d3 <write>:
SYSCALL(write)
 2d3:	b8 10 00 00 00       	mov    $0x10,%eax
 2d8:	cd 40                	int    $0x40
 2da:	c3                   	ret    

000002db <close>:
SYSCALL(close)
 2db:	b8 15 00 00 00       	mov    $0x15,%eax
 2e0:	cd 40                	int    $0x40
 2e2:	c3                   	ret    

000002e3 <kill>:
SYSCALL(kill)
 2e3:	b8 06 00 00 00       	mov    $0x6,%eax
 2e8:	cd 40                	int    $0x40
 2ea:	c3                   	ret    

000002eb <exec>:
SYSCALL(exec)
 2eb:	b8 07 00 00 00       	mov    $0x7,%eax
 2f0:	cd 40                	int    $0x40
 2f2:	c3                   	ret    

000002f3 <open>:
SYSCALL(open)
 2f3:	b8 0f 00 00 00       	mov    $0xf,%eax
 2f8:	cd 40                	int    $0x40
 2fa:	c3                   	ret    

000002fb <mknod>:
SYSCALL(mknod)
 2fb:	b8 11 00 00 00       	mov    $0x11,%eax
 300:	cd 40                	int    $0x40
 302:	c3                   	ret    

00000303 <unlink>:
SYSCALL(unlink)
 303:	b8 12 00 00 00       	mov    $0x12,%eax
 308:	cd 40                	int    $0x40
 30a:	c3                   	ret    

0000030b <fstat>:
SYSCALL(fstat)
 30b:	b8 08 00 00 00       	mov    $0x8,%eax
 310:	cd 40                	int    $0x40
 312:	c3                   	ret    

00000313 <link>:
SYSCALL(link)
 313:	b8 13 00 00 00       	mov    $0x13,%eax
 318:	cd 40                	int    $0x40
 31a:	c3                   	ret    

0000031b <mkdir>:
SYSCALL(mkdir)
 31b:	b8 14 00 00 00       	mov    $0x14,%eax
 320:	cd 40                	int    $0x40
 322:	c3                   	ret    

00000323 <chdir>:
SYSCALL(chdir)
 323:	b8 09 00 00 00       	mov    $0x9,%eax
 328:	cd 40                	int    $0x40
 32a:	c3                   	ret    

0000032b <dup>:
SYSCALL(dup)
 32b:	b8 0a 00 00 00       	mov    $0xa,%eax
 330:	cd 40                	int    $0x40
 332:	c3                   	ret    

00000333 <getpid>:
SYSCALL(getpid)
 333:	b8 0b 00 00 00       	mov    $0xb,%eax
 338:	cd 40                	int    $0x40
 33a:	c3                   	ret    

0000033b <sbrk>:
SYSCALL(sbrk)
 33b:	b8 0c 00 00 00       	mov    $0xc,%eax
 340:	cd 40                	int    $0x40
 342:	c3                   	ret    

00000343 <sleep>:
SYSCALL(sleep)
 343:	b8 0d 00 00 00       	mov    $0xd,%eax
 348:	cd 40                	int    $0x40
 34a:	c3                   	ret    

0000034b <uptime>:
SYSCALL(uptime)
 34b:	b8 0e 00 00 00       	mov    $0xe,%eax
 350:	cd 40                	int    $0x40
 352:	c3                   	ret    

00000353 <cpuhalt>:
SYSCALL(cpuhalt)
 353:	b8 16 00 00 00       	mov    $0x16,%eax
 358:	cd 40                	int    $0x40
 35a:	c3                   	ret    
 35b:	66 90                	xchg   %ax,%ax
 35d:	66 90                	xchg   %ax,%ax
 35f:	90                   	nop

00000360 <printint.constprop.0>:
  for (i = 0; i < (sizeof(uint) * 2); i++, x <<= 4)
    putc(fd, digits[x >> (sizeof(uint) * 8 - 4)]);
}

static void
printint(int fd, int xx, int base, int sgn)
 360:	55                   	push   %ebp
 361:	89 e5                	mov    %esp,%ebp
 363:	57                   	push   %edi
 364:	56                   	push   %esi
 365:	53                   	push   %ebx
 366:	83 ec 3c             	sub    $0x3c,%esp
 369:	89 55 c4             	mov    %edx,-0x3c(%ebp)
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 36c:	85 c0                	test   %eax,%eax
 36e:	0f 89 84 00 00 00    	jns    3f8 <printint.constprop.0+0x98>
 374:	83 e1 01             	and    $0x1,%ecx
 377:	74 7f                	je     3f8 <printint.constprop.0+0x98>
    neg = 1;
 379:	c7 45 bc 01 00 00 00 	movl   $0x1,-0x44(%ebp)
    x = -xx;
 380:	f7 d8                	neg    %eax
 382:	89 c1                	mov    %eax,%ecx
  } else {
    x = xx;
  }

  i = 0;
 384:	31 db                	xor    %ebx,%ebx
 386:	8d 75 d7             	lea    -0x29(%ebp),%esi
 389:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  do{
    buf[i++] = digits[x % base];
 390:	89 c8                	mov    %ecx,%eax
 392:	31 d2                	xor    %edx,%edx
 394:	89 cf                	mov    %ecx,%edi
 396:	f7 75 c4             	divl   -0x3c(%ebp)
 399:	0f b6 92 6c 08 00 00 	movzbl 0x86c(%edx),%edx
 3a0:	89 45 c0             	mov    %eax,-0x40(%ebp)
 3a3:	89 d8                	mov    %ebx,%eax
 3a5:	8d 5b 01             	lea    0x1(%ebx),%ebx
  }while((x /= base) != 0);
 3a8:	8b 4d c0             	mov    -0x40(%ebp),%ecx
    buf[i++] = digits[x % base];
 3ab:	88 14 1e             	mov    %dl,(%esi,%ebx,1)
  }while((x /= base) != 0);
 3ae:	3b 7d c4             	cmp    -0x3c(%ebp),%edi
 3b1:	73 dd                	jae    390 <printint.constprop.0+0x30>
  if(neg)
 3b3:	8b 4d bc             	mov    -0x44(%ebp),%ecx
 3b6:	85 c9                	test   %ecx,%ecx
 3b8:	74 0c                	je     3c6 <printint.constprop.0+0x66>
    buf[i++] = '-';
 3ba:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
    buf[i++] = digits[x % base];
 3bf:	89 d8                	mov    %ebx,%eax
    buf[i++] = '-';
 3c1:	ba 2d 00 00 00       	mov    $0x2d,%edx

  while(--i >= 0)
 3c6:	8d 5c 05 d7          	lea    -0x29(%ebp,%eax,1),%ebx
 3ca:	eb 0a                	jmp    3d6 <printint.constprop.0+0x76>
 3cc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    putc(fd, buf[i]);
 3d0:	0f b6 13             	movzbl (%ebx),%edx
 3d3:	83 eb 01             	sub    $0x1,%ebx
  write(fd, &c, 1);
 3d6:	83 ec 04             	sub    $0x4,%esp
 3d9:	88 55 d7             	mov    %dl,-0x29(%ebp)
 3dc:	6a 01                	push   $0x1
 3de:	56                   	push   %esi
 3df:	6a 01                	push   $0x1
 3e1:	e8 ed fe ff ff       	call   2d3 <write>
  while(--i >= 0)
 3e6:	83 c4 10             	add    $0x10,%esp
 3e9:	39 de                	cmp    %ebx,%esi
 3eb:	75 e3                	jne    3d0 <printint.constprop.0+0x70>
}
 3ed:	8d 65 f4             	lea    -0xc(%ebp),%esp
 3f0:	5b                   	pop    %ebx
 3f1:	5e                   	pop    %esi
 3f2:	5f                   	pop    %edi
 3f3:	5d                   	pop    %ebp
 3f4:	c3                   	ret    
 3f5:	8d 76 00             	lea    0x0(%esi),%esi
  neg = 0;
 3f8:	c7 45 bc 00 00 00 00 	movl   $0x0,-0x44(%ebp)
    x = xx;
 3ff:	89 c1                	mov    %eax,%ecx
 401:	eb 81                	jmp    384 <printint.constprop.0+0x24>
 403:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 40a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00000410 <vprintf.constprop.0>:
static void vprintf(int fd, const char *fmt, va_list ap)
 410:	55                   	push   %ebp
 411:	89 e5                	mov    %esp,%ebp
 413:	57                   	push   %edi
 414:	56                   	push   %esi
 415:	53                   	push   %ebx
 416:	83 ec 2c             	sub    $0x2c,%esp
 419:	89 55 d4             	mov    %edx,-0x2c(%ebp)
{
  char *s;
  int c, i, state;

  state = 0;
  for(i = 0; fmt[i]; i++){
 41c:	0f b6 10             	movzbl (%eax),%edx
 41f:	84 d2                	test   %dl,%dl
 421:	74 6c                	je     48f <vprintf.constprop.0+0x7f>
 423:	8d 58 01             	lea    0x1(%eax),%ebx
 426:	31 ff                	xor    %edi,%edi
 428:	8d 75 e7             	lea    -0x19(%ebp),%esi
 42b:	eb 25                	jmp    452 <vprintf.constprop.0+0x42>
 42d:	8d 76 00             	lea    0x0(%esi),%esi
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
 430:	83 f8 25             	cmp    $0x25,%eax
 433:	74 4b                	je     480 <vprintf.constprop.0+0x70>
  write(fd, &c, 1);
 435:	83 ec 04             	sub    $0x4,%esp
 438:	88 55 e7             	mov    %dl,-0x19(%ebp)
 43b:	6a 01                	push   $0x1
 43d:	56                   	push   %esi
 43e:	6a 01                	push   $0x1
 440:	e8 8e fe ff ff       	call   2d3 <write>
        state = '%';
      } else {
        putc(fd, c);
 445:	83 c4 10             	add    $0x10,%esp
  for(i = 0; fmt[i]; i++){
 448:	0f b6 13             	movzbl (%ebx),%edx
 44b:	83 c3 01             	add    $0x1,%ebx
 44e:	84 d2                	test   %dl,%dl
 450:	74 3d                	je     48f <vprintf.constprop.0+0x7f>
    c = fmt[i] & 0xff;
 452:	0f b6 c2             	movzbl %dl,%eax
    if(state == 0){
 455:	85 ff                	test   %edi,%edi
 457:	74 d7                	je     430 <vprintf.constprop.0+0x20>
      }
    } else if(state == '%'){
 459:	83 ff 25             	cmp    $0x25,%edi
 45c:	75 ea                	jne    448 <vprintf.constprop.0+0x38>
      if(c == 'd'){
 45e:	83 f8 25             	cmp    $0x25,%eax
 461:	0f 84 a9 01 00 00    	je     610 <vprintf.constprop.0+0x200>
 467:	83 e8 63             	sub    $0x63,%eax
 46a:	83 f8 15             	cmp    $0x15,%eax
 46d:	77 31                	ja     4a0 <vprintf.constprop.0+0x90>
 46f:	ff 24 85 14 08 00 00 	jmp    *0x814(,%eax,4)
 476:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 47d:	8d 76 00             	lea    0x0(%esi),%esi
  for(i = 0; fmt[i]; i++){
 480:	0f b6 13             	movzbl (%ebx),%edx
 483:	83 c3 01             	add    $0x1,%ebx
        state = '%';
 486:	bf 25 00 00 00       	mov    $0x25,%edi
  for(i = 0; fmt[i]; i++){
 48b:	84 d2                	test   %dl,%dl
 48d:	75 c3                	jne    452 <vprintf.constprop.0+0x42>
        putc(fd, c);
      }
      state = 0;
    }
  }
}
 48f:	8d 65 f4             	lea    -0xc(%ebp),%esp
 492:	5b                   	pop    %ebx
 493:	5e                   	pop    %esi
 494:	5f                   	pop    %edi
 495:	5d                   	pop    %ebp
 496:	c3                   	ret    
 497:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 49e:	66 90                	xchg   %ax,%ax
  write(fd, &c, 1);
 4a0:	83 ec 04             	sub    $0x4,%esp
 4a3:	88 55 d0             	mov    %dl,-0x30(%ebp)
 4a6:	6a 01                	push   $0x1
 4a8:	56                   	push   %esi
 4a9:	6a 01                	push   $0x1
 4ab:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
 4af:	e8 1f fe ff ff       	call   2d3 <write>
        putc(fd, c);
 4b4:	0f b6 55 d0          	movzbl -0x30(%ebp),%edx
  write(fd, &c, 1);
 4b8:	83 c4 0c             	add    $0xc,%esp
 4bb:	88 55 e7             	mov    %dl,-0x19(%ebp)
 4be:	6a 01                	push   $0x1
      state = 0;
 4c0:	31 ff                	xor    %edi,%edi
  write(fd, &c, 1);
 4c2:	56                   	push   %esi
 4c3:	6a 01                	push   $0x1
 4c5:	e8 09 fe ff ff       	call   2d3 <write>
        putc(fd, c);
 4ca:	83 c4 10             	add    $0x10,%esp
 4cd:	e9 76 ff ff ff       	jmp    448 <vprintf.constprop.0+0x38>
 4d2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        putc(fd, va_arg(ap, uint));
 4d8:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  write(fd, &c, 1);
 4db:	83 ec 04             	sub    $0x4,%esp
        putc(fd, va_arg(ap, uint));
 4de:	8d 78 04             	lea    0x4(%eax),%edi
 4e1:	8b 00                	mov    (%eax),%eax
  write(fd, &c, 1);
 4e3:	6a 01                	push   $0x1
 4e5:	56                   	push   %esi
 4e6:	6a 01                	push   $0x1
        putc(fd, va_arg(ap, uint));
 4e8:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
 4eb:	e8 e3 fd ff ff       	call   2d3 <write>
        putc(fd, va_arg(ap, uint));
 4f0:	89 7d d4             	mov    %edi,-0x2c(%ebp)
 4f3:	83 c4 10             	add    $0x10,%esp
      state = 0;
 4f6:	31 ff                	xor    %edi,%edi
 4f8:	e9 4b ff ff ff       	jmp    448 <vprintf.constprop.0+0x38>
 4fd:	8d 76 00             	lea    0x0(%esi),%esi
        printint(fd, va_arg(ap, int), 10, 1);
 500:	8b 45 d4             	mov    -0x2c(%ebp),%eax
 503:	b9 01 00 00 00       	mov    $0x1,%ecx
 508:	8d 78 04             	lea    0x4(%eax),%edi
        printint(fd, va_arg(ap, uint), 10, 0);
 50b:	8b 00                	mov    (%eax),%eax
 50d:	ba 0a 00 00 00       	mov    $0xa,%edx
 512:	e8 49 fe ff ff       	call   360 <printint.constprop.0>
 517:	89 7d d4             	mov    %edi,-0x2c(%ebp)
      state = 0;
 51a:	31 ff                	xor    %edi,%edi
 51c:	e9 27 ff ff ff       	jmp    448 <vprintf.constprop.0+0x38>
 521:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        printint(fd, va_arg(ap, uint), 10, 0);
 528:	8b 45 d4             	mov    -0x2c(%ebp),%eax
 52b:	31 c9                	xor    %ecx,%ecx
 52d:	8d 78 04             	lea    0x4(%eax),%edi
 530:	eb d9                	jmp    50b <vprintf.constprop.0+0xfb>
 532:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        printptr(fd, va_arg(ap, uint));
 538:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  write(fd, &c, 1);
 53b:	83 ec 04             	sub    $0x4,%esp
 53e:	c6 45 e7 30          	movb   $0x30,-0x19(%ebp)
        printptr(fd, va_arg(ap, uint));
 542:	8b 38                	mov    (%eax),%edi
  write(fd, &c, 1);
 544:	6a 01                	push   $0x1
        printptr(fd, va_arg(ap, uint));
 546:	8d 48 04             	lea    0x4(%eax),%ecx
  write(fd, &c, 1);
 549:	56                   	push   %esi
 54a:	6a 01                	push   $0x1
        printptr(fd, va_arg(ap, uint));
 54c:	89 4d d0             	mov    %ecx,-0x30(%ebp)
  write(fd, &c, 1);
 54f:	e8 7f fd ff ff       	call   2d3 <write>
 554:	83 c4 0c             	add    $0xc,%esp
 557:	c6 45 e7 78          	movb   $0x78,-0x19(%ebp)
 55b:	6a 01                	push   $0x1
 55d:	56                   	push   %esi
 55e:	6a 01                	push   $0x1
 560:	e8 6e fd ff ff       	call   2d3 <write>
  putc(fd, 'x');
 565:	c7 45 d4 08 00 00 00 	movl   $0x8,-0x2c(%ebp)
 56c:	83 c4 10             	add    $0x10,%esp
 56f:	90                   	nop
  write(fd, &c, 1);
 570:	83 ec 04             	sub    $0x4,%esp
    putc(fd, digits[x >> (sizeof(uint) * 8 - 4)]);
 573:	89 f8                	mov    %edi,%eax
  for (i = 0; i < (sizeof(uint) * 2); i++, x <<= 4)
 575:	c1 e7 04             	shl    $0x4,%edi
  write(fd, &c, 1);
 578:	6a 01                	push   $0x1
    putc(fd, digits[x >> (sizeof(uint) * 8 - 4)]);
 57a:	c1 e8 1c             	shr    $0x1c,%eax
  write(fd, &c, 1);
 57d:	56                   	push   %esi
 57e:	0f b6 80 6c 08 00 00 	movzbl 0x86c(%eax),%eax
 585:	6a 01                	push   $0x1
 587:	88 45 e7             	mov    %al,-0x19(%ebp)
 58a:	e8 44 fd ff ff       	call   2d3 <write>
  for (i = 0; i < (sizeof(uint) * 2); i++, x <<= 4)
 58f:	83 c4 10             	add    $0x10,%esp
 592:	83 6d d4 01          	subl   $0x1,-0x2c(%ebp)
 596:	75 d8                	jne    570 <vprintf.constprop.0+0x160>
        printptr(fd, va_arg(ap, uint));
 598:	8b 45 d0             	mov    -0x30(%ebp),%eax
      state = 0;
 59b:	31 ff                	xor    %edi,%edi
        printptr(fd, va_arg(ap, uint));
 59d:	89 45 d4             	mov    %eax,-0x2c(%ebp)
 5a0:	e9 a3 fe ff ff       	jmp    448 <vprintf.constprop.0+0x38>
 5a5:	8d 76 00             	lea    0x0(%esi),%esi
        s = va_arg(ap, char*);
 5a8:	8b 45 d4             	mov    -0x2c(%ebp),%eax
 5ab:	8b 38                	mov    (%eax),%edi
 5ad:	8d 48 04             	lea    0x4(%eax),%ecx
 5b0:	89 4d d4             	mov    %ecx,-0x2c(%ebp)
        if(s == 0)
 5b3:	85 ff                	test   %edi,%edi
 5b5:	74 64                	je     61b <vprintf.constprop.0+0x20b>
        while(*s != 0){
 5b7:	0f b6 07             	movzbl (%edi),%eax
 5ba:	84 c0                	test   %al,%al
 5bc:	74 1f                	je     5dd <vprintf.constprop.0+0x1cd>
 5be:	66 90                	xchg   %ax,%ax
  write(fd, &c, 1);
 5c0:	83 ec 04             	sub    $0x4,%esp
          s++;
 5c3:	83 c7 01             	add    $0x1,%edi
 5c6:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
 5c9:	6a 01                	push   $0x1
 5cb:	56                   	push   %esi
 5cc:	6a 01                	push   $0x1
 5ce:	e8 00 fd ff ff       	call   2d3 <write>
        while(*s != 0){
 5d3:	0f b6 07             	movzbl (%edi),%eax
 5d6:	83 c4 10             	add    $0x10,%esp
 5d9:	84 c0                	test   %al,%al
 5db:	75 e3                	jne    5c0 <vprintf.constprop.0+0x1b0>
      state = 0;
 5dd:	31 ff                	xor    %edi,%edi
 5df:	e9 64 fe ff ff       	jmp    448 <vprintf.constprop.0+0x38>
 5e4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        printint(fd, va_arg(ap, int), 16, 0);
 5e8:	8b 45 d4             	mov    -0x2c(%ebp),%eax
 5eb:	31 c9                	xor    %ecx,%ecx
 5ed:	ba 10 00 00 00       	mov    $0x10,%edx
 5f2:	8d 78 04             	lea    0x4(%eax),%edi
 5f5:	8b 00                	mov    (%eax),%eax
 5f7:	e8 64 fd ff ff       	call   360 <printint.constprop.0>
 5fc:	89 7d d4             	mov    %edi,-0x2c(%ebp)
      state = 0;
 5ff:	31 ff                	xor    %edi,%edi
 601:	e9 42 fe ff ff       	jmp    448 <vprintf.constprop.0+0x38>
 606:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 60d:	8d 76 00             	lea    0x0(%esi),%esi
        putc(fd, c);
 610:	88 55 e7             	mov    %dl,-0x19(%ebp)
  write(fd, &c, 1);
 613:	83 ec 04             	sub    $0x4,%esp
 616:	e9 a3 fe ff ff       	jmp    4be <vprintf.constprop.0+0xae>
          s = "(null)";
 61b:	bf 0c 08 00 00       	mov    $0x80c,%edi
        while(*s != 0){
 620:	b8 28 00 00 00       	mov    $0x28,%eax
 625:	eb 99                	jmp    5c0 <vprintf.constprop.0+0x1b0>
 627:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 62e:	66 90                	xchg   %ax,%ax

00000630 <fprintf>:
// Print to the given fd. Only understands %d,%x, %p, %s, %c.
void
fprintf(int fd, const char *fmt, ...)
{
 630:	55                   	push   %ebp
 631:	89 e5                	mov    %esp,%ebp
 633:	83 ec 08             	sub    $0x8,%esp
 va_list ap;
 va_start(ap, fmt); 
 vprintf(1,fmt,ap);
 636:	8b 45 0c             	mov    0xc(%ebp),%eax
 639:	8d 55 10             	lea    0x10(%ebp),%edx
 63c:	e8 cf fd ff ff       	call   410 <vprintf.constprop.0>
}
 641:	c9                   	leave  
 642:	c3                   	ret    
 643:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 64a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00000650 <printf>:
void
printf(const char *fmt, ...)
{
 650:	55                   	push   %ebp
 651:	89 e5                	mov    %esp,%ebp
 653:	83 ec 08             	sub    $0x8,%esp
  va_list ap;
  va_start(ap, fmt); 
  vprintf(1,fmt,ap);
 656:	8b 45 08             	mov    0x8(%ebp),%eax
 659:	8d 55 0c             	lea    0xc(%ebp),%edx
 65c:	e8 af fd ff ff       	call   410 <vprintf.constprop.0>
}
 661:	c9                   	leave  
 662:	c3                   	ret    
 663:	66 90                	xchg   %ax,%ax
 665:	66 90                	xchg   %ax,%ax
 667:	66 90                	xchg   %ax,%ax
 669:	66 90                	xchg   %ax,%ax
 66b:	66 90                	xchg   %ax,%ax
 66d:	66 90                	xchg   %ax,%ax
 66f:	90                   	nop

00000670 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 670:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 671:	a1 80 08 00 00       	mov    0x880,%eax
{
 676:	89 e5                	mov    %esp,%ebp
 678:	57                   	push   %edi
 679:	56                   	push   %esi
 67a:	53                   	push   %ebx
 67b:	8b 5d 08             	mov    0x8(%ebp),%ebx
  bp = (Header*)ap - 1;
 67e:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 681:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 688:	89 c2                	mov    %eax,%edx
 68a:	8b 00                	mov    (%eax),%eax
 68c:	39 ca                	cmp    %ecx,%edx
 68e:	73 30                	jae    6c0 <free+0x50>
 690:	39 c1                	cmp    %eax,%ecx
 692:	72 04                	jb     698 <free+0x28>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 694:	39 c2                	cmp    %eax,%edx
 696:	72 f0                	jb     688 <free+0x18>
      break;
  if(bp + bp->s.size == p->s.ptr){
 698:	8b 73 fc             	mov    -0x4(%ebx),%esi
 69b:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 69e:	39 f8                	cmp    %edi,%eax
 6a0:	74 30                	je     6d2 <free+0x62>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
 6a2:	89 43 f8             	mov    %eax,-0x8(%ebx)
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
 6a5:	8b 42 04             	mov    0x4(%edx),%eax
 6a8:	8d 34 c2             	lea    (%edx,%eax,8),%esi
 6ab:	39 f1                	cmp    %esi,%ecx
 6ad:	74 3a                	je     6e9 <free+0x79>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
 6af:	89 0a                	mov    %ecx,(%edx)
  } else
    p->s.ptr = bp;
  freep = p;
}
 6b1:	5b                   	pop    %ebx
  freep = p;
 6b2:	89 15 80 08 00 00    	mov    %edx,0x880
}
 6b8:	5e                   	pop    %esi
 6b9:	5f                   	pop    %edi
 6ba:	5d                   	pop    %ebp
 6bb:	c3                   	ret    
 6bc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 6c0:	39 c2                	cmp    %eax,%edx
 6c2:	72 c4                	jb     688 <free+0x18>
 6c4:	39 c1                	cmp    %eax,%ecx
 6c6:	73 c0                	jae    688 <free+0x18>
  if(bp + bp->s.size == p->s.ptr){
 6c8:	8b 73 fc             	mov    -0x4(%ebx),%esi
 6cb:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 6ce:	39 f8                	cmp    %edi,%eax
 6d0:	75 d0                	jne    6a2 <free+0x32>
    bp->s.size += p->s.ptr->s.size;
 6d2:	03 70 04             	add    0x4(%eax),%esi
 6d5:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 6d8:	8b 02                	mov    (%edx),%eax
 6da:	8b 00                	mov    (%eax),%eax
 6dc:	89 43 f8             	mov    %eax,-0x8(%ebx)
  if(p + p->s.size == bp){
 6df:	8b 42 04             	mov    0x4(%edx),%eax
 6e2:	8d 34 c2             	lea    (%edx,%eax,8),%esi
 6e5:	39 f1                	cmp    %esi,%ecx
 6e7:	75 c6                	jne    6af <free+0x3f>
    p->s.size += bp->s.size;
 6e9:	03 43 fc             	add    -0x4(%ebx),%eax
  freep = p;
 6ec:	89 15 80 08 00 00    	mov    %edx,0x880
    p->s.size += bp->s.size;
 6f2:	89 42 04             	mov    %eax,0x4(%edx)
    p->s.ptr = bp->s.ptr;
 6f5:	8b 4b f8             	mov    -0x8(%ebx),%ecx
 6f8:	89 0a                	mov    %ecx,(%edx)
}
 6fa:	5b                   	pop    %ebx
 6fb:	5e                   	pop    %esi
 6fc:	5f                   	pop    %edi
 6fd:	5d                   	pop    %ebp
 6fe:	c3                   	ret    
 6ff:	90                   	nop

00000700 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 700:	55                   	push   %ebp
 701:	89 e5                	mov    %esp,%ebp
 703:	57                   	push   %edi
 704:	56                   	push   %esi
 705:	53                   	push   %ebx
 706:	83 ec 1c             	sub    $0x1c,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 709:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
 70c:	8b 3d 80 08 00 00    	mov    0x880,%edi
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 712:	8d 70 07             	lea    0x7(%eax),%esi
 715:	c1 ee 03             	shr    $0x3,%esi
 718:	83 c6 01             	add    $0x1,%esi
  if((prevp = freep) == 0){
 71b:	85 ff                	test   %edi,%edi
 71d:	0f 84 9d 00 00 00    	je     7c0 <malloc+0xc0>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 723:	8b 17                	mov    (%edi),%edx
    if(p->s.size >= nunits){
 725:	8b 4a 04             	mov    0x4(%edx),%ecx
 728:	39 f1                	cmp    %esi,%ecx
 72a:	73 6a                	jae    796 <malloc+0x96>
 72c:	bb 00 10 00 00       	mov    $0x1000,%ebx
 731:	39 de                	cmp    %ebx,%esi
 733:	0f 43 de             	cmovae %esi,%ebx
  p = sbrk(nu * sizeof(Header));
 736:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
 73d:	89 45 e4             	mov    %eax,-0x1c(%ebp)
 740:	eb 17                	jmp    759 <malloc+0x59>
 742:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 748:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
 74a:	8b 48 04             	mov    0x4(%eax),%ecx
 74d:	39 f1                	cmp    %esi,%ecx
 74f:	73 4f                	jae    7a0 <malloc+0xa0>
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 751:	8b 3d 80 08 00 00    	mov    0x880,%edi
 757:	89 c2                	mov    %eax,%edx
 759:	39 d7                	cmp    %edx,%edi
 75b:	75 eb                	jne    748 <malloc+0x48>
  p = sbrk(nu * sizeof(Header));
 75d:	83 ec 0c             	sub    $0xc,%esp
 760:	ff 75 e4             	push   -0x1c(%ebp)
 763:	e8 d3 fb ff ff       	call   33b <sbrk>
  if(p == (char*)-1)
 768:	83 c4 10             	add    $0x10,%esp
 76b:	83 f8 ff             	cmp    $0xffffffff,%eax
 76e:	74 1c                	je     78c <malloc+0x8c>
  hp->s.size = nu;
 770:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 773:	83 ec 0c             	sub    $0xc,%esp
 776:	83 c0 08             	add    $0x8,%eax
 779:	50                   	push   %eax
 77a:	e8 f1 fe ff ff       	call   670 <free>
  return freep;
 77f:	8b 15 80 08 00 00    	mov    0x880,%edx
      if((p = morecore(nunits)) == 0)
 785:	83 c4 10             	add    $0x10,%esp
 788:	85 d2                	test   %edx,%edx
 78a:	75 bc                	jne    748 <malloc+0x48>
        return 0;
  }
}
 78c:	8d 65 f4             	lea    -0xc(%ebp),%esp
        return 0;
 78f:	31 c0                	xor    %eax,%eax
}
 791:	5b                   	pop    %ebx
 792:	5e                   	pop    %esi
 793:	5f                   	pop    %edi
 794:	5d                   	pop    %ebp
 795:	c3                   	ret    
    if(p->s.size >= nunits){
 796:	89 d0                	mov    %edx,%eax
 798:	89 fa                	mov    %edi,%edx
 79a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      if(p->s.size == nunits)
 7a0:	39 ce                	cmp    %ecx,%esi
 7a2:	74 4c                	je     7f0 <malloc+0xf0>
        p->s.size -= nunits;
 7a4:	29 f1                	sub    %esi,%ecx
 7a6:	89 48 04             	mov    %ecx,0x4(%eax)
        p += p->s.size;
 7a9:	8d 04 c8             	lea    (%eax,%ecx,8),%eax
        p->s.size = nunits;
 7ac:	89 70 04             	mov    %esi,0x4(%eax)
      freep = prevp;
 7af:	89 15 80 08 00 00    	mov    %edx,0x880
}
 7b5:	8d 65 f4             	lea    -0xc(%ebp),%esp
      return (void*)(p + 1);
 7b8:	83 c0 08             	add    $0x8,%eax
}
 7bb:	5b                   	pop    %ebx
 7bc:	5e                   	pop    %esi
 7bd:	5f                   	pop    %edi
 7be:	5d                   	pop    %ebp
 7bf:	c3                   	ret    
    base.s.ptr = freep = prevp = &base;
 7c0:	c7 05 80 08 00 00 84 	movl   $0x884,0x880
 7c7:	08 00 00 
    base.s.size = 0;
 7ca:	bf 84 08 00 00       	mov    $0x884,%edi
    base.s.ptr = freep = prevp = &base;
 7cf:	c7 05 84 08 00 00 84 	movl   $0x884,0x884
 7d6:	08 00 00 
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 7d9:	89 fa                	mov    %edi,%edx
    base.s.size = 0;
 7db:	c7 05 88 08 00 00 00 	movl   $0x0,0x888
 7e2:	00 00 00 
    if(p->s.size >= nunits){
 7e5:	e9 42 ff ff ff       	jmp    72c <malloc+0x2c>
 7ea:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        prevp->s.ptr = p->s.ptr;
 7f0:	8b 08                	mov    (%eax),%ecx
 7f2:	89 0a                	mov    %ecx,(%edx)
 7f4:	eb b9                	jmp    7af <malloc+0xaf>
