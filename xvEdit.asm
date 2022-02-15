
user/_xvEdit:     file format elf32-i386


Disassembly of section .text:

00000000 <strcpy>:
#include "user/user.h"
#include "../kernel/x86.h"

char*
strcpy(char *s, const char *t)
{
   0:	55                   	push   %ebp
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
   1:	31 c0                	xor    %eax,%eax
{
   3:	89 e5                	mov    %esp,%ebp
   5:	53                   	push   %ebx
   6:	8b 4d 08             	mov    0x8(%ebp),%ecx
   9:	8b 5d 0c             	mov    0xc(%ebp),%ebx
   c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  while((*s++ = *t++) != 0)
  10:	0f b6 14 03          	movzbl (%ebx,%eax,1),%edx
  14:	88 14 01             	mov    %dl,(%ecx,%eax,1)
  17:	83 c0 01             	add    $0x1,%eax
  1a:	84 d2                	test   %dl,%dl
  1c:	75 f2                	jne    10 <strcpy+0x10>
    ;
  return os;
}
  1e:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  21:	89 c8                	mov    %ecx,%eax
  23:	c9                   	leave  
  24:	c3                   	ret    
  25:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  2c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000030 <strcmp>:

int
strcmp(const char *p, const char *q)
{
  30:	55                   	push   %ebp
  31:	89 e5                	mov    %esp,%ebp
  33:	53                   	push   %ebx
  34:	8b 55 08             	mov    0x8(%ebp),%edx
  37:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  while(*p && *p == *q)
  3a:	0f b6 02             	movzbl (%edx),%eax
  3d:	84 c0                	test   %al,%al
  3f:	75 17                	jne    58 <strcmp+0x28>
  41:	eb 3a                	jmp    7d <strcmp+0x4d>
  43:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  47:	90                   	nop
  48:	0f b6 42 01          	movzbl 0x1(%edx),%eax
    p++, q++;
  4c:	83 c2 01             	add    $0x1,%edx
  4f:	8d 59 01             	lea    0x1(%ecx),%ebx
  while(*p && *p == *q)
  52:	84 c0                	test   %al,%al
  54:	74 1a                	je     70 <strcmp+0x40>
    p++, q++;
  56:	89 d9                	mov    %ebx,%ecx
  while(*p && *p == *q)
  58:	0f b6 19             	movzbl (%ecx),%ebx
  5b:	38 c3                	cmp    %al,%bl
  5d:	74 e9                	je     48 <strcmp+0x18>
  return (uchar)*p - (uchar)*q;
  5f:	29 d8                	sub    %ebx,%eax
}
  61:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  64:	c9                   	leave  
  65:	c3                   	ret    
  66:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  6d:	8d 76 00             	lea    0x0(%esi),%esi
  return (uchar)*p - (uchar)*q;
  70:	0f b6 59 01          	movzbl 0x1(%ecx),%ebx
  74:	31 c0                	xor    %eax,%eax
  76:	29 d8                	sub    %ebx,%eax
}
  78:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  7b:	c9                   	leave  
  7c:	c3                   	ret    
  return (uchar)*p - (uchar)*q;
  7d:	0f b6 19             	movzbl (%ecx),%ebx
  80:	31 c0                	xor    %eax,%eax
  82:	eb db                	jmp    5f <strcmp+0x2f>
  84:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  8b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  8f:	90                   	nop

00000090 <strlen>:

uint
strlen(const char *s)
{
  90:	55                   	push   %ebp
  91:	89 e5                	mov    %esp,%ebp
  93:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  for(n = 0; s[n]; n++)
  96:	80 3a 00             	cmpb   $0x0,(%edx)
  99:	74 15                	je     b0 <strlen+0x20>
  9b:	31 c0                	xor    %eax,%eax
  9d:	8d 76 00             	lea    0x0(%esi),%esi
  a0:	83 c0 01             	add    $0x1,%eax
  a3:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
  a7:	89 c1                	mov    %eax,%ecx
  a9:	75 f5                	jne    a0 <strlen+0x10>
    ;
  return n;
}
  ab:	89 c8                	mov    %ecx,%eax
  ad:	5d                   	pop    %ebp
  ae:	c3                   	ret    
  af:	90                   	nop
  for(n = 0; s[n]; n++)
  b0:	31 c9                	xor    %ecx,%ecx
}
  b2:	5d                   	pop    %ebp
  b3:	89 c8                	mov    %ecx,%eax
  b5:	c3                   	ret    
  b6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  bd:	8d 76 00             	lea    0x0(%esi),%esi

000000c0 <memset>:

void*
memset(void *dst, int c, uint n)
{
  c0:	55                   	push   %ebp
  c1:	89 e5                	mov    %esp,%ebp
  c3:	57                   	push   %edi
  c4:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
  c7:	8b 4d 10             	mov    0x10(%ebp),%ecx
  ca:	8b 45 0c             	mov    0xc(%ebp),%eax
  cd:	89 d7                	mov    %edx,%edi
  cf:	fc                   	cld    
  d0:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
  d2:	8b 7d fc             	mov    -0x4(%ebp),%edi
  d5:	89 d0                	mov    %edx,%eax
  d7:	c9                   	leave  
  d8:	c3                   	ret    
  d9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

000000e0 <strchr>:

char*
strchr(const char *s, char c)
{
  e0:	55                   	push   %ebp
  e1:	89 e5                	mov    %esp,%ebp
  e3:	8b 45 08             	mov    0x8(%ebp),%eax
  e6:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
  ea:	0f b6 10             	movzbl (%eax),%edx
  ed:	84 d2                	test   %dl,%dl
  ef:	75 12                	jne    103 <strchr+0x23>
  f1:	eb 1d                	jmp    110 <strchr+0x30>
  f3:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  f7:	90                   	nop
  f8:	0f b6 50 01          	movzbl 0x1(%eax),%edx
  fc:	83 c0 01             	add    $0x1,%eax
  ff:	84 d2                	test   %dl,%dl
 101:	74 0d                	je     110 <strchr+0x30>
    if(*s == c)
 103:	38 d1                	cmp    %dl,%cl
 105:	75 f1                	jne    f8 <strchr+0x18>
      return (char*)s;
  return 0;
}
 107:	5d                   	pop    %ebp
 108:	c3                   	ret    
 109:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  return 0;
 110:	31 c0                	xor    %eax,%eax
}
 112:	5d                   	pop    %ebp
 113:	c3                   	ret    
 114:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 11b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 11f:	90                   	nop

