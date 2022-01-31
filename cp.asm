
user/_cp:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
#include "kernel/types.h"
#include "user/user.h"
#include "kernel/fcntl.h"
int main(int argc, char *argv[]){
   0:	8d 4c 24 04          	lea    0x4(%esp),%ecx
   4:	83 e4 f0             	and    $0xfffffff0,%esp
   7:	ff 71 fc             	push   -0x4(%ecx)
   a:	55                   	push   %ebp
   b:	89 e5                	mov    %esp,%ebp
   d:	57                   	push   %edi
   e:	56                   	push   %esi
   f:	53                   	push   %ebx
  10:	51                   	push   %ecx
  11:	81 ec 18 02 00 00    	sub    $0x218,%esp
    char buffer[512];
    // Make sure the usage is correct by first checking for correct number of perameters
    if(argc > 3 || argc < 3){
  17:	83 39 03             	cmpl   $0x3,(%ecx)
int main(int argc, char *argv[]){
  1a:	8b 51 04             	mov    0x4(%ecx),%edx
    if(argc > 3 || argc < 3){
  1d:	74 13                	je     32 <main+0x32>
        fprintf(2, "Not the correct usage of command cp");
  1f:	50                   	push   %eax
  20:	50                   	push   %eax
  21:	68 78 08 00 00       	push   $0x878
  26:	6a 02                	push   $0x2
  28:	e8 83 06 00 00       	call   6b0 <fprintf>
        exit();
  2d:	e8 01 03 00 00       	call   333 <exit>
        //OR CALL man cp
    }
    //check if source and destination can open
    int srcf = open(argv[1], O_RDONLY); //src file
  32:	53                   	push   %ebx
  33:	53                   	push   %ebx
  34:	6a 00                	push   $0x0
  36:	ff 72 04             	push   0x4(%edx)
  39:	89 95 e4 fd ff ff    	mov    %edx,-0x21c(%ebp)
  3f:	e8 2f 03 00 00       	call   373 <open>
    int destf = open(argv[2], O_CREATE|O_RDWR); // dest file
  44:	8b 95 e4 fd ff ff    	mov    -0x21c(%ebp),%edx
  4a:	5f                   	pop    %edi
    int srcf = open(argv[1], O_RDONLY); //src file
  4b:	89 c6                	mov    %eax,%esi
    int destf = open(argv[2], O_CREATE|O_RDWR); // dest file
  4d:	58                   	pop    %eax
  4e:	68 02 02 00 00       	push   $0x202
  53:	ff 72 08             	push   0x8(%edx)
  56:	e8 18 03 00 00       	call   373 <open>
    if(srcf < 0){
  5b:	83 c4 10             	add    $0x10,%esp
  5e:	85 f6                	test   %esi,%esi
  60:	8b 95 e4 fd ff ff    	mov    -0x21c(%ebp),%edx
    int destf = open(argv[2], O_CREATE|O_RDWR); // dest file
  66:	89 c7                	mov    %eax,%edi
    if(srcf < 0){
  68:	78 60                	js     ca <main+0xca>
        fprintf(2, "Cannot open source file: %s \n", argv[1]);
        exit();
    }
    if (destf < 0){
  6a:	8d 9d e8 fd ff ff    	lea    -0x218(%ebp),%ebx
  70:	85 c0                	test   %eax,%eax
  72:	79 2a                	jns    9e <main+0x9e>
        fprintf(2, "Cannot open / Read or write destination file: %s \n ", argv[2]);
  74:	50                   	push   %eax
  75:	ff 72 08             	push   0x8(%edx)
  78:	68 9c 08 00 00       	push   $0x89c
  7d:	6a 02                	push   $0x2
  7f:	e8 2c 06 00 00       	call   6b0 <fprintf>
        exit();
  84:	e8 aa 02 00 00       	call   333 <exit>
  89:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    }
    int i;
    while((i = read(srcf, buffer, sizeof(buffer))) > 0){
        write(destf, buffer, i);
  90:	83 ec 04             	sub    $0x4,%esp
  93:	50                   	push   %eax
  94:	53                   	push   %ebx
  95:	57                   	push   %edi
  96:	e8 b8 02 00 00       	call   353 <write>
  9b:	83 c4 10             	add    $0x10,%esp
    while((i = read(srcf, buffer, sizeof(buffer))) > 0){
  9e:	83 ec 04             	sub    $0x4,%esp
  a1:	68 00 02 00 00       	push   $0x200
  a6:	53                   	push   %ebx
  a7:	56                   	push   %esi
  a8:	e8 9e 02 00 00       	call   34b <read>
  ad:	83 c4 10             	add    $0x10,%esp
  b0:	85 c0                	test   %eax,%eax
  b2:	7f dc                	jg     90 <main+0x90>
    }
    close(srcf);
  b4:	83 ec 0c             	sub    $0xc,%esp
  b7:	56                   	push   %esi
  b8:	e8 9e 02 00 00       	call   35b <close>
    close(destf);
  bd:	89 3c 24             	mov    %edi,(%esp)
  c0:	e8 96 02 00 00       	call   35b <close>
    exit();
  c5:	e8 69 02 00 00       	call   333 <exit>
        fprintf(2, "Cannot open source file: %s \n", argv[1]);
  ca:	51                   	push   %ecx
  cb:	ff 72 04             	push   0x4(%edx)
  ce:	68 d0 08 00 00       	push   $0x8d0
  d3:	6a 02                	push   $0x2
  d5:	e8 d6 05 00 00       	call   6b0 <fprintf>
        exit();
  da:	e8 54 02 00 00       	call   333 <exit>
  df:	90                   	nop

000000e0 <strcpy>:
#include "user/user.h"
#include "../kernel/x86.h"

char*
strcpy(char *s, const char *t)
{
  e0:	55                   	push   %ebp
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
  e1:	31 c0                	xor    %eax,%eax
{
  e3:	89 e5                	mov    %esp,%ebp
  e5:	53                   	push   %ebx
  e6:	8b 4d 08             	mov    0x8(%ebp),%ecx
  e9:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  ec:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  while((*s++ = *t++) != 0)
  f0:	0f b6 14 03          	movzbl (%ebx,%eax,1),%edx
  f4:	88 14 01             	mov    %dl,(%ecx,%eax,1)
  f7:	83 c0 01             	add    $0x1,%eax
  fa:	84 d2                	test   %dl,%dl
  fc:	75 f2                	jne    f0 <strcpy+0x10>
    ;
  return os;
}
  fe:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 101:	89 c8                	mov    %ecx,%eax
 103:	c9                   	leave  
 104:	c3                   	ret    
 105:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 10c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000110 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 110:	55                   	push   %ebp
 111:	89 e5                	mov    %esp,%ebp
 113:	53                   	push   %ebx
 114:	8b 55 08             	mov    0x8(%ebp),%edx
 117:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  while(*p && *p == *q)
 11a:	0f b6 02             	movzbl (%edx),%eax
 11d:	84 c0                	test   %al,%al
 11f:	75 17                	jne    138 <strcmp+0x28>
 121:	eb 3a                	jmp    15d <strcmp+0x4d>
 123:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 127:	90                   	nop
 128:	0f b6 42 01          	movzbl 0x1(%edx),%eax
    p++, q++;
 12c:	83 c2 01             	add    $0x1,%edx
 12f:	8d 59 01             	lea    0x1(%ecx),%ebx
  while(*p && *p == *q)
 132:	84 c0                	test   %al,%al
 134:	74 1a                	je     150 <strcmp+0x40>
    p++, q++;
 136:	89 d9                	mov    %ebx,%ecx
  while(*p && *p == *q)
 138:	0f b6 19             	movzbl (%ecx),%ebx
 13b:	38 c3                	cmp    %al,%bl
 13d:	74 e9                	je     128 <strcmp+0x18>
  return (uchar)*p - (uchar)*q;
 13f:	29 d8                	sub    %ebx,%eax
}
 141:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 144:	c9                   	leave  
 145:	c3                   	ret    
 146:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 14d:	8d 76 00             	lea    0x0(%esi),%esi
  return (uchar)*p - (uchar)*q;
 150:	0f b6 59 01          	movzbl 0x1(%ecx),%ebx
 154:	31 c0                	xor    %eax,%eax
 156:	29 d8                	sub    %ebx,%eax
}
 158:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 15b:	c9                   	leave  
 15c:	c3                   	ret    
  return (uchar)*p - (uchar)*q;
 15d:	0f b6 19             	movzbl (%ecx),%ebx
 160:	31 c0                	xor    %eax,%eax
 162:	eb db                	jmp    13f <strcmp+0x2f>
 164:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 16b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 16f:	90                   	nop

00000170 <strlen>:

uint
strlen(const char *s)
{
 170:	55                   	push   %ebp
 171:	89 e5                	mov    %esp,%ebp
 173:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  for(n = 0; s[n]; n++)
 176:	80 3a 00             	cmpb   $0x0,(%edx)
 179:	74 15                	je     190 <strlen+0x20>
 17b:	31 c0                	xor    %eax,%eax
 17d:	8d 76 00             	lea    0x0(%esi),%esi
 180:	83 c0 01             	add    $0x1,%eax
 183:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
 187:	89 c1                	mov    %eax,%ecx
 189:	75 f5                	jne    180 <strlen+0x10>
    ;
  return n;
}
 18b:	89 c8                	mov    %ecx,%eax
 18d:	5d                   	pop    %ebp
 18e:	c3                   	ret    
 18f:	90                   	nop
  for(n = 0; s[n]; n++)
 190:	31 c9                	xor    %ecx,%ecx
}
 192:	5d                   	pop    %ebp
 193:	89 c8                	mov    %ecx,%eax
 195:	c3                   	ret    
 196:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 19d:	8d 76 00             	lea    0x0(%esi),%esi

000001a0 <memset>:

void*
memset(void *dst, int c, uint n)
{
 1a0:	55                   	push   %ebp
 1a1:	89 e5                	mov    %esp,%ebp
 1a3:	57                   	push   %edi
 1a4:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 1a7:	8b 4d 10             	mov    0x10(%ebp),%ecx
 1aa:	8b 45 0c             	mov    0xc(%ebp),%eax
 1ad:	89 d7                	mov    %edx,%edi
 1af:	fc                   	cld    
 1b0:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 1b2:	8b 7d fc             	mov    -0x4(%ebp),%edi
 1b5:	89 d0                	mov    %edx,%eax
 1b7:	c9                   	leave  
 1b8:	c3                   	ret    
 1b9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

000001c0 <strchr>:

char*
strchr(const char *s, char c)
{
 1c0:	55                   	push   %ebp
 1c1:	89 e5                	mov    %esp,%ebp
 1c3:	8b 45 08             	mov    0x8(%ebp),%eax
 1c6:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 1ca:	0f b6 10             	movzbl (%eax),%edx
 1cd:	84 d2                	test   %dl,%dl
 1cf:	75 12                	jne    1e3 <strchr+0x23>
 1d1:	eb 1d                	jmp    1f0 <strchr+0x30>
 1d3:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 1d7:	90                   	nop
 1d8:	0f b6 50 01          	movzbl 0x1(%eax),%edx
 1dc:	83 c0 01             	add    $0x1,%eax
 1df:	84 d2                	test   %dl,%dl
 1e1:	74 0d                	je     1f0 <strchr+0x30>
    if(*s == c)
 1e3:	38 d1                	cmp    %dl,%cl
 1e5:	75 f1                	jne    1d8 <strchr+0x18>
      return (char*)s;
  return 0;
}
 1e7:	5d                   	pop    %ebp
 1e8:	c3                   	ret    
 1e9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  return 0;
 1f0:	31 c0                	xor    %eax,%eax
}
 1f2:	5d                   	pop    %ebp
 1f3:	c3                   	ret    
 1f4:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 1fb:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 1ff:	90                   	nop

00000200 <gets>:

char*
gets(char *buf, int max)
{
 200:	55                   	push   %ebp
 201:	89 e5                	mov    %esp,%ebp
 203:	57                   	push   %edi
 204:	56                   	push   %esi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    cc = read(0, &c, 1);
 205:	8d 7d e7             	lea    -0x19(%ebp),%edi
{
 208:	53                   	push   %ebx
  for(i=0; i+1 < max; ){
 209:	31 db                	xor    %ebx,%ebx
{
 20b:	83 ec 1c             	sub    $0x1c,%esp
  for(i=0; i+1 < max; ){
 20e:	eb 27                	jmp    237 <gets+0x37>
    cc = read(0, &c, 1);
 210:	83 ec 04             	sub    $0x4,%esp
 213:	6a 01                	push   $0x1
 215:	57                   	push   %edi
 216:	6a 00                	push   $0x0
 218:	e8 2e 01 00 00       	call   34b <read>
    if(cc < 1)
 21d:	83 c4 10             	add    $0x10,%esp
 220:	85 c0                	test   %eax,%eax
 222:	7e 1d                	jle    241 <gets+0x41>
      break;
    buf[i++] = c;
 224:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 228:	8b 55 08             	mov    0x8(%ebp),%edx
 22b:	88 44 1a ff          	mov    %al,-0x1(%edx,%ebx,1)
    if(c == '\n' || c == '\r')
 22f:	3c 0a                	cmp    $0xa,%al
 231:	74 1d                	je     250 <gets+0x50>
 233:	3c 0d                	cmp    $0xd,%al
 235:	74 19                	je     250 <gets+0x50>
  for(i=0; i+1 < max; ){
 237:	89 de                	mov    %ebx,%esi
 239:	83 c3 01             	add    $0x1,%ebx
 23c:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 23f:	7c cf                	jl     210 <gets+0x10>
      break;
  }
  buf[i] = '\0';
 241:	8b 45 08             	mov    0x8(%ebp),%eax
 244:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
  return buf;
}
 248:	8d 65 f4             	lea    -0xc(%ebp),%esp
 24b:	5b                   	pop    %ebx
 24c:	5e                   	pop    %esi
 24d:	5f                   	pop    %edi
 24e:	5d                   	pop    %ebp
 24f:	c3                   	ret    
  buf[i] = '\0';
 250:	8b 45 08             	mov    0x8(%ebp),%eax
 253:	89 de                	mov    %ebx,%esi
 255:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
}
 259:	8d 65 f4             	lea    -0xc(%ebp),%esp
 25c:	5b                   	pop    %ebx
 25d:	5e                   	pop    %esi
 25e:	5f                   	pop    %edi
 25f:	5d                   	pop    %ebp
 260:	c3                   	ret    
 261:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 268:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 26f:	90                   	nop

00000270 <stat>:

int
stat(const char *n, struct stat *st)
{
 270:	55                   	push   %ebp
 271:	89 e5                	mov    %esp,%ebp
 273:	56                   	push   %esi
 274:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 275:	83 ec 08             	sub    $0x8,%esp
 278:	6a 00                	push   $0x0
 27a:	ff 75 08             	push   0x8(%ebp)
 27d:	e8 f1 00 00 00       	call   373 <open>
  if(fd < 0)
 282:	83 c4 10             	add    $0x10,%esp
 285:	85 c0                	test   %eax,%eax
 287:	78 27                	js     2b0 <stat+0x40>
    return -1;
  r = fstat(fd, st);
 289:	83 ec 08             	sub    $0x8,%esp
 28c:	ff 75 0c             	push   0xc(%ebp)
 28f:	89 c3                	mov    %eax,%ebx
 291:	50                   	push   %eax
 292:	e8 f4 00 00 00       	call   38b <fstat>
  close(fd);
 297:	89 1c 24             	mov    %ebx,(%esp)
  r = fstat(fd, st);
 29a:	89 c6                	mov    %eax,%esi
  close(fd);
 29c:	e8 ba 00 00 00       	call   35b <close>
  return r;
 2a1:	83 c4 10             	add    $0x10,%esp
}
 2a4:	8d 65 f8             	lea    -0x8(%ebp),%esp
 2a7:	89 f0                	mov    %esi,%eax
 2a9:	5b                   	pop    %ebx
 2aa:	5e                   	pop    %esi
 2ab:	5d                   	pop    %ebp
 2ac:	c3                   	ret    
 2ad:	8d 76 00             	lea    0x0(%esi),%esi
    return -1;
 2b0:	be ff ff ff ff       	mov    $0xffffffff,%esi
 2b5:	eb ed                	jmp    2a4 <stat+0x34>
 2b7:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 2be:	66 90                	xchg   %ax,%ax

000002c0 <atoi>:

int
atoi(const char *s)
{
 2c0:	55                   	push   %ebp
 2c1:	89 e5                	mov    %esp,%ebp
 2c3:	53                   	push   %ebx
 2c4:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 2c7:	0f be 02             	movsbl (%edx),%eax
 2ca:	8d 48 d0             	lea    -0x30(%eax),%ecx
 2cd:	80 f9 09             	cmp    $0x9,%cl
  n = 0;
 2d0:	b9 00 00 00 00       	mov    $0x0,%ecx
  while('0' <= *s && *s <= '9')
 2d5:	77 1e                	ja     2f5 <atoi+0x35>
 2d7:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 2de:	66 90                	xchg   %ax,%ax
    n = n*10 + *s++ - '0';
 2e0:	83 c2 01             	add    $0x1,%edx
 2e3:	8d 0c 89             	lea    (%ecx,%ecx,4),%ecx
 2e6:	8d 4c 48 d0          	lea    -0x30(%eax,%ecx,2),%ecx
  while('0' <= *s && *s <= '9')
 2ea:	0f be 02             	movsbl (%edx),%eax
 2ed:	8d 58 d0             	lea    -0x30(%eax),%ebx
 2f0:	80 fb 09             	cmp    $0x9,%bl
 2f3:	76 eb                	jbe    2e0 <atoi+0x20>
  return n;
}
 2f5:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 2f8:	89 c8                	mov    %ecx,%eax
 2fa:	c9                   	leave  
 2fb:	c3                   	ret    
 2fc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000300 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 300:	55                   	push   %ebp
 301:	89 e5                	mov    %esp,%ebp
 303:	57                   	push   %edi
 304:	8b 45 10             	mov    0x10(%ebp),%eax
 307:	8b 55 08             	mov    0x8(%ebp),%edx
 30a:	56                   	push   %esi
 30b:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 30e:	85 c0                	test   %eax,%eax
 310:	7e 13                	jle    325 <memmove+0x25>
 312:	01 d0                	add    %edx,%eax
  dst = vdst;
 314:	89 d7                	mov    %edx,%edi
 316:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 31d:	8d 76 00             	lea    0x0(%esi),%esi
    *dst++ = *src++;
 320:	a4                   	movsb  %ds:(%esi),%es:(%edi)
  while(n-- > 0)
 321:	39 f8                	cmp    %edi,%eax
 323:	75 fb                	jne    320 <memmove+0x20>
  return vdst;
}
 325:	5e                   	pop    %esi
 326:	89 d0                	mov    %edx,%eax
 328:	5f                   	pop    %edi
 329:	5d                   	pop    %ebp
 32a:	c3                   	ret    

0000032b <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 32b:	b8 01 00 00 00       	mov    $0x1,%eax
 330:	cd 40                	int    $0x40
 332:	c3                   	ret    

00000333 <exit>:
SYSCALL(exit)
 333:	b8 02 00 00 00       	mov    $0x2,%eax
 338:	cd 40                	int    $0x40
 33a:	c3                   	ret    

0000033b <wait>:
SYSCALL(wait)
 33b:	b8 03 00 00 00       	mov    $0x3,%eax
 340:	cd 40                	int    $0x40
 342:	c3                   	ret    

00000343 <pipe>:
SYSCALL(pipe)
 343:	b8 04 00 00 00       	mov    $0x4,%eax
 348:	cd 40                	int    $0x40
 34a:	c3                   	ret    

0000034b <read>:
SYSCALL(read)
 34b:	b8 05 00 00 00       	mov    $0x5,%eax
 350:	cd 40                	int    $0x40
 352:	c3                   	ret    

00000353 <write>:
SYSCALL(write)
 353:	b8 10 00 00 00       	mov    $0x10,%eax
 358:	cd 40                	int    $0x40
 35a:	c3                   	ret    

0000035b <close>:
SYSCALL(close)
 35b:	b8 15 00 00 00       	mov    $0x15,%eax
 360:	cd 40                	int    $0x40
 362:	c3                   	ret    

00000363 <kill>:
SYSCALL(kill)
 363:	b8 06 00 00 00       	mov    $0x6,%eax
 368:	cd 40                	int    $0x40
 36a:	c3                   	ret    

0000036b <exec>:
SYSCALL(exec)
 36b:	b8 07 00 00 00       	mov    $0x7,%eax
 370:	cd 40                	int    $0x40
 372:	c3                   	ret    

00000373 <open>:
SYSCALL(open)
 373:	b8 0f 00 00 00       	mov    $0xf,%eax
 378:	cd 40                	int    $0x40
 37a:	c3                   	ret    

0000037b <mknod>:
SYSCALL(mknod)
 37b:	b8 11 00 00 00       	mov    $0x11,%eax
 380:	cd 40                	int    $0x40
 382:	c3                   	ret    

00000383 <unlink>:
SYSCALL(unlink)
 383:	b8 12 00 00 00       	mov    $0x12,%eax
 388:	cd 40                	int    $0x40
 38a:	c3                   	ret    

0000038b <fstat>:
SYSCALL(fstat)
 38b:	b8 08 00 00 00       	mov    $0x8,%eax
 390:	cd 40                	int    $0x40
 392:	c3                   	ret    

00000393 <link>:
SYSCALL(link)
 393:	b8 13 00 00 00       	mov    $0x13,%eax
 398:	cd 40                	int    $0x40
 39a:	c3                   	ret    

0000039b <mkdir>:
SYSCALL(mkdir)
 39b:	b8 14 00 00 00       	mov    $0x14,%eax
 3a0:	cd 40                	int    $0x40
 3a2:	c3                   	ret    

000003a3 <chdir>:
SYSCALL(chdir)
 3a3:	b8 09 00 00 00       	mov    $0x9,%eax
 3a8:	cd 40                	int    $0x40
 3aa:	c3                   	ret    

000003ab <dup>:
SYSCALL(dup)
 3ab:	b8 0a 00 00 00       	mov    $0xa,%eax
 3b0:	cd 40                	int    $0x40
 3b2:	c3                   	ret    

000003b3 <getpid>:
SYSCALL(getpid)
 3b3:	b8 0b 00 00 00       	mov    $0xb,%eax
 3b8:	cd 40                	int    $0x40
 3ba:	c3                   	ret    

000003bb <sbrk>:
SYSCALL(sbrk)
 3bb:	b8 0c 00 00 00       	mov    $0xc,%eax
 3c0:	cd 40                	int    $0x40
 3c2:	c3                   	ret    

000003c3 <sleep>:
SYSCALL(sleep)
 3c3:	b8 0d 00 00 00       	mov    $0xd,%eax
 3c8:	cd 40                	int    $0x40
 3ca:	c3                   	ret    

000003cb <uptime>:
SYSCALL(uptime)
 3cb:	b8 0e 00 00 00       	mov    $0xe,%eax
 3d0:	cd 40                	int    $0x40
 3d2:	c3                   	ret    

000003d3 <cpuhalt>:
SYSCALL(cpuhalt)
 3d3:	b8 16 00 00 00       	mov    $0x16,%eax
 3d8:	cd 40                	int    $0x40
 3da:	c3                   	ret    
 3db:	66 90                	xchg   %ax,%ax
 3dd:	66 90                	xchg   %ax,%ax
 3df:	90                   	nop

000003e0 <printint.constprop.0>:
  for (i = 0; i < (sizeof(uint) * 2); i++, x <<= 4)
    putc(fd, digits[x >> (sizeof(uint) * 8 - 4)]);
}

static void
printint(int fd, int xx, int base, int sgn)
 3e0:	55                   	push   %ebp
 3e1:	89 e5                	mov    %esp,%ebp
 3e3:	57                   	push   %edi
 3e4:	56                   	push   %esi
 3e5:	53                   	push   %ebx
 3e6:	83 ec 3c             	sub    $0x3c,%esp
 3e9:	89 55 c4             	mov    %edx,-0x3c(%ebp)
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 3ec:	85 c0                	test   %eax,%eax
 3ee:	0f 89 84 00 00 00    	jns    478 <printint.constprop.0+0x98>
 3f4:	83 e1 01             	and    $0x1,%ecx
 3f7:	74 7f                	je     478 <printint.constprop.0+0x98>
    neg = 1;
 3f9:	c7 45 bc 01 00 00 00 	movl   $0x1,-0x44(%ebp)
    x = -xx;
 400:	f7 d8                	neg    %eax
 402:	89 c1                	mov    %eax,%ecx
  } else {
    x = xx;
  }

  i = 0;
 404:	31 db                	xor    %ebx,%ebx
 406:	8d 75 d7             	lea    -0x29(%ebp),%esi
 409:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  do{
    buf[i++] = digits[x % base];
 410:	89 c8                	mov    %ecx,%eax
 412:	31 d2                	xor    %edx,%edx
 414:	89 cf                	mov    %ecx,%edi
 416:	f7 75 c4             	divl   -0x3c(%ebp)
 419:	0f b6 92 50 09 00 00 	movzbl 0x950(%edx),%edx
 420:	89 45 c0             	mov    %eax,-0x40(%ebp)
 423:	89 d8                	mov    %ebx,%eax
 425:	8d 5b 01             	lea    0x1(%ebx),%ebx
  }while((x /= base) != 0);
 428:	8b 4d c0             	mov    -0x40(%ebp),%ecx
    buf[i++] = digits[x % base];
 42b:	88 14 1e             	mov    %dl,(%esi,%ebx,1)
  }while((x /= base) != 0);
 42e:	3b 7d c4             	cmp    -0x3c(%ebp),%edi
 431:	73 dd                	jae    410 <printint.constprop.0+0x30>
  if(neg)
 433:	8b 4d bc             	mov    -0x44(%ebp),%ecx
 436:	85 c9                	test   %ecx,%ecx
 438:	74 0c                	je     446 <printint.constprop.0+0x66>
    buf[i++] = '-';
 43a:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
    buf[i++] = digits[x % base];
 43f:	89 d8                	mov    %ebx,%eax
    buf[i++] = '-';
 441:	ba 2d 00 00 00       	mov    $0x2d,%edx

  while(--i >= 0)
 446:	8d 5c 05 d7          	lea    -0x29(%ebp,%eax,1),%ebx
 44a:	eb 0a                	jmp    456 <printint.constprop.0+0x76>
 44c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    putc(fd, buf[i]);
 450:	0f b6 13             	movzbl (%ebx),%edx
 453:	83 eb 01             	sub    $0x1,%ebx
  write(fd, &c, 1);
 456:	83 ec 04             	sub    $0x4,%esp
 459:	88 55 d7             	mov    %dl,-0x29(%ebp)
 45c:	6a 01                	push   $0x1
 45e:	56                   	push   %esi
 45f:	6a 01                	push   $0x1
 461:	e8 ed fe ff ff       	call   353 <write>
  while(--i >= 0)
 466:	83 c4 10             	add    $0x10,%esp
 469:	39 de                	cmp    %ebx,%esi
 46b:	75 e3                	jne    450 <printint.constprop.0+0x70>
}
 46d:	8d 65 f4             	lea    -0xc(%ebp),%esp
 470:	5b                   	pop    %ebx
 471:	5e                   	pop    %esi
 472:	5f                   	pop    %edi
 473:	5d                   	pop    %ebp
 474:	c3                   	ret    
 475:	8d 76 00             	lea    0x0(%esi),%esi
  neg = 0;
 478:	c7 45 bc 00 00 00 00 	movl   $0x0,-0x44(%ebp)
    x = xx;
 47f:	89 c1                	mov    %eax,%ecx
 481:	eb 81                	jmp    404 <printint.constprop.0+0x24>
 483:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 48a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00000490 <vprintf.constprop.0>:
static void vprintf(int fd, const char *fmt, va_list ap)
 490:	55                   	push   %ebp
 491:	89 e5                	mov    %esp,%ebp
 493:	57                   	push   %edi
 494:	56                   	push   %esi
 495:	53                   	push   %ebx
 496:	83 ec 2c             	sub    $0x2c,%esp
 499:	89 55 d4             	mov    %edx,-0x2c(%ebp)
{
  char *s;
  int c, i, state;

  state = 0;
  for(i = 0; fmt[i]; i++){
 49c:	0f b6 10             	movzbl (%eax),%edx
 49f:	84 d2                	test   %dl,%dl
 4a1:	74 6c                	je     50f <vprintf.constprop.0+0x7f>
 4a3:	8d 58 01             	lea    0x1(%eax),%ebx
 4a6:	31 ff                	xor    %edi,%edi
 4a8:	8d 75 e7             	lea    -0x19(%ebp),%esi
 4ab:	eb 25                	jmp    4d2 <vprintf.constprop.0+0x42>
 4ad:	8d 76 00             	lea    0x0(%esi),%esi
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
 4b0:	83 f8 25             	cmp    $0x25,%eax
 4b3:	74 4b                	je     500 <vprintf.constprop.0+0x70>
  write(fd, &c, 1);
 4b5:	83 ec 04             	sub    $0x4,%esp
 4b8:	88 55 e7             	mov    %dl,-0x19(%ebp)
 4bb:	6a 01                	push   $0x1
 4bd:	56                   	push   %esi
 4be:	6a 01                	push   $0x1
 4c0:	e8 8e fe ff ff       	call   353 <write>
        state = '%';
      } else {
        putc(fd, c);
 4c5:	83 c4 10             	add    $0x10,%esp
  for(i = 0; fmt[i]; i++){
 4c8:	0f b6 13             	movzbl (%ebx),%edx
 4cb:	83 c3 01             	add    $0x1,%ebx
 4ce:	84 d2                	test   %dl,%dl
 4d0:	74 3d                	je     50f <vprintf.constprop.0+0x7f>
    c = fmt[i] & 0xff;
 4d2:	0f b6 c2             	movzbl %dl,%eax
    if(state == 0){
 4d5:	85 ff                	test   %edi,%edi
 4d7:	74 d7                	je     4b0 <vprintf.constprop.0+0x20>
      }
    } else if(state == '%'){
 4d9:	83 ff 25             	cmp    $0x25,%edi
 4dc:	75 ea                	jne    4c8 <vprintf.constprop.0+0x38>
      if(c == 'd'){
 4de:	83 f8 25             	cmp    $0x25,%eax
 4e1:	0f 84 a9 01 00 00    	je     690 <vprintf.constprop.0+0x200>
 4e7:	83 e8 63             	sub    $0x63,%eax
 4ea:	83 f8 15             	cmp    $0x15,%eax
 4ed:	77 31                	ja     520 <vprintf.constprop.0+0x90>
 4ef:	ff 24 85 f8 08 00 00 	jmp    *0x8f8(,%eax,4)
 4f6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 4fd:	8d 76 00             	lea    0x0(%esi),%esi
  for(i = 0; fmt[i]; i++){
 500:	0f b6 13             	movzbl (%ebx),%edx
 503:	83 c3 01             	add    $0x1,%ebx
        state = '%';
 506:	bf 25 00 00 00       	mov    $0x25,%edi
  for(i = 0; fmt[i]; i++){
 50b:	84 d2                	test   %dl,%dl
 50d:	75 c3                	jne    4d2 <vprintf.constprop.0+0x42>
        putc(fd, c);
      }
      state = 0;
    }
  }
}
 50f:	8d 65 f4             	lea    -0xc(%ebp),%esp
 512:	5b                   	pop    %ebx
 513:	5e                   	pop    %esi
 514:	5f                   	pop    %edi
 515:	5d                   	pop    %ebp
 516:	c3                   	ret    
 517:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 51e:	66 90                	xchg   %ax,%ax
  write(fd, &c, 1);
 520:	83 ec 04             	sub    $0x4,%esp
 523:	88 55 d0             	mov    %dl,-0x30(%ebp)
 526:	6a 01                	push   $0x1
 528:	56                   	push   %esi
 529:	6a 01                	push   $0x1
 52b:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
 52f:	e8 1f fe ff ff       	call   353 <write>
        putc(fd, c);
 534:	0f b6 55 d0          	movzbl -0x30(%ebp),%edx
  write(fd, &c, 1);
 538:	83 c4 0c             	add    $0xc,%esp
 53b:	88 55 e7             	mov    %dl,-0x19(%ebp)
 53e:	6a 01                	push   $0x1
      state = 0;
 540:	31 ff                	xor    %edi,%edi
  write(fd, &c, 1);
 542:	56                   	push   %esi
 543:	6a 01                	push   $0x1
 545:	e8 09 fe ff ff       	call   353 <write>
        putc(fd, c);
 54a:	83 c4 10             	add    $0x10,%esp
 54d:	e9 76 ff ff ff       	jmp    4c8 <vprintf.constprop.0+0x38>
 552:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        putc(fd, va_arg(ap, uint));
 558:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  write(fd, &c, 1);
 55b:	83 ec 04             	sub    $0x4,%esp
        putc(fd, va_arg(ap, uint));
 55e:	8d 78 04             	lea    0x4(%eax),%edi
 561:	8b 00                	mov    (%eax),%eax
  write(fd, &c, 1);
 563:	6a 01                	push   $0x1
 565:	56                   	push   %esi
 566:	6a 01                	push   $0x1
        putc(fd, va_arg(ap, uint));
 568:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
 56b:	e8 e3 fd ff ff       	call   353 <write>
        putc(fd, va_arg(ap, uint));
 570:	89 7d d4             	mov    %edi,-0x2c(%ebp)
 573:	83 c4 10             	add    $0x10,%esp
      state = 0;
 576:	31 ff                	xor    %edi,%edi
 578:	e9 4b ff ff ff       	jmp    4c8 <vprintf.constprop.0+0x38>
 57d:	8d 76 00             	lea    0x0(%esi),%esi
        printint(fd, va_arg(ap, int), 10, 1);
 580:	8b 45 d4             	mov    -0x2c(%ebp),%eax
 583:	b9 01 00 00 00       	mov    $0x1,%ecx
 588:	8d 78 04             	lea    0x4(%eax),%edi
        printint(fd, va_arg(ap, uint), 10, 0);
 58b:	8b 00                	mov    (%eax),%eax
 58d:	ba 0a 00 00 00       	mov    $0xa,%edx
 592:	e8 49 fe ff ff       	call   3e0 <printint.constprop.0>
 597:	89 7d d4             	mov    %edi,-0x2c(%ebp)
      state = 0;
 59a:	31 ff                	xor    %edi,%edi
 59c:	e9 27 ff ff ff       	jmp    4c8 <vprintf.constprop.0+0x38>
 5a1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        printint(fd, va_arg(ap, uint), 10, 0);
 5a8:	8b 45 d4             	mov    -0x2c(%ebp),%eax
 5ab:	31 c9                	xor    %ecx,%ecx
 5ad:	8d 78 04             	lea    0x4(%eax),%edi
 5b0:	eb d9                	jmp    58b <vprintf.constprop.0+0xfb>
 5b2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        printptr(fd, va_arg(ap, uint));
 5b8:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  write(fd, &c, 1);
 5bb:	83 ec 04             	sub    $0x4,%esp
 5be:	c6 45 e7 30          	movb   $0x30,-0x19(%ebp)
        printptr(fd, va_arg(ap, uint));
 5c2:	8b 38                	mov    (%eax),%edi
  write(fd, &c, 1);
 5c4:	6a 01                	push   $0x1
        printptr(fd, va_arg(ap, uint));
 5c6:	8d 48 04             	lea    0x4(%eax),%ecx
  write(fd, &c, 1);
 5c9:	56                   	push   %esi
 5ca:	6a 01                	push   $0x1
        printptr(fd, va_arg(ap, uint));
 5cc:	89 4d d0             	mov    %ecx,-0x30(%ebp)
  write(fd, &c, 1);
 5cf:	e8 7f fd ff ff       	call   353 <write>
 5d4:	83 c4 0c             	add    $0xc,%esp
 5d7:	c6 45 e7 78          	movb   $0x78,-0x19(%ebp)
 5db:	6a 01                	push   $0x1
 5dd:	56                   	push   %esi
 5de:	6a 01                	push   $0x1
 5e0:	e8 6e fd ff ff       	call   353 <write>
  putc(fd, 'x');
 5e5:	c7 45 d4 08 00 00 00 	movl   $0x8,-0x2c(%ebp)
 5ec:	83 c4 10             	add    $0x10,%esp
 5ef:	90                   	nop
  write(fd, &c, 1);
 5f0:	83 ec 04             	sub    $0x4,%esp
    putc(fd, digits[x >> (sizeof(uint) * 8 - 4)]);
 5f3:	89 f8                	mov    %edi,%eax
  for (i = 0; i < (sizeof(uint) * 2); i++, x <<= 4)
 5f5:	c1 e7 04             	shl    $0x4,%edi
  write(fd, &c, 1);
 5f8:	6a 01                	push   $0x1
    putc(fd, digits[x >> (sizeof(uint) * 8 - 4)]);
 5fa:	c1 e8 1c             	shr    $0x1c,%eax
  write(fd, &c, 1);
 5fd:	56                   	push   %esi
 5fe:	0f b6 80 50 09 00 00 	movzbl 0x950(%eax),%eax
 605:	6a 01                	push   $0x1
 607:	88 45 e7             	mov    %al,-0x19(%ebp)
 60a:	e8 44 fd ff ff       	call   353 <write>
  for (i = 0; i < (sizeof(uint) * 2); i++, x <<= 4)
 60f:	83 c4 10             	add    $0x10,%esp
 612:	83 6d d4 01          	subl   $0x1,-0x2c(%ebp)
 616:	75 d8                	jne    5f0 <vprintf.constprop.0+0x160>
        printptr(fd, va_arg(ap, uint));
 618:	8b 45 d0             	mov    -0x30(%ebp),%eax
      state = 0;
 61b:	31 ff                	xor    %edi,%edi
        printptr(fd, va_arg(ap, uint));
 61d:	89 45 d4             	mov    %eax,-0x2c(%ebp)
 620:	e9 a3 fe ff ff       	jmp    4c8 <vprintf.constprop.0+0x38>
 625:	8d 76 00             	lea    0x0(%esi),%esi
        s = va_arg(ap, char*);
 628:	8b 45 d4             	mov    -0x2c(%ebp),%eax
 62b:	8b 38                	mov    (%eax),%edi
 62d:	8d 48 04             	lea    0x4(%eax),%ecx
 630:	89 4d d4             	mov    %ecx,-0x2c(%ebp)
        if(s == 0)
 633:	85 ff                	test   %edi,%edi
 635:	74 64                	je     69b <vprintf.constprop.0+0x20b>
        while(*s != 0){
 637:	0f b6 07             	movzbl (%edi),%eax
 63a:	84 c0                	test   %al,%al
 63c:	74 1f                	je     65d <vprintf.constprop.0+0x1cd>
 63e:	66 90                	xchg   %ax,%ax
  write(fd, &c, 1);
 640:	83 ec 04             	sub    $0x4,%esp
          s++;
 643:	83 c7 01             	add    $0x1,%edi
 646:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
 649:	6a 01                	push   $0x1
 64b:	56                   	push   %esi
 64c:	6a 01                	push   $0x1
 64e:	e8 00 fd ff ff       	call   353 <write>
        while(*s != 0){
 653:	0f b6 07             	movzbl (%edi),%eax
 656:	83 c4 10             	add    $0x10,%esp
 659:	84 c0                	test   %al,%al
 65b:	75 e3                	jne    640 <vprintf.constprop.0+0x1b0>
      state = 0;
 65d:	31 ff                	xor    %edi,%edi
 65f:	e9 64 fe ff ff       	jmp    4c8 <vprintf.constprop.0+0x38>
 664:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        printint(fd, va_arg(ap, int), 16, 0);
 668:	8b 45 d4             	mov    -0x2c(%ebp),%eax
 66b:	31 c9                	xor    %ecx,%ecx
 66d:	ba 10 00 00 00       	mov    $0x10,%edx
 672:	8d 78 04             	lea    0x4(%eax),%edi
 675:	8b 00                	mov    (%eax),%eax
 677:	e8 64 fd ff ff       	call   3e0 <printint.constprop.0>
 67c:	89 7d d4             	mov    %edi,-0x2c(%ebp)
      state = 0;
 67f:	31 ff                	xor    %edi,%edi
 681:	e9 42 fe ff ff       	jmp    4c8 <vprintf.constprop.0+0x38>
 686:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 68d:	8d 76 00             	lea    0x0(%esi),%esi
        putc(fd, c);
 690:	88 55 e7             	mov    %dl,-0x19(%ebp)
  write(fd, &c, 1);
 693:	83 ec 04             	sub    $0x4,%esp
 696:	e9 a3 fe ff ff       	jmp    53e <vprintf.constprop.0+0xae>
          s = "(null)";
 69b:	bf ee 08 00 00       	mov    $0x8ee,%edi
        while(*s != 0){
 6a0:	b8 28 00 00 00       	mov    $0x28,%eax
 6a5:	eb 99                	jmp    640 <vprintf.constprop.0+0x1b0>
 6a7:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 6ae:	66 90                	xchg   %ax,%ax

000006b0 <fprintf>:
// Print to the given fd. Only understands %d,%x, %p, %s, %c.
void
fprintf(int fd, const char *fmt, ...)
{
 6b0:	55                   	push   %ebp
 6b1:	89 e5                	mov    %esp,%ebp
 6b3:	83 ec 08             	sub    $0x8,%esp
 va_list ap;
 va_start(ap, fmt); 
 vprintf(1,fmt,ap);
 6b6:	8b 45 0c             	mov    0xc(%ebp),%eax
 6b9:	8d 55 10             	lea    0x10(%ebp),%edx
 6bc:	e8 cf fd ff ff       	call   490 <vprintf.constprop.0>
}
 6c1:	c9                   	leave  
 6c2:	c3                   	ret    
 6c3:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 6ca:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

000006d0 <printf>:
void
printf(const char *fmt, ...)
{
 6d0:	55                   	push   %ebp
 6d1:	89 e5                	mov    %esp,%ebp
 6d3:	83 ec 08             	sub    $0x8,%esp
  va_list ap;
  va_start(ap, fmt); 
  vprintf(1,fmt,ap);
 6d6:	8b 45 08             	mov    0x8(%ebp),%eax
 6d9:	8d 55 0c             	lea    0xc(%ebp),%edx
 6dc:	e8 af fd ff ff       	call   490 <vprintf.constprop.0>
}
 6e1:	c9                   	leave  
 6e2:	c3                   	ret    
 6e3:	66 90                	xchg   %ax,%ax
 6e5:	66 90                	xchg   %ax,%ax
 6e7:	66 90                	xchg   %ax,%ax
 6e9:	66 90                	xchg   %ax,%ax
 6eb:	66 90                	xchg   %ax,%ax
 6ed:	66 90                	xchg   %ax,%ax
 6ef:	90                   	nop

000006f0 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 6f0:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 6f1:	a1 64 09 00 00       	mov    0x964,%eax
{
 6f6:	89 e5                	mov    %esp,%ebp
 6f8:	57                   	push   %edi
 6f9:	56                   	push   %esi
 6fa:	53                   	push   %ebx
 6fb:	8b 5d 08             	mov    0x8(%ebp),%ebx
  bp = (Header*)ap - 1;
 6fe:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 701:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 708:	89 c2                	mov    %eax,%edx
 70a:	8b 00                	mov    (%eax),%eax
 70c:	39 ca                	cmp    %ecx,%edx
 70e:	73 30                	jae    740 <free+0x50>
 710:	39 c1                	cmp    %eax,%ecx
 712:	72 04                	jb     718 <free+0x28>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 714:	39 c2                	cmp    %eax,%edx
 716:	72 f0                	jb     708 <free+0x18>
      break;
  if(bp + bp->s.size == p->s.ptr){
 718:	8b 73 fc             	mov    -0x4(%ebx),%esi
 71b:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 71e:	39 f8                	cmp    %edi,%eax
 720:	74 30                	je     752 <free+0x62>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
 722:	89 43 f8             	mov    %eax,-0x8(%ebx)
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
 725:	8b 42 04             	mov    0x4(%edx),%eax
 728:	8d 34 c2             	lea    (%edx,%eax,8),%esi
 72b:	39 f1                	cmp    %esi,%ecx
 72d:	74 3a                	je     769 <free+0x79>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
 72f:	89 0a                	mov    %ecx,(%edx)
  } else
    p->s.ptr = bp;
  freep = p;
}
 731:	5b                   	pop    %ebx
  freep = p;
 732:	89 15 64 09 00 00    	mov    %edx,0x964
}
 738:	5e                   	pop    %esi
 739:	5f                   	pop    %edi
 73a:	5d                   	pop    %ebp
 73b:	c3                   	ret    
 73c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 740:	39 c2                	cmp    %eax,%edx
 742:	72 c4                	jb     708 <free+0x18>
 744:	39 c1                	cmp    %eax,%ecx
 746:	73 c0                	jae    708 <free+0x18>
  if(bp + bp->s.size == p->s.ptr){
 748:	8b 73 fc             	mov    -0x4(%ebx),%esi
 74b:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 74e:	39 f8                	cmp    %edi,%eax
 750:	75 d0                	jne    722 <free+0x32>
    bp->s.size += p->s.ptr->s.size;
 752:	03 70 04             	add    0x4(%eax),%esi
 755:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 758:	8b 02                	mov    (%edx),%eax
 75a:	8b 00                	mov    (%eax),%eax
 75c:	89 43 f8             	mov    %eax,-0x8(%ebx)
  if(p + p->s.size == bp){
 75f:	8b 42 04             	mov    0x4(%edx),%eax
 762:	8d 34 c2             	lea    (%edx,%eax,8),%esi
 765:	39 f1                	cmp    %esi,%ecx
 767:	75 c6                	jne    72f <free+0x3f>
    p->s.size += bp->s.size;
 769:	03 43 fc             	add    -0x4(%ebx),%eax
  freep = p;
 76c:	89 15 64 09 00 00    	mov    %edx,0x964
    p->s.size += bp->s.size;
 772:	89 42 04             	mov    %eax,0x4(%edx)
    p->s.ptr = bp->s.ptr;
 775:	8b 4b f8             	mov    -0x8(%ebx),%ecx
 778:	89 0a                	mov    %ecx,(%edx)
}
 77a:	5b                   	pop    %ebx
 77b:	5e                   	pop    %esi
 77c:	5f                   	pop    %edi
 77d:	5d                   	pop    %ebp
 77e:	c3                   	ret    
 77f:	90                   	nop

00000780 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 780:	55                   	push   %ebp
 781:	89 e5                	mov    %esp,%ebp
 783:	57                   	push   %edi
 784:	56                   	push   %esi
 785:	53                   	push   %ebx
 786:	83 ec 1c             	sub    $0x1c,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 789:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
 78c:	8b 3d 64 09 00 00    	mov    0x964,%edi
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 792:	8d 70 07             	lea    0x7(%eax),%esi
 795:	c1 ee 03             	shr    $0x3,%esi
 798:	83 c6 01             	add    $0x1,%esi
  if((prevp = freep) == 0){
 79b:	85 ff                	test   %edi,%edi
 79d:	0f 84 9d 00 00 00    	je     840 <malloc+0xc0>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 7a3:	8b 17                	mov    (%edi),%edx
    if(p->s.size >= nunits){
 7a5:	8b 4a 04             	mov    0x4(%edx),%ecx
 7a8:	39 f1                	cmp    %esi,%ecx
 7aa:	73 6a                	jae    816 <malloc+0x96>
 7ac:	bb 00 10 00 00       	mov    $0x1000,%ebx
 7b1:	39 de                	cmp    %ebx,%esi
 7b3:	0f 43 de             	cmovae %esi,%ebx
  p = sbrk(nu * sizeof(Header));
 7b6:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
 7bd:	89 45 e4             	mov    %eax,-0x1c(%ebp)
 7c0:	eb 17                	jmp    7d9 <malloc+0x59>
 7c2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 7c8:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
 7ca:	8b 48 04             	mov    0x4(%eax),%ecx
 7cd:	39 f1                	cmp    %esi,%ecx
 7cf:	73 4f                	jae    820 <malloc+0xa0>
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 7d1:	8b 3d 64 09 00 00    	mov    0x964,%edi
 7d7:	89 c2                	mov    %eax,%edx
 7d9:	39 d7                	cmp    %edx,%edi
 7db:	75 eb                	jne    7c8 <malloc+0x48>
  p = sbrk(nu * sizeof(Header));
 7dd:	83 ec 0c             	sub    $0xc,%esp
 7e0:	ff 75 e4             	push   -0x1c(%ebp)
 7e3:	e8 d3 fb ff ff       	call   3bb <sbrk>
  if(p == (char*)-1)
 7e8:	83 c4 10             	add    $0x10,%esp
 7eb:	83 f8 ff             	cmp    $0xffffffff,%eax
 7ee:	74 1c                	je     80c <malloc+0x8c>
  hp->s.size = nu;
 7f0:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 7f3:	83 ec 0c             	sub    $0xc,%esp
 7f6:	83 c0 08             	add    $0x8,%eax
 7f9:	50                   	push   %eax
 7fa:	e8 f1 fe ff ff       	call   6f0 <free>
  return freep;
 7ff:	8b 15 64 09 00 00    	mov    0x964,%edx
      if((p = morecore(nunits)) == 0)
 805:	83 c4 10             	add    $0x10,%esp
 808:	85 d2                	test   %edx,%edx
 80a:	75 bc                	jne    7c8 <malloc+0x48>
        return 0;
  }
}
 80c:	8d 65 f4             	lea    -0xc(%ebp),%esp
        return 0;
 80f:	31 c0                	xor    %eax,%eax
}
 811:	5b                   	pop    %ebx
 812:	5e                   	pop    %esi
 813:	5f                   	pop    %edi
 814:	5d                   	pop    %ebp
 815:	c3                   	ret    
    if(p->s.size >= nunits){
 816:	89 d0                	mov    %edx,%eax
 818:	89 fa                	mov    %edi,%edx
 81a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      if(p->s.size == nunits)
 820:	39 ce                	cmp    %ecx,%esi
 822:	74 4c                	je     870 <malloc+0xf0>
        p->s.size -= nunits;
 824:	29 f1                	sub    %esi,%ecx
 826:	89 48 04             	mov    %ecx,0x4(%eax)
        p += p->s.size;
 829:	8d 04 c8             	lea    (%eax,%ecx,8),%eax
        p->s.size = nunits;
 82c:	89 70 04             	mov    %esi,0x4(%eax)
      freep = prevp;
 82f:	89 15 64 09 00 00    	mov    %edx,0x964
}
 835:	8d 65 f4             	lea    -0xc(%ebp),%esp
      return (void*)(p + 1);
 838:	83 c0 08             	add    $0x8,%eax
}
 83b:	5b                   	pop    %ebx
 83c:	5e                   	pop    %esi
 83d:	5f                   	pop    %edi
 83e:	5d                   	pop    %ebp
 83f:	c3                   	ret    
    base.s.ptr = freep = prevp = &base;
 840:	c7 05 64 09 00 00 68 	movl   $0x968,0x964
 847:	09 00 00 
    base.s.size = 0;
 84a:	bf 68 09 00 00       	mov    $0x968,%edi
    base.s.ptr = freep = prevp = &base;
 84f:	c7 05 68 09 00 00 68 	movl   $0x968,0x968
 856:	09 00 00 
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 859:	89 fa                	mov    %edi,%edx
    base.s.size = 0;
 85b:	c7 05 6c 09 00 00 00 	movl   $0x0,0x96c
 862:	00 00 00 
    if(p->s.size >= nunits){
 865:	e9 42 ff ff ff       	jmp    7ac <malloc+0x2c>
 86a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        prevp->s.ptr = p->s.ptr;
 870:	8b 08                	mov    (%eax),%ecx
 872:	89 0a                	mov    %ecx,(%edx)
 874:	eb b9                	jmp    82f <malloc+0xaf>
