
user/_mv:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
#include "kernel/fcntl.h"
#include "kernel/stat.h"
#include "kernel/fs.h"

int main(int argc, char *argv[])
{
   0:	8d 4c 24 04          	lea    0x4(%esp),%ecx
   4:	83 e4 f0             	and    $0xfffffff0,%esp
   7:	ff 71 fc             	push   -0x4(%ecx)
   a:	55                   	push   %ebp
   b:	89 e5                	mov    %esp,%ebp
   d:	57                   	push   %edi
   e:	56                   	push   %esi
   f:	53                   	push   %ebx
  10:	51                   	push   %ecx
  11:	81 ec 38 02 00 00    	sub    $0x238,%esp
    char buf[512];
    // Declare
    int d1,d2,n;
    struct stat st;
    // Check if there is a file
    if (argc != 3)
  17:	83 39 03             	cmpl   $0x3,(%ecx)
{
  1a:	8b 71 04             	mov    0x4(%ecx),%esi
    if (argc != 3)
  1d:	74 13                	je     32 <main+0x32>
    {
        fprintf(2, "mv: too many or less args\n");
  1f:	52                   	push   %edx
  20:	52                   	push   %edx
  21:	68 48 09 00 00       	push   $0x948
  26:	6a 02                	push   $0x2
  28:	e8 53 07 00 00       	call   780 <fprintf>
        exit();
  2d:	e8 d1 03 00 00       	call   403 <exit>
    }
    
    // Check if the file can open
    if((d1 = open(argv[1], O_RDONLY)) < 0){
  32:	50                   	push   %eax
  33:	50                   	push   %eax
  34:	6a 00                	push   $0x0
  36:	ff 76 04             	push   0x4(%esi)
  39:	e8 05 04 00 00       	call   443 <open>
  3e:	83 c4 10             	add    $0x10,%esp
  41:	89 c3                	mov    %eax,%ebx
  43:	85 c0                	test   %eax,%eax
  45:	78 65                	js     ac <main+0xac>
        fprintf(2, "mv: Can't open %s\n", argv[1]);
        exit();
    }
    // Check if the file can open
    if(fstat(d1, & st) < 0){
  47:	50                   	push   %eax
  48:	50                   	push   %eax
  49:	8d 85 d4 fd ff ff    	lea    -0x22c(%ebp),%eax
  4f:	50                   	push   %eax
  50:	53                   	push   %ebx
  51:	e8 05 04 00 00       	call   45b <fstat>
  56:	83 c4 10             	add    $0x10,%esp
  59:	85 c0                	test   %eax,%eax
  5b:	78 32                	js     8f <main+0x8f>
        fprintf(2, "mv: Can't open %s\n", argv[1]);
        close(d1);
        exit();
    }
    // File type check
    if (st.type == T_FILE)
  5d:	66 83 bd d4 fd ff ff 	cmpw   $0x2,-0x22c(%ebp)
  64:	02 
  65:	74 5a                	je     c1 <main+0xc1>
        }
        close(d2);
    }
    else
    {
        fprintf(2, "mv: invalid args");
  67:	52                   	push   %edx
  68:	52                   	push   %edx
  69:	68 8f 09 00 00       	push   $0x98f
  6e:	6a 02                	push   $0x2
  70:	e8 0b 07 00 00       	call   780 <fprintf>
  75:	83 c4 10             	add    $0x10,%esp
    }
    //close and unlink the file
    close(d1);
  78:	83 ec 0c             	sub    $0xc,%esp
  7b:	53                   	push   %ebx
  7c:	e8 aa 03 00 00       	call   42b <close>
    unlink(argv[1]);
  81:	58                   	pop    %eax
  82:	ff 76 04             	push   0x4(%esi)
  85:	e8 c9 03 00 00       	call   453 <unlink>
    exit();
  8a:	e8 74 03 00 00       	call   403 <exit>
        fprintf(2, "mv: Can't open %s\n", argv[1]);
  8f:	50                   	push   %eax
  90:	ff 76 04             	push   0x4(%esi)
  93:	68 63 09 00 00       	push   $0x963
  98:	6a 02                	push   $0x2
  9a:	e8 e1 06 00 00       	call   780 <fprintf>
        close(d1);
  9f:	89 1c 24             	mov    %ebx,(%esp)
  a2:	e8 84 03 00 00       	call   42b <close>
        exit();
  a7:	e8 57 03 00 00       	call   403 <exit>
        fprintf(2, "mv: Can't open %s\n", argv[1]);
  ac:	50                   	push   %eax
  ad:	ff 76 04             	push   0x4(%esi)
  b0:	68 63 09 00 00       	push   $0x963
  b5:	6a 02                	push   $0x2
  b7:	e8 c4 06 00 00       	call   780 <fprintf>
        exit();
  bc:	e8 42 03 00 00       	call   403 <exit>
        if((d2 = open(argv[2], O_CREATE)) < 0){
  c1:	50                   	push   %eax
  c2:	50                   	push   %eax
  c3:	68 00 02 00 00       	push   $0x200
  c8:	ff 76 08             	push   0x8(%esi)
  cb:	e8 73 03 00 00       	call   443 <open>
  d0:	83 c4 10             	add    $0x10,%esp
  d3:	85 c0                	test   %eax,%eax
  d5:	78 7a                	js     151 <main+0x151>
        close(d2);
  d7:	83 ec 0c             	sub    $0xc,%esp
  da:	8d bd e8 fd ff ff    	lea    -0x218(%ebp),%edi
  e0:	50                   	push   %eax
  e1:	e8 45 03 00 00       	call   42b <close>
        close(0);
  e6:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  ed:	e8 39 03 00 00       	call   42b <close>
        if((d2 = open(argv[2], O_WRONLY) < 0)){
  f2:	58                   	pop    %eax
  f3:	5a                   	pop    %edx
  f4:	6a 01                	push   $0x1
  f6:	ff 76 08             	push   0x8(%esi)
  f9:	e8 45 03 00 00       	call   443 <open>
  fe:	83 c4 10             	add    $0x10,%esp
 101:	85 c0                	test   %eax,%eax
 103:	79 25                	jns    12a <main+0x12a>
 105:	eb 7a                	jmp    181 <main+0x181>
            if(n == 0)
 107:	0f 84 89 00 00 00    	je     196 <main+0x196>
            if(write(d2,buf,n) != n)
 10d:	51                   	push   %ecx
 10e:	50                   	push   %eax
 10f:	57                   	push   %edi
 110:	6a 00                	push   $0x0
 112:	89 85 c4 fd ff ff    	mov    %eax,-0x23c(%ebp)
 118:	e8 06 03 00 00       	call   423 <write>
 11d:	8b 95 c4 fd ff ff    	mov    -0x23c(%ebp),%edx
 123:	83 c4 10             	add    $0x10,%esp
 126:	39 d0                	cmp    %edx,%eax
 128:	75 14                	jne    13e <main+0x13e>
            if((n = read(d1,buf,sizeof(buf))) < 0)
 12a:	50                   	push   %eax
 12b:	68 00 02 00 00       	push   $0x200
 130:	57                   	push   %edi
 131:	53                   	push   %ebx
 132:	e8 e4 02 00 00       	call   41b <read>
 137:	83 c4 10             	add    $0x10,%esp
 13a:	85 c0                	test   %eax,%eax
 13c:	79 c9                	jns    107 <main+0x107>
                fprintf(2,"mv: Error while copying\n");
 13e:	53                   	push   %ebx
 13f:	53                   	push   %ebx
 140:	68 76 09 00 00       	push   $0x976
 145:	6a 02                	push   $0x2
 147:	e8 34 06 00 00       	call   780 <fprintf>
                exit();
 14c:	e8 b2 02 00 00       	call   403 <exit>
            close(d2);
 151:	83 ec 0c             	sub    $0xc,%esp
 154:	50                   	push   %eax
 155:	e8 d1 02 00 00       	call   42b <close>
            close(0);
 15a:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 161:	e8 c5 02 00 00       	call   42b <close>
            if((d2 = open(argv[2], O_WRONLY) < 0)){
 166:	59                   	pop    %ecx
 167:	5f                   	pop    %edi
 168:	6a 01                	push   $0x1
 16a:	ff 76 08             	push   0x8(%esi)
 16d:	e8 d1 02 00 00       	call   443 <open>
 172:	83 c4 10             	add    $0x10,%esp
 175:	89 c2                	mov    %eax,%edx
 177:	31 c0                	xor    %eax,%eax
 179:	85 d2                	test   %edx,%edx
 17b:	0f 89 56 ff ff ff    	jns    d7 <main+0xd7>
            fprintf(2, "mv: Can't open %s\n", argv[2]);
 181:	50                   	push   %eax
 182:	ff 76 08             	push   0x8(%esi)
 185:	68 63 09 00 00       	push   $0x963
 18a:	6a 02                	push   $0x2
 18c:	e8 ef 05 00 00       	call   780 <fprintf>
            exit();
 191:	e8 6d 02 00 00       	call   403 <exit>
        close(d2);
 196:	83 ec 0c             	sub    $0xc,%esp
 199:	6a 00                	push   $0x0
 19b:	e8 8b 02 00 00       	call   42b <close>
 1a0:	83 c4 10             	add    $0x10,%esp
 1a3:	e9 d0 fe ff ff       	jmp    78 <main+0x78>
 1a8:	66 90                	xchg   %ax,%ax
 1aa:	66 90                	xchg   %ax,%ax
 1ac:	66 90                	xchg   %ax,%ax
 1ae:	66 90                	xchg   %ax,%ax

000001b0 <strcpy>:
#include "user/user.h"
#include "../kernel/x86.h"

char*
strcpy(char *s, const char *t)
{
 1b0:	55                   	push   %ebp
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 1b1:	31 c0                	xor    %eax,%eax
{
 1b3:	89 e5                	mov    %esp,%ebp
 1b5:	53                   	push   %ebx
 1b6:	8b 4d 08             	mov    0x8(%ebp),%ecx
 1b9:	8b 5d 0c             	mov    0xc(%ebp),%ebx
 1bc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  while((*s++ = *t++) != 0)
 1c0:	0f b6 14 03          	movzbl (%ebx,%eax,1),%edx
 1c4:	88 14 01             	mov    %dl,(%ecx,%eax,1)
 1c7:	83 c0 01             	add    $0x1,%eax
 1ca:	84 d2                	test   %dl,%dl
 1cc:	75 f2                	jne    1c0 <strcpy+0x10>
    ;
  return os;
}
 1ce:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 1d1:	89 c8                	mov    %ecx,%eax
 1d3:	c9                   	leave  
 1d4:	c3                   	ret    
 1d5:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 1dc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

000001e0 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 1e0:	55                   	push   %ebp
 1e1:	89 e5                	mov    %esp,%ebp
 1e3:	53                   	push   %ebx
 1e4:	8b 55 08             	mov    0x8(%ebp),%edx
 1e7:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  while(*p && *p == *q)
 1ea:	0f b6 02             	movzbl (%edx),%eax
 1ed:	84 c0                	test   %al,%al
 1ef:	75 17                	jne    208 <strcmp+0x28>
 1f1:	eb 3a                	jmp    22d <strcmp+0x4d>
 1f3:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 1f7:	90                   	nop
 1f8:	0f b6 42 01          	movzbl 0x1(%edx),%eax
    p++, q++;
 1fc:	83 c2 01             	add    $0x1,%edx
 1ff:	8d 59 01             	lea    0x1(%ecx),%ebx
  while(*p && *p == *q)
 202:	84 c0                	test   %al,%al
 204:	74 1a                	je     220 <strcmp+0x40>
    p++, q++;
 206:	89 d9                	mov    %ebx,%ecx
  while(*p && *p == *q)
 208:	0f b6 19             	movzbl (%ecx),%ebx
 20b:	38 c3                	cmp    %al,%bl
 20d:	74 e9                	je     1f8 <strcmp+0x18>
  return (uchar)*p - (uchar)*q;
 20f:	29 d8                	sub    %ebx,%eax
}
 211:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 214:	c9                   	leave  
 215:	c3                   	ret    
 216:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 21d:	8d 76 00             	lea    0x0(%esi),%esi
  return (uchar)*p - (uchar)*q;
 220:	0f b6 59 01          	movzbl 0x1(%ecx),%ebx
 224:	31 c0                	xor    %eax,%eax
 226:	29 d8                	sub    %ebx,%eax
}
 228:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 22b:	c9                   	leave  
 22c:	c3                   	ret    
  return (uchar)*p - (uchar)*q;
 22d:	0f b6 19             	movzbl (%ecx),%ebx
 230:	31 c0                	xor    %eax,%eax
 232:	eb db                	jmp    20f <strcmp+0x2f>
 234:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 23b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 23f:	90                   	nop

00000240 <strlen>:

uint
strlen(const char *s)
{
 240:	55                   	push   %ebp
 241:	89 e5                	mov    %esp,%ebp
 243:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  for(n = 0; s[n]; n++)
 246:	80 3a 00             	cmpb   $0x0,(%edx)
 249:	74 15                	je     260 <strlen+0x20>
 24b:	31 c0                	xor    %eax,%eax
 24d:	8d 76 00             	lea    0x0(%esi),%esi
 250:	83 c0 01             	add    $0x1,%eax
 253:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
 257:	89 c1                	mov    %eax,%ecx
 259:	75 f5                	jne    250 <strlen+0x10>
    ;
  return n;
}
 25b:	89 c8                	mov    %ecx,%eax
 25d:	5d                   	pop    %ebp
 25e:	c3                   	ret    
 25f:	90                   	nop
  for(n = 0; s[n]; n++)
 260:	31 c9                	xor    %ecx,%ecx
}
 262:	5d                   	pop    %ebp
 263:	89 c8                	mov    %ecx,%eax
 265:	c3                   	ret    
 266:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 26d:	8d 76 00             	lea    0x0(%esi),%esi

00000270 <memset>:

void*
memset(void *dst, int c, uint n)
{
 270:	55                   	push   %ebp
 271:	89 e5                	mov    %esp,%ebp
 273:	57                   	push   %edi
 274:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 277:	8b 4d 10             	mov    0x10(%ebp),%ecx
 27a:	8b 45 0c             	mov    0xc(%ebp),%eax
 27d:	89 d7                	mov    %edx,%edi
 27f:	fc                   	cld    
 280:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 282:	8b 7d fc             	mov    -0x4(%ebp),%edi
 285:	89 d0                	mov    %edx,%eax
 287:	c9                   	leave  
 288:	c3                   	ret    
 289:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000290 <strchr>:

char*
strchr(const char *s, char c)
{
 290:	55                   	push   %ebp
 291:	89 e5                	mov    %esp,%ebp
 293:	8b 45 08             	mov    0x8(%ebp),%eax
 296:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 29a:	0f b6 10             	movzbl (%eax),%edx
 29d:	84 d2                	test   %dl,%dl
 29f:	75 12                	jne    2b3 <strchr+0x23>
 2a1:	eb 1d                	jmp    2c0 <strchr+0x30>
 2a3:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 2a7:	90                   	nop
 2a8:	0f b6 50 01          	movzbl 0x1(%eax),%edx
 2ac:	83 c0 01             	add    $0x1,%eax
 2af:	84 d2                	test   %dl,%dl
 2b1:	74 0d                	je     2c0 <strchr+0x30>
    if(*s == c)
 2b3:	38 d1                	cmp    %dl,%cl
 2b5:	75 f1                	jne    2a8 <strchr+0x18>
      return (char*)s;
  return 0;
}
 2b7:	5d                   	pop    %ebp
 2b8:	c3                   	ret    
 2b9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  return 0;
 2c0:	31 c0                	xor    %eax,%eax
}
 2c2:	5d                   	pop    %ebp
 2c3:	c3                   	ret    
 2c4:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 2cb:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 2cf:	90                   	nop

000002d0 <gets>:

char*
gets(char *buf, int max)
{
 2d0:	55                   	push   %ebp
 2d1:	89 e5                	mov    %esp,%ebp
 2d3:	57                   	push   %edi
 2d4:	56                   	push   %esi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    cc = read(0, &c, 1);
 2d5:	8d 7d e7             	lea    -0x19(%ebp),%edi
{
 2d8:	53                   	push   %ebx
  for(i=0; i+1 < max; ){
 2d9:	31 db                	xor    %ebx,%ebx
{
 2db:	83 ec 1c             	sub    $0x1c,%esp
  for(i=0; i+1 < max; ){
 2de:	eb 27                	jmp    307 <gets+0x37>
    cc = read(0, &c, 1);
 2e0:	83 ec 04             	sub    $0x4,%esp
 2e3:	6a 01                	push   $0x1
 2e5:	57                   	push   %edi
 2e6:	6a 00                	push   $0x0
 2e8:	e8 2e 01 00 00       	call   41b <read>
    if(cc < 1)
 2ed:	83 c4 10             	add    $0x10,%esp
 2f0:	85 c0                	test   %eax,%eax
 2f2:	7e 1d                	jle    311 <gets+0x41>
      break;
    buf[i++] = c;
 2f4:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 2f8:	8b 55 08             	mov    0x8(%ebp),%edx
 2fb:	88 44 1a ff          	mov    %al,-0x1(%edx,%ebx,1)
    if(c == '\n' || c == '\r')
 2ff:	3c 0a                	cmp    $0xa,%al
 301:	74 1d                	je     320 <gets+0x50>
 303:	3c 0d                	cmp    $0xd,%al
 305:	74 19                	je     320 <gets+0x50>
  for(i=0; i+1 < max; ){
 307:	89 de                	mov    %ebx,%esi
 309:	83 c3 01             	add    $0x1,%ebx
 30c:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 30f:	7c cf                	jl     2e0 <gets+0x10>
      break;
  }
  buf[i] = '\0';
 311:	8b 45 08             	mov    0x8(%ebp),%eax
 314:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
  return buf;
}
 318:	8d 65 f4             	lea    -0xc(%ebp),%esp
 31b:	5b                   	pop    %ebx
 31c:	5e                   	pop    %esi
 31d:	5f                   	pop    %edi
 31e:	5d                   	pop    %ebp
 31f:	c3                   	ret    
  buf[i] = '\0';
 320:	8b 45 08             	mov    0x8(%ebp),%eax
 323:	89 de                	mov    %ebx,%esi
 325:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
}
 329:	8d 65 f4             	lea    -0xc(%ebp),%esp
 32c:	5b                   	pop    %ebx
 32d:	5e                   	pop    %esi
 32e:	5f                   	pop    %edi
 32f:	5d                   	pop    %ebp
 330:	c3                   	ret    
 331:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 338:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 33f:	90                   	nop

00000340 <stat>:

int
stat(const char *n, struct stat *st)
{
 340:	55                   	push   %ebp
 341:	89 e5                	mov    %esp,%ebp
 343:	56                   	push   %esi
 344:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 345:	83 ec 08             	sub    $0x8,%esp
 348:	6a 00                	push   $0x0
 34a:	ff 75 08             	push   0x8(%ebp)
 34d:	e8 f1 00 00 00       	call   443 <open>
  if(fd < 0)
 352:	83 c4 10             	add    $0x10,%esp
 355:	85 c0                	test   %eax,%eax
 357:	78 27                	js     380 <stat+0x40>
    return -1;
  r = fstat(fd, st);
 359:	83 ec 08             	sub    $0x8,%esp
 35c:	ff 75 0c             	push   0xc(%ebp)
 35f:	89 c3                	mov    %eax,%ebx
 361:	50                   	push   %eax
 362:	e8 f4 00 00 00       	call   45b <fstat>
  close(fd);
 367:	89 1c 24             	mov    %ebx,(%esp)
  r = fstat(fd, st);
 36a:	89 c6                	mov    %eax,%esi
  close(fd);
 36c:	e8 ba 00 00 00       	call   42b <close>
  return r;
 371:	83 c4 10             	add    $0x10,%esp
}
 374:	8d 65 f8             	lea    -0x8(%ebp),%esp
 377:	89 f0                	mov    %esi,%eax
 379:	5b                   	pop    %ebx
 37a:	5e                   	pop    %esi
 37b:	5d                   	pop    %ebp
 37c:	c3                   	ret    
 37d:	8d 76 00             	lea    0x0(%esi),%esi
    return -1;
 380:	be ff ff ff ff       	mov    $0xffffffff,%esi
 385:	eb ed                	jmp    374 <stat+0x34>
 387:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 38e:	66 90                	xchg   %ax,%ax

00000390 <atoi>:

int
atoi(const char *s)
{
 390:	55                   	push   %ebp
 391:	89 e5                	mov    %esp,%ebp
 393:	53                   	push   %ebx
 394:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 397:	0f be 02             	movsbl (%edx),%eax
 39a:	8d 48 d0             	lea    -0x30(%eax),%ecx
 39d:	80 f9 09             	cmp    $0x9,%cl
  n = 0;
 3a0:	b9 00 00 00 00       	mov    $0x0,%ecx
  while('0' <= *s && *s <= '9')
 3a5:	77 1e                	ja     3c5 <atoi+0x35>
 3a7:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 3ae:	66 90                	xchg   %ax,%ax
    n = n*10 + *s++ - '0';
 3b0:	83 c2 01             	add    $0x1,%edx
 3b3:	8d 0c 89             	lea    (%ecx,%ecx,4),%ecx
 3b6:	8d 4c 48 d0          	lea    -0x30(%eax,%ecx,2),%ecx
  while('0' <= *s && *s <= '9')
 3ba:	0f be 02             	movsbl (%edx),%eax
 3bd:	8d 58 d0             	lea    -0x30(%eax),%ebx
 3c0:	80 fb 09             	cmp    $0x9,%bl
 3c3:	76 eb                	jbe    3b0 <atoi+0x20>
  return n;
}
 3c5:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 3c8:	89 c8                	mov    %ecx,%eax
 3ca:	c9                   	leave  
 3cb:	c3                   	ret    
 3cc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

000003d0 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 3d0:	55                   	push   %ebp
 3d1:	89 e5                	mov    %esp,%ebp
 3d3:	57                   	push   %edi
 3d4:	8b 45 10             	mov    0x10(%ebp),%eax
 3d7:	8b 55 08             	mov    0x8(%ebp),%edx
 3da:	56                   	push   %esi
 3db:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 3de:	85 c0                	test   %eax,%eax
 3e0:	7e 13                	jle    3f5 <memmove+0x25>
 3e2:	01 d0                	add    %edx,%eax
  dst = vdst;
 3e4:	89 d7                	mov    %edx,%edi
 3e6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 3ed:	8d 76 00             	lea    0x0(%esi),%esi
    *dst++ = *src++;
 3f0:	a4                   	movsb  %ds:(%esi),%es:(%edi)
  while(n-- > 0)
 3f1:	39 f8                	cmp    %edi,%eax
 3f3:	75 fb                	jne    3f0 <memmove+0x20>
  return vdst;
}
 3f5:	5e                   	pop    %esi
 3f6:	89 d0                	mov    %edx,%eax
 3f8:	5f                   	pop    %edi
 3f9:	5d                   	pop    %ebp
 3fa:	c3                   	ret    

000003fb <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 3fb:	b8 01 00 00 00       	mov    $0x1,%eax
 400:	cd 40                	int    $0x40
 402:	c3                   	ret    

00000403 <exit>:
SYSCALL(exit)
 403:	b8 02 00 00 00       	mov    $0x2,%eax
 408:	cd 40                	int    $0x40
 40a:	c3                   	ret    

0000040b <wait>:
SYSCALL(wait)
 40b:	b8 03 00 00 00       	mov    $0x3,%eax
 410:	cd 40                	int    $0x40
 412:	c3                   	ret    

00000413 <pipe>:
SYSCALL(pipe)
 413:	b8 04 00 00 00       	mov    $0x4,%eax
 418:	cd 40                	int    $0x40
 41a:	c3                   	ret    

0000041b <read>:
SYSCALL(read)
 41b:	b8 05 00 00 00       	mov    $0x5,%eax
 420:	cd 40                	int    $0x40
 422:	c3                   	ret    

00000423 <write>:
SYSCALL(write)
 423:	b8 10 00 00 00       	mov    $0x10,%eax
 428:	cd 40                	int    $0x40
 42a:	c3                   	ret    

0000042b <close>:
SYSCALL(close)
 42b:	b8 15 00 00 00       	mov    $0x15,%eax
 430:	cd 40                	int    $0x40
 432:	c3                   	ret    

00000433 <kill>:
SYSCALL(kill)
 433:	b8 06 00 00 00       	mov    $0x6,%eax
 438:	cd 40                	int    $0x40
 43a:	c3                   	ret    

0000043b <exec>:
SYSCALL(exec)
 43b:	b8 07 00 00 00       	mov    $0x7,%eax
 440:	cd 40                	int    $0x40
 442:	c3                   	ret    

00000443 <open>:
SYSCALL(open)
 443:	b8 0f 00 00 00       	mov    $0xf,%eax
 448:	cd 40                	int    $0x40
 44a:	c3                   	ret    

0000044b <mknod>:
SYSCALL(mknod)
 44b:	b8 11 00 00 00       	mov    $0x11,%eax
 450:	cd 40                	int    $0x40
 452:	c3                   	ret    

00000453 <unlink>:
SYSCALL(unlink)
 453:	b8 12 00 00 00       	mov    $0x12,%eax
 458:	cd 40                	int    $0x40
 45a:	c3                   	ret    

0000045b <fstat>:
SYSCALL(fstat)
 45b:	b8 08 00 00 00       	mov    $0x8,%eax
 460:	cd 40                	int    $0x40
 462:	c3                   	ret    

00000463 <link>:
SYSCALL(link)
 463:	b8 13 00 00 00       	mov    $0x13,%eax
 468:	cd 40                	int    $0x40
 46a:	c3                   	ret    

0000046b <mkdir>:
SYSCALL(mkdir)
 46b:	b8 14 00 00 00       	mov    $0x14,%eax
 470:	cd 40                	int    $0x40
 472:	c3                   	ret    

00000473 <chdir>:
SYSCALL(chdir)
 473:	b8 09 00 00 00       	mov    $0x9,%eax
 478:	cd 40                	int    $0x40
 47a:	c3                   	ret    

0000047b <dup>:
SYSCALL(dup)
 47b:	b8 0a 00 00 00       	mov    $0xa,%eax
 480:	cd 40                	int    $0x40
 482:	c3                   	ret    

00000483 <getpid>:
SYSCALL(getpid)
 483:	b8 0b 00 00 00       	mov    $0xb,%eax
 488:	cd 40                	int    $0x40
 48a:	c3                   	ret    

0000048b <sbrk>:
SYSCALL(sbrk)
 48b:	b8 0c 00 00 00       	mov    $0xc,%eax
 490:	cd 40                	int    $0x40
 492:	c3                   	ret    

00000493 <sleep>:
SYSCALL(sleep)
 493:	b8 0d 00 00 00       	mov    $0xd,%eax
 498:	cd 40                	int    $0x40
 49a:	c3                   	ret    

0000049b <uptime>:
SYSCALL(uptime)
 49b:	b8 0e 00 00 00       	mov    $0xe,%eax
 4a0:	cd 40                	int    $0x40
 4a2:	c3                   	ret    

000004a3 <cpuhalt>:
SYSCALL(cpuhalt)
 4a3:	b8 16 00 00 00       	mov    $0x16,%eax
 4a8:	cd 40                	int    $0x40
 4aa:	c3                   	ret    
 4ab:	66 90                	xchg   %ax,%ax
 4ad:	66 90                	xchg   %ax,%ax
 4af:	90                   	nop

000004b0 <printint.constprop.0>:
  for (i = 0; i < (sizeof(uint) * 2); i++, x <<= 4)
    putc(fd, digits[x >> (sizeof(uint) * 8 - 4)]);
}

static void
printint(int fd, int xx, int base, int sgn)
 4b0:	55                   	push   %ebp
 4b1:	89 e5                	mov    %esp,%ebp
 4b3:	57                   	push   %edi
 4b4:	56                   	push   %esi
 4b5:	53                   	push   %ebx
 4b6:	83 ec 3c             	sub    $0x3c,%esp
 4b9:	89 55 c4             	mov    %edx,-0x3c(%ebp)
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 4bc:	85 c0                	test   %eax,%eax
 4be:	0f 89 84 00 00 00    	jns    548 <printint.constprop.0+0x98>
 4c4:	83 e1 01             	and    $0x1,%ecx
 4c7:	74 7f                	je     548 <printint.constprop.0+0x98>
    neg = 1;
 4c9:	c7 45 bc 01 00 00 00 	movl   $0x1,-0x44(%ebp)
    x = -xx;
 4d0:	f7 d8                	neg    %eax
 4d2:	89 c1                	mov    %eax,%ecx
  } else {
    x = xx;
  }

  i = 0;
 4d4:	31 db                	xor    %ebx,%ebx
 4d6:	8d 75 d7             	lea    -0x29(%ebp),%esi
 4d9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  do{
    buf[i++] = digits[x % base];
 4e0:	89 c8                	mov    %ecx,%eax
 4e2:	31 d2                	xor    %edx,%edx
 4e4:	89 cf                	mov    %ecx,%edi
 4e6:	f7 75 c4             	divl   -0x3c(%ebp)
 4e9:	0f b6 92 00 0a 00 00 	movzbl 0xa00(%edx),%edx
 4f0:	89 45 c0             	mov    %eax,-0x40(%ebp)
 4f3:	89 d8                	mov    %ebx,%eax
 4f5:	8d 5b 01             	lea    0x1(%ebx),%ebx
  }while((x /= base) != 0);
 4f8:	8b 4d c0             	mov    -0x40(%ebp),%ecx
    buf[i++] = digits[x % base];
 4fb:	88 14 1e             	mov    %dl,(%esi,%ebx,1)
  }while((x /= base) != 0);
 4fe:	3b 7d c4             	cmp    -0x3c(%ebp),%edi
 501:	73 dd                	jae    4e0 <printint.constprop.0+0x30>
  if(neg)
 503:	8b 4d bc             	mov    -0x44(%ebp),%ecx
 506:	85 c9                	test   %ecx,%ecx
 508:	74 0c                	je     516 <printint.constprop.0+0x66>
    buf[i++] = '-';
 50a:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
    buf[i++] = digits[x % base];
 50f:	89 d8                	mov    %ebx,%eax
    buf[i++] = '-';
 511:	ba 2d 00 00 00       	mov    $0x2d,%edx

  while(--i >= 0)
 516:	8d 5c 05 d7          	lea    -0x29(%ebp,%eax,1),%ebx
 51a:	eb 0a                	jmp    526 <printint.constprop.0+0x76>
 51c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    putc(fd, buf[i]);
 520:	0f b6 13             	movzbl (%ebx),%edx
 523:	83 eb 01             	sub    $0x1,%ebx
  write(fd, &c, 1);
 526:	83 ec 04             	sub    $0x4,%esp
 529:	88 55 d7             	mov    %dl,-0x29(%ebp)
 52c:	6a 01                	push   $0x1
 52e:	56                   	push   %esi
 52f:	6a 01                	push   $0x1
 531:	e8 ed fe ff ff       	call   423 <write>
  while(--i >= 0)
 536:	83 c4 10             	add    $0x10,%esp
 539:	39 de                	cmp    %ebx,%esi
 53b:	75 e3                	jne    520 <printint.constprop.0+0x70>
}
 53d:	8d 65 f4             	lea    -0xc(%ebp),%esp
 540:	5b                   	pop    %ebx
 541:	5e                   	pop    %esi
 542:	5f                   	pop    %edi
 543:	5d                   	pop    %ebp
 544:	c3                   	ret    
 545:	8d 76 00             	lea    0x0(%esi),%esi
  neg = 0;
 548:	c7 45 bc 00 00 00 00 	movl   $0x0,-0x44(%ebp)
    x = xx;
 54f:	89 c1                	mov    %eax,%ecx
 551:	eb 81                	jmp    4d4 <printint.constprop.0+0x24>
 553:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 55a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00000560 <vprintf.constprop.0>:
