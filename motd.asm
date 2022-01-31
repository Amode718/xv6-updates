
user/_motd:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
#include "user/user.h"
#include "kernel/fcntl.h"

int
main(int argc, char *argv[])
{
   0:	8d 4c 24 04          	lea    0x4(%esp),%ecx
   4:	83 e4 f0             	and    $0xfffffff0,%esp
   7:	ff 71 fc             	push   -0x4(%ecx)
   a:	55                   	push   %ebp
   b:	89 e5                	mov    %esp,%ebp
   d:	51                   	push   %ecx
   e:	83 ec 04             	sub    $0x4,%esp
  11:	8b 01                	mov    (%ecx),%eax

  if(argc == 1){
  13:	83 f8 01             	cmp    $0x1,%eax
  16:	74 14                	je     2c <main+0x2c>
    fprintf(2, "Have a great day!\n");
    exit();
  }
  if(argc == 2){
  18:	83 f8 02             	cmp    $0x2,%eax
  1b:	74 35                	je     52 <main+0x52>
    fprintf(2, "Found the secret!\n");
    exit();
  }
  if(argc == 3){
  1d:	83 f8 03             	cmp    $0x3,%eax
  20:	74 1d                	je     3f <main+0x3f>
    fprintf(2, "The Lord is with you where ever you go!\n");
    exit();
  }
  22:	8b 4d fc             	mov    -0x4(%ebp),%ecx
  25:	31 c0                	xor    %eax,%eax
  27:	c9                   	leave  
  28:	8d 61 fc             	lea    -0x4(%ecx),%esp
  2b:	c3                   	ret    
    fprintf(2, "Have a great day!\n");
  2c:	51                   	push   %ecx
  2d:	51                   	push   %ecx
  2e:	68 08 08 00 00       	push   $0x808
  33:	6a 02                	push   $0x2
  35:	e8 06 06 00 00       	call   640 <fprintf>
    exit();
  3a:	e8 84 02 00 00       	call   2c3 <exit>
    fprintf(2, "The Lord is with you where ever you go!\n");
  3f:	50                   	push   %eax
  40:	50                   	push   %eax
  41:	68 30 08 00 00       	push   $0x830
  46:	6a 02                	push   $0x2
  48:	e8 f3 05 00 00       	call   640 <fprintf>
    exit();
  4d:	e8 71 02 00 00       	call   2c3 <exit>
    fprintf(2, "Found the secret!\n");
  52:	52                   	push   %edx
  53:	52                   	push   %edx
  54:	68 1b 08 00 00       	push   $0x81b
  59:	6a 02                	push   $0x2
  5b:	e8 e0 05 00 00       	call   640 <fprintf>
    exit();
  60:	e8 5e 02 00 00       	call   2c3 <exit>
  65:	66 90                	xchg   %ax,%ax
  67:	66 90                	xchg   %ax,%ax
  69:	66 90                	xchg   %ax,%ax
  6b:	66 90                	xchg   %ax,%ax
  6d:	66 90                	xchg   %ax,%ax
  6f:	90                   	nop

00000070 <strcpy>:
#include "user/user.h"
#include "../kernel/x86.h"

char*
strcpy(char *s, const char *t)
{
  70:	55                   	push   %ebp
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
  71:	31 c0                	xor    %eax,%eax
{
  73:	89 e5                	mov    %esp,%ebp
  75:	53                   	push   %ebx
  76:	8b 4d 08             	mov    0x8(%ebp),%ecx
  79:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  7c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  while((*s++ = *t++) != 0)
  80:	0f b6 14 03          	movzbl (%ebx,%eax,1),%edx
  84:	88 14 01             	mov    %dl,(%ecx,%eax,1)
  87:	83 c0 01             	add    $0x1,%eax
  8a:	84 d2                	test   %dl,%dl
  8c:	75 f2                	jne    80 <strcpy+0x10>
    ;
  return os;
}
  8e:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  91:	89 c8                	mov    %ecx,%eax
  93:	c9                   	leave  
  94:	c3                   	ret    
  95:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  9c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

000000a0 <strcmp>:

int
strcmp(const char *p, const char *q)
{
  a0:	55                   	push   %ebp
  a1:	89 e5                	mov    %esp,%ebp
  a3:	53                   	push   %ebx
  a4:	8b 55 08             	mov    0x8(%ebp),%edx
  a7:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  while(*p && *p == *q)
  aa:	0f b6 02             	movzbl (%edx),%eax
  ad:	84 c0                	test   %al,%al
  af:	75 17                	jne    c8 <strcmp+0x28>
  b1:	eb 3a                	jmp    ed <strcmp+0x4d>
  b3:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  b7:	90                   	nop
  b8:	0f b6 42 01          	movzbl 0x1(%edx),%eax
    p++, q++;
  bc:	83 c2 01             	add    $0x1,%edx
  bf:	8d 59 01             	lea    0x1(%ecx),%ebx
  while(*p && *p == *q)
  c2:	84 c0                	test   %al,%al
  c4:	74 1a                	je     e0 <strcmp+0x40>
    p++, q++;
  c6:	89 d9                	mov    %ebx,%ecx
  while(*p && *p == *q)
  c8:	0f b6 19             	movzbl (%ecx),%ebx
  cb:	38 c3                	cmp    %al,%bl
  cd:	74 e9                	je     b8 <strcmp+0x18>
  return (uchar)*p - (uchar)*q;
  cf:	29 d8                	sub    %ebx,%eax
}
  d1:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  d4:	c9                   	leave  
  d5:	c3                   	ret    
  d6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  dd:	8d 76 00             	lea    0x0(%esi),%esi
  return (uchar)*p - (uchar)*q;
  e0:	0f b6 59 01          	movzbl 0x1(%ecx),%ebx
  e4:	31 c0                	xor    %eax,%eax
  e6:	29 d8                	sub    %ebx,%eax
}
  e8:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  eb:	c9                   	leave  
  ec:	c3                   	ret    
  return (uchar)*p - (uchar)*q;
  ed:	0f b6 19             	movzbl (%ecx),%ebx
  f0:	31 c0                	xor    %eax,%eax
  f2:	eb db                	jmp    cf <strcmp+0x2f>
  f4:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  fb:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  ff:	90                   	nop

00000100 <strlen>:

uint
strlen(const char *s)
{
 100:	55                   	push   %ebp
 101:	89 e5                	mov    %esp,%ebp
 103:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  for(n = 0; s[n]; n++)
 106:	80 3a 00             	cmpb   $0x0,(%edx)
 109:	74 15                	je     120 <strlen+0x20>
 10b:	31 c0                	xor    %eax,%eax
 10d:	8d 76 00             	lea    0x0(%esi),%esi
 110:	83 c0 01             	add    $0x1,%eax
 113:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
 117:	89 c1                	mov    %eax,%ecx
 119:	75 f5                	jne    110 <strlen+0x10>
    ;
  return n;
}
 11b:	89 c8                	mov    %ecx,%eax
 11d:	5d                   	pop    %ebp
 11e:	c3                   	ret    
 11f:	90                   	nop
  for(n = 0; s[n]; n++)
 120:	31 c9                	xor    %ecx,%ecx
}
 122:	5d                   	pop    %ebp
 123:	89 c8                	mov    %ecx,%eax
 125:	c3                   	ret    
 126:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 12d:	8d 76 00             	lea    0x0(%esi),%esi