00000120 <gets>:

char*
gets(char *buf, int max)
{
 120:	55                   	push   %ebp
 121:	89 e5                	mov    %esp,%ebp
 123:	57                   	push   %edi
 124:	56                   	push   %esi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    cc = read(0, &c, 1);
 125:	8d 7d e7             	lea    -0x19(%ebp),%edi
{
 128:	53                   	push   %ebx
  for(i=0; i+1 < max; ){
 129:	31 db                	xor    %ebx,%ebx
{
 12b:	83 ec 1c             	sub    $0x1c,%esp
  for(i=0; i+1 < max; ){
 12e:	eb 27                	jmp    157 <gets+0x37>
    cc = read(0, &c, 1);
 130:	83 ec 04             	sub    $0x4,%esp
 133:	6a 01                	push   $0x1
 135:	57                   	push   %edi
 136:	6a 00                	push   $0x0
 138:	e8 2e 01 00 00       	call   26b <read>
    if(cc < 1)
 13d:	83 c4 10             	add    $0x10,%esp
 140:	85 c0                	test   %eax,%eax
 142:	7e 1d                	jle    161 <gets+0x41>
      break;
    buf[i++] = c;
 144:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 148:	8b 55 08             	mov    0x8(%ebp),%edx
 14b:	88 44 1a ff          	mov    %al,-0x1(%edx,%ebx,1)
    if(c == '\n' || c == '\r')
 14f:	3c 0a                	cmp    $0xa,%al
 151:	74 1d                	je     170 <gets+0x50>
 153:	3c 0d                	cmp    $0xd,%al
 155:	74 19                	je     170 <gets+0x50>
  for(i=0; i+1 < max; ){
 157:	89 de                	mov    %ebx,%esi
 159:	83 c3 01             	add    $0x1,%ebx
 15c:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 15f:	7c cf                	jl     130 <gets+0x10>
      break;
  }
  buf[i] = '\0';
 161:	8b 45 08             	mov    0x8(%ebp),%eax
 164:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
  return buf;
}
 168:	8d 65 f4             	lea    -0xc(%ebp),%esp
 16b:	5b                   	pop    %ebx
 16c:	5e                   	pop    %esi
 16d:	5f                   	pop    %edi
 16e:	5d                   	pop    %ebp
 16f:	c3                   	ret    
  buf[i] = '\0';
 170:	8b 45 08             	mov    0x8(%ebp),%eax
 173:	89 de                	mov    %ebx,%esi
 175:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
}
 179:	8d 65 f4             	lea    -0xc(%ebp),%esp
 17c:	5b                   	pop    %ebx
 17d:	5e                   	pop    %esi
 17e:	5f                   	pop    %edi
 17f:	5d                   	pop    %ebp
 180:	c3                   	ret    
 181:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 188:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 18f:	90                   	nop

00000190 <stat>:

int
stat(const char *n, struct stat *st)
{
 190:	55                   	push   %ebp
 191:	89 e5                	mov    %esp,%ebp
 193:	56                   	push   %esi
 194:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 195:	83 ec 08             	sub    $0x8,%esp
 198:	6a 00                	push   $0x0
 19a:	ff 75 08             	push   0x8(%ebp)
 19d:	e8 f1 00 00 00       	call   293 <open>
  if(fd < 0)
 1a2:	83 c4 10             	add    $0x10,%esp
 1a5:	85 c0                	test   %eax,%eax
 1a7:	78 27                	js     1d0 <stat+0x40>
    return -1;
  r = fstat(fd, st);
 1a9:	83 ec 08             	sub    $0x8,%esp
 1ac:	ff 75 0c             	push   0xc(%ebp)
 1af:	89 c3                	mov    %eax,%ebx
 1b1:	50                   	push   %eax
 1b2:	e8 f4 00 00 00       	call   2ab <fstat>
  close(fd);
 1b7:	89 1c 24             	mov    %ebx,(%esp)
  r = fstat(fd, st);
 1ba:	89 c6                	mov    %eax,%esi
  close(fd);
 1bc:	e8 ba 00 00 00       	call   27b <close>
  return r;
 1c1:	83 c4 10             	add    $0x10,%esp
}
 1c4:	8d 65 f8             	lea    -0x8(%ebp),%esp
 1c7:	89 f0                	mov    %esi,%eax
 1c9:	5b                   	pop    %ebx
 1ca:	5e                   	pop    %esi
 1cb:	5d                   	pop    %ebp
 1cc:	c3                   	ret    
 1cd:	8d 76 00             	lea    0x0(%esi),%esi
    return -1;
 1d0:	be ff ff ff ff       	mov    $0xffffffff,%esi
 1d5:	eb ed                	jmp    1c4 <stat+0x34>
 1d7:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 1de:	66 90                	xchg   %ax,%ax

000001e0 <atoi>:

int
atoi(const char *s)
{
 1e0:	55                   	push   %ebp
 1e1:	89 e5                	mov    %esp,%ebp
 1e3:	53                   	push   %ebx
 1e4:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 1e7:	0f be 02             	movsbl (%edx),%eax
 1ea:	8d 48 d0             	lea    -0x30(%eax),%ecx
 1ed:	80 f9 09             	cmp    $0x9,%cl
  n = 0;
 1f0:	b9 00 00 00 00       	mov    $0x0,%ecx
  while('0' <= *s && *s <= '9')
 1f5:	77 1e                	ja     215 <atoi+0x35>
 1f7:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 1fe:	66 90                	xchg   %ax,%ax
    n = n*10 + *s++ - '0';
 200:	83 c2 01             	add    $0x1,%edx
 203:	8d 0c 89             	lea    (%ecx,%ecx,4),%ecx
 206:	8d 4c 48 d0          	lea    -0x30(%eax,%ecx,2),%ecx
  while('0' <= *s && *s <= '9')
 20a:	0f be 02             	movsbl (%edx),%eax
 20d:	8d 58 d0             	lea    -0x30(%eax),%ebx
 210:	80 fb 09             	cmp    $0x9,%bl
 213:	76 eb                	jbe    200 <atoi+0x20>
  return n;
}
 215:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 218:	89 c8                	mov    %ecx,%eax
 21a:	c9                   	leave  
 21b:	c3                   	ret    
 21c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000220 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 220:	55                   	push   %ebp
 221:	89 e5                	mov    %esp,%ebp
 223:	57                   	push   %edi
 224:	8b 45 10             	mov    0x10(%ebp),%eax
 227:	8b 55 08             	mov    0x8(%ebp),%edx
 22a:	56                   	push   %esi
 22b:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 22e:	85 c0                	test   %eax,%eax
 230:	7e 13                	jle    245 <memmove+0x25>
 232:	01 d0                	add    %edx,%eax
  dst = vdst;
 234:	89 d7                	mov    %edx,%edi
 236:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 23d:	8d 76 00             	lea    0x0(%esi),%esi
    *dst++ = *src++;
 240:	a4                   	movsb  %ds:(%esi),%es:(%edi)
  while(n-- > 0)
 241:	39 f8                	cmp    %edi,%eax
 243:	75 fb                	jne    240 <memmove+0x20>
  return vdst;
}
 245:	5e                   	pop    %esi
 246:	89 d0                	mov    %edx,%eax
 248:	5f                   	pop    %edi
 249:	5d                   	pop    %ebp
 24a:	c3                   	ret    

0000024b <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 24b:	b8 01 00 00 00       	mov    $0x1,%eax
 250:	cd 40                	int    $0x40
 252:	c3                   	ret    

00000253 <exit>:
SYSCALL(exit)
 253:	b8 02 00 00 00       	mov    $0x2,%eax
 258:	cd 40                	int    $0x40
 25a:	c3                   	ret    

0000025b <wait>:
SYSCALL(wait)
 25b:	b8 03 00 00 00       	mov    $0x3,%eax
 260:	cd 40                	int    $0x40
 262:	c3                   	ret    

00000263 <pipe>:
SYSCALL(pipe)
 263:	b8 04 00 00 00       	mov    $0x4,%eax
 268:	cd 40                	int    $0x40
 26a:	c3                   	ret    

0000026b <read>:
SYSCALL(read)
 26b:	b8 05 00 00 00       	mov    $0x5,%eax
 270:	cd 40                	int    $0x40
 272:	c3                   	ret    

00000273 <write>:
SYSCALL(write)
 273:	b8 10 00 00 00       	mov    $0x10,%eax
 278:	cd 40                	int    $0x40
 27a:	c3                   	ret    

0000027b <close>:
SYSCALL(close)
 27b:	b8 15 00 00 00       	mov    $0x15,%eax
 280:	cd 40                	int    $0x40
 282:	c3                   	ret    

00000283 <kill>:
SYSCALL(kill)
 283:	b8 06 00 00 00       	mov    $0x6,%eax
 288:	cd 40                	int    $0x40
 28a:	c3                   	ret    

0000028b <exec>:
SYSCALL(exec)
 28b:	b8 07 00 00 00       	mov    $0x7,%eax
 290:	cd 40                	int    $0x40
 292:	c3                   	ret    

00000293 <open>:
SYSCALL(open)
 293:	b8 0f 00 00 00       	mov    $0xf,%eax
 298:	cd 40                	int    $0x40
 29a:	c3                   	ret    

0000029b <mknod>:
SYSCALL(mknod)
 29b:	b8 11 00 00 00       	mov    $0x11,%eax
 2a0:	cd 40                	int    $0x40
 2a2:	c3                   	ret    

000002a3 <unlink>:
SYSCALL(unlink)
 2a3:	b8 12 00 00 00       	mov    $0x12,%eax
 2a8:	cd 40                	int    $0x40
 2aa:	c3                   	ret    

000002ab <fstat>:
SYSCALL(fstat)
 2ab:	b8 08 00 00 00       	mov    $0x8,%eax
 2b0:	cd 40                	int    $0x40
 2b2:	c3                   	ret    

000002b3 <link>:
SYSCALL(link)
 2b3:	b8 13 00 00 00       	mov    $0x13,%eax
 2b8:	cd 40                	int    $0x40
 2ba:	c3                   	ret    

000002bb <mkdir>:
SYSCALL(mkdir)
 2bb:	b8 14 00 00 00       	mov    $0x14,%eax
 2c0:	cd 40                	int    $0x40
 2c2:	c3                   	ret    

000002c3 <chdir>:
SYSCALL(chdir)
 2c3:	b8 09 00 00 00       	mov    $0x9,%eax
 2c8:	cd 40                	int    $0x40
 2ca:	c3                   	ret    

000002cb <dup>:
SYSCALL(dup)
 2cb:	b8 0a 00 00 00       	mov    $0xa,%eax
 2d0:	cd 40                	int    $0x40
 2d2:	c3                   	ret    

000002d3 <getpid>:
SYSCALL(getpid)
 2d3:	b8 0b 00 00 00       	mov    $0xb,%eax
 2d8:	cd 40                	int    $0x40
 2da:	c3                   	ret    

000002db <sbrk>:
SYSCALL(sbrk)
 2db:	b8 0c 00 00 00       	mov    $0xc,%eax
 2e0:	cd 40                	int    $0x40
 2e2:	c3                   	ret    

000002e3 <sleep>:
SYSCALL(sleep)
 2e3:	b8 0d 00 00 00       	mov    $0xd,%eax
 2e8:	cd 40                	int    $0x40
 2ea:	c3                   	ret    

000002eb <uptime>:
SYSCALL(uptime)
 2eb:	b8 0e 00 00 00       	mov    $0xe,%eax
 2f0:	cd 40                	int    $0x40
 2f2:	c3                   	ret    

000002f3 <cpuhalt>:
SYSCALL(cpuhalt)
 2f3:	b8 16 00 00 00       	mov    $0x16,%eax
 2f8:	cd 40                	int    $0x40
 2fa:	c3                   	ret    
 2fb:	66 90                	xchg   %ax,%ax
 2fd:	66 90                	xchg   %ax,%ax
 2ff:	90                   	nop

00000300 <printint>:
    putc(fd, digits[x >> (sizeof(uint) * 8 - 4)]);
}

static void
printint(int fd, int xx, int base, int sgn)
{
 300:	55                   	push   %ebp
 301:	89 e5                	mov    %esp,%ebp
 303:	57                   	push   %edi
 304:	56                   	push   %esi
 305:	53                   	push   %ebx
 306:	83 ec 3c             	sub    $0x3c,%esp
 309:	89 4d c4             	mov    %ecx,-0x3c(%ebp)
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
    x = -xx;
 30c:	89 d1                	mov    %edx,%ecx
{
 30e:	89 45 b8             	mov    %eax,-0x48(%ebp)
  if(sgn && xx < 0){
 311:	85 d2                	test   %edx,%edx
 313:	0f 89 7f 00 00 00    	jns    398 <printint+0x98>
 319:	f6 45 08 01          	testb  $0x1,0x8(%ebp)
 31d:	74 79                	je     398 <printint+0x98>
    neg = 1;
 31f:	c7 45 bc 01 00 00 00 	movl   $0x1,-0x44(%ebp)
    x = -xx;
 326:	f7 d9                	neg    %ecx
  } else {
    x = xx;
  }

  i = 0;
 328:	31 db                	xor    %ebx,%ebx
 32a:	8d 75 d7             	lea    -0x29(%ebp),%esi
 32d:	8d 76 00             	lea    0x0(%esi),%esi
  do{
    buf[i++] = digits[x % base];
 330:	89 c8                	mov    %ecx,%eax
 332:	31 d2                	xor    %edx,%edx
 334:	89 cf                	mov    %ecx,%edi
 336:	f7 75 c4             	divl   -0x3c(%ebp)
 339:	0f b6 92 18 08 00 00 	movzbl 0x818(%edx),%edx
 340:	89 45 c0             	mov    %eax,-0x40(%ebp)
 343:	89 d8                	mov    %ebx,%eax
 345:	8d 5b 01             	lea    0x1(%ebx),%ebx
  }while((x /= base) != 0);
 348:	8b 4d c0             	mov    -0x40(%ebp),%ecx
    buf[i++] = digits[x % base];
 34b:	88 14 1e             	mov    %dl,(%esi,%ebx,1)
  }while((x /= base) != 0);
 34e:	39 7d c4             	cmp    %edi,-0x3c(%ebp)
 351:	76 dd                	jbe    330 <printint+0x30>
  if(neg)
 353:	8b 4d bc             	mov    -0x44(%ebp),%ecx
 356:	85 c9                	test   %ecx,%ecx
 358:	74 0c                	je     366 <printint+0x66>
    buf[i++] = '-';
 35a:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
    buf[i++] = digits[x % base];
 35f:	89 d8                	mov    %ebx,%eax
    buf[i++] = '-';
 361:	ba 2d 00 00 00       	mov    $0x2d,%edx

  while(--i >= 0)
 366:	8b 7d b8             	mov    -0x48(%ebp),%edi
 369:	8d 5c 05 d7          	lea    -0x29(%ebp,%eax,1),%ebx
 36d:	eb 07                	jmp    376 <printint+0x76>
 36f:	90                   	nop
    putc(fd, buf[i]);
 370:	0f b6 13             	movzbl (%ebx),%edx
 373:	83 eb 01             	sub    $0x1,%ebx
  write(fd, &c, 1);
 376:	83 ec 04             	sub    $0x4,%esp
 379:	88 55 d7             	mov    %dl,-0x29(%ebp)
 37c:	6a 01                	push   $0x1
 37e:	56                   	push   %esi
 37f:	57                   	push   %edi
 380:	e8 ee fe ff ff       	call   273 <write>
  while(--i >= 0)
 385:	83 c4 10             	add    $0x10,%esp
 388:	39 de                	cmp    %ebx,%esi
 38a:	75 e4                	jne    370 <printint+0x70>
}
 38c:	8d 65 f4             	lea    -0xc(%ebp),%esp
 38f:	5b                   	pop    %ebx
 390:	5e                   	pop    %esi
 391:	5f                   	pop    %edi
 392:	5d                   	pop    %ebp
 393:	c3                   	ret    
 394:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
 398:	c7 45 bc 00 00 00 00 	movl   $0x0,-0x44(%ebp)
 39f:	eb 87                	jmp    328 <printint+0x28>
 3a1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 3a8:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 3af:	90                   	nop

000003b0 <vprintf>:
static void vprintf(int fd, const char *fmt, va_list ap)
{
 3b0:	55                   	push   %ebp
 3b1:	89 e5                	mov    %esp,%ebp
 3b3:	57                   	push   %edi
 3b4:	56                   	push   %esi
 3b5:	53                   	push   %ebx
 3b6:	83 ec 2c             	sub    $0x2c,%esp
 3b9:	89 4d d4             	mov    %ecx,-0x2c(%ebp)
  char *s;
  int c, i, state;

  state = 0;
  for(i = 0; fmt[i]; i++){
 3bc:	0f b6 0a             	movzbl (%edx),%ecx
 3bf:	84 c9                	test   %cl,%cl
 3c1:	74 6c                	je     42f <vprintf+0x7f>
 3c3:	89 c6                	mov    %eax,%esi
 3c5:	8d 5a 01             	lea    0x1(%edx),%ebx
 3c8:	31 ff                	xor    %edi,%edi
 3ca:	eb 28                	jmp    3f4 <vprintf+0x44>
 3cc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
 3d0:	83 f8 25             	cmp    $0x25,%eax
 3d3:	74 4b                	je     420 <vprintf+0x70>
  write(fd, &c, 1);
 3d5:	83 ec 04             	sub    $0x4,%esp
 3d8:	8d 45 e7             	lea    -0x19(%ebp),%eax
 3db:	88 4d e7             	mov    %cl,-0x19(%ebp)
 3de:	6a 01                	push   $0x1
 3e0:	50                   	push   %eax
 3e1:	56                   	push   %esi
 3e2:	e8 8c fe ff ff       	call   273 <write>
        state = '%';
      } else {
        putc(fd, c);
 3e7:	83 c4 10             	add    $0x10,%esp
  for(i = 0; fmt[i]; i++){
 3ea:	0f b6 0b             	movzbl (%ebx),%ecx
 3ed:	83 c3 01             	add    $0x1,%ebx
 3f0:	84 c9                	test   %cl,%cl
 3f2:	74 3b                	je     42f <vprintf+0x7f>
    c = fmt[i] & 0xff;
 3f4:	0f b6 c1             	movzbl %cl,%eax
    if(state == 0){
 3f7:	85 ff                	test   %edi,%edi
 3f9:	74 d5                	je     3d0 <vprintf+0x20>
      }
    } else if(state == '%'){
 3fb:	83 ff 25             	cmp    $0x25,%edi
 3fe:	75 ea                	jne    3ea <vprintf+0x3a>
      if(c == 'd'){
 400:	83 f8 25             	cmp    $0x25,%eax
 403:	0f 84 cf 01 00 00    	je     5d8 <vprintf+0x228>
 409:	83 e8 63             	sub    $0x63,%eax
 40c:	83 f8 15             	cmp    $0x15,%eax
 40f:	77 2f                	ja     440 <vprintf+0x90>
 411:	ff 24 85 c0 07 00 00 	jmp    *0x7c0(,%eax,4)
 418:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 41f:	90                   	nop
  for(i = 0; fmt[i]; i++){
 420:	0f b6 0b             	movzbl (%ebx),%ecx
 423:	83 c3 01             	add    $0x1,%ebx
        state = '%';
 426:	bf 25 00 00 00       	mov    $0x25,%edi
  for(i = 0; fmt[i]; i++){
 42b:	84 c9                	test   %cl,%cl
 42d:	75 c5                	jne    3f4 <vprintf+0x44>
        putc(fd, c);
      }
      state = 0;
    }
  }
}
 42f:	8d 65 f4             	lea    -0xc(%ebp),%esp
 432:	5b                   	pop    %ebx
 433:	5e                   	pop    %esi
 434:	5f                   	pop    %edi
 435:	5d                   	pop    %ebp
 436:	c3                   	ret    
 437:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 43e:	66 90                	xchg   %ax,%ax
  write(fd, &c, 1);
 440:	83 ec 04             	sub    $0x4,%esp
 443:	8d 45 e7             	lea    -0x19(%ebp),%eax
 446:	88 4d d0             	mov    %cl,-0x30(%ebp)
 449:	6a 01                	push   $0x1
 44b:	50                   	push   %eax
 44c:	56                   	push   %esi
 44d:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
 451:	e8 1d fe ff ff       	call   273 <write>
        putc(fd, c);
 456:	0f b6 4d d0          	movzbl -0x30(%ebp),%ecx
  write(fd, &c, 1);
 45a:	83 c4 0c             	add    $0xc,%esp
 45d:	88 4d e7             	mov    %cl,-0x19(%ebp)
 460:	8d 45 e7             	lea    -0x19(%ebp),%eax
 463:	6a 01                	push   $0x1
      state = 0;
 465:	31 ff                	xor    %edi,%edi
  write(fd, &c, 1);
 467:	50                   	push   %eax
 468:	56                   	push   %esi
 469:	e8 05 fe ff ff       	call   273 <write>
        putc(fd, c);
 46e:	83 c4 10             	add    $0x10,%esp
 471:	e9 74 ff ff ff       	jmp    3ea <vprintf+0x3a>
 476:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 47d:	8d 76 00             	lea    0x0(%esi),%esi
        putc(fd, va_arg(ap, uint));
 480:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  write(fd, &c, 1);
 483:	83 ec 04             	sub    $0x4,%esp
        putc(fd, va_arg(ap, uint));
 486:	8d 78 04             	lea    0x4(%eax),%edi
 489:	8b 00                	mov    (%eax),%eax
  write(fd, &c, 1);
 48b:	6a 01                	push   $0x1
        putc(fd, va_arg(ap, uint));
 48d:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
 490:	8d 45 e7             	lea    -0x19(%ebp),%eax
 493:	50                   	push   %eax
 494:	56                   	push   %esi
 495:	e8 d9 fd ff ff       	call   273 <write>
        putc(fd, va_arg(ap, uint));
 49a:	89 7d d4             	mov    %edi,-0x2c(%ebp)
 49d:	83 c4 10             	add    $0x10,%esp
      state = 0;
 4a0:	31 ff                	xor    %edi,%edi
 4a2:	e9 43 ff ff ff       	jmp    3ea <vprintf+0x3a>
 4a7:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 4ae:	66 90                	xchg   %ax,%ax
        printint(fd, va_arg(ap, int), 10, 1);
 4b0:	83 ec 0c             	sub    $0xc,%esp
 4b3:	8b 45 d4             	mov    -0x2c(%ebp),%eax
 4b6:	b9 0a 00 00 00       	mov    $0xa,%ecx
 4bb:	6a 01                	push   $0x1
 4bd:	8d 78 04             	lea    0x4(%eax),%edi
        printint(fd, va_arg(ap, int), 16, 0);
 4c0:	8b 10                	mov    (%eax),%edx
 4c2:	89 f0                	mov    %esi,%eax
 4c4:	e8 37 fe ff ff       	call   300 <printint>
 4c9:	89 7d d4             	mov    %edi,-0x2c(%ebp)
 4cc:	83 c4 10             	add    $0x10,%esp
      state = 0;
 4cf:	31 ff                	xor    %edi,%edi
 4d1:	e9 14 ff ff ff       	jmp    3ea <vprintf+0x3a>
 4d6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 4dd:	8d 76 00             	lea    0x0(%esi),%esi
        printint(fd, va_arg(ap, uint), 10, 0);
 4e0:	8b 45 d4             	mov    -0x2c(%ebp),%eax
 4e3:	83 ec 0c             	sub    $0xc,%esp
 4e6:	b9 0a 00 00 00       	mov    $0xa,%ecx
 4eb:	6a 00                	push   $0x0
 4ed:	8d 78 04             	lea    0x4(%eax),%edi
 4f0:	eb ce                	jmp    4c0 <vprintf+0x110>
 4f2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        printptr(fd, va_arg(ap, uint));
 4f8:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  write(fd, &c, 1);
 4fb:	83 ec 04             	sub    $0x4,%esp
 4fe:	c6 45 e7 30          	movb   $0x30,-0x19(%ebp)
        printptr(fd, va_arg(ap, uint));
 502:	8b 38                	mov    (%eax),%edi
 504:	8d 50 04             	lea    0x4(%eax),%edx
  write(fd, &c, 1);
 507:	8d 45 e7             	lea    -0x19(%ebp),%eax
 50a:	6a 01                	push   $0x1
 50c:	50                   	push   %eax
 50d:	56                   	push   %esi
        printptr(fd, va_arg(ap, uint));
 50e:	89 55 d4             	mov    %edx,-0x2c(%ebp)
  write(fd, &c, 1);
 511:	e8 5d fd ff ff       	call   273 <write>
 516:	83 c4 0c             	add    $0xc,%esp
 519:	8d 45 e7             	lea    -0x19(%ebp),%eax
 51c:	c6 45 e7 78          	movb   $0x78,-0x19(%ebp)
 520:	6a 01                	push   $0x1
 522:	50                   	push   %eax
 523:	56                   	push   %esi
 524:	e8 4a fd ff ff       	call   273 <write>
  putc(fd, 'x');
 529:	b8 08 00 00 00       	mov    $0x8,%eax
 52e:	89 5d d0             	mov    %ebx,-0x30(%ebp)
 531:	83 c4 10             	add    $0x10,%esp
 534:	89 fb                	mov    %edi,%ebx
 536:	89 c7                	mov    %eax,%edi
 538:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 53f:	90                   	nop
    putc(fd, digits[x >> (sizeof(uint) * 8 - 4)]);
 540:	89 d8                	mov    %ebx,%eax
  write(fd, &c, 1);
 542:	83 ec 04             	sub    $0x4,%esp
  for (i = 0; i < (sizeof(uint) * 2); i++, x <<= 4)
 545:	c1 e3 04             	shl    $0x4,%ebx
    putc(fd, digits[x >> (sizeof(uint) * 8 - 4)]);
 548:	c1 e8 1c             	shr    $0x1c,%eax
  write(fd, &c, 1);
 54b:	6a 01                	push   $0x1
 54d:	0f b6 80 18 08 00 00 	movzbl 0x818(%eax),%eax
 554:	88 45 e7             	mov    %al,-0x19(%ebp)
 557:	8d 45 e7             	lea    -0x19(%ebp),%eax
 55a:	50                   	push   %eax
 55b:	56                   	push   %esi
 55c:	e8 12 fd ff ff       	call   273 <write>
  for (i = 0; i < (sizeof(uint) * 2); i++, x <<= 4)
 561:	83 c4 10             	add    $0x10,%esp
 564:	83 ef 01             	sub    $0x1,%edi
 567:	75 d7                	jne    540 <vprintf+0x190>
        printptr(fd, va_arg(ap, uint));
 569:	8b 5d d0             	mov    -0x30(%ebp),%ebx
      state = 0;
 56c:	31 ff                	xor    %edi,%edi
 56e:	e9 77 fe ff ff       	jmp    3ea <vprintf+0x3a>
 573:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 577:	90                   	nop
        s = va_arg(ap, char*);
 578:	8b 45 d4             	mov    -0x2c(%ebp),%eax
 57b:	8b 38                	mov    (%eax),%edi
 57d:	8d 50 04             	lea    0x4(%eax),%edx
 580:	89 55 d4             	mov    %edx,-0x2c(%ebp)
        if(s == 0)
 583:	85 ff                	test   %edi,%edi
 585:	74 5c                	je     5e3 <vprintf+0x233>
        while(*s != 0){
 587:	0f b6 07             	movzbl (%edi),%eax
 58a:	84 c0                	test   %al,%al
 58c:	74 21                	je     5af <vprintf+0x1ff>
 58e:	66 90                	xchg   %ax,%ax
  write(fd, &c, 1);
 590:	83 ec 04             	sub    $0x4,%esp
 593:	88 45 e7             	mov    %al,-0x19(%ebp)
 596:	8d 45 e7             	lea    -0x19(%ebp),%eax
          s++;
 599:	83 c7 01             	add    $0x1,%edi
  write(fd, &c, 1);
 59c:	6a 01                	push   $0x1
 59e:	50                   	push   %eax
 59f:	56                   	push   %esi
 5a0:	e8 ce fc ff ff       	call   273 <write>
        while(*s != 0){
 5a5:	0f b6 07             	movzbl (%edi),%eax
 5a8:	83 c4 10             	add    $0x10,%esp
 5ab:	84 c0                	test   %al,%al
 5ad:	75 e1                	jne    590 <vprintf+0x1e0>
      state = 0;
 5af:	31 ff                	xor    %edi,%edi
 5b1:	e9 34 fe ff ff       	jmp    3ea <vprintf+0x3a>
 5b6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 5bd:	8d 76 00             	lea    0x0(%esi),%esi
        printint(fd, va_arg(ap, int), 16, 0);
 5c0:	8b 45 d4             	mov    -0x2c(%ebp),%eax
 5c3:	83 ec 0c             	sub    $0xc,%esp
 5c6:	b9 10 00 00 00       	mov    $0x10,%ecx
 5cb:	6a 00                	push   $0x0
 5cd:	8d 78 04             	lea    0x4(%eax),%edi
 5d0:	e9 eb fe ff ff       	jmp    4c0 <vprintf+0x110>
 5d5:	8d 76 00             	lea    0x0(%esi),%esi
        putc(fd, c);
 5d8:	88 4d e7             	mov    %cl,-0x19(%ebp)
  write(fd, &c, 1);
 5db:	83 ec 04             	sub    $0x4,%esp
 5de:	e9 7d fe ff ff       	jmp    460 <vprintf+0xb0>
          s = "(null)";
 5e3:	bf b8 07 00 00       	mov    $0x7b8,%edi
        while(*s != 0){
 5e8:	b8 28 00 00 00       	mov    $0x28,%eax
 5ed:	eb a1                	jmp    590 <vprintf+0x1e0>
 5ef:	90                   	nop

000005f0 <fprintf>:
// Print to the given fd. Only understands %d,%x, %p, %s, %c.
void
fprintf(int fd, const char *fmt, ...)
{
 5f0:	55                   	push   %ebp
 5f1:	89 e5                	mov    %esp,%ebp
 5f3:	83 ec 08             	sub    $0x8,%esp
 va_list ap;
 va_start(ap, fmt); 
 vprintf(fd,fmt,ap);
 5f6:	8b 55 0c             	mov    0xc(%ebp),%edx
 5f9:	8b 45 08             	mov    0x8(%ebp),%eax
 5fc:	8d 4d 10             	lea    0x10(%ebp),%ecx
 5ff:	e8 ac fd ff ff       	call   3b0 <vprintf>
}
 604:	c9                   	leave  
 605:	c3                   	ret    
 606:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 60d:	8d 76 00             	lea    0x0(%esi),%esi

00000610 <printf>:
void
printf(const char *fmt, ...)
{
 610:	55                   	push   %ebp
  va_list ap;
  va_start(ap, fmt); 
  vprintf(1,fmt,ap);
 611:	b8 01 00 00 00       	mov    $0x1,%eax
{
 616:	89 e5                	mov    %esp,%ebp
 618:	83 ec 08             	sub    $0x8,%esp
  vprintf(1,fmt,ap);
 61b:	8b 55 08             	mov    0x8(%ebp),%edx
 61e:	8d 4d 0c             	lea    0xc(%ebp),%ecx
 621:	e8 8a fd ff ff       	call   3b0 <vprintf>
}
 626:	c9                   	leave  
 627:	c3                   	ret    
 628:	66 90                	xchg   %ax,%ax
 62a:	66 90                	xchg   %ax,%ax
 62c:	66 90                	xchg   %ax,%ax
 62e:	66 90                	xchg   %ax,%ax

00000630 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 630:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 631:	a1 2c 08 00 00       	mov    0x82c,%eax
{
 636:	89 e5                	mov    %esp,%ebp
 638:	57                   	push   %edi
 639:	56                   	push   %esi
 63a:	53                   	push   %ebx
 63b:	8b 5d 08             	mov    0x8(%ebp),%ebx
  bp = (Header*)ap - 1;
 63e:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 641:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 648:	89 c2                	mov    %eax,%edx
 64a:	8b 00                	mov    (%eax),%eax
 64c:	39 ca                	cmp    %ecx,%edx
 64e:	73 30                	jae    680 <free+0x50>
 650:	39 c1                	cmp    %eax,%ecx
 652:	72 04                	jb     658 <free+0x28>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 654:	39 c2                	cmp    %eax,%edx
 656:	72 f0                	jb     648 <free+0x18>
      break;
  if(bp + bp->s.size == p->s.ptr){
 658:	8b 73 fc             	mov    -0x4(%ebx),%esi
 65b:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 65e:	39 f8                	cmp    %edi,%eax
 660:	74 30                	je     692 <free+0x62>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
 662:	89 43 f8             	mov    %eax,-0x8(%ebx)
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
 665:	8b 42 04             	mov    0x4(%edx),%eax
 668:	8d 34 c2             	lea    (%edx,%eax,8),%esi
 66b:	39 f1                	cmp    %esi,%ecx
 66d:	74 3a                	je     6a9 <free+0x79>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
 66f:	89 0a                	mov    %ecx,(%edx)
  } else
    p->s.ptr = bp;
  freep = p;
}
 671:	5b                   	pop    %ebx
  freep = p;
 672:	89 15 2c 08 00 00    	mov    %edx,0x82c
}
 678:	5e                   	pop    %esi
 679:	5f                   	pop    %edi
 67a:	5d                   	pop    %ebp
 67b:	c3                   	ret    
 67c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 680:	39 c2                	cmp    %eax,%edx
 682:	72 c4                	jb     648 <free+0x18>
 684:	39 c1                	cmp    %eax,%ecx
 686:	73 c0                	jae    648 <free+0x18>
  if(bp + bp->s.size == p->s.ptr){
 688:	8b 73 fc             	mov    -0x4(%ebx),%esi
 68b:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 68e:	39 f8                	cmp    %edi,%eax
 690:	75 d0                	jne    662 <free+0x32>
    bp->s.size += p->s.ptr->s.size;
 692:	03 70 04             	add    0x4(%eax),%esi
 695:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 698:	8b 02                	mov    (%edx),%eax
 69a:	8b 00                	mov    (%eax),%eax
 69c:	89 43 f8             	mov    %eax,-0x8(%ebx)
  if(p + p->s.size == bp){
 69f:	8b 42 04             	mov    0x4(%edx),%eax
 6a2:	8d 34 c2             	lea    (%edx,%eax,8),%esi
 6a5:	39 f1                	cmp    %esi,%ecx
 6a7:	75 c6                	jne    66f <free+0x3f>
    p->s.size += bp->s.size;
 6a9:	03 43 fc             	add    -0x4(%ebx),%eax
  freep = p;
 6ac:	89 15 2c 08 00 00    	mov    %edx,0x82c
    p->s.size += bp->s.size;
 6b2:	89 42 04             	mov    %eax,0x4(%edx)
    p->s.ptr = bp->s.ptr;
 6b5:	8b 4b f8             	mov    -0x8(%ebx),%ecx
 6b8:	89 0a                	mov    %ecx,(%edx)
}
 6ba:	5b                   	pop    %ebx
 6bb:	5e                   	pop    %esi
 6bc:	5f                   	pop    %edi
 6bd:	5d                   	pop    %ebp
 6be:	c3                   	ret    
 6bf:	90                   	nop

000006c0 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 6c0:	55                   	push   %ebp
 6c1:	89 e5                	mov    %esp,%ebp
 6c3:	57                   	push   %edi
 6c4:	56                   	push   %esi
 6c5:	53                   	push   %ebx
 6c6:	83 ec 1c             	sub    $0x1c,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 6c9:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
 6cc:	8b 3d 2c 08 00 00    	mov    0x82c,%edi
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 6d2:	8d 70 07             	lea    0x7(%eax),%esi
 6d5:	c1 ee 03             	shr    $0x3,%esi
 6d8:	83 c6 01             	add    $0x1,%esi
  if((prevp = freep) == 0){
 6db:	85 ff                	test   %edi,%edi
 6dd:	0f 84 9d 00 00 00    	je     780 <malloc+0xc0>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 6e3:	8b 17                	mov    (%edi),%edx
    if(p->s.size >= nunits){
 6e5:	8b 4a 04             	mov    0x4(%edx),%ecx
 6e8:	39 f1                	cmp    %esi,%ecx
 6ea:	73 6a                	jae    756 <malloc+0x96>
 6ec:	bb 00 10 00 00       	mov    $0x1000,%ebx
 6f1:	39 de                	cmp    %ebx,%esi
 6f3:	0f 43 de             	cmovae %esi,%ebx
  p = sbrk(nu * sizeof(Header));
 6f6:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
 6fd:	89 45 e4             	mov    %eax,-0x1c(%ebp)
 700:	eb 17                	jmp    719 <malloc+0x59>
 702:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 708:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
 70a:	8b 48 04             	mov    0x4(%eax),%ecx
 70d:	39 f1                	cmp    %esi,%ecx
 70f:	73 4f                	jae    760 <malloc+0xa0>
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 711:	8b 3d 2c 08 00 00    	mov    0x82c,%edi
 717:	89 c2                	mov    %eax,%edx
 719:	39 d7                	cmp    %edx,%edi
 71b:	75 eb                	jne    708 <malloc+0x48>
  p = sbrk(nu * sizeof(Header));
 71d:	83 ec 0c             	sub    $0xc,%esp
 720:	ff 75 e4             	push   -0x1c(%ebp)
 723:	e8 b3 fb ff ff       	call   2db <sbrk>
  if(p == (char*)-1)
 728:	83 c4 10             	add    $0x10,%esp
 72b:	83 f8 ff             	cmp    $0xffffffff,%eax
 72e:	74 1c                	je     74c <malloc+0x8c>
  hp->s.size = nu;
 730:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 733:	83 ec 0c             	sub    $0xc,%esp
 736:	83 c0 08             	add    $0x8,%eax
 739:	50                   	push   %eax
 73a:	e8 f1 fe ff ff       	call   630 <free>
  return freep;
 73f:	8b 15 2c 08 00 00    	mov    0x82c,%edx
      if((p = morecore(nunits)) == 0)
 745:	83 c4 10             	add    $0x10,%esp
 748:	85 d2                	test   %edx,%edx
 74a:	75 bc                	jne    708 <malloc+0x48>
        return 0;
  }
}
 74c:	8d 65 f4             	lea    -0xc(%ebp),%esp
        return 0;
 74f:	31 c0                	xor    %eax,%eax
}
 751:	5b                   	pop    %ebx
 752:	5e                   	pop    %esi
 753:	5f                   	pop    %edi
 754:	5d                   	pop    %ebp
 755:	c3                   	ret    
    if(p->s.size >= nunits){
 756:	89 d0                	mov    %edx,%eax
 758:	89 fa                	mov    %edi,%edx
 75a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      if(p->s.size == nunits)
 760:	39 ce                	cmp    %ecx,%esi
 762:	74 4c                	je     7b0 <malloc+0xf0>
        p->s.size -= nunits;
 764:	29 f1                	sub    %esi,%ecx
 766:	89 48 04             	mov    %ecx,0x4(%eax)
        p += p->s.size;
 769:	8d 04 c8             	lea    (%eax,%ecx,8),%eax
        p->s.size = nunits;
 76c:	89 70 04             	mov    %esi,0x4(%eax)
      freep = prevp;
 76f:	89 15 2c 08 00 00    	mov    %edx,0x82c
}
 775:	8d 65 f4             	lea    -0xc(%ebp),%esp
      return (void*)(p + 1);
 778:	83 c0 08             	add    $0x8,%eax
}
 77b:	5b                   	pop    %ebx
 77c:	5e                   	pop    %esi
 77d:	5f                   	pop    %edi
 77e:	5d                   	pop    %ebp
 77f:	c3                   	ret    
    base.s.ptr = freep = prevp = &base;
 780:	c7 05 2c 08 00 00 30 	movl   $0x830,0x82c
 787:	08 00 00 
    base.s.size = 0;
 78a:	bf 30 08 00 00       	mov    $0x830,%edi
    base.s.ptr = freep = prevp = &base;
 78f:	c7 05 30 08 00 00 30 	movl   $0x830,0x830
 796:	08 00 00 
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 799:	89 fa                	mov    %edi,%edx
    base.s.size = 0;
 79b:	c7 05 34 08 00 00 00 	movl   $0x0,0x834
 7a2:	00 00 00 
    if(p->s.size >= nunits){
 7a5:	e9 42 ff ff ff       	jmp    6ec <malloc+0x2c>
 7aa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        prevp->s.ptr = p->s.ptr;
 7b0:	8b 08                	mov    (%eax),%ecx
 7b2:	89 0a                	mov    %ecx,(%edx)
 7b4:	eb b9                	jmp    76f <malloc+0xaf>
