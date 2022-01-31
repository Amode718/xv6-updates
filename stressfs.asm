
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
  2b:	68 d8 08 00 00       	push   $0x8d8
  char path[] = "stressfs0";
  30:	c7 85 de fd ff ff 73 	movl   $0x65727473,-0x222(%ebp)
  37:	74 72 65 
  3a:	c7 85 e2 fd ff ff 73 	movl   $0x73667373,-0x21e(%ebp)
  41:	73 66 73 
  printf("stressfs starting\n");
  44:	e8 e7 06 00 00       	call   730 <printf>
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
  7a:	68 eb 08 00 00       	push   $0x8eb
  7f:	e8 ac 06 00 00       	call   730 <printf>

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
  d5:	c7 04 24 f5 08 00 00 	movl   $0x8f5,(%esp)
  dc:	e8 4f 06 00 00       	call   730 <printf>
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

00000440 <printint.constprop.0>:
  for (i = 0; i < (sizeof(uint) * 2); i++, x <<= 4)
    putc(fd, digits[x >> (sizeof(uint) * 8 - 4)]);
}

static void
printint(int fd, int xx, int base, int sgn)
 440:	55                   	push   %ebp
 441:	89 e5                	mov    %esp,%ebp
 443:	57                   	push   %edi
 444:	56                   	push   %esi
 445:	53                   	push   %ebx
 446:	83 ec 3c             	sub    $0x3c,%esp
 449:	89 55 c4             	mov    %edx,-0x3c(%ebp)
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 44c:	85 c0                	test   %eax,%eax
 44e:	0f 89 84 00 00 00    	jns    4d8 <printint.constprop.0+0x98>
 454:	83 e1 01             	and    $0x1,%ecx
 457:	74 7f                	je     4d8 <printint.constprop.0+0x98>
    neg = 1;
 459:	c7 45 bc 01 00 00 00 	movl   $0x1,-0x44(%ebp)
    x = -xx;
 460:	f7 d8                	neg    %eax
 462:	89 c1                	mov    %eax,%ecx
  } else {
    x = xx;
  }

  i = 0;
 464:	31 db                	xor    %ebx,%ebx
 466:	8d 75 d7             	lea    -0x29(%ebp),%esi
 469:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  do{
    buf[i++] = digits[x % base];
 470:	89 c8                	mov    %ecx,%eax
 472:	31 d2                	xor    %edx,%edx
 474:	89 cf                	mov    %ecx,%edi
 476:	f7 75 c4             	divl   -0x3c(%ebp)
 479:	0f b6 92 5c 09 00 00 	movzbl 0x95c(%edx),%edx
 480:	89 45 c0             	mov    %eax,-0x40(%ebp)
 483:	89 d8                	mov    %ebx,%eax
 485:	8d 5b 01             	lea    0x1(%ebx),%ebx
  }while((x /= base) != 0);
 488:	8b 4d c0             	mov    -0x40(%ebp),%ecx
    buf[i++] = digits[x % base];
 48b:	88 14 1e             	mov    %dl,(%esi,%ebx,1)
  }while((x /= base) != 0);
 48e:	3b 7d c4             	cmp    -0x3c(%ebp),%edi
 491:	73 dd                	jae    470 <printint.constprop.0+0x30>
  if(neg)
 493:	8b 4d bc             	mov    -0x44(%ebp),%ecx
 496:	85 c9                	test   %ecx,%ecx
 498:	74 0c                	je     4a6 <printint.constprop.0+0x66>
    buf[i++] = '-';
 49a:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
    buf[i++] = digits[x % base];
 49f:	89 d8                	mov    %ebx,%eax
    buf[i++] = '-';
 4a1:	ba 2d 00 00 00       	mov    $0x2d,%edx

  while(--i >= 0)
 4a6:	8d 5c 05 d7          	lea    -0x29(%ebp,%eax,1),%ebx
 4aa:	eb 0a                	jmp    4b6 <printint.constprop.0+0x76>
 4ac:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    putc(fd, buf[i]);
 4b0:	0f b6 13             	movzbl (%ebx),%edx
 4b3:	83 eb 01             	sub    $0x1,%ebx
  write(fd, &c, 1);
 4b6:	83 ec 04             	sub    $0x4,%esp
 4b9:	88 55 d7             	mov    %dl,-0x29(%ebp)
 4bc:	6a 01                	push   $0x1
 4be:	56                   	push   %esi
 4bf:	6a 01                	push   $0x1
 4c1:	e8 ed fe ff ff       	call   3b3 <write>
  while(--i >= 0)
 4c6:	83 c4 10             	add    $0x10,%esp
 4c9:	39 de                	cmp    %ebx,%esi
 4cb:	75 e3                	jne    4b0 <printint.constprop.0+0x70>
}
 4cd:	8d 65 f4             	lea    -0xc(%ebp),%esp
 4d0:	5b                   	pop    %ebx
 4d1:	5e                   	pop    %esi
 4d2:	5f                   	pop    %edi
 4d3:	5d                   	pop    %ebp
 4d4:	c3                   	ret    
 4d5:	8d 76 00             	lea    0x0(%esi),%esi
  neg = 0;
 4d8:	c7 45 bc 00 00 00 00 	movl   $0x0,-0x44(%ebp)
    x = xx;
 4df:	89 c1                	mov    %eax,%ecx
 4e1:	eb 81                	jmp    464 <printint.constprop.0+0x24>
 4e3:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 4ea:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