00000130 <memset>:

void*
memset(void *dst, int c, uint n)
{
 130:	55                   	push   %ebp
 131:	89 e5                	mov    %esp,%ebp
 133:	57                   	push   %edi
 134:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 137:	8b 4d 10             	mov    0x10(%ebp),%ecx
 13a:	8b 45 0c             	mov    0xc(%ebp),%eax
 13d:	89 d7                	mov    %edx,%edi
 13f:	fc                   	cld    
 140:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 142:	8b 7d fc             	mov    -0x4(%ebp),%edi
 145:	89 d0                	mov    %edx,%eax
 147:	c9                   	leave  
 148:	c3                   	ret    
 149:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000150 <strchr>:

char*
strchr(const char *s, char c)
{
 150:	55                   	push   %ebp
 151:	89 e5                	mov    %esp,%ebp
 153:	8b 45 08             	mov    0x8(%ebp),%eax
 156:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 15a:	0f b6 10             	movzbl (%eax),%edx
 15d:	84 d2                	test   %dl,%dl
 15f:	75 12                	jne    173 <strchr+0x23>
 161:	eb 1d                	jmp    180 <strchr+0x30>
 163:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 167:	90                   	nop
 168:	0f b6 50 01          	movzbl 0x1(%eax),%edx
 16c:	83 c0 01             	add    $0x1,%eax
 16f:	84 d2                	test   %dl,%dl
 171:	74 0d                	je     180 <strchr+0x30>
    if(*s == c)
 173:	38 d1                	cmp    %dl,%cl
 175:	75 f1                	jne    168 <strchr+0x18>
      return (char*)s;
  return 0;
}
 177:	5d                   	pop    %ebp
 178:	c3                   	ret    
 179:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  return 0;
 180:	31 c0                	xor    %eax,%eax
}
 182:	5d                   	pop    %ebp
 183:	c3                   	ret    
 184:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 18b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 18f:	90                   	nop

00000190 <gets>:

