
user/_stressfs:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
#include "kernel/fs.h"
#include "kernel/fcntl.h"

int
main(int argc, char *argv[])
{
   0:	8d 4c 24 04          	lea    0x4(%esp),%ecx
   4:	83 e4 f0             	and    $0xfffffff0,%esp
   7:	ff 71 fc             	push   -0x4(%ecx)
   a:	55                   	push   %ebp
   b:	89 e5                	mov    %esp,%ebp
   d:	57                   	push   %edi
   e:	56                   	push   %esi
  int fd, i;
  char path[] = "stressfs0";
   f:	be 30 00 00 00       	mov    $0x30,%esi
{
  14:	53                   	push   %ebx
  char data[512];

  printf("stressfs starting\n");
  memset(data, 'a', sizeof(data));

  for(i = 0; i < 4; i++)
  15:	31 db                	xor    %ebx,%ebx
{
  17:	51                   	push   %ecx
  18:	81 ec 24 02 00 00    	sub    $0x224,%esp
  char path[] = "stressfs0";
  1e:	66 89 b5 e6 fd ff ff 	mov    %si,-0x21a(%ebp)
  memset(data, 'a', sizeof(data));
  25:	8d b5 e8 fd ff ff    	lea    -0x218(%ebp),%esi
  printf("stressfs starting\n");
  2b:	68 f8 08 00 00       	push   $0x8f8
  char path[] = "stressfs0";
  30:	c7 85 de fd ff ff 73 	movl   $0x65727473,-0x222(%ebp)
  37:	74 72 65 
  3a:	c7 85 e2 fd ff ff 73 	movl   $0x73667373,-0x21e(%ebp)
  41:	73 66 73 
  printf("stressfs starting\n");
  44:	e8 07 07 00 00       	call   750 <printf>
  memset(data, 'a', sizeof(data));
  49:	83 c4 0c             	add    $0xc,%esp
  4c:	68 00 02 00 00       	push   $0x200
  51:	6a 61                	push   $0x61
  53:	56                   	push   %esi
  54:	e8 a7 01 00 00       	call   200 <memset>
  59:	83 c4 10             	add    $0x10,%esp
    if(fork() > 0)
  5c:	e8 2a 03 00 00       	call   38b <fork>
  61:	85 c0                	test   %eax,%eax
  63:	0f 8f c1 00 00 00    	jg     12a <main+0x12a>
  for(i = 0; i < 4; i++)
  69:	83 c3 01             	add    $0x1,%ebx
  6c:	83 fb 04             	cmp    $0x4,%ebx
  6f:	75 eb                	jne    5c <main+0x5c>
  71:	bf 04 00 00 00       	mov    $0x4,%edi
      break;

  printf("write %d\n", i);
  76:	83 ec 08             	sub    $0x8,%esp
  79:	53                   	push   %ebx
  7a:	68 0b 09 00 00       	push   $0x90b
  7f:	e8 cc 06 00 00       	call   750 <printf>

  path[8] += i;
  84:	89 f8                	mov    %edi,%eax
  86:	00 85 e6 fd ff ff    	add    %al,-0x21a(%ebp)
  fd = open(path, O_CREATE | O_RDWR);
  8c:	59                   	pop    %ecx
  8d:	8d 85 de fd ff ff    	lea    -0x222(%ebp),%eax
  93:	5b                   	pop    %ebx
  94:	68 02 02 00 00       	push   $0x202
  99:	bb 14 00 00 00       	mov    $0x14,%ebx
  9e:	50                   	push   %eax
  9f:	e8 2f 03 00 00       	call   3d3 <open>
  a4:	83 c4 10             	add    $0x10,%esp
  a7:	89 c7                	mov    %eax,%edi
  for(i = 0; i < 20; i++)
  a9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    write(fd, data, sizeof(data));
  b0:	83 ec 04             	sub    $0x4,%esp
  b3:	68 00 02 00 00       	push   $0x200
  b8:	56                   	push   %esi
  b9:	57                   	push   %edi
  ba:	e8 f4 02 00 00       	call   3b3 <write>
  for(i = 0; i < 20; i++)
  bf:	83 c4 10             	add    $0x10,%esp
  c2:	83 eb 01             	sub    $0x1,%ebx
  c5:	75 e9                	jne    b0 <main+0xb0>
  close(fd);
  c7:	83 ec 0c             	sub    $0xc,%esp

  printf("read\n");

  fd = open(path, O_RDONLY);
  ca:	bb 14 00 00 00       	mov    $0x14,%ebx
  close(fd);
  cf:	57                   	push   %edi
  d0:	e8 e6 02 00 00       	call   3bb <close>
  printf("read\n");
  d5:	c7 04 24 15 09 00 00 	movl   $0x915,(%esp)
  dc:	e8 6f 06 00 00       	call   750 <printf>
  fd = open(path, O_RDONLY);
  e1:	58                   	pop    %eax
  e2:	8d 85 de fd ff ff    	lea    -0x222(%ebp),%eax
  e8:	5a                   	pop    %edx
  e9:	6a 00                	push   $0x0
  eb:	50                   	push   %eax
  ec:	e8 e2 02 00 00       	call   3d3 <open>
  f1:	83 c4 10             	add    $0x10,%esp
  f4:	89 c7                	mov    %eax,%edi
  for (i = 0; i < 20; i++)
  f6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  fd:	8d 76 00             	lea    0x0(%esi),%esi
    read(fd, data, sizeof(data));
 100:	83 ec 04             	sub    $0x4,%esp
 103:	68 00 02 00 00       	push   $0x200
 108:	56                   	push   %esi
 109:	57                   	push   %edi
 10a:	e8 9c 02 00 00       	call   3ab <read>
  for (i = 0; i < 20; i++)
 10f:	83 c4 10             	add    $0x10,%esp
 112:	83 eb 01             	sub    $0x1,%ebx
 115:	75 e9                	jne    100 <main+0x100>
  close(fd);
 117:	83 ec 0c             	sub    $0xc,%esp
 11a:	57                   	push   %edi
 11b:	e8 9b 02 00 00       	call   3bb <close>

  wait();
 120:	e8 76 02 00 00       	call   39b <wait>

  exit();
 125:	e8 69 02 00 00       	call   393 <exit>
  path[8] += i;
 12a:	89 df                	mov    %ebx,%edi
 12c:	e9 45 ff ff ff       	jmp    76 <main+0x76>
 131:	66 90                	xchg   %ax,%ax
 133:	66 90                	xchg   %ax,%ax
 135:	66 90                	xchg   %ax,%ax
 137:	66 90                	xchg   %ax,%ax
 139:	66 90                	xchg   %ax,%ax
 13b:	66 90                	xchg   %ax,%ax
 13d:	66 90                	xchg   %ax,%ax
 13f:	90                   	nop

00000140 <strcpy>:
#include "user/user.h"
#include "../kernel/x86.h"

char*
strcpy(char *s, const char *t)
{
 140:	55                   	push   %ebp
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 141:	31 c0                	xor    %eax,%eax
{
 143:	89 e5                	mov    %esp,%ebp
 145:	53                   	push   %ebx
 146:	8b 4d 08             	mov    0x8(%ebp),%ecx
 149:	8b 5d 0c             	mov    0xc(%ebp),%ebx
 14c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  while((*s++ = *t++) != 0)
 150:	0f b6 14 03          	movzbl (%ebx,%eax,1),%edx
 154:	88 14 01             	mov    %dl,(%ecx,%eax,1)
 157:	83 c0 01             	add    $0x1,%eax
 15a:	84 d2                	test   %dl,%dl
 15c:	75 f2                	jne    150 <strcpy+0x10>
    ;
  return os;
}
 15e:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 161:	89 c8                	mov    %ecx,%eax
 163:	c9                   	leave  
 164:	c3                   	ret    
 165:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 16c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000170 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 170:	55                   	push   %ebp
 171:	89 e5                	mov    %esp,%ebp
 173:	53                   	push   %ebx
 174:	8b 55 08             	mov    0x8(%ebp),%edx
 177:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  while(*p && *p == *q)
 17a:	0f b6 02             	movzbl (%edx),%eax
 17d:	84 c0                	test   %al,%al
 17f:	75 17                	jne    198 <strcmp+0x28>
 181:	eb 3a                	jmp    1bd <strcmp+0x4d>
 183:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 187:	90                   	nop
 188:	0f b6 42 01          	movzbl 0x1(%edx),%eax
    p++, q++;
 18c:	83 c2 01             	add    $0x1,%edx
 18f:	8d 59 01             	lea    0x1(%ecx),%ebx
  while(*p && *p == *q)
 192:	84 c0                	test   %al,%al
 194:	74 1a                	je     1b0 <strcmp+0x40>
    p++, q++;
 196:	89 d9                	mov    %ebx,%ecx
  while(*p && *p == *q)
 198:	0f b6 19             	movzbl (%ecx),%ebx
 19b:	38 c3                	cmp    %al,%bl
 19d:	74 e9                	je     188 <strcmp+0x18>
  return (uchar)*p - (uchar)*q;
 19f:	29 d8                	sub    %ebx,%eax
}
 1a1:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 1a4:	c9                   	leave  
 1a5:	c3                   	ret    
 1a6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 1ad:	8d 76 00             	lea    0x0(%esi),%esi
  return (uchar)*p - (uchar)*q;
 1b0:	0f b6 59 01          	movzbl 0x1(%ecx),%ebx
 1b4:	31 c0                	xor    %eax,%eax
 1b6:	29 d8                	sub    %ebx,%eax
}
 1b8:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 1bb:	c9                   	leave  
 1bc:	c3                   	ret    
  return (uchar)*p - (uchar)*q;
 1bd:	0f b6 19             	movzbl (%ecx),%ebx
 1c0:	31 c0                	xor    %eax,%eax
 1c2:	eb db                	jmp    19f <strcmp+0x2f>
 1c4:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 1cb:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 1cf:	90                   	nop

000001d0 <strlen>:

uint
strlen(const char *s)
{
 1d0:	55                   	push   %ebp
 1d1:	89 e5                	mov    %esp,%ebp
 1d3:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  for(n = 0; s[n]; n++)
 1d6:	80 3a 00             	cmpb   $0x0,(%edx)
 1d9:	74 15                	je     1f0 <strlen+0x20>
 1db:	31 c0                	xor    %eax,%eax
 1dd:	8d 76 00             	lea    0x0(%esi),%esi
 1e0:	83 c0 01             	add    $0x1,%eax
 1e3:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
 1e7:	89 c1                	mov    %eax,%ecx
 1e9:	75 f5                	jne    1e0 <strlen+0x10>
    ;
  return n;
}
 1eb:	89 c8                	mov    %ecx,%eax
 1ed:	5d                   	pop    %ebp
 1ee:	c3                   	ret    
 1ef:	90                   	nop
  for(n = 0; s[n]; n++)
 1f0:	31 c9                	xor    %ecx,%ecx
}
 1f2:	5d                   	pop    %ebp
 1f3:	89 c8                	mov    %ecx,%eax
 1f5:	c3                   	ret    
 1f6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 1fd:	8d 76 00             	lea    0x0(%esi),%esi

00000200 <memset>:

void*
memset(void *dst, int c, uint n)
{
 200:	55                   	push   %ebp
 201:	89 e5                	mov    %esp,%ebp
 203:	57                   	push   %edi
 204:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 207:	8b 4d 10             	mov    0x10(%ebp),%ecx
 20a:	8b 45 0c             	mov    0xc(%ebp),%eax
 20d:	89 d7                	mov    %edx,%edi
 20f:	fc                   	cld    
 210:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 212:	8b 7d fc             	mov    -0x4(%ebp),%edi
 215:	89 d0                	mov    %edx,%eax
 217:	c9                   	leave  
 218:	c3                   	ret    
 219:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000220 <strchr>:

char*
strchr(const char *s, char c)
{
 220:	55                   	push   %ebp
 221:	89 e5                	mov    %esp,%ebp
 223:	8b 45 08             	mov    0x8(%ebp),%eax
 226:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 22a:	0f b6 10             	movzbl (%eax),%edx
 22d:	84 d2                	test   %dl,%dl
 22f:	75 12                	jne    243 <strchr+0x23>
 231:	eb 1d                	jmp    250 <strchr+0x30>
 233:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 237:	90                   	nop
 238:	0f b6 50 01          	movzbl 0x1(%eax),%edx
 23c:	83 c0 01             	add    $0x1,%eax
 23f:	84 d2                	test   %dl,%dl
 241:	74 0d                	je     250 <strchr+0x30>
    if(*s == c)
 243:	38 d1                	cmp    %dl,%cl
 245:	75 f1                	jne    238 <strchr+0x18>
      return (char*)s;
  return 0;
}
 247:	5d                   	pop    %ebp
 248:	c3                   	ret    
 249:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  return 0;
 250:	31 c0                	xor    %eax,%eax
}
 252:	5d                   	pop    %ebp
 253:	c3                   	ret    
 254:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 25b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 25f:	90                   	nop

00000260 <gets>:

char*
gets(char *buf, int max)
{
 260:	55                   	push   %ebp
 261:	89 e5                	mov    %esp,%ebp
 263:	57                   	push   %edi
 264:	56                   	push   %esi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    cc = read(0, &c, 1);
 265:	8d 7d e7             	lea    -0x19(%ebp),%edi
{
 268:	53                   	push   %ebx
  for(i=0; i+1 < max; ){
 269:	31 db                	xor    %ebx,%ebx
{
 26b:	83 ec 1c             	sub    $0x1c,%esp
  for(i=0; i+1 < max; ){
 26e:	eb 27                	jmp    297 <gets+0x37>
    cc = read(0, &c, 1);
 270:	83 ec 04             	sub    $0x4,%esp
 273:	6a 01                	push   $0x1
 275:	57                   	push   %edi
 276:	6a 00                	push   $0x0
 278:	e8 2e 01 00 00       	call   3ab <read>
    if(cc < 1)
 27d:	83 c4 10             	add    $0x10,%esp
 280:	85 c0                	test   %eax,%eax
 282:	7e 1d                	jle    2a1 <gets+0x41>
      break;
    buf[i++] = c;
 284:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 288:	8b 55 08             	mov    0x8(%ebp),%edx
 28b:	88 44 1a ff          	mov    %al,-0x1(%edx,%ebx,1)
    if(c == '\n' || c == '\r')
 28f:	3c 0a                	cmp    $0xa,%al
 291:	74 1d                	je     2b0 <gets+0x50>
 293:	3c 0d                	cmp    $0xd,%al
 295:	74 19                	je     2b0 <gets+0x50>
  for(i=0; i+1 < max; ){
 297:	89 de                	mov    %ebx,%esi
 299:	83 c3 01             	add    $0x1,%ebx
 29c:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 29f:	7c cf                	jl     270 <gets+0x10>
      break;
  }
  buf[i] = '\0';
 2a1:	8b 45 08             	mov    0x8(%ebp),%eax
 2a4:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
  return buf;
}
 2a8:	8d 65 f4             	lea    -0xc(%ebp),%esp
 2ab:	5b                   	pop    %ebx
 2ac:	5e                   	pop    %esi
 2ad:	5f                   	pop    %edi
 2ae:	5d                   	pop    %ebp
 2af:	c3                   	ret    
  buf[i] = '\0';
 2b0:	8b 45 08             	mov    0x8(%ebp),%eax
 2b3:	89 de                	mov    %ebx,%esi
 2b5:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
}
 2b9:	8d 65 f4             	lea    -0xc(%ebp),%esp
 2bc:	5b                   	pop    %ebx
 2bd:	5e                   	pop    %esi
 2be:	5f                   	pop    %edi
 2bf:	5d                   	pop    %ebp
 2c0:	c3                   	ret    
 2c1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 2c8:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 2cf:	90                   	nop

000002d0 <stat>:

int
stat(const char *n, struct stat *st)
{
 2d0:	55                   	push   %ebp
 2d1:	89 e5                	mov    %esp,%ebp
 2d3:	56                   	push   %esi
 2d4:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 2d5:	83 ec 08             	sub    $0x8,%esp
 2d8:	6a 00                	push   $0x0
 2da:	ff 75 08             	push   0x8(%ebp)
 2dd:	e8 f1 00 00 00       	call   3d3 <open>
  if(fd < 0)
 2e2:	83 c4 10             	add    $0x10,%esp
 2e5:	85 c0                	test   %eax,%eax
 2e7:	78 27                	js     310 <stat+0x40>
    return -1;
  r = fstat(fd, st);
 2e9:	83 ec 08             	sub    $0x8,%esp
 2ec:	ff 75 0c             	push   0xc(%ebp)
 2ef:	89 c3                	mov    %eax,%ebx
 2f1:	50                   	push   %eax
 2f2:	e8 f4 00 00 00       	call   3eb <fstat>
  close(fd);
 2f7:	89 1c 24             	mov    %ebx,(%esp)
  r = fstat(fd, st);
 2fa:	89 c6                	mov    %eax,%esi
  close(fd);
 2fc:	e8 ba 00 00 00       	call   3bb <close>
  return r;
 301:	83 c4 10             	add    $0x10,%esp
}
 304:	8d 65 f8             	lea    -0x8(%ebp),%esp
 307:	89 f0                	mov    %esi,%eax
 309:	5b                   	pop    %ebx
 30a:	5e                   	pop    %esi
 30b:	5d                   	pop    %ebp
 30c:	c3                   	ret    
 30d:	8d 76 00             	lea    0x0(%esi),%esi
    return -1;
 310:	be ff ff ff ff       	mov    $0xffffffff,%esi
 315:	eb ed                	jmp    304 <stat+0x34>
 317:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 31e:	66 90                	xchg   %ax,%ax

00000320 <atoi>:

int
atoi(const char *s)
{
 320:	55                   	push   %ebp
 321:	89 e5                	mov    %esp,%ebp
 323:	53                   	push   %ebx
 324:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 327:	0f be 02             	movsbl (%edx),%eax
 32a:	8d 48 d0             	lea    -0x30(%eax),%ecx
 32d:	80 f9 09             	cmp    $0x9,%cl
  n = 0;
 330:	b9 00 00 00 00       	mov    $0x0,%ecx
  while('0' <= *s && *s <= '9')
 335:	77 1e                	ja     355 <atoi+0x35>
 337:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 33e:	66 90                	xchg   %ax,%ax
    n = n*10 + *s++ - '0';
 340:	83 c2 01             	add    $0x1,%edx
 343:	8d 0c 89             	lea    (%ecx,%ecx,4),%ecx
 346:	8d 4c 48 d0          	lea    -0x30(%eax,%ecx,2),%ecx
  while('0' <= *s && *s <= '9')
 34a:	0f be 02             	movsbl (%edx),%eax
 34d:	8d 58 d0             	lea    -0x30(%eax),%ebx
 350:	80 fb 09             	cmp    $0x9,%bl
 353:	76 eb                	jbe    340 <atoi+0x20>
  return n;
}
 355:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 358:	89 c8                	mov    %ecx,%eax
 35a:	c9                   	leave  
 35b:	c3                   	ret    
 35c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000360 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 360:	55                   	push   %ebp
 361:	89 e5                	mov    %esp,%ebp
 363:	57                   	push   %edi
 364:	8b 45 10             	mov    0x10(%ebp),%eax
 367:	8b 55 08             	mov    0x8(%ebp),%edx
 36a:	56                   	push   %esi
 36b:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 36e:	85 c0                	test   %eax,%eax
 370:	7e 13                	jle    385 <memmove+0x25>
 372:	01 d0                	add    %edx,%eax
  dst = vdst;
 374:	89 d7                	mov    %edx,%edi
 376:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 37d:	8d 76 00             	lea    0x0(%esi),%esi
    *dst++ = *src++;
 380:	a4                   	movsb  %ds:(%esi),%es:(%edi)
  while(n-- > 0)
 381:	39 f8                	cmp    %edi,%eax
 383:	75 fb                	jne    380 <memmove+0x20>
  return vdst;
}
 385:	5e                   	pop    %esi
 386:	89 d0                	mov    %edx,%eax
 388:	5f                   	pop    %edi
 389:	5d                   	pop    %ebp
 38a:	c3                   	ret    

0000038b <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 38b:	b8 01 00 00 00       	mov    $0x1,%eax
 390:	cd 40                	int    $0x40
 392:	c3                   	ret    

00000393 <exit>:
SYSCALL(exit)
 393:	b8 02 00 00 00       	mov    $0x2,%eax
 398:	cd 40                	int    $0x40
 39a:	c3                   	ret    

0000039b <wait>:
SYSCALL(wait)
 39b:	b8 03 00 00 00       	mov    $0x3,%eax
 3a0:	cd 40                	int    $0x40
 3a2:	c3                   	ret    

000003a3 <pipe>:
SYSCALL(pipe)
 3a3:	b8 04 00 00 00       	mov    $0x4,%eax
 3a8:	cd 40                	int    $0x40
 3aa:	c3                   	ret    

000003ab <read>:
SYSCALL(read)
 3ab:	b8 05 00 00 00       	mov    $0x5,%eax
 3b0:	cd 40                	int    $0x40
 3b2:	c3                   	ret    

000003b3 <write>:
SYSCALL(write)
 3b3:	b8 10 00 00 00       	mov    $0x10,%eax
 3b8:	cd 40                	int    $0x40
 3ba:	c3                   	ret    

000003bb <close>:
SYSCALL(close)
 3bb:	b8 15 00 00 00       	mov    $0x15,%eax
 3c0:	cd 40                	int    $0x40
 3c2:	c3                   	ret    

000003c3 <kill>:
SYSCALL(kill)
 3c3:	b8 06 00 00 00       	mov    $0x6,%eax
 3c8:	cd 40                	int    $0x40
 3ca:	c3                   	ret    

000003cb <exec>:
SYSCALL(exec)
 3cb:	b8 07 00 00 00       	mov    $0x7,%eax
 3d0:	cd 40                	int    $0x40
 3d2:	c3                   	ret    

000003d3 <open>:
SYSCALL(open)
 3d3:	b8 0f 00 00 00       	mov    $0xf,%eax
 3d8:	cd 40                	int    $0x40
 3da:	c3                   	ret    

000003db <mknod>:
SYSCALL(mknod)
 3db:	b8 11 00 00 00       	mov    $0x11,%eax
 3e0:	cd 40                	int    $0x40
 3e2:	c3                   	ret    

000003e3 <unlink>:
SYSCALL(unlink)
 3e3:	b8 12 00 00 00       	mov    $0x12,%eax
 3e8:	cd 40                	int    $0x40
 3ea:	c3                   	ret    

000003eb <fstat>:
SYSCALL(fstat)
 3eb:	b8 08 00 00 00       	mov    $0x8,%eax
 3f0:	cd 40                	int    $0x40
 3f2:	c3                   	ret    

000003f3 <link>:
SYSCALL(link)
 3f3:	b8 13 00 00 00       	mov    $0x13,%eax
 3f8:	cd 40                	int    $0x40
 3fa:	c3                   	ret    

000003fb <mkdir>:
SYSCALL(mkdir)
 3fb:	b8 14 00 00 00       	mov    $0x14,%eax
 400:	cd 40                	int    $0x40
 402:	c3                   	ret    

00000403 <chdir>:
SYSCALL(chdir)
 403:	b8 09 00 00 00       	mov    $0x9,%eax
 408:	cd 40                	int    $0x40
 40a:	c3                   	ret    

0000040b <dup>:
SYSCALL(dup)
 40b:	b8 0a 00 00 00       	mov    $0xa,%eax
 410:	cd 40                	int    $0x40
 412:	c3                   	ret    

00000413 <getpid>:
SYSCALL(getpid)
 413:	b8 0b 00 00 00       	mov    $0xb,%eax
 418:	cd 40                	int    $0x40
 41a:	c3                   	ret    

0000041b <sbrk>:
SYSCALL(sbrk)
 41b:	b8 0c 00 00 00       	mov    $0xc,%eax
 420:	cd 40                	int    $0x40
 422:	c3                   	ret    

00000423 <sleep>:
SYSCALL(sleep)
 423:	b8 0d 00 00 00       	mov    $0xd,%eax
 428:	cd 40                	int    $0x40
 42a:	c3                   	ret    

0000042b <uptime>:
SYSCALL(uptime)
 42b:	b8 0e 00 00 00       	mov    $0xe,%eax
 430:	cd 40                	int    $0x40
 432:	c3                   	ret    

00000433 <cpuhalt>:
SYSCALL(cpuhalt)
 433:	b8 16 00 00 00       	mov    $0x16,%eax
 438:	cd 40                	int    $0x40
 43a:	c3                   	ret    
 43b:	66 90                	xchg   %ax,%ax
 43d:	66 90                	xchg   %ax,%ax
 43f:	90                   	nop

00000440 <printint>:
    putc(fd, digits[x >> (sizeof(uint) * 8 - 4)]);
}

static void
printint(int fd, int xx, int base, int sgn)
{
 440:	55                   	push   %ebp
 441:	89 e5                	mov    %esp,%ebp
 443:	57                   	push   %edi
 444:	56                   	push   %esi
 445:	53                   	push   %ebx
 446:	83 ec 3c             	sub    $0x3c,%esp
 449:	89 4d c4             	mov    %ecx,-0x3c(%ebp)
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
    x = -xx;
 44c:	89 d1                	mov    %edx,%ecx
{
 44e:	89 45 b8             	mov    %eax,-0x48(%ebp)
  if(sgn && xx < 0){
 451:	85 d2                	test   %edx,%edx
 453:	0f 89 7f 00 00 00    	jns    4d8 <printint+0x98>
 459:	f6 45 08 01          	testb  $0x1,0x8(%ebp)
 45d:	74 79                	je     4d8 <printint+0x98>
    neg = 1;
 45f:	c7 45 bc 01 00 00 00 	movl   $0x1,-0x44(%ebp)
    x = -xx;
 466:	f7 d9                	neg    %ecx
  } else {
    x = xx;
  }

  i = 0;
 468:	31 db                	xor    %ebx,%ebx
 46a:	8d 75 d7             	lea    -0x29(%ebp),%esi
 46d:	8d 76 00             	lea    0x0(%esi),%esi
  do{
    buf[i++] = digits[x % base];
 470:	89 c8                	mov    %ecx,%eax
 472:	31 d2                	xor    %edx,%edx
 474:	89 cf                	mov    %ecx,%edi
 476:	f7 75 c4             	divl   -0x3c(%ebp)
 479:	0f b6 92 7c 09 00 00 	movzbl 0x97c(%edx),%edx
 480:	89 45 c0             	mov    %eax,-0x40(%ebp)
 483:	89 d8                	mov    %ebx,%eax
 485:	8d 5b 01             	lea    0x1(%ebx),%ebx
  }while((x /= base) != 0);
 488:	8b 4d c0             	mov    -0x40(%ebp),%ecx
    buf[i++] = digits[x % base];
 48b:	88 14 1e             	mov    %dl,(%esi,%ebx,1)
  }while((x /= base) != 0);
 48e:	39 7d c4             	cmp    %edi,-0x3c(%ebp)
 491:	76 dd                	jbe    470 <printint+0x30>
  if(neg)
 493:	8b 4d bc             	mov    -0x44(%ebp),%ecx
 496:	85 c9                	test   %ecx,%ecx
 498:	74 0c                	je     4a6 <printint+0x66>
    buf[i++] = '-';
 49a:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
    buf[i++] = digits[x % base];
 49f:	89 d8                	mov    %ebx,%eax
    buf[i++] = '-';
 4a1:	ba 2d 00 00 00       	mov    $0x2d,%edx

  while(--i >= 0)
 4a6:	8b 7d b8             	mov    -0x48(%ebp),%edi
 4a9:	8d 5c 05 d7          	lea    -0x29(%ebp,%eax,1),%ebx
 4ad:	eb 07                	jmp    4b6 <printint+0x76>
 4af:	90                   	nop
    putc(fd, buf[i]);
 4b0:	0f b6 13             	movzbl (%ebx),%edx
 4b3:	83 eb 01             	sub    $0x1,%ebx
  write(fd, &c, 1);
 4b6:	83 ec 04             	sub    $0x4,%esp
 4b9:	88 55 d7             	mov    %dl,-0x29(%ebp)
 4bc:	6a 01                	push   $0x1
 4be:	56                   	push   %esi
 4bf:	57                   	push   %edi
 4c0:	e8 ee fe ff ff       	call   3b3 <write>
  while(--i >= 0)
 4c5:	83 c4 10             	add    $0x10,%esp
 4c8:	39 de                	cmp    %ebx,%esi
 4ca:	75 e4                	jne    4b0 <printint+0x70>
}
 4cc:	8d 65 f4             	lea    -0xc(%ebp),%esp
 4cf:	5b                   	pop    %ebx
 4d0:	5e                   	pop    %esi
 4d1:	5f                   	pop    %edi
 4d2:	5d                   	pop    %ebp
 4d3:	c3                   	ret    
 4d4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
 4d8:	c7 45 bc 00 00 00 00 	movl   $0x0,-0x44(%ebp)
 4df:	eb 87                	jmp    468 <printint+0x28>
 4e1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 4e8:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 4ef:	90                   	nop

000004f0 <vprintf>:
static void vprintf(int fd, const char *fmt, va_list ap)
{
 4f0:	55                   	push   %ebp
 4f1:	89 e5                	mov    %esp,%ebp
 4f3:	57                   	push   %edi
 4f4:	56                   	push   %esi
 4f5:	53                   	push   %ebx
 4f6:	83 ec 2c             	sub    $0x2c,%esp
 4f9:	89 4d d4             	mov    %ecx,-0x2c(%ebp)
  char *s;
  int c, i, state;

  state = 0;
  for(i = 0; fmt[i]; i++){
 4fc:	0f b6 0a             	movzbl (%edx),%ecx
 4ff:	84 c9                	test   %cl,%cl
 501:	74 6c                	je     56f <vprintf+0x7f>
 503:	89 c6                	mov    %eax,%esi
 505:	8d 5a 01             	lea    0x1(%edx),%ebx
 508:	31 ff                	xor    %edi,%edi
 50a:	eb 28                	jmp    534 <vprintf+0x44>
 50c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
 510:	83 f8 25             	cmp    $0x25,%eax
 513:	74 4b                	je     560 <vprintf+0x70>
  write(fd, &c, 1);
 515:	83 ec 04             	sub    $0x4,%esp
 518:	8d 45 e7             	lea    -0x19(%ebp),%eax
 51b:	88 4d e7             	mov    %cl,-0x19(%ebp)
 51e:	6a 01                	push   $0x1
 520:	50                   	push   %eax
 521:	56                   	push   %esi
 522:	e8 8c fe ff ff       	call   3b3 <write>
        state = '%';
      } else {
        putc(fd, c);
 527:	83 c4 10             	add    $0x10,%esp
  for(i = 0; fmt[i]; i++){
 52a:	0f b6 0b             	movzbl (%ebx),%ecx
 52d:	83 c3 01             	add    $0x1,%ebx
 530:	84 c9                	test   %cl,%cl
 532:	74 3b                	je     56f <vprintf+0x7f>
    c = fmt[i] & 0xff;
 534:	0f b6 c1             	movzbl %cl,%eax
    if(state == 0){
 537:	85 ff                	test   %edi,%edi
 539:	74 d5                	je     510 <vprintf+0x20>
      }
    } else if(state == '%'){
 53b:	83 ff 25             	cmp    $0x25,%edi
 53e:	75 ea                	jne    52a <vprintf+0x3a>
      if(c == 'd'){
 540:	83 f8 25             	cmp    $0x25,%eax
 543:	0f 84 cf 01 00 00    	je     718 <vprintf+0x228>
 549:	83 e8 63             	sub    $0x63,%eax
 54c:	83 f8 15             	cmp    $0x15,%eax
 54f:	77 2f                	ja     580 <vprintf+0x90>
 551:	ff 24 85 24 09 00 00 	jmp    *0x924(,%eax,4)
 558:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 55f:	90                   	nop
  for(i = 0; fmt[i]; i++){
 560:	0f b6 0b             	movzbl (%ebx),%ecx
 563:	83 c3 01             	add    $0x1,%ebx
        state = '%';
 566:	bf 25 00 00 00       	mov    $0x25,%edi
  for(i = 0; fmt[i]; i++){
 56b:	84 c9                	test   %cl,%cl
 56d:	75 c5                	jne    534 <vprintf+0x44>
        putc(fd, c);
      }
      state = 0;
    }
  }
}
 56f:	8d 65 f4             	lea    -0xc(%ebp),%esp
 572:	5b                   	pop    %ebx
 573:	5e                   	pop    %esi
 574:	5f                   	pop    %edi
 575:	5d                   	pop    %ebp
 576:	c3                   	ret    
 577:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 57e:	66 90                	xchg   %ax,%ax
  write(fd, &c, 1);
 580:	83 ec 04             	sub    $0x4,%esp
 583:	8d 45 e7             	lea    -0x19(%ebp),%eax
 586:	88 4d d0             	mov    %cl,-0x30(%ebp)
 589:	6a 01                	push   $0x1
 58b:	50                   	push   %eax
 58c:	56                   	push   %esi
 58d:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
 591:	e8 1d fe ff ff       	call   3b3 <write>
        putc(fd, c);
 596:	0f b6 4d d0          	movzbl -0x30(%ebp),%ecx
  write(fd, &c, 1);
 59a:	83 c4 0c             	add    $0xc,%esp
 59d:	88 4d e7             	mov    %cl,-0x19(%ebp)
 5a0:	8d 45 e7             	lea    -0x19(%ebp),%eax
 5a3:	6a 01                	push   $0x1
      state = 0;
 5a5:	31 ff                	xor    %edi,%edi
  write(fd, &c, 1);
 5a7:	50                   	push   %eax
 5a8:	56                   	push   %esi
 5a9:	e8 05 fe ff ff       	call   3b3 <write>
        putc(fd, c);
 5ae:	83 c4 10             	add    $0x10,%esp
 5b1:	e9 74 ff ff ff       	jmp    52a <vprintf+0x3a>
 5b6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 5bd:	8d 76 00             	lea    0x0(%esi),%esi
        putc(fd, va_arg(ap, uint));
 5c0:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  write(fd, &c, 1);
 5c3:	83 ec 04             	sub    $0x4,%esp
        putc(fd, va_arg(ap, uint));
 5c6:	8d 78 04             	lea    0x4(%eax),%edi
 5c9:	8b 00                	mov    (%eax),%eax
  write(fd, &c, 1);
 5cb:	6a 01                	push   $0x1
        putc(fd, va_arg(ap, uint));
 5cd:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
 5d0:	8d 45 e7             	lea    -0x19(%ebp),%eax
 5d3:	50                   	push   %eax
 5d4:	56                   	push   %esi
 5d5:	e8 d9 fd ff ff       	call   3b3 <write>
        putc(fd, va_arg(ap, uint));
 5da:	89 7d d4             	mov    %edi,-0x2c(%ebp)
 5dd:	83 c4 10             	add    $0x10,%esp
      state = 0;
 5e0:	31 ff                	xor    %edi,%edi
 5e2:	e9 43 ff ff ff       	jmp    52a <vprintf+0x3a>
 5e7:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 5ee:	66 90                	xchg   %ax,%ax
        printint(fd, va_arg(ap, int), 10, 1);
 5f0:	83 ec 0c             	sub    $0xc,%esp
 5f3:	8b 45 d4             	mov    -0x2c(%ebp),%eax
 5f6:	b9 0a 00 00 00       	mov    $0xa,%ecx
 5fb:	6a 01                	push   $0x1
 5fd:	8d 78 04             	lea    0x4(%eax),%edi
        printint(fd, va_arg(ap, int), 16, 0);
 600:	8b 10                	mov    (%eax),%edx
 602:	89 f0                	mov    %esi,%eax
 604:	e8 37 fe ff ff       	call   440 <printint>
 609:	89 7d d4             	mov    %edi,-0x2c(%ebp)
 60c:	83 c4 10             	add    $0x10,%esp
      state = 0;
 60f:	31 ff                	xor    %edi,%edi
 611:	e9 14 ff ff ff       	jmp    52a <vprintf+0x3a>
 616:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 61d:	8d 76 00             	lea    0x0(%esi),%esi
        printint(fd, va_arg(ap, uint), 10, 0);
 620:	8b 45 d4             	mov    -0x2c(%ebp),%eax
 623:	83 ec 0c             	sub    $0xc,%esp
 626:	b9 0a 00 00 00       	mov    $0xa,%ecx
 62b:	6a 00                	push   $0x0
 62d:	8d 78 04             	lea    0x4(%eax),%edi
 630:	eb ce                	jmp    600 <vprintf+0x110>
 632:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        printptr(fd, va_arg(ap, uint));
 638:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  write(fd, &c, 1);
 63b:	83 ec 04             	sub    $0x4,%esp
 63e:	c6 45 e7 30          	movb   $0x30,-0x19(%ebp)
        printptr(fd, va_arg(ap, uint));
 642:	8b 38                	mov    (%eax),%edi
 644:	8d 50 04             	lea    0x4(%eax),%edx
  write(fd, &c, 1);
 647:	8d 45 e7             	lea    -0x19(%ebp),%eax
 64a:	6a 01                	push   $0x1
 64c:	50                   	push   %eax
 64d:	56                   	push   %esi
        printptr(fd, va_arg(ap, uint));
 64e:	89 55 d4             	mov    %edx,-0x2c(%ebp)
  write(fd, &c, 1);
 651:	e8 5d fd ff ff       	call   3b3 <write>
 656:	83 c4 0c             	add    $0xc,%esp
 659:	8d 45 e7             	lea    -0x19(%ebp),%eax
 65c:	c6 45 e7 78          	movb   $0x78,-0x19(%ebp)
 660:	6a 01                	push   $0x1
 662:	50                   	push   %eax
 663:	56                   	push   %esi
 664:	e8 4a fd ff ff       	call   3b3 <write>
  putc(fd, 'x');
 669:	b8 08 00 00 00       	mov    $0x8,%eax
 66e:	89 5d d0             	mov    %ebx,-0x30(%ebp)
 671:	83 c4 10             	add    $0x10,%esp
 674:	89 fb                	mov    %edi,%ebx
 676:	89 c7                	mov    %eax,%edi
 678:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 67f:	90                   	nop
    putc(fd, digits[x >> (sizeof(uint) * 8 - 4)]);
 680:	89 d8                	mov    %ebx,%eax
  write(fd, &c, 1);
 682:	83 ec 04             	sub    $0x4,%esp
  for (i = 0; i < (sizeof(uint) * 2); i++, x <<= 4)
 685:	c1 e3 04             	shl    $0x4,%ebx
    putc(fd, digits[x >> (sizeof(uint) * 8 - 4)]);
 688:	c1 e8 1c             	shr    $0x1c,%eax
  write(fd, &c, 1);
 68b:	6a 01                	push   $0x1
 68d:	0f b6 80 7c 09 00 00 	movzbl 0x97c(%eax),%eax
 694:	88 45 e7             	mov    %al,-0x19(%ebp)
 697:	8d 45 e7             	lea    -0x19(%ebp),%eax
 69a:	50                   	push   %eax
 69b:	56                   	push   %esi
 69c:	e8 12 fd ff ff       	call   3b3 <write>
  for (i = 0; i < (sizeof(uint) * 2); i++, x <<= 4)
 6a1:	83 c4 10             	add    $0x10,%esp
 6a4:	83 ef 01             	sub    $0x1,%edi
 6a7:	75 d7                	jne    680 <vprintf+0x190>
        printptr(fd, va_arg(ap, uint));
 6a9:	8b 5d d0             	mov    -0x30(%ebp),%ebx
      state = 0;
 6ac:	31 ff                	xor    %edi,%edi
 6ae:	e9 77 fe ff ff       	jmp    52a <vprintf+0x3a>
 6b3:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 6b7:	90                   	nop
        s = va_arg(ap, char*);
 6b8:	8b 45 d4             	mov    -0x2c(%ebp),%eax
 6bb:	8b 38                	mov    (%eax),%edi
 6bd:	8d 50 04             	lea    0x4(%eax),%edx
 6c0:	89 55 d4             	mov    %edx,-0x2c(%ebp)
        if(s == 0)
 6c3:	85 ff                	test   %edi,%edi
 6c5:	74 5c                	je     723 <vprintf+0x233>
        while(*s != 0){
 6c7:	0f b6 07             	movzbl (%edi),%eax
 6ca:	84 c0                	test   %al,%al
 6cc:	74 21                	je     6ef <vprintf+0x1ff>
 6ce:	66 90                	xchg   %ax,%ax
  write(fd, &c, 1);
 6d0:	83 ec 04             	sub    $0x4,%esp
 6d3:	88 45 e7             	mov    %al,-0x19(%ebp)
 6d6:	8d 45 e7             	lea    -0x19(%ebp),%eax
          s++;
 6d9:	83 c7 01             	add    $0x1,%edi
  write(fd, &c, 1);
 6dc:	6a 01                	push   $0x1
 6de:	50                   	push   %eax
 6df:	56                   	push   %esi
 6e0:	e8 ce fc ff ff       	call   3b3 <write>
        while(*s != 0){
 6e5:	0f b6 07             	movzbl (%edi),%eax
 6e8:	83 c4 10             	add    $0x10,%esp
 6eb:	84 c0                	test   %al,%al
 6ed:	75 e1                	jne    6d0 <vprintf+0x1e0>
      state = 0;
 6ef:	31 ff                	xor    %edi,%edi
 6f1:	e9 34 fe ff ff       	jmp    52a <vprintf+0x3a>
 6f6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 6fd:	8d 76 00             	lea    0x0(%esi),%esi
        printint(fd, va_arg(ap, int), 16, 0);
 700:	8b 45 d4             	mov    -0x2c(%ebp),%eax
 703:	83 ec 0c             	sub    $0xc,%esp
 706:	b9 10 00 00 00       	mov    $0x10,%ecx
 70b:	6a 00                	push   $0x0
 70d:	8d 78 04             	lea    0x4(%eax),%edi
 710:	e9 eb fe ff ff       	jmp    600 <vprintf+0x110>
 715:	8d 76 00             	lea    0x0(%esi),%esi
        putc(fd, c);
 718:	88 4d e7             	mov    %cl,-0x19(%ebp)
  write(fd, &c, 1);
 71b:	83 ec 04             	sub    $0x4,%esp
 71e:	e9 7d fe ff ff       	jmp    5a0 <vprintf+0xb0>
          s = "(null)";
 723:	bf 1b 09 00 00       	mov    $0x91b,%edi
        while(*s != 0){
 728:	b8 28 00 00 00       	mov    $0x28,%eax
 72d:	eb a1                	jmp    6d0 <vprintf+0x1e0>
 72f:	90                   	nop

00000730 <fprintf>:
// Print to the given fd. Only understands %d,%x, %p, %s, %c.
void
fprintf(int fd, const char *fmt, ...)
{
 730:	55                   	push   %ebp
 731:	89 e5                	mov    %esp,%ebp
 733:	83 ec 08             	sub    $0x8,%esp
 va_list ap;
 va_start(ap, fmt); 
 vprintf(fd,fmt,ap);
 736:	8b 55 0c             	mov    0xc(%ebp),%edx
 739:	8b 45 08             	mov    0x8(%ebp),%eax
 73c:	8d 4d 10             	lea    0x10(%ebp),%ecx
 73f:	e8 ac fd ff ff       	call   4f0 <vprintf>
}
 744:	c9                   	leave  
 745:	c3                   	ret    
 746:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 74d:	8d 76 00             	lea    0x0(%esi),%esi

00000750 <printf>:
void
printf(const char *fmt, ...)
{
 750:	55                   	push   %ebp
  va_list ap;
  va_start(ap, fmt); 
  vprintf(1,fmt,ap);
 751:	b8 01 00 00 00       	mov    $0x1,%eax
{
 756:	89 e5                	mov    %esp,%ebp
 758:	83 ec 08             	sub    $0x8,%esp
  vprintf(1,fmt,ap);
 75b:	8b 55 08             	mov    0x8(%ebp),%edx
 75e:	8d 4d 0c             	lea    0xc(%ebp),%ecx
 761:	e8 8a fd ff ff       	call   4f0 <vprintf>
}
 766:	c9                   	leave  
 767:	c3                   	ret    
 768:	66 90                	xchg   %ax,%ax
 76a:	66 90                	xchg   %ax,%ax
 76c:	66 90                	xchg   %ax,%ax
 76e:	66 90                	xchg   %ax,%ax

00000770 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 770:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 771:	a1 90 09 00 00       	mov    0x990,%eax
{
 776:	89 e5                	mov    %esp,%ebp
 778:	57                   	push   %edi
 779:	56                   	push   %esi
 77a:	53                   	push   %ebx
 77b:	8b 5d 08             	mov    0x8(%ebp),%ebx
  bp = (Header*)ap - 1;
 77e:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 781:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 788:	89 c2                	mov    %eax,%edx
 78a:	8b 00                	mov    (%eax),%eax
 78c:	39 ca                	cmp    %ecx,%edx
 78e:	73 30                	jae    7c0 <free+0x50>
 790:	39 c1                	cmp    %eax,%ecx
 792:	72 04                	jb     798 <free+0x28>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 794:	39 c2                	cmp    %eax,%edx
 796:	72 f0                	jb     788 <free+0x18>
      break;
  if(bp + bp->s.size == p->s.ptr){
 798:	8b 73 fc             	mov    -0x4(%ebx),%esi
 79b:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 79e:	39 f8                	cmp    %edi,%eax
 7a0:	74 30                	je     7d2 <free+0x62>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
 7a2:	89 43 f8             	mov    %eax,-0x8(%ebx)
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
 7a5:	8b 42 04             	mov    0x4(%edx),%eax
 7a8:	8d 34 c2             	lea    (%edx,%eax,8),%esi
 7ab:	39 f1                	cmp    %esi,%ecx
 7ad:	74 3a                	je     7e9 <free+0x79>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
 7af:	89 0a                	mov    %ecx,(%edx)
  } else
    p->s.ptr = bp;
  freep = p;
}
 7b1:	5b                   	pop    %ebx
  freep = p;
 7b2:	89 15 90 09 00 00    	mov    %edx,0x990
}
 7b8:	5e                   	pop    %esi
 7b9:	5f                   	pop    %edi
 7ba:	5d                   	pop    %ebp
 7bb:	c3                   	ret    
 7bc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 7c0:	39 c2                	cmp    %eax,%edx
 7c2:	72 c4                	jb     788 <free+0x18>
 7c4:	39 c1                	cmp    %eax,%ecx
 7c6:	73 c0                	jae    788 <free+0x18>
  if(bp + bp->s.size == p->s.ptr){
 7c8:	8b 73 fc             	mov    -0x4(%ebx),%esi
 7cb:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 7ce:	39 f8                	cmp    %edi,%eax
 7d0:	75 d0                	jne    7a2 <free+0x32>
    bp->s.size += p->s.ptr->s.size;
 7d2:	03 70 04             	add    0x4(%eax),%esi
 7d5:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 7d8:	8b 02                	mov    (%edx),%eax
 7da:	8b 00                	mov    (%eax),%eax
 7dc:	89 43 f8             	mov    %eax,-0x8(%ebx)
  if(p + p->s.size == bp){
 7df:	8b 42 04             	mov    0x4(%edx),%eax
 7e2:	8d 34 c2             	lea    (%edx,%eax,8),%esi
 7e5:	39 f1                	cmp    %esi,%ecx
 7e7:	75 c6                	jne    7af <free+0x3f>
    p->s.size += bp->s.size;
 7e9:	03 43 fc             	add    -0x4(%ebx),%eax
  freep = p;
 7ec:	89 15 90 09 00 00    	mov    %edx,0x990
    p->s.size += bp->s.size;
 7f2:	89 42 04             	mov    %eax,0x4(%edx)
    p->s.ptr = bp->s.ptr;
 7f5:	8b 4b f8             	mov    -0x8(%ebx),%ecx
 7f8:	89 0a                	mov    %ecx,(%edx)
}
 7fa:	5b                   	pop    %ebx
 7fb:	5e                   	pop    %esi
 7fc:	5f                   	pop    %edi
 7fd:	5d                   	pop    %ebp
 7fe:	c3                   	ret    
 7ff:	90                   	nop

00000800 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 800:	55                   	push   %ebp
 801:	89 e5                	mov    %esp,%ebp
 803:	57                   	push   %edi
 804:	56                   	push   %esi
 805:	53                   	push   %ebx
 806:	83 ec 1c             	sub    $0x1c,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 809:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
 80c:	8b 3d 90 09 00 00    	mov    0x990,%edi
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 812:	8d 70 07             	lea    0x7(%eax),%esi
 815:	c1 ee 03             	shr    $0x3,%esi
 818:	83 c6 01             	add    $0x1,%esi
  if((prevp = freep) == 0){
 81b:	85 ff                	test   %edi,%edi
 81d:	0f 84 9d 00 00 00    	je     8c0 <malloc+0xc0>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 823:	8b 17                	mov    (%edi),%edx
    if(p->s.size >= nunits){
 825:	8b 4a 04             	mov    0x4(%edx),%ecx
 828:	39 f1                	cmp    %esi,%ecx
 82a:	73 6a                	jae    896 <malloc+0x96>
 82c:	bb 00 10 00 00       	mov    $0x1000,%ebx
 831:	39 de                	cmp    %ebx,%esi
 833:	0f 43 de             	cmovae %esi,%ebx
  p = sbrk(nu * sizeof(Header));
 836:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
 83d:	89 45 e4             	mov    %eax,-0x1c(%ebp)
 840:	eb 17                	jmp    859 <malloc+0x59>
 842:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 848:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
 84a:	8b 48 04             	mov    0x4(%eax),%ecx
 84d:	39 f1                	cmp    %esi,%ecx
 84f:	73 4f                	jae    8a0 <malloc+0xa0>
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 851:	8b 3d 90 09 00 00    	mov    0x990,%edi
 857:	89 c2                	mov    %eax,%edx
 859:	39 d7                	cmp    %edx,%edi
 85b:	75 eb                	jne    848 <malloc+0x48>
  p = sbrk(nu * sizeof(Header));
 85d:	83 ec 0c             	sub    $0xc,%esp
 860:	ff 75 e4             	push   -0x1c(%ebp)
 863:	e8 b3 fb ff ff       	call   41b <sbrk>
  if(p == (char*)-1)
 868:	83 c4 10             	add    $0x10,%esp
 86b:	83 f8 ff             	cmp    $0xffffffff,%eax
 86e:	74 1c                	je     88c <malloc+0x8c>
  hp->s.size = nu;
 870:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 873:	83 ec 0c             	sub    $0xc,%esp
 876:	83 c0 08             	add    $0x8,%eax
 879:	50                   	push   %eax
 87a:	e8 f1 fe ff ff       	call   770 <free>
  return freep;
 87f:	8b 15 90 09 00 00    	mov    0x990,%edx
      if((p = morecore(nunits)) == 0)
 885:	83 c4 10             	add    $0x10,%esp
 888:	85 d2                	test   %edx,%edx
 88a:	75 bc                	jne    848 <malloc+0x48>
        return 0;
  }
}
 88c:	8d 65 f4             	lea    -0xc(%ebp),%esp
        return 0;
 88f:	31 c0                	xor    %eax,%eax
}
 891:	5b                   	pop    %ebx
 892:	5e                   	pop    %esi
 893:	5f                   	pop    %edi
 894:	5d                   	pop    %ebp
 895:	c3                   	ret    
    if(p->s.size >= nunits){
 896:	89 d0                	mov    %edx,%eax
 898:	89 fa                	mov    %edi,%edx
 89a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      if(p->s.size == nunits)
 8a0:	39 ce                	cmp    %ecx,%esi
 8a2:	74 4c                	je     8f0 <malloc+0xf0>
        p->s.size -= nunits;
 8a4:	29 f1                	sub    %esi,%ecx
 8a6:	89 48 04             	mov    %ecx,0x4(%eax)
        p += p->s.size;
 8a9:	8d 04 c8             	lea    (%eax,%ecx,8),%eax
        p->s.size = nunits;
 8ac:	89 70 04             	mov    %esi,0x4(%eax)
      freep = prevp;
 8af:	89 15 90 09 00 00    	mov    %edx,0x990
}
 8b5:	8d 65 f4             	lea    -0xc(%ebp),%esp
      return (void*)(p + 1);
 8b8:	83 c0 08             	add    $0x8,%eax
}
 8bb:	5b                   	pop    %ebx
 8bc:	5e                   	pop    %esi
 8bd:	5f                   	pop    %edi
 8be:	5d                   	pop    %ebp
 8bf:	c3                   	ret    
    base.s.ptr = freep = prevp = &base;
 8c0:	c7 05 90 09 00 00 94 	movl   $0x994,0x990
 8c7:	09 00 00 
    base.s.size = 0;
 8ca:	bf 94 09 00 00       	mov    $0x994,%edi
    base.s.ptr = freep = prevp = &base;
 8cf:	c7 05 94 09 00 00 94 	movl   $0x994,0x994
 8d6:	09 00 00 
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 8d9:	89 fa                	mov    %edi,%edx
    base.s.size = 0;
 8db:	c7 05 98 09 00 00 00 	movl   $0x0,0x998
 8e2:	00 00 00 
    if(p->s.size >= nunits){
 8e5:	e9 42 ff ff ff       	jmp    82c <malloc+0x2c>
 8ea:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        prevp->s.ptr = p->s.ptr;
 8f0:	8b 08                	mov    (%eax),%ecx
 8f2:	89 0a                	mov    %ecx,(%edx)
 8f4:	eb b9                	jmp    8af <malloc+0xaf>