static void vprintf(int fd, const char *fmt, va_list ap)
 560:	55                   	push   %ebp
 561:	89 e5                	mov    %esp,%ebp
 563:	57                   	push   %edi
 564:	56                   	push   %esi
 565:	53                   	push   %ebx
 566:	83 ec 2c             	sub    $0x2c,%esp
 569:	89 55 d4             	mov    %edx,-0x2c(%ebp)
{
  char *s;
  int c, i, state;

  state = 0;
  for(i = 0; fmt[i]; i++){
 56c:	0f b6 10             	movzbl (%eax),%edx
 56f:	84 d2                	test   %dl,%dl
 571:	74 6c                	je     5df <vprintf.constprop.0+0x7f>
 573:	8d 58 01             	lea    0x1(%eax),%ebx
 576:	31 ff                	xor    %edi,%edi
 578:	8d 75 e7             	lea    -0x19(%ebp),%esi
 57b:	eb 25                	jmp    5a2 <vprintf.constprop.0+0x42>
 57d:	8d 76 00             	lea    0x0(%esi),%esi
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
 580:	83 f8 25             	cmp    $0x25,%eax
 583:	74 4b                	je     5d0 <vprintf.constprop.0+0x70>
  write(fd, &c, 1);
 585:	83 ec 04             	sub    $0x4,%esp
 588:	88 55 e7             	mov    %dl,-0x19(%ebp)
 58b:	6a 01                	push   $0x1
 58d:	56                   	push   %esi
 58e:	6a 01                	push   $0x1
 590:	e8 8e fe ff ff       	call   423 <write>
        state = '%';
      } else {
        putc(fd, c);
 595:	83 c4 10             	add    $0x10,%esp
  for(i = 0; fmt[i]; i++){
 598:	0f b6 13             	movzbl (%ebx),%edx
 59b:	83 c3 01             	add    $0x1,%ebx
 59e:	84 d2                	test   %dl,%dl
 5a0:	74 3d                	je     5df <vprintf.constprop.0+0x7f>
    c = fmt[i] & 0xff;
 5a2:	0f b6 c2             	movzbl %dl,%eax
    if(state == 0){
 5a5:	85 ff                	test   %edi,%edi
 5a7:	74 d7                	je     580 <vprintf.constprop.0+0x20>
      }
    } else if(state == '%'){
 5a9:	83 ff 25             	cmp    $0x25,%edi
 5ac:	75 ea                	jne    598 <vprintf.constprop.0+0x38>
      if(c == 'd'){
 5ae:	83 f8 25             	cmp    $0x25,%eax
 5b1:	0f 84 a9 01 00 00    	je     760 <vprintf.constprop.0+0x200>
 5b7:	83 e8 63             	sub    $0x63,%eax
 5ba:	83 f8 15             	cmp    $0x15,%eax
 5bd:	77 31                	ja     5f0 <vprintf.constprop.0+0x90>
 5bf:	ff 24 85 a8 09 00 00 	jmp    *0x9a8(,%eax,4)
 5c6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 5cd:	8d 76 00             	lea    0x0(%esi),%esi
  for(i = 0; fmt[i]; i++){
 5d0:	0f b6 13             	movzbl (%ebx),%edx
 5d3:	83 c3 01             	add    $0x1,%ebx
        state = '%';
 5d6:	bf 25 00 00 00       	mov    $0x25,%edi
  for(i = 0; fmt[i]; i++){
 5db:	84 d2                	test   %dl,%dl
 5dd:	75 c3                	jne    5a2 <vprintf.constprop.0+0x42>
        putc(fd, c);
      }
      state = 0;
    }
  }
}
 5df:	8d 65 f4             	lea    -0xc(%ebp),%esp
 5e2:	5b                   	pop    %ebx
 5e3:	5e                   	pop    %esi
 5e4:	5f                   	pop    %edi
 5e5:	5d                   	pop    %ebp
 5e6:	c3                   	ret    
 5e7:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 5ee:	66 90                	xchg   %ax,%ax
  write(fd, &c, 1);
 5f0:	83 ec 04             	sub    $0x4,%esp
 5f3:	88 55 d0             	mov    %dl,-0x30(%ebp)
 5f6:	6a 01                	push   $0x1
 5f8:	56                   	push   %esi
 5f9:	6a 01                	push   $0x1
 5fb:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
 5ff:	e8 1f fe ff ff       	call   423 <write>
        putc(fd, c);
 604:	0f b6 55 d0          	movzbl -0x30(%ebp),%edx
  write(fd, &c, 1);
 608:	83 c4 0c             	add    $0xc,%esp
 60b:	88 55 e7             	mov    %dl,-0x19(%ebp)
 60e:	6a 01                	push   $0x1
      state = 0;
 610:	31 ff                	xor    %edi,%edi
  write(fd, &c, 1);
 612:	56                   	push   %esi
 613:	6a 01                	push   $0x1
 615:	e8 09 fe ff ff       	call   423 <write>
        putc(fd, c);
 61a:	83 c4 10             	add    $0x10,%esp
 61d:	e9 76 ff ff ff       	jmp    598 <vprintf.constprop.0+0x38>
 622:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        putc(fd, va_arg(ap, uint));
 628:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  write(fd, &c, 1);
 62b:	83 ec 04             	sub    $0x4,%esp
        putc(fd, va_arg(ap, uint));
 62e:	8d 78 04             	lea    0x4(%eax),%edi
 631:	8b 00                	mov    (%eax),%eax
  write(fd, &c, 1);
 633:	6a 01                	push   $0x1
 635:	56                   	push   %esi
 636:	6a 01                	push   $0x1
        putc(fd, va_arg(ap, uint));
 638:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
 63b:	e8 e3 fd ff ff       	call   423 <write>
        putc(fd, va_arg(ap, uint));
 640:	89 7d d4             	mov    %edi,-0x2c(%ebp)
 643:	83 c4 10             	add    $0x10,%esp
      state = 0;
 646:	31 ff                	xor    %edi,%edi
 648:	e9 4b ff ff ff       	jmp    598 <vprintf.constprop.0+0x38>
 64d:	8d 76 00             	lea    0x0(%esi),%esi
        printint(fd, va_arg(ap, int), 10, 1);
 650:	8b 45 d4             	mov    -0x2c(%ebp),%eax
 653:	b9 01 00 00 00       	mov    $0x1,%ecx
 658:	8d 78 04             	lea    0x4(%eax),%edi
        printint(fd, va_arg(ap, uint), 10, 0);
 65b:	8b 00                	mov    (%eax),%eax
 65d:	ba 0a 00 00 00       	mov    $0xa,%edx
 662:	e8 49 fe ff ff       	call   4b0 <printint.constprop.0>
 667:	89 7d d4             	mov    %edi,-0x2c(%ebp)
      state = 0;
 66a:	31 ff                	xor    %edi,%edi
 66c:	e9 27 ff ff ff       	jmp    598 <vprintf.constprop.0+0x38>
 671:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        printint(fd, va_arg(ap, uint), 10, 0);
 678:	8b 45 d4             	mov    -0x2c(%ebp),%eax
 67b:	31 c9                	xor    %ecx,%ecx
 67d:	8d 78 04             	lea    0x4(%eax),%edi
 680:	eb d9                	jmp    65b <vprintf.constprop.0+0xfb>
 682:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        printptr(fd, va_arg(ap, uint));
 688:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  write(fd, &c, 1);
 68b:	83 ec 04             	sub    $0x4,%esp
 68e:	c6 45 e7 30          	movb   $0x30,-0x19(%ebp)
        printptr(fd, va_arg(ap, uint));
 692:	8b 38                	mov    (%eax),%edi
  write(fd, &c, 1);
 694:	6a 01                	push   $0x1
        printptr(fd, va_arg(ap, uint));
 696:	8d 48 04             	lea    0x4(%eax),%ecx
  write(fd, &c, 1);
 699:	56                   	push   %esi
 69a:	6a 01                	push   $0x1
        printptr(fd, va_arg(ap, uint));
 69c:	89 4d d0             	mov    %ecx,-0x30(%ebp)
  write(fd, &c, 1);
 69f:	e8 7f fd ff ff       	call   423 <write>
 6a4:	83 c4 0c             	add    $0xc,%esp
 6a7:	c6 45 e7 78          	movb   $0x78,-0x19(%ebp)
 6ab:	6a 01                	push   $0x1
 6ad:	56                   	push   %esi
 6ae:	6a 01                	push   $0x1
 6b0:	e8 6e fd ff ff       	call   423 <write>
  putc(fd, 'x');
 6b5:	c7 45 d4 08 00 00 00 	movl   $0x8,-0x2c(%ebp)
 6bc:	83 c4 10             	add    $0x10,%esp
 6bf:	90                   	nop
  write(fd, &c, 1);
 6c0:	83 ec 04             	sub    $0x4,%esp
    putc(fd, digits[x >> (sizeof(uint) * 8 - 4)]);
 6c3:	89 f8                	mov    %edi,%eax
  for (i = 0; i < (sizeof(uint) * 2); i++, x <<= 4)
 6c5:	c1 e7 04             	shl    $0x4,%edi
  write(fd, &c, 1);
 6c8:	6a 01                	push   $0x1
    putc(fd, digits[x >> (sizeof(uint) * 8 - 4)]);
 6ca:	c1 e8 1c             	shr    $0x1c,%eax
  write(fd, &c, 1);
 6cd:	56                   	push   %esi
 6ce:	0f b6 80 00 0a 00 00 	movzbl 0xa00(%eax),%eax
 6d5:	6a 01                	push   $0x1
 6d7:	88 45 e7             	mov    %al,-0x19(%ebp)
 6da:	e8 44 fd ff ff       	call   423 <write>
  for (i = 0; i < (sizeof(uint) * 2); i++, x <<= 4)
 6df:	83 c4 10             	add    $0x10,%esp
 6e2:	83 6d d4 01          	subl   $0x1,-0x2c(%ebp)
 6e6:	75 d8                	jne    6c0 <vprintf.constprop.0+0x160>
        printptr(fd, va_arg(ap, uint));
 6e8:	8b 45 d0             	mov    -0x30(%ebp),%eax
      state = 0;
 6eb:	31 ff                	xor    %edi,%edi
        printptr(fd, va_arg(ap, uint));
 6ed:	89 45 d4             	mov    %eax,-0x2c(%ebp)
 6f0:	e9 a3 fe ff ff       	jmp    598 <vprintf.constprop.0+0x38>
 6f5:	8d 76 00             	lea    0x0(%esi),%esi
        s = va_arg(ap, char*);
 6f8:	8b 45 d4             	mov    -0x2c(%ebp),%eax
 6fb:	8b 38                	mov    (%eax),%edi
 6fd:	8d 48 04             	lea    0x4(%eax),%ecx
 700:	89 4d d4             	mov    %ecx,-0x2c(%ebp)
        if(s == 0)
 703:	85 ff                	test   %edi,%edi
 705:	74 64                	je     76b <vprintf.constprop.0+0x20b>
        while(*s != 0){
 707:	0f b6 07             	movzbl (%edi),%eax
 70a:	84 c0                	test   %al,%al
 70c:	74 1f                	je     72d <vprintf.constprop.0+0x1cd>
 70e:	66 90                	xchg   %ax,%ax
  write(fd, &c, 1);
 710:	83 ec 04             	sub    $0x4,%esp
          s++;
 713:	83 c7 01             	add    $0x1,%edi
 716:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
 719:	6a 01                	push   $0x1
 71b:	56                   	push   %esi
 71c:	6a 01                	push   $0x1
 71e:	e8 00 fd ff ff       	call   423 <write>
        while(*s != 0){
 723:	0f b6 07             	movzbl (%edi),%eax
 726:	83 c4 10             	add    $0x10,%esp
 729:	84 c0                	test   %al,%al
 72b:	75 e3                	jne    710 <vprintf.constprop.0+0x1b0>
      state = 0;
 72d:	31 ff                	xor    %edi,%edi
 72f:	e9 64 fe ff ff       	jmp    598 <vprintf.constprop.0+0x38>
 734:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        printint(fd, va_arg(ap, int), 16, 0);
 738:	8b 45 d4             	mov    -0x2c(%ebp),%eax
 73b:	31 c9                	xor    %ecx,%ecx
 73d:	ba 10 00 00 00       	mov    $0x10,%edx
 742:	8d 78 04             	lea    0x4(%eax),%edi
 745:	8b 00                	mov    (%eax),%eax
 747:	e8 64 fd ff ff       	call   4b0 <printint.constprop.0>
 74c:	89 7d d4             	mov    %edi,-0x2c(%ebp)
      state = 0;
 74f:	31 ff                	xor    %edi,%edi
 751:	e9 42 fe ff ff       	jmp    598 <vprintf.constprop.0+0x38>
 756:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 75d:	8d 76 00             	lea    0x0(%esi),%esi
        putc(fd, c);
 760:	88 55 e7             	mov    %dl,-0x19(%ebp)
  write(fd, &c, 1);
 763:	83 ec 04             	sub    $0x4,%esp
 766:	e9 a3 fe ff ff       	jmp    60e <vprintf.constprop.0+0xae>
          s = "(null)";
 76b:	bf a0 09 00 00       	mov    $0x9a0,%edi
        while(*s != 0){
 770:	b8 28 00 00 00       	mov    $0x28,%eax
 775:	eb 99                	jmp    710 <vprintf.constprop.0+0x1b0>
 777:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 77e:	66 90                	xchg   %ax,%ax

00000780 <fprintf>:
// Print to the given fd. Only understands %d,%x, %p, %s, %c.
void
fprintf(int fd, const char *fmt, ...)
{
 780:	55                   	push   %ebp
 781:	89 e5                	mov    %esp,%ebp
 783:	83 ec 08             	sub    $0x8,%esp
 va_list ap;
 va_start(ap, fmt); 
 vprintf(1,fmt,ap);
 786:	8b 45 0c             	mov    0xc(%ebp),%eax
 789:	8d 55 10             	lea    0x10(%ebp),%edx
 78c:	e8 cf fd ff ff       	call   560 <vprintf.constprop.0>
}
 791:	c9                   	leave  
 792:	c3                   	ret    
 793:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 79a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

000007a0 <printf>:
void
printf(const char *fmt, ...)
{
 7a0:	55                   	push   %ebp
 7a1:	89 e5                	mov    %esp,%ebp
 7a3:	83 ec 08             	sub    $0x8,%esp
  va_list ap;
  va_start(ap, fmt); 
  vprintf(1,fmt,ap);
 7a6:	8b 45 08             	mov    0x8(%ebp),%eax
 7a9:	8d 55 0c             	lea    0xc(%ebp),%edx
 7ac:	e8 af fd ff ff       	call   560 <vprintf.constprop.0>
}
 7b1:	c9                   	leave  
 7b2:	c3                   	ret    
 7b3:	66 90                	xchg   %ax,%ax
 7b5:	66 90                	xchg   %ax,%ax
 7b7:	66 90                	xchg   %ax,%ax
 7b9:	66 90                	xchg   %ax,%ax
 7bb:	66 90                	xchg   %ax,%ax
 7bd:	66 90                	xchg   %ax,%ax
 7bf:	90                   	nop

000007c0 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 7c0:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 7c1:	a1 14 0a 00 00       	mov    0xa14,%eax
{
 7c6:	89 e5                	mov    %esp,%ebp
 7c8:	57                   	push   %edi
 7c9:	56                   	push   %esi
 7ca:	53                   	push   %ebx
 7cb:	8b 5d 08             	mov    0x8(%ebp),%ebx
  bp = (Header*)ap - 1;
 7ce:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 7d1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 7d8:	89 c2                	mov    %eax,%edx
 7da:	8b 00                	mov    (%eax),%eax
 7dc:	39 ca                	cmp    %ecx,%edx
 7de:	73 30                	jae    810 <free+0x50>
 7e0:	39 c1                	cmp    %eax,%ecx
 7e2:	72 04                	jb     7e8 <free+0x28>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 7e4:	39 c2                	cmp    %eax,%edx
 7e6:	72 f0                	jb     7d8 <free+0x18>
      break;
  if(bp + bp->s.size == p->s.ptr){
 7e8:	8b 73 fc             	mov    -0x4(%ebx),%esi
 7eb:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 7ee:	39 f8                	cmp    %edi,%eax
 7f0:	74 30                	je     822 <free+0x62>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
 7f2:	89 43 f8             	mov    %eax,-0x8(%ebx)
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
 7f5:	8b 42 04             	mov    0x4(%edx),%eax
 7f8:	8d 34 c2             	lea    (%edx,%eax,8),%esi
 7fb:	39 f1                	cmp    %esi,%ecx
 7fd:	74 3a                	je     839 <free+0x79>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
 7ff:	89 0a                	mov    %ecx,(%edx)
  } else
    p->s.ptr = bp;
  freep = p;
}
 801:	5b                   	pop    %ebx
  freep = p;
 802:	89 15 14 0a 00 00    	mov    %edx,0xa14
}
 808:	5e                   	pop    %esi
 809:	5f                   	pop    %edi
 80a:	5d                   	pop    %ebp
 80b:	c3                   	ret    
 80c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 810:	39 c2                	cmp    %eax,%edx
 812:	72 c4                	jb     7d8 <free+0x18>
 814:	39 c1                	cmp    %eax,%ecx
 816:	73 c0                	jae    7d8 <free+0x18>
  if(bp + bp->s.size == p->s.ptr){
 818:	8b 73 fc             	mov    -0x4(%ebx),%esi
 81b:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 81e:	39 f8                	cmp    %edi,%eax
 820:	75 d0                	jne    7f2 <free+0x32>
    bp->s.size += p->s.ptr->s.size;
 822:	03 70 04             	add    0x4(%eax),%esi
 825:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 828:	8b 02                	mov    (%edx),%eax
 82a:	8b 00                	mov    (%eax),%eax
 82c:	89 43 f8             	mov    %eax,-0x8(%ebx)
  if(p + p->s.size == bp){
 82f:	8b 42 04             	mov    0x4(%edx),%eax
 832:	8d 34 c2             	lea    (%edx,%eax,8),%esi
 835:	39 f1                	cmp    %esi,%ecx
 837:	75 c6                	jne    7ff <free+0x3f>
    p->s.size += bp->s.size;
 839:	03 43 fc             	add    -0x4(%ebx),%eax
  freep = p;
 83c:	89 15 14 0a 00 00    	mov    %edx,0xa14
    p->s.size += bp->s.size;
 842:	89 42 04             	mov    %eax,0x4(%edx)
    p->s.ptr = bp->s.ptr;
 845:	8b 4b f8             	mov    -0x8(%ebx),%ecx
 848:	89 0a                	mov    %ecx,(%edx)
}
 84a:	5b                   	pop    %ebx
 84b:	5e                   	pop    %esi
 84c:	5f                   	pop    %edi
 84d:	5d                   	pop    %ebp
 84e:	c3                   	ret    
 84f:	90                   	nop

00000850 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 850:	55                   	push   %ebp
 851:	89 e5                	mov    %esp,%ebp
 853:	57                   	push   %edi
 854:	56                   	push   %esi
 855:	53                   	push   %ebx
 856:	83 ec 1c             	sub    $0x1c,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 859:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
 85c:	8b 3d 14 0a 00 00    	mov    0xa14,%edi
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 862:	8d 70 07             	lea    0x7(%eax),%esi
 865:	c1 ee 03             	shr    $0x3,%esi
 868:	83 c6 01             	add    $0x1,%esi
  if((prevp = freep) == 0){
 86b:	85 ff                	test   %edi,%edi
 86d:	0f 84 9d 00 00 00    	je     910 <malloc+0xc0>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 873:	8b 17                	mov    (%edi),%edx
    if(p->s.size >= nunits){
 875:	8b 4a 04             	mov    0x4(%edx),%ecx
 878:	39 f1                	cmp    %esi,%ecx
 87a:	73 6a                	jae    8e6 <malloc+0x96>
 87c:	bb 00 10 00 00       	mov    $0x1000,%ebx
 881:	39 de                	cmp    %ebx,%esi
 883:	0f 43 de             	cmovae %esi,%ebx
  p = sbrk(nu * sizeof(Header));
 886:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
 88d:	89 45 e4             	mov    %eax,-0x1c(%ebp)
 890:	eb 17                	jmp    8a9 <malloc+0x59>
 892:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 898:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
 89a:	8b 48 04             	mov    0x4(%eax),%ecx
 89d:	39 f1                	cmp    %esi,%ecx
 89f:	73 4f                	jae    8f0 <malloc+0xa0>
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 8a1:	8b 3d 14 0a 00 00    	mov    0xa14,%edi
 8a7:	89 c2                	mov    %eax,%edx
 8a9:	39 d7                	cmp    %edx,%edi
 8ab:	75 eb                	jne    898 <malloc+0x48>
  p = sbrk(nu * sizeof(Header));
 8ad:	83 ec 0c             	sub    $0xc,%esp
 8b0:	ff 75 e4             	push   -0x1c(%ebp)
 8b3:	e8 d3 fb ff ff       	call   48b <sbrk>
  if(p == (char*)-1)
 8b8:	83 c4 10             	add    $0x10,%esp
 8bb:	83 f8 ff             	cmp    $0xffffffff,%eax
 8be:	74 1c                	je     8dc <malloc+0x8c>
  hp->s.size = nu;
 8c0:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 8c3:	83 ec 0c             	sub    $0xc,%esp
 8c6:	83 c0 08             	add    $0x8,%eax
 8c9:	50                   	push   %eax
 8ca:	e8 f1 fe ff ff       	call   7c0 <free>
  return freep;
 8cf:	8b 15 14 0a 00 00    	mov    0xa14,%edx
      if((p = morecore(nunits)) == 0)
 8d5:	83 c4 10             	add    $0x10,%esp
 8d8:	85 d2                	test   %edx,%edx
 8da:	75 bc                	jne    898 <malloc+0x48>
        return 0;
  }
}
 8dc:	8d 65 f4             	lea    -0xc(%ebp),%esp
        return 0;
 8df:	31 c0                	xor    %eax,%eax
}
 8e1:	5b                   	pop    %ebx
 8e2:	5e                   	pop    %esi
 8e3:	5f                   	pop    %edi
 8e4:	5d                   	pop    %ebp
 8e5:	c3                   	ret    
    if(p->s.size >= nunits){
 8e6:	89 d0                	mov    %edx,%eax
 8e8:	89 fa                	mov    %edi,%edx
 8ea:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      if(p->s.size == nunits)
 8f0:	39 ce                	cmp    %ecx,%esi
 8f2:	74 4c                	je     940 <malloc+0xf0>
        p->s.size -= nunits;
 8f4:	29 f1                	sub    %esi,%ecx
 8f6:	89 48 04             	mov    %ecx,0x4(%eax)
        p += p->s.size;
 8f9:	8d 04 c8             	lea    (%eax,%ecx,8),%eax
        p->s.size = nunits;
 8fc:	89 70 04             	mov    %esi,0x4(%eax)
      freep = prevp;
 8ff:	89 15 14 0a 00 00    	mov    %edx,0xa14
}
 905:	8d 65 f4             	lea    -0xc(%ebp),%esp
      return (void*)(p + 1);
 908:	83 c0 08             	add    $0x8,%eax
}
 90b:	5b                   	pop    %ebx
 90c:	5e                   	pop    %esi
 90d:	5f                   	pop    %edi
 90e:	5d                   	pop    %ebp
 90f:	c3                   	ret    
    base.s.ptr = freep = prevp = &base;
 910:	c7 05 14 0a 00 00 18 	movl   $0xa18,0xa14
 917:	0a 00 00 
    base.s.size = 0;
 91a:	bf 18 0a 00 00       	mov    $0xa18,%edi
    base.s.ptr = freep = prevp = &base;
 91f:	c7 05 18 0a 00 00 18 	movl   $0xa18,0xa18
 926:	0a 00 00 
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 929:	89 fa                	mov    %edi,%edx
    base.s.size = 0;
 92b:	c7 05 1c 0a 00 00 00 	movl   $0x0,0xa1c
 932:	00 00 00 
    if(p->s.size >= nunits){
 935:	e9 42 ff ff ff       	jmp    87c <malloc+0x2c>
 93a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        prevp->s.ptr = p->s.ptr;
 940:	8b 08                	mov    (%eax),%ecx
 942:	89 0a                	mov    %ecx,(%edx)
 944:	eb b9                	jmp    8ff <malloc+0xaf>