char*
gets(char *buf, int max)
{
 190:	55                   	push   %ebp
 191:	89 e5                	mov    %esp,%ebp
 193:	57                   	push   %edi
 194:	56                   	push   %esi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    cc = read(0, &c, 1);
 195:	8d 7d e7             	lea    -0x19(%ebp),%edi
{
 198:	53                   	push   %ebx
  for(i=0; i+1 < max; ){
 199:	31 db                	xor    %ebx,%ebx
{
 19b:	83 ec 1c             	sub    $0x1c,%esp
  for(i=0; i+1 < max; ){
 19e:	eb 27                	jmp    1c7 <gets+0x37>
    cc = read(0, &c, 1);
 1a0:	83 ec 04             	sub    $0x4,%esp
 1a3:	6a 01                	push   $0x1
 1a5:	57                   	push   %edi
 1a6:	6a 00                	push   $0x0
 1a8:	e8 2e 01 00 00       	call   2db <read>
    if(cc < 1)
 1ad:	83 c4 10             	add    $0x10,%esp
 1b0:	85 c0                	test   %eax,%eax
 1b2:	7e 1d                	jle    1d1 <gets+0x41>
      break;
    buf[i++] = c;
 1b4:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 1b8:	8b 55 08             	mov    0x8(%ebp),%edx
 1bb:	88 44 1a ff          	mov    %al,-0x1(%edx,%ebx,1)
    if(c == '\n' || c == '\r')
 1bf:	3c 0a                	cmp    $0xa,%al
 1c1:	74 1d                	je     1e0 <gets+0x50>
 1c3:	3c 0d                	cmp    $0xd,%al
 1c5:	74 19                	je     1e0 <gets+0x50>
  for(i=0; i+1 < max; ){
 1c7:	89 de                	mov    %ebx,%esi
 1c9:	83 c3 01             	add    $0x1,%ebx
 1cc:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 1cf:	7c cf                	jl     1a0 <gets+0x10>
      break;
  }
  buf[i] = '\0';
 1d1:	8b 45 08             	mov    0x8(%ebp),%eax
 1d4:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
  return buf;
}
 1d8:	8d 65 f4             	lea    -0xc(%ebp),%esp
 1db:	5b                   	pop    %ebx
 1dc:	5e                   	pop    %esi
 1dd:	5f                   	pop    %edi
 1de:	5d                   	pop    %ebp
 1df:	c3                   	ret    
  buf[i] = '\0';
 1e0:	8b 45 08             	mov    0x8(%ebp),%eax
 1e3:	89 de                	mov    %ebx,%esi
 1e5:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
}
 1e9:	8d 65 f4             	lea    -0xc(%ebp),%esp
 1ec:	5b                   	pop    %ebx
 1ed:	5e                   	pop    %esi
 1ee:	5f                   	pop    %edi
 1ef:	5d                   	pop    %ebp
 1f0:	c3                   	ret    
 1f1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 1f8:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 1ff:	90                   	nop

00000200 <stat>:

int
stat(const char *n, struct stat *st)
{
 200:	55                   	push   %ebp
 201:	89 e5                	mov    %esp,%ebp
 203:	56                   	push   %esi
 204:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 205:	83 ec 08             	sub    $0x8,%esp
 208:	6a 00                	push   $0x0
 20a:	ff 75 08             	push   0x8(%ebp)
 20d:	e8 f1 00 00 00       	call   303 <open>
  if(fd < 0)
 212:	83 c4 10             	add    $0x10,%esp
 215:	85 c0                	test   %eax,%eax
 217:	78 27                	js     240 <stat+0x40>
    return -1;
  r = fstat(fd, st);
 219:	83 ec 08             	sub    $0x8,%esp
 21c:	ff 75 0c             	push   0xc(%ebp)
 21f:	89 c3                	mov    %eax,%ebx
 221:	50                   	push   %eax
 222:	e8 f4 00 00 00       	call   31b <fstat>
  close(fd);
 227:	89 1c 24             	mov    %ebx,(%esp)
  r = fstat(fd, st);
 22a:	89 c6                	mov    %eax,%esi
  close(fd);
 22c:	e8 ba 00 00 00       	call   2eb <close>
  return r;
 231:	83 c4 10             	add    $0x10,%esp
}
 234:	8d 65 f8             	lea    -0x8(%ebp),%esp
 237:	89 f0                	mov    %esi,%eax
 239:	5b                   	pop    %ebx
 23a:	5e                   	pop    %esi
 23b:	5d                   	pop    %ebp
 23c:	c3                   	ret    
 23d:	8d 76 00             	lea    0x0(%esi),%esi
    return -1;
 240:	be ff ff ff ff       	mov    $0xffffffff,%esi
 245:	eb ed                	jmp    234 <stat+0x34>
 247:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 24e:	66 90                	xchg   %ax,%ax

00000250 <atoi>:

int
atoi(const char *s)
{
 250:	55                   	push   %ebp
 251:	89 e5                	mov    %esp,%ebp
 253:	53                   	push   %ebx
 254:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 257:	0f be 02             	movsbl (%edx),%eax
 25a:	8d 48 d0             	lea    -0x30(%eax),%ecx
 25d:	80 f9 09             	cmp    $0x9,%cl
  n = 0;
 260:	b9 00 00 00 00       	mov    $0x0,%ecx
  while('0' <= *s && *s <= '9')
 265:	77 1e                	ja     285 <atoi+0x35>
 267:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 26e:	66 90                	xchg   %ax,%ax
    n = n*10 + *s++ - '0';
 270:	83 c2 01             	add    $0x1,%edx
 273:	8d 0c 89             	lea    (%ecx,%ecx,4),%ecx
 276:	8d 4c 48 d0          	lea    -0x30(%eax,%ecx,2),%ecx
  while('0' <= *s && *s <= '9')
 27a:	0f be 02             	movsbl (%edx),%eax
 27d:	8d 58 d0             	lea    -0x30(%eax),%ebx
 280:	80 fb 09             	cmp    $0x9,%bl
 283:	76 eb                	jbe    270 <atoi+0x20>
  return n;
}
 285:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 288:	89 c8                	mov    %ecx,%eax
 28a:	c9                   	leave  
 28b:	c3                   	ret    
 28c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000290 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 290:	55                   	push   %ebp
 291:	89 e5                	mov    %esp,%ebp
 293:	57                   	push   %edi
 294:	8b 45 10             	mov    0x10(%ebp),%eax
 297:	8b 55 08             	mov    0x8(%ebp),%edx
 29a:	56                   	push   %esi
 29b:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 29e:	85 c0                	test   %eax,%eax
 2a0:	7e 13                	jle    2b5 <memmove+0x25>
 2a2:	01 d0                	add    %edx,%eax
  dst = vdst;
 2a4:	89 d7                	mov    %edx,%edi
 2a6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 2ad:	8d 76 00             	lea    0x0(%esi),%esi
    *dst++ = *src++;
 2b0:	a4                   	movsb  %ds:(%esi),%es:(%edi)
  while(n-- > 0)
 2b1:	39 f8                	cmp    %edi,%eax
 2b3:	75 fb                	jne    2b0 <memmove+0x20>
  return vdst;
}
 2b5:	5e                   	pop    %esi
 2b6:	89 d0                	mov    %edx,%eax
 2b8:	5f                   	pop    %edi
 2b9:	5d                   	pop    %ebp
 2ba:	c3                   	ret    

000002bb <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 2bb:	b8 01 00 00 00       	mov    $0x1,%eax
 2c0:	cd 40                	int    $0x40
 2c2:	c3                   	ret    

000002c3 <exit>:
SYSCALL(exit)
 2c3:	b8 02 00 00 00       	mov    $0x2,%eax
 2c8:	cd 40                	int    $0x40
 2ca:	c3                   	ret    

000002cb <wait>:
SYSCALL(wait)
 2cb:	b8 03 00 00 00       	mov    $0x3,%eax
 2d0:	cd 40                	int    $0x40
 2d2:	c3                   	ret    

000002d3 <pipe>:
SYSCALL(pipe)
 2d3:	b8 04 00 00 00       	mov    $0x4,%eax
 2d8:	cd 40                	int    $0x40
 2da:	c3                   	ret    

000002db <read>:
SYSCALL(read)
 2db:	b8 05 00 00 00       	mov    $0x5,%eax
 2e0:	cd 40                	int    $0x40
 2e2:	c3                   	ret    

000002e3 <write>:
SYSCALL(write)
 2e3:	b8 10 00 00 00       	mov    $0x10,%eax
 2e8:	cd 40                	int    $0x40
 2ea:	c3                   	ret    

000002eb <close>:
SYSCALL(close)
 2eb:	b8 15 00 00 00       	mov    $0x15,%eax
 2f0:	cd 40                	int    $0x40
 2f2:	c3                   	ret    

000002f3 <kill>:
SYSCALL(kill)
 2f3:	b8 06 00 00 00       	mov    $0x6,%eax
 2f8:	cd 40                	int    $0x40
 2fa:	c3                   	ret    

000002fb <exec>:
SYSCALL(exec)
 2fb:	b8 07 00 00 00       	mov    $0x7,%eax
 300:	cd 40                	int    $0x40
 302:	c3                   	ret    

00000303 <open>:
SYSCALL(open)
 303:	b8 0f 00 00 00       	mov    $0xf,%eax
 308:	cd 40                	int    $0x40
 30a:	c3                   	ret    

0000030b <mknod>:
SYSCALL(mknod)
 30b:	b8 11 00 00 00       	mov    $0x11,%eax
 310:	cd 40                	int    $0x40
 312:	c3                   	ret    

00000313 <unlink>:
SYSCALL(unlink)
 313:	b8 12 00 00 00       	mov    $0x12,%eax
 318:	cd 40                	int    $0x40
 31a:	c3                   	ret    

0000031b <fstat>:
SYSCALL(fstat)
 31b:	b8 08 00 00 00       	mov    $0x8,%eax
 320:	cd 40                	int    $0x40
 322:	c3                   	ret    

00000323 <link>:
SYSCALL(link)
 323:	b8 13 00 00 00       	mov    $0x13,%eax
 328:	cd 40                	int    $0x40
 32a:	c3                   	ret    

0000032b <mkdir>:
SYSCALL(mkdir)
 32b:	b8 14 00 00 00       	mov    $0x14,%eax
 330:	cd 40                	int    $0x40
 332:	c3                   	ret    

00000333 <chdir>:
SYSCALL(chdir)
 333:	b8 09 00 00 00       	mov    $0x9,%eax
 338:	cd 40                	int    $0x40
 33a:	c3                   	ret    

0000033b <dup>:
SYSCALL(dup)
 33b:	b8 0a 00 00 00       	mov    $0xa,%eax
 340:	cd 40                	int    $0x40
 342:	c3                   	ret    

00000343 <getpid>:
SYSCALL(getpid)
 343:	b8 0b 00 00 00       	mov    $0xb,%eax
 348:	cd 40                	int    $0x40
 34a:	c3                   	ret    

0000034b <sbrk>:
SYSCALL(sbrk)
 34b:	b8 0c 00 00 00       	mov    $0xc,%eax
 350:	cd 40                	int    $0x40
 352:	c3                   	ret    

00000353 <sleep>:
SYSCALL(sleep)
 353:	b8 0d 00 00 00       	mov    $0xd,%eax
 358:	cd 40                	int    $0x40
 35a:	c3                   	ret    

0000035b <uptime>:
SYSCALL(uptime)
 35b:	b8 0e 00 00 00       	mov    $0xe,%eax
 360:	cd 40                	int    $0x40
 362:	c3                   	ret    

00000363 <cpuhalt>:
SYSCALL(cpuhalt)
 363:	b8 16 00 00 00       	mov    $0x16,%eax
 368:	cd 40                	int    $0x40
 36a:	c3                   	ret    
 36b:	66 90                	xchg   %ax,%ax
 36d:	66 90                	xchg   %ax,%ax
 36f:	90                   	nop

00000370 <printint.constprop.0>:
  for (i = 0; i < (sizeof(uint) * 2); i++, x <<= 4)
    putc(fd, digits[x >> (sizeof(uint) * 8 - 4)]);
}

static void
printint(int fd, int xx, int base, int sgn)
 370:	55                   	push   %ebp
 371:	89 e5                	mov    %esp,%ebp
 373:	57                   	push   %edi
 374:	56                   	push   %esi
 375:	53                   	push   %ebx
 376:	83 ec 3c             	sub    $0x3c,%esp
 379:	89 55 c4             	mov    %edx,-0x3c(%ebp)
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 37c:	85 c0                	test   %eax,%eax
 37e:	0f 89 84 00 00 00    	jns    408 <printint.constprop.0+0x98>
 384:	83 e1 01             	and    $0x1,%ecx
 387:	74 7f                	je     408 <printint.constprop.0+0x98>
    neg = 1;
 389:	c7 45 bc 01 00 00 00 	movl   $0x1,-0x44(%ebp)
    x = -xx;
 390:	f7 d8                	neg    %eax
 392:	89 c1                	mov    %eax,%ecx
  } else {
    x = xx;
  }

  i = 0;
 394:	31 db                	xor    %ebx,%ebx
 396:	8d 75 d7             	lea    -0x29(%ebp),%esi
 399:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  do{
    buf[i++] = digits[x % base];
 3a0:	89 c8                	mov    %ecx,%eax
 3a2:	31 d2                	xor    %edx,%edx
 3a4:	89 cf                	mov    %ecx,%edi
 3a6:	f7 75 c4             	divl   -0x3c(%ebp)
 3a9:	0f b6 92 b8 08 00 00 	movzbl 0x8b8(%edx),%edx
 3b0:	89 45 c0             	mov    %eax,-0x40(%ebp)
 3b3:	89 d8                	mov    %ebx,%eax
 3b5:	8d 5b 01             	lea    0x1(%ebx),%ebx
  }while((x /= base) != 0);
 3b8:	8b 4d c0             	mov    -0x40(%ebp),%ecx
    buf[i++] = digits[x % base];
 3bb:	88 14 1e             	mov    %dl,(%esi,%ebx,1)
  }while((x /= base) != 0);
 3be:	3b 7d c4             	cmp    -0x3c(%ebp),%edi
 3c1:	73 dd                	jae    3a0 <printint.constprop.0+0x30>
  if(neg)
 3c3:	8b 4d bc             	mov    -0x44(%ebp),%ecx
 3c6:	85 c9                	test   %ecx,%ecx
 3c8:	74 0c                	je     3d6 <printint.constprop.0+0x66>
    buf[i++] = '-';
 3ca:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
    buf[i++] = digits[x % base];
 3cf:	89 d8                	mov    %ebx,%eax
    buf[i++] = '-';
 3d1:	ba 2d 00 00 00       	mov    $0x2d,%edx

  while(--i >= 0)
 3d6:	8d 5c 05 d7          	lea    -0x29(%ebp,%eax,1),%ebx
 3da:	eb 0a                	jmp    3e6 <printint.constprop.0+0x76>
 3dc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    putc(fd, buf[i]);
 3e0:	0f b6 13             	movzbl (%ebx),%edx
 3e3:	83 eb 01             	sub    $0x1,%ebx
  write(fd, &c, 1);
 3e6:	83 ec 04             	sub    $0x4,%esp
 3e9:	88 55 d7             	mov    %dl,-0x29(%ebp)
 3ec:	6a 01                	push   $0x1
 3ee:	56                   	push   %esi
 3ef:	6a 01                	push   $0x1
 3f1:	e8 ed fe ff ff       	call   2e3 <write>
  while(--i >= 0)
 3f6:	83 c4 10             	add    $0x10,%esp
 3f9:	39 de                	cmp    %ebx,%esi
 3fb:	75 e3                	jne    3e0 <printint.constprop.0+0x70>
}
 3fd:	8d 65 f4             	lea    -0xc(%ebp),%esp
 400:	5b                   	pop    %ebx
 401:	5e                   	pop    %esi
 402:	5f                   	pop    %edi
 403:	5d                   	pop    %ebp
 404:	c3                   	ret    
 405:	8d 76 00             	lea    0x0(%esi),%esi
  neg = 0;
 408:	c7 45 bc 00 00 00 00 	movl   $0x0,-0x44(%ebp)
    x = xx;
 40f:	89 c1                	mov    %eax,%ecx
 411:	eb 81                	jmp    394 <printint.constprop.0+0x24>
 413:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 41a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00000420 <vprintf.constprop.0>:
static void vprintf(int fd, const char *fmt, va_list ap)
 420:	55                   	push   %ebp
 421:	89 e5                	mov    %esp,%ebp
 423:	57                   	push   %edi
 424:	56                   	push   %esi
 425:	53                   	push   %ebx
 426:	83 ec 2c             	sub    $0x2c,%esp
 429:	89 55 d4             	mov    %edx,-0x2c(%ebp)
{
  char *s;
  int c, i, state;

  state = 0;
  for(i = 0; fmt[i]; i++){
 42c:	0f b6 10             	movzbl (%eax),%edx
 42f:	84 d2                	test   %dl,%dl
 431:	74 6c                	je     49f <vprintf.constprop.0+0x7f>
 433:	8d 58 01             	lea    0x1(%eax),%ebx
 436:	31 ff                	xor    %edi,%edi
 438:	8d 75 e7             	lea    -0x19(%ebp),%esi
 43b:	eb 25                	jmp    462 <vprintf.constprop.0+0x42>
 43d:	8d 76 00             	lea    0x0(%esi),%esi
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
 440:	83 f8 25             	cmp    $0x25,%eax
 443:	74 4b                	je     490 <vprintf.constprop.0+0x70>
  write(fd, &c, 1);
 445:	83 ec 04             	sub    $0x4,%esp
 448:	88 55 e7             	mov    %dl,-0x19(%ebp)
 44b:	6a 01                	push   $0x1
 44d:	56                   	push   %esi
 44e:	6a 01                	push   $0x1
 450:	e8 8e fe ff ff       	call   2e3 <write>
        state = '%';
      } else {
        putc(fd, c);
 455:	83 c4 10             	add    $0x10,%esp
  for(i = 0; fmt[i]; i++){
 458:	0f b6 13             	movzbl (%ebx),%edx
 45b:	83 c3 01             	add    $0x1,%ebx
 45e:	84 d2                	test   %dl,%dl
 460:	74 3d                	je     49f <vprintf.constprop.0+0x7f>
    c = fmt[i] & 0xff;
 462:	0f b6 c2             	movzbl %dl,%eax
    if(state == 0){
 465:	85 ff                	test   %edi,%edi
 467:	74 d7                	je     440 <vprintf.constprop.0+0x20>
      }
    } else if(state == '%'){
 469:	83 ff 25             	cmp    $0x25,%edi
 46c:	75 ea                	jne    458 <vprintf.constprop.0+0x38>
      if(c == 'd'){
 46e:	83 f8 25             	cmp    $0x25,%eax
 471:	0f 84 a9 01 00 00    	je     620 <vprintf.constprop.0+0x200>
 477:	83 e8 63             	sub    $0x63,%eax
 47a:	83 f8 15             	cmp    $0x15,%eax
 47d:	77 31                	ja     4b0 <vprintf.constprop.0+0x90>
 47f:	ff 24 85 60 08 00 00 	jmp    *0x860(,%eax,4)
 486:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 48d:	8d 76 00             	lea    0x0(%esi),%esi
  for(i = 0; fmt[i]; i++){
 490:	0f b6 13             	movzbl (%ebx),%edx
 493:	83 c3 01             	add    $0x1,%ebx
        state = '%';
 496:	bf 25 00 00 00       	mov    $0x25,%edi
  for(i = 0; fmt[i]; i++){
 49b:	84 d2                	test   %dl,%dl
 49d:	75 c3                	jne    462 <vprintf.constprop.0+0x42>
        putc(fd, c);
      }
      state = 0;
    }
  }
}
 49f:	8d 65 f4             	lea    -0xc(%ebp),%esp
 4a2:	5b                   	pop    %ebx
 4a3:	5e                   	pop    %esi
 4a4:	5f                   	pop    %edi
 4a5:	5d                   	pop    %ebp
 4a6:	c3                   	ret    
 4a7:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 4ae:	66 90                	xchg   %ax,%ax
  write(fd, &c, 1);
 4b0:	83 ec 04             	sub    $0x4,%esp
 4b3:	88 55 d0             	mov    %dl,-0x30(%ebp)
 4b6:	6a 01                	push   $0x1
 4b8:	56                   	push   %esi
 4b9:	6a 01                	push   $0x1
 4bb:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
 4bf:	e8 1f fe ff ff       	call   2e3 <write>
        putc(fd, c);
 4c4:	0f b6 55 d0          	movzbl -0x30(%ebp),%edx
  write(fd, &c, 1);
 4c8:	83 c4 0c             	add    $0xc,%esp
 4cb:	88 55 e7             	mov    %dl,-0x19(%ebp)
 4ce:	6a 01                	push   $0x1
      state = 0;
 4d0:	31 ff                	xor    %edi,%edi
  write(fd, &c, 1);
 4d2:	56                   	push   %esi
 4d3:	6a 01                	push   $0x1
 4d5:	e8 09 fe ff ff       	call   2e3 <write>
        putc(fd, c);
 4da:	83 c4 10             	add    $0x10,%esp
 4dd:	e9 76 ff ff ff       	jmp    458 <vprintf.constprop.0+0x38>
 4e2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        putc(fd, va_arg(ap, uint));
 4e8:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  write(fd, &c, 1);
 4eb:	83 ec 04             	sub    $0x4,%esp
        putc(fd, va_arg(ap, uint));
 4ee:	8d 78 04             	lea    0x4(%eax),%edi
 4f1:	8b 00                	mov    (%eax),%eax
  write(fd, &c, 1);
 4f3:	6a 01                	push   $0x1
 4f5:	56                   	push   %esi
 4f6:	6a 01                	push   $0x1
        putc(fd, va_arg(ap, uint));
 4f8:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
 4fb:	e8 e3 fd ff ff       	call   2e3 <write>
        putc(fd, va_arg(ap, uint));
 500:	89 7d d4             	mov    %edi,-0x2c(%ebp)
 503:	83 c4 10             	add    $0x10,%esp
      state = 0;
 506:	31 ff                	xor    %edi,%edi
 508:	e9 4b ff ff ff       	jmp    458 <vprintf.constprop.0+0x38>
 50d:	8d 76 00             	lea    0x0(%esi),%esi
        printint(fd, va_arg(ap, int), 10, 1);
 510:	8b 45 d4             	mov    -0x2c(%ebp),%eax
 513:	b9 01 00 00 00       	mov    $0x1,%ecx
 518:	8d 78 04             	lea    0x4(%eax),%edi
        printint(fd, va_arg(ap, uint), 10, 0);
 51b:	8b 00                	mov    (%eax),%eax
 51d:	ba 0a 00 00 00       	mov    $0xa,%edx
 522:	e8 49 fe ff ff       	call   370 <printint.constprop.0>
 527:	89 7d d4             	mov    %edi,-0x2c(%ebp)
      state = 0;
 52a:	31 ff                	xor    %edi,%edi
 52c:	e9 27 ff ff ff       	jmp    458 <vprintf.constprop.0+0x38>
 531:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        printint(fd, va_arg(ap, uint), 10, 0);
 538:	8b 45 d4             	mov    -0x2c(%ebp),%eax
 53b:	31 c9                	xor    %ecx,%ecx
 53d:	8d 78 04             	lea    0x4(%eax),%edi
 540:	eb d9                	jmp    51b <vprintf.constprop.0+0xfb>
 542:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        printptr(fd, va_arg(ap, uint));
 548:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  write(fd, &c, 1);
 54b:	83 ec 04             	sub    $0x4,%esp
 54e:	c6 45 e7 30          	movb   $0x30,-0x19(%ebp)
        printptr(fd, va_arg(ap, uint));
 552:	8b 38                	mov    (%eax),%edi
  write(fd, &c, 1);
 554:	6a 01                	push   $0x1
        printptr(fd, va_arg(ap, uint));
 556:	8d 48 04             	lea    0x4(%eax),%ecx
  write(fd, &c, 1);
 559:	56                   	push   %esi
 55a:	6a 01                	push   $0x1
        printptr(fd, va_arg(ap, uint));
 55c:	89 4d d0             	mov    %ecx,-0x30(%ebp)
  write(fd, &c, 1);
 55f:	e8 7f fd ff ff       	call   2e3 <write>
 564:	83 c4 0c             	add    $0xc,%esp
 567:	c6 45 e7 78          	movb   $0x78,-0x19(%ebp)
 56b:	6a 01                	push   $0x1
 56d:	56                   	push   %esi
 56e:	6a 01                	push   $0x1
 570:	e8 6e fd ff ff       	call   2e3 <write>
  putc(fd, 'x');
 575:	c7 45 d4 08 00 00 00 	movl   $0x8,-0x2c(%ebp)
 57c:	83 c4 10             	add    $0x10,%esp
 57f:	90                   	nop
  write(fd, &c, 1);
 580:	83 ec 04             	sub    $0x4,%esp
    putc(fd, digits[x >> (sizeof(uint) * 8 - 4)]);
 583:	89 f8                	mov    %edi,%eax
  for (i = 0; i < (sizeof(uint) * 2); i++, x <<= 4)
 585:	c1 e7 04             	shl    $0x4,%edi
  write(fd, &c, 1);
 588:	6a 01                	push   $0x1
    putc(fd, digits[x >> (sizeof(uint) * 8 - 4)]);
 58a:	c1 e8 1c             	shr    $0x1c,%eax
  write(fd, &c, 1);
 58d:	56                   	push   %esi
 58e:	0f b6 80 b8 08 00 00 	movzbl 0x8b8(%eax),%eax
 595:	6a 01                	push   $0x1
 597:	88 45 e7             	mov    %al,-0x19(%ebp)
 59a:	e8 44 fd ff ff       	call   2e3 <write>
  for (i = 0; i < (sizeof(uint) * 2); i++, x <<= 4)
 59f:	83 c4 10             	add    $0x10,%esp
 5a2:	83 6d d4 01          	subl   $0x1,-0x2c(%ebp)
 5a6:	75 d8                	jne    580 <vprintf.constprop.0+0x160>
        printptr(fd, va_arg(ap, uint));
 5a8:	8b 45 d0             	mov    -0x30(%ebp),%eax
      state = 0;
 5ab:	31 ff                	xor    %edi,%edi
        printptr(fd, va_arg(ap, uint));
 5ad:	89 45 d4             	mov    %eax,-0x2c(%ebp)
 5b0:	e9 a3 fe ff ff       	jmp    458 <vprintf.constprop.0+0x38>
 5b5:	8d 76 00             	lea    0x0(%esi),%esi
        s = va_arg(ap, char*);
 5b8:	8b 45 d4             	mov    -0x2c(%ebp),%eax
 5bb:	8b 38                	mov    (%eax),%edi
 5bd:	8d 48 04             	lea    0x4(%eax),%ecx
 5c0:	89 4d d4             	mov    %ecx,-0x2c(%ebp)
        if(s == 0)
 5c3:	85 ff                	test   %edi,%edi
 5c5:	74 64                	je     62b <vprintf.constprop.0+0x20b>
        while(*s != 0){
 5c7:	0f b6 07             	movzbl (%edi),%eax
 5ca:	84 c0                	test   %al,%al
 5cc:	74 1f                	je     5ed <vprintf.constprop.0+0x1cd>
 5ce:	66 90                	xchg   %ax,%ax
  write(fd, &c, 1);
 5d0:	83 ec 04             	sub    $0x4,%esp
          s++;
 5d3:	83 c7 01             	add    $0x1,%edi
 5d6:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
 5d9:	6a 01                	push   $0x1
 5db:	56                   	push   %esi
 5dc:	6a 01                	push   $0x1
 5de:	e8 00 fd ff ff       	call   2e3 <write>
        while(*s != 0){
 5e3:	0f b6 07             	movzbl (%edi),%eax
 5e6:	83 c4 10             	add    $0x10,%esp
 5e9:	84 c0                	test   %al,%al
 5eb:	75 e3                	jne    5d0 <vprintf.constprop.0+0x1b0>
      state = 0;
 5ed:	31 ff                	xor    %edi,%edi
 5ef:	e9 64 fe ff ff       	jmp    458 <vprintf.constprop.0+0x38>
 5f4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        printint(fd, va_arg(ap, int), 16, 0);
 5f8:	8b 45 d4             	mov    -0x2c(%ebp),%eax
 5fb:	31 c9                	xor    %ecx,%ecx
 5fd:	ba 10 00 00 00       	mov    $0x10,%edx
 602:	8d 78 04             	lea    0x4(%eax),%edi
 605:	8b 00                	mov    (%eax),%eax
 607:	e8 64 fd ff ff       	call   370 <printint.constprop.0>
 60c:	89 7d d4             	mov    %edi,-0x2c(%ebp)
      state = 0;
 60f:	31 ff                	xor    %edi,%edi
 611:	e9 42 fe ff ff       	jmp    458 <vprintf.constprop.0+0x38>
 616:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 61d:	8d 76 00             	lea    0x0(%esi),%esi
        putc(fd, c);
 620:	88 55 e7             	mov    %dl,-0x19(%ebp)
  write(fd, &c, 1);
 623:	83 ec 04             	sub    $0x4,%esp
 626:	e9 a3 fe ff ff       	jmp    4ce <vprintf.constprop.0+0xae>
          s = "(null)";
 62b:	bf 59 08 00 00       	mov    $0x859,%edi
        while(*s != 0){
 630:	b8 28 00 00 00       	mov    $0x28,%eax
 635:	eb 99                	jmp    5d0 <vprintf.constprop.0+0x1b0>
 637:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 63e:	66 90                	xchg   %ax,%ax

00000640 <fprintf>:
// Print to the given fd. Only understands %d,%x, %p, %s, %c.
void
fprintf(int fd, const char *fmt, ...)
{
 640:	55                   	push   %ebp
 641:	89 e5                	mov    %esp,%ebp
 643:	83 ec 08             	sub    $0x8,%esp
 va_list ap;
 va_start(ap, fmt); 
 vprintf(1,fmt,ap);
 646:	8b 45 0c             	mov    0xc(%ebp),%eax
 649:	8d 55 10             	lea    0x10(%ebp),%edx
 64c:	e8 cf fd ff ff       	call   420 <vprintf.constprop.0>
}
 651:	c9                   	leave  
 652:	c3                   	ret    
 653:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 65a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00000660 <printf>:
void
printf(const char *fmt, ...)
{
 660:	55                   	push   %ebp
 661:	89 e5                	mov    %esp,%ebp
 663:	83 ec 08             	sub    $0x8,%esp
  va_list ap;
  va_start(ap, fmt); 
  vprintf(1,fmt,ap);
 666:	8b 45 08             	mov    0x8(%ebp),%eax
 669:	8d 55 0c             	lea    0xc(%ebp),%edx
 66c:	e8 af fd ff ff       	call   420 <vprintf.constprop.0>
}
 671:	c9                   	leave  
 672:	c3                   	ret    
 673:	66 90                	xchg   %ax,%ax
 675:	66 90                	xchg   %ax,%ax
 677:	66 90                	xchg   %ax,%ax
 679:	66 90                	xchg   %ax,%ax
 67b:	66 90                	xchg   %ax,%ax
 67d:	66 90                	xchg   %ax,%ax
 67f:	90                   	nop

00000680 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 680:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 681:	a1 cc 08 00 00       	mov    0x8cc,%eax
{
 686:	89 e5                	mov    %esp,%ebp
 688:	57                   	push   %edi
 689:	56                   	push   %esi
 68a:	53                   	push   %ebx
 68b:	8b 5d 08             	mov    0x8(%ebp),%ebx
  bp = (Header*)ap - 1;
 68e:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 691:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 698:	89 c2                	mov    %eax,%edx
 69a:	8b 00                	mov    (%eax),%eax
 69c:	39 ca                	cmp    %ecx,%edx
 69e:	73 30                	jae    6d0 <free+0x50>
 6a0:	39 c1                	cmp    %eax,%ecx
 6a2:	72 04                	jb     6a8 <free+0x28>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 6a4:	39 c2                	cmp    %eax,%edx
 6a6:	72 f0                	jb     698 <free+0x18>
      break;
  if(bp + bp->s.size == p->s.ptr){
 6a8:	8b 73 fc             	mov    -0x4(%ebx),%esi
 6ab:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 6ae:	39 f8                	cmp    %edi,%eax
 6b0:	74 30                	je     6e2 <free+0x62>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
 6b2:	89 43 f8             	mov    %eax,-0x8(%ebx)
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
 6b5:	8b 42 04             	mov    0x4(%edx),%eax
 6b8:	8d 34 c2             	lea    (%edx,%eax,8),%esi
 6bb:	39 f1                	cmp    %esi,%ecx
 6bd:	74 3a                	je     6f9 <free+0x79>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
 6bf:	89 0a                	mov    %ecx,(%edx)
  } else
    p->s.ptr = bp;
  freep = p;
}
 6c1:	5b                   	pop    %ebx
  freep = p;
 6c2:	89 15 cc 08 00 00    	mov    %edx,0x8cc
}
 6c8:	5e                   	pop    %esi
 6c9:	5f                   	pop    %edi
 6ca:	5d                   	pop    %ebp
 6cb:	c3                   	ret    
 6cc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 6d0:	39 c2                	cmp    %eax,%edx
 6d2:	72 c4                	jb     698 <free+0x18>
 6d4:	39 c1                	cmp    %eax,%ecx
 6d6:	73 c0                	jae    698 <free+0x18>
  if(bp + bp->s.size == p->s.ptr){
 6d8:	8b 73 fc             	mov    -0x4(%ebx),%esi
 6db:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 6de:	39 f8                	cmp    %edi,%eax
 6e0:	75 d0                	jne    6b2 <free+0x32>
    bp->s.size += p->s.ptr->s.size;
 6e2:	03 70 04             	add    0x4(%eax),%esi
 6e5:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 6e8:	8b 02                	mov    (%edx),%eax
 6ea:	8b 00                	mov    (%eax),%eax
 6ec:	89 43 f8             	mov    %eax,-0x8(%ebx)
  if(p + p->s.size == bp){
 6ef:	8b 42 04             	mov    0x4(%edx),%eax
 6f2:	8d 34 c2             	lea    (%edx,%eax,8),%esi
 6f5:	39 f1                	cmp    %esi,%ecx
 6f7:	75 c6                	jne    6bf <free+0x3f>
    p->s.size += bp->s.size;
 6f9:	03 43 fc             	add    -0x4(%ebx),%eax
  freep = p;
 6fc:	89 15 cc 08 00 00    	mov    %edx,0x8cc
    p->s.size += bp->s.size;
 702:	89 42 04             	mov    %eax,0x4(%edx)
    p->s.ptr = bp->s.ptr;
 705:	8b 4b f8             	mov    -0x8(%ebx),%ecx
 708:	89 0a                	mov    %ecx,(%edx)
}
 70a:	5b                   	pop    %ebx
 70b:	5e                   	pop    %esi
 70c:	5f                   	pop    %edi
 70d:	5d                   	pop    %ebp
 70e:	c3                   	ret    
 70f:	90                   	nop

00000710 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 710:	55                   	push   %ebp
 711:	89 e5                	mov    %esp,%ebp
 713:	57                   	push   %edi
 714:	56                   	push   %esi
 715:	53                   	push   %ebx
 716:	83 ec 1c             	sub    $0x1c,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 719:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
 71c:	8b 3d cc 08 00 00    	mov    0x8cc,%edi
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 722:	8d 70 07             	lea    0x7(%eax),%esi
 725:	c1 ee 03             	shr    $0x3,%esi
 728:	83 c6 01             	add    $0x1,%esi
  if((prevp = freep) == 0){
 72b:	85 ff                	test   %edi,%edi
 72d:	0f 84 9d 00 00 00    	je     7d0 <malloc+0xc0>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 733:	8b 17                	mov    (%edi),%edx
    if(p->s.size >= nunits){
 735:	8b 4a 04             	mov    0x4(%edx),%ecx
 738:	39 f1                	cmp    %esi,%ecx
 73a:	73 6a                	jae    7a6 <malloc+0x96>
 73c:	bb 00 10 00 00       	mov    $0x1000,%ebx
 741:	39 de                	cmp    %ebx,%esi
 743:	0f 43 de             	cmovae %esi,%ebx
  p = sbrk(nu * sizeof(Header));
 746:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
 74d:	89 45 e4             	mov    %eax,-0x1c(%ebp)
 750:	eb 17                	jmp    769 <malloc+0x59>
 752:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 758:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
 75a:	8b 48 04             	mov    0x4(%eax),%ecx
 75d:	39 f1                	cmp    %esi,%ecx
 75f:	73 4f                	jae    7b0 <malloc+0xa0>
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 761:	8b 3d cc 08 00 00    	mov    0x8cc,%edi
 767:	89 c2                	mov    %eax,%edx
 769:	39 d7                	cmp    %edx,%edi
 76b:	75 eb                	jne    758 <malloc+0x48>
  p = sbrk(nu * sizeof(Header));
 76d:	83 ec 0c             	sub    $0xc,%esp
 770:	ff 75 e4             	push   -0x1c(%ebp)
 773:	e8 d3 fb ff ff       	call   34b <sbrk>
  if(p == (char*)-1)
 778:	83 c4 10             	add    $0x10,%esp
 77b:	83 f8 ff             	cmp    $0xffffffff,%eax
 77e:	74 1c                	je     79c <malloc+0x8c>
  hp->s.size = nu;
 780:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 783:	83 ec 0c             	sub    $0xc,%esp
 786:	83 c0 08             	add    $0x8,%eax
 789:	50                   	push   %eax
 78a:	e8 f1 fe ff ff       	call   680 <free>
  return freep;
 78f:	8b 15 cc 08 00 00    	mov    0x8cc,%edx
      if((p = morecore(nunits)) == 0)
 795:	83 c4 10             	add    $0x10,%esp
 798:	85 d2                	test   %edx,%edx
 79a:	75 bc                	jne    758 <malloc+0x48>
        return 0;
  }
}
 79c:	8d 65 f4             	lea    -0xc(%ebp),%esp
        return 0;
 79f:	31 c0                	xor    %eax,%eax
}
 7a1:	5b                   	pop    %ebx
 7a2:	5e                   	pop    %esi
 7a3:	5f                   	pop    %edi
 7a4:	5d                   	pop    %ebp
 7a5:	c3                   	ret    
    if(p->s.size >= nunits){
 7a6:	89 d0                	mov    %edx,%eax
 7a8:	89 fa                	mov    %edi,%edx
 7aa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      if(p->s.size == nunits)
 7b0:	39 ce                	cmp    %ecx,%esi
 7b2:	74 4c                	je     800 <malloc+0xf0>
        p->s.size -= nunits;
 7b4:	29 f1                	sub    %esi,%ecx
 7b6:	89 48 04             	mov    %ecx,0x4(%eax)
        p += p->s.size;
 7b9:	8d 04 c8             	lea    (%eax,%ecx,8),%eax
        p->s.size = nunits;
 7bc:	89 70 04             	mov    %esi,0x4(%eax)
      freep = prevp;
 7bf:	89 15 cc 08 00 00    	mov    %edx,0x8cc
}
 7c5:	8d 65 f4             	lea    -0xc(%ebp),%esp
      return (void*)(p + 1);
 7c8:	83 c0 08             	add    $0x8,%eax
}
 7cb:	5b                   	pop    %ebx
 7cc:	5e                   	pop    %esi
 7cd:	5f                   	pop    %edi
 7ce:	5d                   	pop    %ebp
 7cf:	c3                   	ret    
    base.s.ptr = freep = prevp = &base;
 7d0:	c7 05 cc 08 00 00 d0 	movl   $0x8d0,0x8cc
 7d7:	08 00 00 
    base.s.size = 0;
 7da:	bf d0 08 00 00       	mov    $0x8d0,%edi
    base.s.ptr = freep = prevp = &base;
 7df:	c7 05 d0 08 00 00 d0 	movl   $0x8d0,0x8d0
 7e6:	08 00 00 
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 7e9:	89 fa                	mov    %edi,%edx
    base.s.size = 0;
 7eb:	c7 05 d4 08 00 00 00 	movl   $0x0,0x8d4
 7f2:	00 00 00 
    if(p->s.size >= nunits){
 7f5:	e9 42 ff ff ff       	jmp    73c <malloc+0x2c>
 7fa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        prevp->s.ptr = p->s.ptr;
 800:	8b 08                	mov    (%eax),%ecx
 802:	89 0a                	mov    %ecx,(%edx)
 804:	eb b9                	jmp    7bf <malloc+0xaf>