000004f0 <vprintf.constprop.0>:
static void vprintf(int fd, const char *fmt, va_list ap)
 4f0:	55                   	push   %ebp
 4f1:	89 e5                	mov    %esp,%ebp
 4f3:	57                   	push   %edi
 4f4:	56                   	push   %esi
 4f5:	53                   	push   %ebx
 4f6:	83 ec 2c             	sub    $0x2c,%esp
 4f9:	89 55 d4             	mov    %edx,-0x2c(%ebp)
{
  char *s;
  int c, i, state;

  state = 0;
  for(i = 0; fmt[i]; i++){
 4fc:	0f b6 10             	movzbl (%eax),%edx
 4ff:	84 d2                	test   %dl,%dl
 501:	74 6c                	je     56f <vprintf.constprop.0+0x7f>
 503:	8d 58 01             	lea    0x1(%eax),%ebx
 506:	31 ff                	xor    %edi,%edi
 508:	8d 75 e7             	lea    -0x19(%ebp),%esi
 50b:	eb 25                	jmp    532 <vprintf.constprop.0+0x42>
 50d:	8d 76 00             	lea    0x0(%esi),%esi
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
 510:	83 f8 25             	cmp    $0x25,%eax
 513:	74 4b                	je     560 <vprintf.constprop.0+0x70>
  write(fd, &c, 1);
 515:	83 ec 04             	sub    $0x4,%esp
 518:	88 55 e7             	mov    %dl,-0x19(%ebp)
 51b:	6a 01                	push   $0x1
 51d:	56                   	push   %esi
 51e:	6a 01                	push   $0x1
 520:	e8 8e fe ff ff       	call   3b3 <write>
        state = '%';
      } else {
        putc(fd, c);
 525:	83 c4 10             	add    $0x10,%esp
  for(i = 0; fmt[i]; i++){
 528:	0f b6 13             	movzbl (%ebx),%edx
 52b:	83 c3 01             	add    $0x1,%ebx
 52e:	84 d2                	test   %dl,%dl
 530:	74 3d                	je     56f <vprintf.constprop.0+0x7f>
    c = fmt[i] & 0xff;
 532:	0f b6 c2             	movzbl %dl,%eax
    if(state == 0){
 535:	85 ff                	test   %edi,%edi
 537:	74 d7                	je     510 <vprintf.constprop.0+0x20>
      }
    } else if(state == '%'){
 539:	83 ff 25             	cmp    $0x25,%edi
 53c:	75 ea                	jne    528 <vprintf.constprop.0+0x38>
      if(c == 'd'){
 53e:	83 f8 25             	cmp    $0x25,%eax
 541:	0f 84 a9 01 00 00    	je     6f0 <vprintf.constprop.0+0x200>
 547:	83 e8 63             	sub    $0x63,%eax
 54a:	83 f8 15             	cmp    $0x15,%eax
 54d:	77 31                	ja     580 <vprintf.constprop.0+0x90>
 54f:	ff 24 85 04 09 00 00 	jmp    *0x904(,%eax,4)
 556:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 55d:	8d 76 00             	lea    0x0(%esi),%esi
  for(i = 0; fmt[i]; i++){
 560:	0f b6 13             	movzbl (%ebx),%edx
 563:	83 c3 01             	add    $0x1,%ebx
        state = '%';
 566:	bf 25 00 00 00       	mov    $0x25,%edi
  for(i = 0; fmt[i]; i++){
 56b:	84 d2                	test   %dl,%dl
 56d:	75 c3                	jne    532 <vprintf.constprop.0+0x42>
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
 583:	88 55 d0             	mov    %dl,-0x30(%ebp)
 586:	6a 01                	push   $0x1
 588:	56                   	push   %esi
 589:	6a 01                	push   $0x1
 58b:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
 58f:	e8 1f fe ff ff       	call   3b3 <write>
        putc(fd, c);
 594:	0f b6 55 d0          	movzbl -0x30(%ebp),%edx
  write(fd, &c, 1);
 598:	83 c4 0c             	add    $0xc,%esp
 59b:	88 55 e7             	mov    %dl,-0x19(%ebp)
 59e:	6a 01                	push   $0x1
      state = 0;
 5a0:	31 ff                	xor    %edi,%edi
  write(fd, &c, 1);
 5a2:	56                   	push   %esi
 5a3:	6a 01                	push   $0x1
 5a5:	e8 09 fe ff ff       	call   3b3 <write>
        putc(fd, c);
 5aa:	83 c4 10             	add    $0x10,%esp
 5ad:	e9 76 ff ff ff       	jmp    528 <vprintf.constprop.0+0x38>
 5b2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        putc(fd, va_arg(ap, uint));
 5b8:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  write(fd, &c, 1);
 5bb:	83 ec 04             	sub    $0x4,%esp
        putc(fd, va_arg(ap, uint));
 5be:	8d 78 04             	lea    0x4(%eax),%edi
 5c1:	8b 00                	mov    (%eax),%eax
  write(fd, &c, 1);
 5c3:	6a 01                	push   $0x1
 5c5:	56                   	push   %esi
 5c6:	6a 01                	push   $0x1
        putc(fd, va_arg(ap, uint));
 5c8:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
 5cb:	e8 e3 fd ff ff       	call   3b3 <write>
        putc(fd, va_arg(ap, uint));
 5d0:	89 7d d4             	mov    %edi,-0x2c(%ebp)
 5d3:	83 c4 10             	add    $0x10,%esp
      state = 0;
 5d6:	31 ff                	xor    %edi,%edi
 5d8:	e9 4b ff ff ff       	jmp    528 <vprintf.constprop.0+0x38>
 5dd:	8d 76 00             	lea    0x0(%esi),%esi
        printint(fd, va_arg(ap, int), 10, 1);
 5e0:	8b 45 d4             	mov    -0x2c(%ebp),%eax
 5e3:	b9 01 00 00 00       	mov    $0x1,%ecx
 5e8:	8d 78 04             	lea    0x4(%eax),%edi
        printint(fd, va_arg(ap, uint), 10, 0);
 5eb:	8b 00                	mov    (%eax),%eax
 5ed:	ba 0a 00 00 00       	mov    $0xa,%edx
 5f2:	e8 49 fe ff ff       	call   440 <printint.constprop.0>
 5f7:	89 7d d4             	mov    %edi,-0x2c(%ebp)
      state = 0;
 5fa:	31 ff                	xor    %edi,%edi
 5fc:	e9 27 ff ff ff       	jmp    528 <vprintf.constprop.0+0x38>
 601:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        printint(fd, va_arg(ap, uint), 10, 0);
 608:	8b 45 d4             	mov    -0x2c(%ebp),%eax
 60b:	31 c9                	xor    %ecx,%ecx
 60d:	8d 78 04             	lea    0x4(%eax),%edi
 610:	eb d9                	jmp    5eb <vprintf.constprop.0+0xfb>
 612:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        printptr(fd, va_arg(ap, uint));
 618:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  write(fd, &c, 1);
 61b:	83 ec 04             	sub    $0x4,%esp
 61e:	c6 45 e7 30          	movb   $0x30,-0x19(%ebp)
        printptr(fd, va_arg(ap, uint));
 622:	8b 38                	mov    (%eax),%edi
  write(fd, &c, 1);
 624:	6a 01                	push   $0x1
        printptr(fd, va_arg(ap, uint));
 626:	8d 48 04             	lea    0x4(%eax),%ecx
  write(fd, &c, 1);
 629:	56                   	push   %esi
 62a:	6a 01                	push   $0x1
        printptr(fd, va_arg(ap, uint));
 62c:	89 4d d0             	mov    %ecx,-0x30(%ebp)
  write(fd, &c, 1);
 62f:	e8 7f fd ff ff       	call   3b3 <write>
 634:	83 c4 0c             	add    $0xc,%esp
 637:	c6 45 e7 78          	movb   $0x78,-0x19(%ebp)
 63b:	6a 01                	push   $0x1
 63d:	56                   	push   %esi
 63e:	6a 01                	push   $0x1
 640:	e8 6e fd ff ff       	call   3b3 <write>
  putc(fd, 'x');
 645:	c7 45 d4 08 00 00 00 	movl   $0x8,-0x2c(%ebp)
 64c:	83 c4 10             	add    $0x10,%esp
 64f:	90                   	nop
  write(fd, &c, 1);
 650:	83 ec 04             	sub    $0x4,%esp
    putc(fd, digits[x >> (sizeof(uint) * 8 - 4)]);
 653:	89 f8                	mov    %edi,%eax
  for (i = 0; i < (sizeof(uint) * 2); i++, x <<= 4)
 655:	c1 e7 04             	shl    $0x4,%edi
  write(fd, &c, 1);
 658:	6a 01                	push   $0x1
    putc(fd, digits[x >> (sizeof(uint) * 8 - 4)]);
 65a:	c1 e8 1c             	shr    $0x1c,%eax
  write(fd, &c, 1);
 65d:	56                   	push   %esi
 65e:	0f b6 80 5c 09 00 00 	movzbl 0x95c(%eax),%eax
 665:	6a 01                	push   $0x1
 667:	88 45 e7             	mov    %al,-0x19(%ebp)
 66a:	e8 44 fd ff ff       	call   3b3 <write>
  for (i = 0; i < (sizeof(uint) * 2); i++, x <<= 4)
 66f:	83 c4 10             	add    $0x10,%esp
 672:	83 6d d4 01          	subl   $0x1,-0x2c(%ebp)
 676:	75 d8                	jne    650 <vprintf.constprop.0+0x160>
        printptr(fd, va_arg(ap, uint));
 678:	8b 45 d0             	mov    -0x30(%ebp),%eax
      state = 0;
 67b:	31 ff                	xor    %edi,%edi
        printptr(fd, va_arg(ap, uint));
 67d:	89 45 d4             	mov    %eax,-0x2c(%ebp)
 680:	e9 a3 fe ff ff       	jmp    528 <vprintf.constprop.0+0x38>
 685:	8d 76 00             	lea    0x0(%esi),%esi
        s = va_arg(ap, char*);
 688:	8b 45 d4             	mov    -0x2c(%ebp),%eax
 68b:	8b 38                	mov    (%eax),%edi
 68d:	8d 48 04             	lea    0x4(%eax),%ecx
 690:	89 4d d4             	mov    %ecx,-0x2c(%ebp)
        if(s == 0)
 693:	85 ff                	test   %edi,%edi
 695:	74 64                	je     6fb <vprintf.constprop.0+0x20b>
        while(*s != 0){
 697:	0f b6 07             	movzbl (%edi),%eax
 69a:	84 c0                	test   %al,%al
 69c:	74 1f                	je     6bd <vprintf.constprop.0+0x1cd>
 69e:	66 90                	xchg   %ax,%ax
  write(fd, &c, 1);
 6a0:	83 ec 04             	sub    $0x4,%esp
          s++;
 6a3:	83 c7 01             	add    $0x1,%edi
 6a6:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
 6a9:	6a 01                	push   $0x1
 6ab:	56                   	push   %esi
 6ac:	6a 01                	push   $0x1
 6ae:	e8 00 fd ff ff       	call   3b3 <write>
        while(*s != 0){
 6b3:	0f b6 07             	movzbl (%edi),%eax
 6b6:	83 c4 10             	add    $0x10,%esp
 6b9:	84 c0                	test   %al,%al
 6bb:	75 e3                	jne    6a0 <vprintf.constprop.0+0x1b0>
      state = 0;
 6bd:	31 ff                	xor    %edi,%edi
 6bf:	e9 64 fe ff ff       	jmp    528 <vprintf.constprop.0+0x38>
 6c4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        printint(fd, va_arg(ap, int), 16, 0);
 6c8:	8b 45 d4             	mov    -0x2c(%ebp),%eax
 6cb:	31 c9                	xor    %ecx,%ecx
 6cd:	ba 10 00 00 00       	mov    $0x10,%edx
 6d2:	8d 78 04             	lea    0x4(%eax),%edi
 6d5:	8b 00                	mov    (%eax),%eax
 6d7:	e8 64 fd ff ff       	call   440 <printint.constprop.0>
 6dc:	89 7d d4             	mov    %edi,-0x2c(%ebp)
      state = 0;
 6df:	31 ff                	xor    %edi,%edi
 6e1:	e9 42 fe ff ff       	jmp    528 <vprintf.constprop.0+0x38>
 6e6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 6ed:	8d 76 00             	lea    0x0(%esi),%esi
        putc(fd, c);
 6f0:	88 55 e7             	mov    %dl,-0x19(%ebp)
  write(fd, &c, 1);
 6f3:	83 ec 04             	sub    $0x4,%esp
 6f6:	e9 a3 fe ff ff       	jmp    59e <vprintf.constprop.0+0xae>
          s = "(null)";
 6fb:	bf fb 08 00 00       	mov    $0x8fb,%edi
        while(*s != 0){
 700:	b8 28 00 00 00       	mov    $0x28,%eax
 705:	eb 99                	jmp    6a0 <vprintf.constprop.0+0x1b0>
 707:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 70e:	66 90                	xchg   %ax,%ax

00000710 <fprintf>:
// Print to the given fd. Only understands %d,%x, %p, %s, %c.
void
fprintf(int fd, const char *fmt, ...)
{
 710:	55                   	push   %ebp
 711:	89 e5                	mov    %esp,%ebp
 713:	83 ec 08             	sub    $0x8,%esp
 va_list ap;
 va_start(ap, fmt); 
 vprintf(1,fmt,ap);
 716:	8b 45 0c             	mov    0xc(%ebp),%eax
 719:	8d 55 10             	lea    0x10(%ebp),%edx
 71c:	e8 cf fd ff ff       	call   4f0 <vprintf.constprop.0>
}
 721:	c9                   	leave  
 722:	c3                   	ret    
 723:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 72a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00000730 <printf>:
void
printf(const char *fmt, ...)
{
 730:	55                   	push   %ebp
 731:	89 e5                	mov    %esp,%ebp
 733:	83 ec 08             	sub    $0x8,%esp
  va_list ap;
  va_start(ap, fmt); 
  vprintf(1,fmt,ap);
 736:	8b 45 08             	mov    0x8(%ebp),%eax
 739:	8d 55 0c             	lea    0xc(%ebp),%edx
 73c:	e8 af fd ff ff       	call   4f0 <vprintf.constprop.0>
}
 741:	c9                   	leave  
 742:	c3                   	ret    
 743:	66 90                	xchg   %ax,%ax
 745:	66 90                	xchg   %ax,%ax
 747:	66 90                	xchg   %ax,%ax
 749:	66 90                	xchg   %ax,%ax
 74b:	66 90                	xchg   %ax,%ax
 74d:	66 90                	xchg   %ax,%ax
 74f:	90                   	nop

00000750 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 750:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 751:	a1 70 09 00 00       	mov    0x970,%eax
{
 756:	89 e5                	mov    %esp,%ebp
 758:	57                   	push   %edi
 759:	56                   	push   %esi
 75a:	53                   	push   %ebx
 75b:	8b 5d 08             	mov    0x8(%ebp),%ebx
  bp = (Header*)ap - 1;
 75e:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 761:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 768:	89 c2                	mov    %eax,%edx
 76a:	8b 00                	mov    (%eax),%eax
 76c:	39 ca                	cmp    %ecx,%edx
 76e:	73 30                	jae    7a0 <free+0x50>
 770:	39 c1                	cmp    %eax,%ecx
 772:	72 04                	jb     778 <free+0x28>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 774:	39 c2                	cmp    %eax,%edx
 776:	72 f0                	jb     768 <free+0x18>
      break;
  if(bp + bp->s.size == p->s.ptr){
 778:	8b 73 fc             	mov    -0x4(%ebx),%esi
 77b:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 77e:	39 f8                	cmp    %edi,%eax
 780:	74 30                	je     7b2 <free+0x62>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
 782:	89 43 f8             	mov    %eax,-0x8(%ebx)
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
 785:	8b 42 04             	mov    0x4(%edx),%eax
 788:	8d 34 c2             	lea    (%edx,%eax,8),%esi
 78b:	39 f1                	cmp    %esi,%ecx
 78d:	74 3a                	je     7c9 <free+0x79>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
 78f:	89 0a                	mov    %ecx,(%edx)
  } else
    p->s.ptr = bp;
  freep = p;
}
 791:	5b                   	pop    %ebx
  freep = p;
 792:	89 15 70 09 00 00    	mov    %edx,0x970
}
 798:	5e                   	pop    %esi
 799:	5f                   	pop    %edi
 79a:	5d                   	pop    %ebp
 79b:	c3                   	ret    
 79c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 7a0:	39 c2                	cmp    %eax,%edx
 7a2:	72 c4                	jb     768 <free+0x18>
 7a4:	39 c1                	cmp    %eax,%ecx
 7a6:	73 c0                	jae    768 <free+0x18>
  if(bp + bp->s.size == p->s.ptr){
 7a8:	8b 73 fc             	mov    -0x4(%ebx),%esi
 7ab:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 7ae:	39 f8                	cmp    %edi,%eax
 7b0:	75 d0                	jne    782 <free+0x32>
    bp->s.size += p->s.ptr->s.size;
 7b2:	03 70 04             	add    0x4(%eax),%esi
 7b5:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 7b8:	8b 02                	mov    (%edx),%eax
 7ba:	8b 00                	mov    (%eax),%eax
 7bc:	89 43 f8             	mov    %eax,-0x8(%ebx)
  if(p + p->s.size == bp){
 7bf:	8b 42 04             	mov    0x4(%edx),%eax
 7c2:	8d 34 c2             	lea    (%edx,%eax,8),%esi
 7c5:	39 f1                	cmp    %esi,%ecx
 7c7:	75 c6                	jne    78f <free+0x3f>
    p->s.size += bp->s.size;
 7c9:	03 43 fc             	add    -0x4(%ebx),%eax
  freep = p;
 7cc:	89 15 70 09 00 00    	mov    %edx,0x970
    p->s.size += bp->s.size;
 7d2:	89 42 04             	mov    %eax,0x4(%edx)
    p->s.ptr = bp->s.ptr;
 7d5:	8b 4b f8             	mov    -0x8(%ebx),%ecx
 7d8:	89 0a                	mov    %ecx,(%edx)
}
 7da:	5b                   	pop    %ebx
 7db:	5e                   	pop    %esi
 7dc:	5f                   	pop    %edi
 7dd:	5d                   	pop    %ebp
 7de:	c3                   	ret    
 7df:	90                   	nop

000007e0 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 7e0:	55                   	push   %ebp
 7e1:	89 e5                	mov    %esp,%ebp
 7e3:	57                   	push   %edi
 7e4:	56                   	push   %esi
 7e5:	53                   	push   %ebx
 7e6:	83 ec 1c             	sub    $0x1c,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 7e9:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
 7ec:	8b 3d 70 09 00 00    	mov    0x970,%edi
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 7f2:	8d 70 07             	lea    0x7(%eax),%esi
 7f5:	c1 ee 03             	shr    $0x3,%esi
 7f8:	83 c6 01             	add    $0x1,%esi
  if((prevp = freep) == 0){
 7fb:	85 ff                	test   %edi,%edi
 7fd:	0f 84 9d 00 00 00    	je     8a0 <malloc+0xc0>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 803:	8b 17                	mov    (%edi),%edx
    if(p->s.size >= nunits){
 805:	8b 4a 04             	mov    0x4(%edx),%ecx
 808:	39 f1                	cmp    %esi,%ecx
 80a:	73 6a                	jae    876 <malloc+0x96>
 80c:	bb 00 10 00 00       	mov    $0x1000,%ebx
 811:	39 de                	cmp    %ebx,%esi
 813:	0f 43 de             	cmovae %esi,%ebx
  p = sbrk(nu * sizeof(Header));
 816:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
 81d:	89 45 e4             	mov    %eax,-0x1c(%ebp)
 820:	eb 17                	jmp    839 <malloc+0x59>
 822:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 828:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
 82a:	8b 48 04             	mov    0x4(%eax),%ecx
 82d:	39 f1                	cmp    %esi,%ecx
 82f:	73 4f                	jae    880 <malloc+0xa0>
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 831:	8b 3d 70 09 00 00    	mov    0x970,%edi
 837:	89 c2                	mov    %eax,%edx
 839:	39 d7                	cmp    %edx,%edi
 83b:	75 eb                	jne    828 <malloc+0x48>
  p = sbrk(nu * sizeof(Header));
 83d:	83 ec 0c             	sub    $0xc,%esp
 840:	ff 75 e4             	push   -0x1c(%ebp)
 843:	e8 d3 fb ff ff       	call   41b <sbrk>
  if(p == (char*)-1)
 848:	83 c4 10             	add    $0x10,%esp
 84b:	83 f8 ff             	cmp    $0xffffffff,%eax
 84e:	74 1c                	je     86c <malloc+0x8c>
  hp->s.size = nu;
 850:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 853:	83 ec 0c             	sub    $0xc,%esp
 856:	83 c0 08             	add    $0x8,%eax
 859:	50                   	push   %eax
 85a:	e8 f1 fe ff ff       	call   750 <free>
  return freep;
 85f:	8b 15 70 09 00 00    	mov    0x970,%edx
      if((p = morecore(nunits)) == 0)
 865:	83 c4 10             	add    $0x10,%esp
 868:	85 d2                	test   %edx,%edx
 86a:	75 bc                	jne    828 <malloc+0x48>
        return 0;
  }
}
 86c:	8d 65 f4             	lea    -0xc(%ebp),%esp
        return 0;
 86f:	31 c0                	xor    %eax,%eax
}
 871:	5b                   	pop    %ebx
 872:	5e                   	pop    %esi
 873:	5f                   	pop    %edi
 874:	5d                   	pop    %ebp
 875:	c3                   	ret    
    if(p->s.size >= nunits){
 876:	89 d0                	mov    %edx,%eax
 878:	89 fa                	mov    %edi,%edx
 87a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      if(p->s.size == nunits)
 880:	39 ce                	cmp    %ecx,%esi
 882:	74 4c                	je     8d0 <malloc+0xf0>
        p->s.size -= nunits;
 884:	29 f1                	sub    %esi,%ecx
 886:	89 48 04             	mov    %ecx,0x4(%eax)
        p += p->s.size;
 889:	8d 04 c8             	lea    (%eax,%ecx,8),%eax
        p->s.size = nunits;
 88c:	89 70 04             	mov    %esi,0x4(%eax)
      freep = prevp;
 88f:	89 15 70 09 00 00    	mov    %edx,0x970
}
 895:	8d 65 f4             	lea    -0xc(%ebp),%esp
      return (void*)(p + 1);
 898:	83 c0 08             	add    $0x8,%eax
}
 89b:	5b                   	pop    %ebx
 89c:	5e                   	pop    %esi
 89d:	5f                   	pop    %edi
 89e:	5d                   	pop    %ebp
 89f:	c3                   	ret    
    base.s.ptr = freep = prevp = &base;
 8a0:	c7 05 70 09 00 00 74 	movl   $0x974,0x970
 8a7:	09 00 00 
    base.s.size = 0;
 8aa:	bf 74 09 00 00       	mov    $0x974,%edi
    base.s.ptr = freep = prevp = &base;
 8af:	c7 05 74 09 00 00 74 	movl   $0x974,0x974
 8b6:	09 00 00 
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 8b9:	89 fa                	mov    %edi,%edx
    base.s.size = 0;
 8bb:	c7 05 78 09 00 00 00 	movl   $0x0,0x978
 8c2:	00 00 00 
    if(p->s.size >= nunits){
 8c5:	e9 42 ff ff ff       	jmp    80c <malloc+0x2c>
 8ca:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        prevp->s.ptr = p->s.ptr;
 8d0:	8b 08                	mov    (%eax),%ecx
 8d2:	89 0a                	mov    %ecx,(%edx)
 8d4:	eb b9                	jmp    88f <malloc+0xaf>
