
user/_wc:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
  printf("%d %d %d %s\n", l, w, c, name);
}

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
   f:	be 01 00 00 00       	mov    $0x1,%esi
  14:	53                   	push   %ebx
  15:	51                   	push   %ecx
  16:	83 ec 18             	sub    $0x18,%esp
  19:	8b 01                	mov    (%ecx),%eax
  1b:	8b 59 04             	mov    0x4(%ecx),%ebx
  1e:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  21:	83 c3 04             	add    $0x4,%ebx
  int fd, i;

  if(argc <= 1){
  24:	83 f8 01             	cmp    $0x1,%eax
  27:	7e 56                	jle    7f <main+0x7f>
  29:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    wc(0, "");
    exit();
  }

  for(i = 1; i < argc; i++){
    if((fd = open(argv[i], 0)) < 0){
  30:	83 ec 08             	sub    $0x8,%esp
  33:	6a 00                	push   $0x0
  35:	ff 33                	push   (%ebx)
  37:	e8 d7 03 00 00       	call   413 <open>
  3c:	83 c4 10             	add    $0x10,%esp
  3f:	89 c7                	mov    %eax,%edi
  41:	85 c0                	test   %eax,%eax
  43:	78 26                	js     6b <main+0x6b>
      fprintf(2, "wc: cannot open %s\n", argv[i]);
      exit();
    }
    wc(fd, argv[i]);
  45:	83 ec 08             	sub    $0x8,%esp
  48:	ff 33                	push   (%ebx)
  for(i = 1; i < argc; i++){
  4a:	83 c6 01             	add    $0x1,%esi
  4d:	83 c3 04             	add    $0x4,%ebx
    wc(fd, argv[i]);
  50:	50                   	push   %eax
  51:	e8 4a 00 00 00       	call   a0 <wc>
    close(fd);
  56:	89 3c 24             	mov    %edi,(%esp)
  59:	e8 9d 03 00 00       	call   3fb <close>
  for(i = 1; i < argc; i++){
  5e:	83 c4 10             	add    $0x10,%esp
  61:	39 75 e4             	cmp    %esi,-0x1c(%ebp)
  64:	75 ca                	jne    30 <main+0x30>
  }
  exit();
  66:	e8 68 03 00 00       	call   3d3 <exit>
      fprintf(2, "wc: cannot open %s\n", argv[i]);
  6b:	50                   	push   %eax
  6c:	ff 33                	push   (%ebx)
  6e:	68 3b 09 00 00       	push   $0x93b
  73:	6a 02                	push   $0x2
  75:	e8 d6 06 00 00       	call   750 <fprintf>
      exit();
  7a:	e8 54 03 00 00       	call   3d3 <exit>
    wc(0, "");
  7f:	52                   	push   %edx
  80:	52                   	push   %edx
  81:	68 2d 09 00 00       	push   $0x92d
  86:	6a 00                	push   $0x0
  88:	e8 13 00 00 00       	call   a0 <wc>
    exit();
  8d:	e8 41 03 00 00       	call   3d3 <exit>
  92:	66 90                	xchg   %ax,%ax
  94:	66 90                	xchg   %ax,%ax
  96:	66 90                	xchg   %ax,%ax
  98:	66 90                	xchg   %ax,%ax
  9a:	66 90                	xchg   %ax,%ax
  9c:	66 90                	xchg   %ax,%ax
  9e:	66 90                	xchg   %ax,%ax

000000a0 <wc>:
{
  a0:	55                   	push   %ebp
  a1:	89 e5                	mov    %esp,%ebp
  a3:	57                   	push   %edi
  a4:	56                   	push   %esi
  a5:	53                   	push   %ebx
  l = w = c = 0;
  a6:	31 db                	xor    %ebx,%ebx
{
  a8:	83 ec 1c             	sub    $0x1c,%esp
  inword = 0;
  ab:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
  l = w = c = 0;
  b2:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%ebp)
  b9:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
  while((n = read(fd, buf, sizeof(buf))) > 0){
  c0:	83 ec 04             	sub    $0x4,%esp
  c3:	68 00 02 00 00       	push   $0x200
  c8:	68 e0 09 00 00       	push   $0x9e0
  cd:	ff 75 08             	push   0x8(%ebp)
  d0:	e8 16 03 00 00       	call   3eb <read>
  d5:	83 c4 10             	add    $0x10,%esp
  d8:	89 c6                	mov    %eax,%esi
  da:	85 c0                	test   %eax,%eax
  dc:	7e 62                	jle    140 <wc+0xa0>
    for(i=0; i<n; i++){
  de:	31 ff                	xor    %edi,%edi
  e0:	eb 14                	jmp    f6 <wc+0x56>
  e2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        inword = 0;
  e8:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
    for(i=0; i<n; i++){
  ef:	83 c7 01             	add    $0x1,%edi
  f2:	39 fe                	cmp    %edi,%esi
  f4:	74 42                	je     138 <wc+0x98>
      if(buf[i] == '\n')
  f6:	0f be 87 e0 09 00 00 	movsbl 0x9e0(%edi),%eax
        l++;
  fd:	31 c9                	xor    %ecx,%ecx
  ff:	3c 0a                	cmp    $0xa,%al
 101:	0f 94 c1             	sete   %cl
      if(strchr(" \r\t\n\v", buf[i]))
 104:	83 ec 08             	sub    $0x8,%esp
 107:	50                   	push   %eax
        l++;
 108:	01 cb                	add    %ecx,%ebx
      if(strchr(" \r\t\n\v", buf[i]))
 10a:	68 18 09 00 00       	push   $0x918
 10f:	e8 4c 01 00 00       	call   260 <strchr>
 114:	83 c4 10             	add    $0x10,%esp
 117:	85 c0                	test   %eax,%eax
 119:	75 cd                	jne    e8 <wc+0x48>
      else if(!inword){
 11b:	8b 55 e4             	mov    -0x1c(%ebp),%edx
 11e:	85 d2                	test   %edx,%edx
 120:	75 cd                	jne    ef <wc+0x4f>
    for(i=0; i<n; i++){
 122:	83 c7 01             	add    $0x1,%edi
        w++;
 125:	83 45 e0 01          	addl   $0x1,-0x20(%ebp)
        inword = 1;
 129:	c7 45 e4 01 00 00 00 	movl   $0x1,-0x1c(%ebp)
    for(i=0; i<n; i++){
 130:	39 fe                	cmp    %edi,%esi
 132:	75 c2                	jne    f6 <wc+0x56>
 134:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
      c++;
 138:	01 75 dc             	add    %esi,-0x24(%ebp)
 13b:	eb 83                	jmp    c0 <wc+0x20>
 13d:	8d 76 00             	lea    0x0(%esi),%esi
  if(n < 0){
 140:	75 22                	jne    164 <wc+0xc4>
  printf("%d %d %d %s\n", l, w, c, name);
 142:	83 ec 0c             	sub    $0xc,%esp
 145:	ff 75 0c             	push   0xc(%ebp)
 148:	ff 75 dc             	push   -0x24(%ebp)
 14b:	ff 75 e0             	push   -0x20(%ebp)
 14e:	53                   	push   %ebx
 14f:	68 2e 09 00 00       	push   $0x92e
 154:	e8 17 06 00 00       	call   770 <printf>
}
 159:	83 c4 20             	add    $0x20,%esp
 15c:	8d 65 f4             	lea    -0xc(%ebp),%esp
 15f:	5b                   	pop    %ebx
 160:	5e                   	pop    %esi
 161:	5f                   	pop    %edi
 162:	5d                   	pop    %ebp
 163:	c3                   	ret    
    fprintf(2, "wc: read error\n");
 164:	50                   	push   %eax
 165:	50                   	push   %eax
 166:	68 1e 09 00 00       	push   $0x91e
 16b:	6a 02                	push   $0x2
 16d:	e8 de 05 00 00       	call   750 <fprintf>
    exit();
 172:	e8 5c 02 00 00       	call   3d3 <exit>
 177:	66 90                	xchg   %ax,%ax
 179:	66 90                	xchg   %ax,%ax
 17b:	66 90                	xchg   %ax,%ax
 17d:	66 90                	xchg   %ax,%ax
 17f:	90                   	nop

00000180 <strcpy>:
#include "user/user.h"
#include "../kernel/x86.h"

char*
strcpy(char *s, const char *t)
{
 180:	55                   	push   %ebp
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 181:	31 c0                	xor    %eax,%eax
{
 183:	89 e5                	mov    %esp,%ebp
 185:	53                   	push   %ebx
 186:	8b 4d 08             	mov    0x8(%ebp),%ecx
 189:	8b 5d 0c             	mov    0xc(%ebp),%ebx
 18c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  while((*s++ = *t++) != 0)
 190:	0f b6 14 03          	movzbl (%ebx,%eax,1),%edx
 194:	88 14 01             	mov    %dl,(%ecx,%eax,1)
 197:	83 c0 01             	add    $0x1,%eax
 19a:	84 d2                	test   %dl,%dl
 19c:	75 f2                	jne    190 <strcpy+0x10>
    ;
  return os;
}
 19e:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 1a1:	89 c8                	mov    %ecx,%eax
 1a3:	c9                   	leave  
 1a4:	c3                   	ret    
 1a5:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 1ac:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

000001b0 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 1b0:	55                   	push   %ebp
 1b1:	89 e5                	mov    %esp,%ebp
 1b3:	53                   	push   %ebx
 1b4:	8b 55 08             	mov    0x8(%ebp),%edx
 1b7:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  while(*p && *p == *q)
 1ba:	0f b6 02             	movzbl (%edx),%eax
 1bd:	84 c0                	test   %al,%al
 1bf:	75 17                	jne    1d8 <strcmp+0x28>
 1c1:	eb 3a                	jmp    1fd <strcmp+0x4d>
 1c3:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 1c7:	90                   	nop
 1c8:	0f b6 42 01          	movzbl 0x1(%edx),%eax
    p++, q++;
 1cc:	83 c2 01             	add    $0x1,%edx
 1cf:	8d 59 01             	lea    0x1(%ecx),%ebx
  while(*p && *p == *q)
 1d2:	84 c0                	test   %al,%al
 1d4:	74 1a                	je     1f0 <strcmp+0x40>
    p++, q++;
 1d6:	89 d9                	mov    %ebx,%ecx
  while(*p && *p == *q)
 1d8:	0f b6 19             	movzbl (%ecx),%ebx
 1db:	38 c3                	cmp    %al,%bl
 1dd:	74 e9                	je     1c8 <strcmp+0x18>
  return (uchar)*p - (uchar)*q;
 1df:	29 d8                	sub    %ebx,%eax
}
 1e1:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 1e4:	c9                   	leave  
 1e5:	c3                   	ret    
 1e6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 1ed:	8d 76 00             	lea    0x0(%esi),%esi
  return (uchar)*p - (uchar)*q;
 1f0:	0f b6 59 01          	movzbl 0x1(%ecx),%ebx
 1f4:	31 c0                	xor    %eax,%eax
 1f6:	29 d8                	sub    %ebx,%eax
}
 1f8:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 1fb:	c9                   	leave  
 1fc:	c3                   	ret    
  return (uchar)*p - (uchar)*q;
 1fd:	0f b6 19             	movzbl (%ecx),%ebx
 200:	31 c0                	xor    %eax,%eax
 202:	eb db                	jmp    1df <strcmp+0x2f>
 204:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 20b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 20f:	90                   	nop

00000210 <strlen>:

uint
strlen(const char *s)
{
 210:	55                   	push   %ebp
 211:	89 e5                	mov    %esp,%ebp
 213:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  for(n = 0; s[n]; n++)
 216:	80 3a 00             	cmpb   $0x0,(%edx)
 219:	74 15                	je     230 <strlen+0x20>
 21b:	31 c0                	xor    %eax,%eax
 21d:	8d 76 00             	lea    0x0(%esi),%esi
 220:	83 c0 01             	add    $0x1,%eax
 223:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
 227:	89 c1                	mov    %eax,%ecx
 229:	75 f5                	jne    220 <strlen+0x10>
    ;
  return n;
}
 22b:	89 c8                	mov    %ecx,%eax
 22d:	5d                   	pop    %ebp
 22e:	c3                   	ret    
 22f:	90                   	nop
  for(n = 0; s[n]; n++)
 230:	31 c9                	xor    %ecx,%ecx
}
 232:	5d                   	pop    %ebp
 233:	89 c8                	mov    %ecx,%eax
 235:	c3                   	ret    
 236:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 23d:	8d 76 00             	lea    0x0(%esi),%esi

00000240 <memset>:

void*
memset(void *dst, int c, uint n)
{
 240:	55                   	push   %ebp
 241:	89 e5                	mov    %esp,%ebp
 243:	57                   	push   %edi
 244:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 247:	8b 4d 10             	mov    0x10(%ebp),%ecx
 24a:	8b 45 0c             	mov    0xc(%ebp),%eax
 24d:	89 d7                	mov    %edx,%edi
 24f:	fc                   	cld    
 250:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 252:	8b 7d fc             	mov    -0x4(%ebp),%edi
 255:	89 d0                	mov    %edx,%eax
 257:	c9                   	leave  
 258:	c3                   	ret    
 259:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000260 <strchr>:

char*
strchr(const char *s, char c)
{
 260:	55                   	push   %ebp
 261:	89 e5                	mov    %esp,%ebp
 263:	8b 45 08             	mov    0x8(%ebp),%eax
 266:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 26a:	0f b6 10             	movzbl (%eax),%edx
 26d:	84 d2                	test   %dl,%dl
 26f:	75 12                	jne    283 <strchr+0x23>
 271:	eb 1d                	jmp    290 <strchr+0x30>
 273:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 277:	90                   	nop
 278:	0f b6 50 01          	movzbl 0x1(%eax),%edx
 27c:	83 c0 01             	add    $0x1,%eax
 27f:	84 d2                	test   %dl,%dl
 281:	74 0d                	je     290 <strchr+0x30>
    if(*s == c)
 283:	38 d1                	cmp    %dl,%cl
 285:	75 f1                	jne    278 <strchr+0x18>
      return (char*)s;
  return 0;
}
 287:	5d                   	pop    %ebp
 288:	c3                   	ret    
 289:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  return 0;
 290:	31 c0                	xor    %eax,%eax
}
 292:	5d                   	pop    %ebp
 293:	c3                   	ret    
 294:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 29b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 29f:	90                   	nop

000002a0 <gets>:

char*
gets(char *buf, int max)
{
 2a0:	55                   	push   %ebp
 2a1:	89 e5                	mov    %esp,%ebp
 2a3:	57                   	push   %edi
 2a4:	56                   	push   %esi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    cc = read(0, &c, 1);
 2a5:	8d 7d e7             	lea    -0x19(%ebp),%edi
{
 2a8:	53                   	push   %ebx
  for(i=0; i+1 < max; ){
 2a9:	31 db                	xor    %ebx,%ebx
{
 2ab:	83 ec 1c             	sub    $0x1c,%esp
  for(i=0; i+1 < max; ){
 2ae:	eb 27                	jmp    2d7 <gets+0x37>
    cc = read(0, &c, 1);
 2b0:	83 ec 04             	sub    $0x4,%esp
 2b3:	6a 01                	push   $0x1
 2b5:	57                   	push   %edi
 2b6:	6a 00                	push   $0x0
 2b8:	e8 2e 01 00 00       	call   3eb <read>
    if(cc < 1)
 2bd:	83 c4 10             	add    $0x10,%esp
 2c0:	85 c0                	test   %eax,%eax
 2c2:	7e 1d                	jle    2e1 <gets+0x41>
      break;
    buf[i++] = c;
 2c4:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 2c8:	8b 55 08             	mov    0x8(%ebp),%edx
 2cb:	88 44 1a ff          	mov    %al,-0x1(%edx,%ebx,1)
    if(c == '\n' || c == '\r')
 2cf:	3c 0a                	cmp    $0xa,%al
 2d1:	74 1d                	je     2f0 <gets+0x50>
 2d3:	3c 0d                	cmp    $0xd,%al
 2d5:	74 19                	je     2f0 <gets+0x50>
  for(i=0; i+1 < max; ){
 2d7:	89 de                	mov    %ebx,%esi
 2d9:	83 c3 01             	add    $0x1,%ebx
 2dc:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 2df:	7c cf                	jl     2b0 <gets+0x10>
      break;
  }
  buf[i] = '\0';
 2e1:	8b 45 08             	mov    0x8(%ebp),%eax
 2e4:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
  return buf;
}
 2e8:	8d 65 f4             	lea    -0xc(%ebp),%esp
 2eb:	5b                   	pop    %ebx
 2ec:	5e                   	pop    %esi
 2ed:	5f                   	pop    %edi
 2ee:	5d                   	pop    %ebp
 2ef:	c3                   	ret    
  buf[i] = '\0';
 2f0:	8b 45 08             	mov    0x8(%ebp),%eax
 2f3:	89 de                	mov    %ebx,%esi
 2f5:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
}
 2f9:	8d 65 f4             	lea    -0xc(%ebp),%esp
 2fc:	5b                   	pop    %ebx
 2fd:	5e                   	pop    %esi
 2fe:	5f                   	pop    %edi
 2ff:	5d                   	pop    %ebp
 300:	c3                   	ret    
 301:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 308:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 30f:	90                   	nop

00000310 <stat>:

int
stat(const char *n, struct stat *st)
{
 310:	55                   	push   %ebp
 311:	89 e5                	mov    %esp,%ebp
 313:	56                   	push   %esi
 314:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 315:	83 ec 08             	sub    $0x8,%esp
 318:	6a 00                	push   $0x0
 31a:	ff 75 08             	push   0x8(%ebp)
 31d:	e8 f1 00 00 00       	call   413 <open>
  if(fd < 0)
 322:	83 c4 10             	add    $0x10,%esp
 325:	85 c0                	test   %eax,%eax
 327:	78 27                	js     350 <stat+0x40>
    return -1;
  r = fstat(fd, st);
 329:	83 ec 08             	sub    $0x8,%esp
 32c:	ff 75 0c             	push   0xc(%ebp)
 32f:	89 c3                	mov    %eax,%ebx
 331:	50                   	push   %eax
 332:	e8 f4 00 00 00       	call   42b <fstat>
  close(fd);
 337:	89 1c 24             	mov    %ebx,(%esp)
  r = fstat(fd, st);
 33a:	89 c6                	mov    %eax,%esi
  close(fd);
 33c:	e8 ba 00 00 00       	call   3fb <close>
  return r;
 341:	83 c4 10             	add    $0x10,%esp
}
 344:	8d 65 f8             	lea    -0x8(%ebp),%esp
 347:	89 f0                	mov    %esi,%eax
 349:	5b                   	pop    %ebx
 34a:	5e                   	pop    %esi
 34b:	5d                   	pop    %ebp
 34c:	c3                   	ret    
 34d:	8d 76 00             	lea    0x0(%esi),%esi
    return -1;
 350:	be ff ff ff ff       	mov    $0xffffffff,%esi
 355:	eb ed                	jmp    344 <stat+0x34>
 357:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 35e:	66 90                	xchg   %ax,%ax

00000360 <atoi>:

int
atoi(const char *s)
{
 360:	55                   	push   %ebp
 361:	89 e5                	mov    %esp,%ebp
 363:	53                   	push   %ebx
 364:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 367:	0f be 02             	movsbl (%edx),%eax
 36a:	8d 48 d0             	lea    -0x30(%eax),%ecx
 36d:	80 f9 09             	cmp    $0x9,%cl
  n = 0;
 370:	b9 00 00 00 00       	mov    $0x0,%ecx
  while('0' <= *s && *s <= '9')
 375:	77 1e                	ja     395 <atoi+0x35>
 377:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 37e:	66 90                	xchg   %ax,%ax
    n = n*10 + *s++ - '0';
 380:	83 c2 01             	add    $0x1,%edx
 383:	8d 0c 89             	lea    (%ecx,%ecx,4),%ecx
 386:	8d 4c 48 d0          	lea    -0x30(%eax,%ecx,2),%ecx
  while('0' <= *s && *s <= '9')
 38a:	0f be 02             	movsbl (%edx),%eax
 38d:	8d 58 d0             	lea    -0x30(%eax),%ebx
 390:	80 fb 09             	cmp    $0x9,%bl
 393:	76 eb                	jbe    380 <atoi+0x20>
  return n;
}
 395:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 398:	89 c8                	mov    %ecx,%eax
 39a:	c9                   	leave  
 39b:	c3                   	ret    
 39c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

000003a0 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 3a0:	55                   	push   %ebp
 3a1:	89 e5                	mov    %esp,%ebp
 3a3:	57                   	push   %edi
 3a4:	8b 45 10             	mov    0x10(%ebp),%eax
 3a7:	8b 55 08             	mov    0x8(%ebp),%edx
 3aa:	56                   	push   %esi
 3ab:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 3ae:	85 c0                	test   %eax,%eax
 3b0:	7e 13                	jle    3c5 <memmove+0x25>
 3b2:	01 d0                	add    %edx,%eax
  dst = vdst;
 3b4:	89 d7                	mov    %edx,%edi
 3b6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 3bd:	8d 76 00             	lea    0x0(%esi),%esi
    *dst++ = *src++;
 3c0:	a4                   	movsb  %ds:(%esi),%es:(%edi)
  while(n-- > 0)
 3c1:	39 f8                	cmp    %edi,%eax
 3c3:	75 fb                	jne    3c0 <memmove+0x20>
  return vdst;
}
 3c5:	5e                   	pop    %esi
 3c6:	89 d0                	mov    %edx,%eax
 3c8:	5f                   	pop    %edi
 3c9:	5d                   	pop    %ebp
 3ca:	c3                   	ret    

000003cb <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 3cb:	b8 01 00 00 00       	mov    $0x1,%eax
 3d0:	cd 40                	int    $0x40
 3d2:	c3                   	ret    

000003d3 <exit>:
SYSCALL(exit)
 3d3:	b8 02 00 00 00       	mov    $0x2,%eax
 3d8:	cd 40                	int    $0x40
 3da:	c3                   	ret    

000003db <wait>:
SYSCALL(wait)
 3db:	b8 03 00 00 00       	mov    $0x3,%eax
 3e0:	cd 40                	int    $0x40
 3e2:	c3                   	ret    

000003e3 <pipe>:
SYSCALL(pipe)
 3e3:	b8 04 00 00 00       	mov    $0x4,%eax
 3e8:	cd 40                	int    $0x40
 3ea:	c3                   	ret    

000003eb <read>:
SYSCALL(read)
 3eb:	b8 05 00 00 00       	mov    $0x5,%eax
 3f0:	cd 40                	int    $0x40
 3f2:	c3                   	ret    

000003f3 <write>:
SYSCALL(write)
 3f3:	b8 10 00 00 00       	mov    $0x10,%eax
 3f8:	cd 40                	int    $0x40
 3fa:	c3                   	ret    

000003fb <close>:
SYSCALL(close)
 3fb:	b8 15 00 00 00       	mov    $0x15,%eax
 400:	cd 40                	int    $0x40
 402:	c3                   	ret    

00000403 <kill>:
SYSCALL(kill)
 403:	b8 06 00 00 00       	mov    $0x6,%eax
 408:	cd 40                	int    $0x40
 40a:	c3                   	ret    

0000040b <exec>:
SYSCALL(exec)
 40b:	b8 07 00 00 00       	mov    $0x7,%eax
 410:	cd 40                	int    $0x40
 412:	c3                   	ret    

00000413 <open>:
SYSCALL(open)
 413:	b8 0f 00 00 00       	mov    $0xf,%eax
 418:	cd 40                	int    $0x40
 41a:	c3                   	ret    

0000041b <mknod>:
SYSCALL(mknod)
 41b:	b8 11 00 00 00       	mov    $0x11,%eax
 420:	cd 40                	int    $0x40
 422:	c3                   	ret    

00000423 <unlink>:
SYSCALL(unlink)
 423:	b8 12 00 00 00       	mov    $0x12,%eax
 428:	cd 40                	int    $0x40
 42a:	c3                   	ret    

0000042b <fstat>:
SYSCALL(fstat)
 42b:	b8 08 00 00 00       	mov    $0x8,%eax
 430:	cd 40                	int    $0x40
 432:	c3                   	ret    

00000433 <link>:
SYSCALL(link)
 433:	b8 13 00 00 00       	mov    $0x13,%eax
 438:	cd 40                	int    $0x40
 43a:	c3                   	ret    

0000043b <mkdir>:
SYSCALL(mkdir)
 43b:	b8 14 00 00 00       	mov    $0x14,%eax
 440:	cd 40                	int    $0x40
 442:	c3                   	ret    

00000443 <chdir>:
SYSCALL(chdir)
 443:	b8 09 00 00 00       	mov    $0x9,%eax
 448:	cd 40                	int    $0x40
 44a:	c3                   	ret    

0000044b <dup>:
SYSCALL(dup)
 44b:	b8 0a 00 00 00       	mov    $0xa,%eax
 450:	cd 40                	int    $0x40
 452:	c3                   	ret    

00000453 <getpid>:
SYSCALL(getpid)
 453:	b8 0b 00 00 00       	mov    $0xb,%eax
 458:	cd 40                	int    $0x40
 45a:	c3                   	ret    

0000045b <sbrk>:
SYSCALL(sbrk)
 45b:	b8 0c 00 00 00       	mov    $0xc,%eax
 460:	cd 40                	int    $0x40
 462:	c3                   	ret    

00000463 <sleep>:
SYSCALL(sleep)
 463:	b8 0d 00 00 00       	mov    $0xd,%eax
 468:	cd 40                	int    $0x40
 46a:	c3                   	ret    

0000046b <uptime>:
SYSCALL(uptime)
 46b:	b8 0e 00 00 00       	mov    $0xe,%eax
 470:	cd 40                	int    $0x40
 472:	c3                   	ret    

00000473 <cpuhalt>:
SYSCALL(cpuhalt)
 473:	b8 16 00 00 00       	mov    $0x16,%eax
 478:	cd 40                	int    $0x40
 47a:	c3                   	ret    
 47b:	66 90                	xchg   %ax,%ax
 47d:	66 90                	xchg   %ax,%ax
 47f:	90                   	nop

00000480 <printint.constprop.0>:
  for (i = 0; i < (sizeof(uint) * 2); i++, x <<= 4)
    putc(fd, digits[x >> (sizeof(uint) * 8 - 4)]);
}

static void
printint(int fd, int xx, int base, int sgn)
 480:	55                   	push   %ebp
 481:	89 e5                	mov    %esp,%ebp
 483:	57                   	push   %edi
 484:	56                   	push   %esi
 485:	53                   	push   %ebx
 486:	83 ec 3c             	sub    $0x3c,%esp
 489:	89 55 c4             	mov    %edx,-0x3c(%ebp)
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 48c:	85 c0                	test   %eax,%eax
 48e:	0f 89 84 00 00 00    	jns    518 <printint.constprop.0+0x98>
 494:	83 e1 01             	and    $0x1,%ecx
 497:	74 7f                	je     518 <printint.constprop.0+0x98>
    neg = 1;
 499:	c7 45 bc 01 00 00 00 	movl   $0x1,-0x44(%ebp)
    x = -xx;
 4a0:	f7 d8                	neg    %eax
 4a2:	89 c1                	mov    %eax,%ecx
  } else {
    x = xx;
  }

  i = 0;
 4a4:	31 db                	xor    %ebx,%ebx
 4a6:	8d 75 d7             	lea    -0x29(%ebp),%esi
 4a9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  do{
    buf[i++] = digits[x % base];
 4b0:	89 c8                	mov    %ecx,%eax
 4b2:	31 d2                	xor    %edx,%edx
 4b4:	89 cf                	mov    %ecx,%edi
 4b6:	f7 75 c4             	divl   -0x3c(%ebp)
 4b9:	0f b6 92 b0 09 00 00 	movzbl 0x9b0(%edx),%edx
 4c0:	89 45 c0             	mov    %eax,-0x40(%ebp)
 4c3:	89 d8                	mov    %ebx,%eax
 4c5:	8d 5b 01             	lea    0x1(%ebx),%ebx
  }while((x /= base) != 0);
 4c8:	8b 4d c0             	mov    -0x40(%ebp),%ecx
    buf[i++] = digits[x % base];
 4cb:	88 14 1e             	mov    %dl,(%esi,%ebx,1)
  }while((x /= base) != 0);
 4ce:	3b 7d c4             	cmp    -0x3c(%ebp),%edi
 4d1:	73 dd                	jae    4b0 <printint.constprop.0+0x30>
  if(neg)
 4d3:	8b 4d bc             	mov    -0x44(%ebp),%ecx
 4d6:	85 c9                	test   %ecx,%ecx
 4d8:	74 0c                	je     4e6 <printint.constprop.0+0x66>
    buf[i++] = '-';
 4da:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
    buf[i++] = digits[x % base];
 4df:	89 d8                	mov    %ebx,%eax
    buf[i++] = '-';
 4e1:	ba 2d 00 00 00       	mov    $0x2d,%edx

  while(--i >= 0)
 4e6:	8d 5c 05 d7          	lea    -0x29(%ebp,%eax,1),%ebx
 4ea:	eb 0a                	jmp    4f6 <printint.constprop.0+0x76>
 4ec:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    putc(fd, buf[i]);
 4f0:	0f b6 13             	movzbl (%ebx),%edx
 4f3:	83 eb 01             	sub    $0x1,%ebx
  write(fd, &c, 1);
 4f6:	83 ec 04             	sub    $0x4,%esp
 4f9:	88 55 d7             	mov    %dl,-0x29(%ebp)
 4fc:	6a 01                	push   $0x1
 4fe:	56                   	push   %esi
 4ff:	6a 01                	push   $0x1
 501:	e8 ed fe ff ff       	call   3f3 <write>
  while(--i >= 0)
 506:	83 c4 10             	add    $0x10,%esp
 509:	39 de                	cmp    %ebx,%esi
 50b:	75 e3                	jne    4f0 <printint.constprop.0+0x70>
}
 50d:	8d 65 f4             	lea    -0xc(%ebp),%esp
 510:	5b                   	pop    %ebx
 511:	5e                   	pop    %esi
 512:	5f                   	pop    %edi
 513:	5d                   	pop    %ebp
 514:	c3                   	ret    
 515:	8d 76 00             	lea    0x0(%esi),%esi
  neg = 0;
 518:	c7 45 bc 00 00 00 00 	movl   $0x0,-0x44(%ebp)
    x = xx;
 51f:	89 c1                	mov    %eax,%ecx
 521:	eb 81                	jmp    4a4 <printint.constprop.0+0x24>
 523:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 52a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00000530 <vprintf.constprop.0>:
static void vprintf(int fd, const char *fmt, va_list ap)
 530:	55                   	push   %ebp
 531:	89 e5                	mov    %esp,%ebp
 533:	57                   	push   %edi
 534:	56                   	push   %esi
 535:	53                   	push   %ebx
 536:	83 ec 2c             	sub    $0x2c,%esp
 539:	89 55 d4             	mov    %edx,-0x2c(%ebp)
{
  char *s;
  int c, i, state;

  state = 0;
  for(i = 0; fmt[i]; i++){
 53c:	0f b6 10             	movzbl (%eax),%edx
 53f:	84 d2                	test   %dl,%dl
 541:	74 6c                	je     5af <vprintf.constprop.0+0x7f>
 543:	8d 58 01             	lea    0x1(%eax),%ebx
 546:	31 ff                	xor    %edi,%edi
 548:	8d 75 e7             	lea    -0x19(%ebp),%esi
 54b:	eb 25                	jmp    572 <vprintf.constprop.0+0x42>
 54d:	8d 76 00             	lea    0x0(%esi),%esi
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
 550:	83 f8 25             	cmp    $0x25,%eax
 553:	74 4b                	je     5a0 <vprintf.constprop.0+0x70>
  write(fd, &c, 1);
 555:	83 ec 04             	sub    $0x4,%esp
 558:	88 55 e7             	mov    %dl,-0x19(%ebp)
 55b:	6a 01                	push   $0x1
 55d:	56                   	push   %esi
 55e:	6a 01                	push   $0x1
 560:	e8 8e fe ff ff       	call   3f3 <write>
        state = '%';
      } else {
        putc(fd, c);
 565:	83 c4 10             	add    $0x10,%esp
  for(i = 0; fmt[i]; i++){
 568:	0f b6 13             	movzbl (%ebx),%edx
 56b:	83 c3 01             	add    $0x1,%ebx
 56e:	84 d2                	test   %dl,%dl
 570:	74 3d                	je     5af <vprintf.constprop.0+0x7f>
    c = fmt[i] & 0xff;
 572:	0f b6 c2             	movzbl %dl,%eax
    if(state == 0){
 575:	85 ff                	test   %edi,%edi
 577:	74 d7                	je     550 <vprintf.constprop.0+0x20>
      }
    } else if(state == '%'){
 579:	83 ff 25             	cmp    $0x25,%edi
 57c:	75 ea                	jne    568 <vprintf.constprop.0+0x38>
      if(c == 'd'){
 57e:	83 f8 25             	cmp    $0x25,%eax
 581:	0f 84 a9 01 00 00    	je     730 <vprintf.constprop.0+0x200>
 587:	83 e8 63             	sub    $0x63,%eax
 58a:	83 f8 15             	cmp    $0x15,%eax
 58d:	77 31                	ja     5c0 <vprintf.constprop.0+0x90>
 58f:	ff 24 85 58 09 00 00 	jmp    *0x958(,%eax,4)
 596:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 59d:	8d 76 00             	lea    0x0(%esi),%esi
  for(i = 0; fmt[i]; i++){
 5a0:	0f b6 13             	movzbl (%ebx),%edx
 5a3:	83 c3 01             	add    $0x1,%ebx
        state = '%';
 5a6:	bf 25 00 00 00       	mov    $0x25,%edi
  for(i = 0; fmt[i]; i++){
 5ab:	84 d2                	test   %dl,%dl
 5ad:	75 c3                	jne    572 <vprintf.constprop.0+0x42>
        putc(fd, c);
      }
      state = 0;
    }
  }
}
 5af:	8d 65 f4             	lea    -0xc(%ebp),%esp
 5b2:	5b                   	pop    %ebx
 5b3:	5e                   	pop    %esi
 5b4:	5f                   	pop    %edi
 5b5:	5d                   	pop    %ebp
 5b6:	c3                   	ret    
 5b7:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 5be:	66 90                	xchg   %ax,%ax
  write(fd, &c, 1);
 5c0:	83 ec 04             	sub    $0x4,%esp
 5c3:	88 55 d0             	mov    %dl,-0x30(%ebp)
 5c6:	6a 01                	push   $0x1
 5c8:	56                   	push   %esi
 5c9:	6a 01                	push   $0x1
 5cb:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
 5cf:	e8 1f fe ff ff       	call   3f3 <write>
        putc(fd, c);
 5d4:	0f b6 55 d0          	movzbl -0x30(%ebp),%edx
  write(fd, &c, 1);
 5d8:	83 c4 0c             	add    $0xc,%esp
 5db:	88 55 e7             	mov    %dl,-0x19(%ebp)
 5de:	6a 01                	push   $0x1
      state = 0;
 5e0:	31 ff                	xor    %edi,%edi
  write(fd, &c, 1);
 5e2:	56                   	push   %esi
 5e3:	6a 01                	push   $0x1
 5e5:	e8 09 fe ff ff       	call   3f3 <write>
        putc(fd, c);
 5ea:	83 c4 10             	add    $0x10,%esp
 5ed:	e9 76 ff ff ff       	jmp    568 <vprintf.constprop.0+0x38>
 5f2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        putc(fd, va_arg(ap, uint));
 5f8:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  write(fd, &c, 1);
 5fb:	83 ec 04             	sub    $0x4,%esp
        putc(fd, va_arg(ap, uint));
 5fe:	8d 78 04             	lea    0x4(%eax),%edi
 601:	8b 00                	mov    (%eax),%eax
  write(fd, &c, 1);
 603:	6a 01                	push   $0x1
 605:	56                   	push   %esi
 606:	6a 01                	push   $0x1
        putc(fd, va_arg(ap, uint));
 608:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
 60b:	e8 e3 fd ff ff       	call   3f3 <write>
        putc(fd, va_arg(ap, uint));
 610:	89 7d d4             	mov    %edi,-0x2c(%ebp)
 613:	83 c4 10             	add    $0x10,%esp
      state = 0;
 616:	31 ff                	xor    %edi,%edi
 618:	e9 4b ff ff ff       	jmp    568 <vprintf.constprop.0+0x38>
 61d:	8d 76 00             	lea    0x0(%esi),%esi
        printint(fd, va_arg(ap, int), 10, 1);
 620:	8b 45 d4             	mov    -0x2c(%ebp),%eax
 623:	b9 01 00 00 00       	mov    $0x1,%ecx
 628:	8d 78 04             	lea    0x4(%eax),%edi
        printint(fd, va_arg(ap, uint), 10, 0);
 62b:	8b 00                	mov    (%eax),%eax
 62d:	ba 0a 00 00 00       	mov    $0xa,%edx
 632:	e8 49 fe ff ff       	call   480 <printint.constprop.0>
 637:	89 7d d4             	mov    %edi,-0x2c(%ebp)
      state = 0;
 63a:	31 ff                	xor    %edi,%edi
 63c:	e9 27 ff ff ff       	jmp    568 <vprintf.constprop.0+0x38>
 641:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        printint(fd, va_arg(ap, uint), 10, 0);
 648:	8b 45 d4             	mov    -0x2c(%ebp),%eax
 64b:	31 c9                	xor    %ecx,%ecx
 64d:	8d 78 04             	lea    0x4(%eax),%edi
 650:	eb d9                	jmp    62b <vprintf.constprop.0+0xfb>
 652:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        printptr(fd, va_arg(ap, uint));
 658:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  write(fd, &c, 1);
 65b:	83 ec 04             	sub    $0x4,%esp
 65e:	c6 45 e7 30          	movb   $0x30,-0x19(%ebp)
        printptr(fd, va_arg(ap, uint));
 662:	8b 38                	mov    (%eax),%edi
  write(fd, &c, 1);
 664:	6a 01                	push   $0x1
        printptr(fd, va_arg(ap, uint));
 666:	8d 48 04             	lea    0x4(%eax),%ecx
  write(fd, &c, 1);
 669:	56                   	push   %esi
 66a:	6a 01                	push   $0x1
        printptr(fd, va_arg(ap, uint));
 66c:	89 4d d0             	mov    %ecx,-0x30(%ebp)
  write(fd, &c, 1);
 66f:	e8 7f fd ff ff       	call   3f3 <write>
 674:	83 c4 0c             	add    $0xc,%esp
 677:	c6 45 e7 78          	movb   $0x78,-0x19(%ebp)
 67b:	6a 01                	push   $0x1
 67d:	56                   	push   %esi
 67e:	6a 01                	push   $0x1
 680:	e8 6e fd ff ff       	call   3f3 <write>
  putc(fd, 'x');
 685:	c7 45 d4 08 00 00 00 	movl   $0x8,-0x2c(%ebp)
 68c:	83 c4 10             	add    $0x10,%esp
 68f:	90                   	nop
  write(fd, &c, 1);
 690:	83 ec 04             	sub    $0x4,%esp
    putc(fd, digits[x >> (sizeof(uint) * 8 - 4)]);
 693:	89 f8                	mov    %edi,%eax
  for (i = 0; i < (sizeof(uint) * 2); i++, x <<= 4)
 695:	c1 e7 04             	shl    $0x4,%edi
  write(fd, &c, 1);
 698:	6a 01                	push   $0x1
    putc(fd, digits[x >> (sizeof(uint) * 8 - 4)]);
 69a:	c1 e8 1c             	shr    $0x1c,%eax
  write(fd, &c, 1);
 69d:	56                   	push   %esi
 69e:	0f b6 80 b0 09 00 00 	movzbl 0x9b0(%eax),%eax
 6a5:	6a 01                	push   $0x1
 6a7:	88 45 e7             	mov    %al,-0x19(%ebp)
 6aa:	e8 44 fd ff ff       	call   3f3 <write>
  for (i = 0; i < (sizeof(uint) * 2); i++, x <<= 4)
 6af:	83 c4 10             	add    $0x10,%esp
 6b2:	83 6d d4 01          	subl   $0x1,-0x2c(%ebp)
 6b6:	75 d8                	jne    690 <vprintf.constprop.0+0x160>
        printptr(fd, va_arg(ap, uint));
 6b8:	8b 45 d0             	mov    -0x30(%ebp),%eax
      state = 0;
 6bb:	31 ff                	xor    %edi,%edi
        printptr(fd, va_arg(ap, uint));
 6bd:	89 45 d4             	mov    %eax,-0x2c(%ebp)
 6c0:	e9 a3 fe ff ff       	jmp    568 <vprintf.constprop.0+0x38>
 6c5:	8d 76 00             	lea    0x0(%esi),%esi
        s = va_arg(ap, char*);
 6c8:	8b 45 d4             	mov    -0x2c(%ebp),%eax
 6cb:	8b 38                	mov    (%eax),%edi
 6cd:	8d 48 04             	lea    0x4(%eax),%ecx
 6d0:	89 4d d4             	mov    %ecx,-0x2c(%ebp)
        if(s == 0)
 6d3:	85 ff                	test   %edi,%edi
 6d5:	74 64                	je     73b <vprintf.constprop.0+0x20b>
        while(*s != 0){
 6d7:	0f b6 07             	movzbl (%edi),%eax
 6da:	84 c0                	test   %al,%al
 6dc:	74 1f                	je     6fd <vprintf.constprop.0+0x1cd>
 6de:	66 90                	xchg   %ax,%ax
  write(fd, &c, 1);
 6e0:	83 ec 04             	sub    $0x4,%esp
          s++;
 6e3:	83 c7 01             	add    $0x1,%edi
 6e6:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
 6e9:	6a 01                	push   $0x1
 6eb:	56                   	push   %esi
 6ec:	6a 01                	push   $0x1
 6ee:	e8 00 fd ff ff       	call   3f3 <write>
        while(*s != 0){
 6f3:	0f b6 07             	movzbl (%edi),%eax
 6f6:	83 c4 10             	add    $0x10,%esp
 6f9:	84 c0                	test   %al,%al
 6fb:	75 e3                	jne    6e0 <vprintf.constprop.0+0x1b0>
      state = 0;
 6fd:	31 ff                	xor    %edi,%edi
 6ff:	e9 64 fe ff ff       	jmp    568 <vprintf.constprop.0+0x38>
 704:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        printint(fd, va_arg(ap, int), 16, 0);
 708:	8b 45 d4             	mov    -0x2c(%ebp),%eax
 70b:	31 c9                	xor    %ecx,%ecx
 70d:	ba 10 00 00 00       	mov    $0x10,%edx
 712:	8d 78 04             	lea    0x4(%eax),%edi
 715:	8b 00                	mov    (%eax),%eax
 717:	e8 64 fd ff ff       	call   480 <printint.constprop.0>
 71c:	89 7d d4             	mov    %edi,-0x2c(%ebp)
      state = 0;
 71f:	31 ff                	xor    %edi,%edi
 721:	e9 42 fe ff ff       	jmp    568 <vprintf.constprop.0+0x38>
 726:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 72d:	8d 76 00             	lea    0x0(%esi),%esi
        putc(fd, c);
 730:	88 55 e7             	mov    %dl,-0x19(%ebp)
  write(fd, &c, 1);
 733:	83 ec 04             	sub    $0x4,%esp
 736:	e9 a3 fe ff ff       	jmp    5de <vprintf.constprop.0+0xae>
          s = "(null)";
 73b:	bf 4f 09 00 00       	mov    $0x94f,%edi
        while(*s != 0){
 740:	b8 28 00 00 00       	mov    $0x28,%eax
 745:	eb 99                	jmp    6e0 <vprintf.constprop.0+0x1b0>
 747:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 74e:	66 90                	xchg   %ax,%ax

00000750 <fprintf>:
// Print to the given fd. Only understands %d,%x, %p, %s, %c.
void
fprintf(int fd, const char *fmt, ...)
{
 750:	55                   	push   %ebp
 751:	89 e5                	mov    %esp,%ebp
 753:	83 ec 08             	sub    $0x8,%esp
 va_list ap;
 va_start(ap, fmt); 
 vprintf(1,fmt,ap);
 756:	8b 45 0c             	mov    0xc(%ebp),%eax
 759:	8d 55 10             	lea    0x10(%ebp),%edx
 75c:	e8 cf fd ff ff       	call   530 <vprintf.constprop.0>
}
 761:	c9                   	leave  
 762:	c3                   	ret    
 763:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 76a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00000770 <printf>:
void
printf(const char *fmt, ...)
{
 770:	55                   	push   %ebp
 771:	89 e5                	mov    %esp,%ebp
 773:	83 ec 08             	sub    $0x8,%esp
  va_list ap;
  va_start(ap, fmt); 
  vprintf(1,fmt,ap);
 776:	8b 45 08             	mov    0x8(%ebp),%eax
 779:	8d 55 0c             	lea    0xc(%ebp),%edx
 77c:	e8 af fd ff ff       	call   530 <vprintf.constprop.0>
}
 781:	c9                   	leave  
 782:	c3                   	ret    
 783:	66 90                	xchg   %ax,%ax
 785:	66 90                	xchg   %ax,%ax
 787:	66 90                	xchg   %ax,%ax
 789:	66 90                	xchg   %ax,%ax
 78b:	66 90                	xchg   %ax,%ax
 78d:	66 90                	xchg   %ax,%ax
 78f:	90                   	nop

00000790 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 790:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 791:	a1 e0 0b 00 00       	mov    0xbe0,%eax
{
 796:	89 e5                	mov    %esp,%ebp
 798:	57                   	push   %edi
 799:	56                   	push   %esi
 79a:	53                   	push   %ebx
 79b:	8b 5d 08             	mov    0x8(%ebp),%ebx
  bp = (Header*)ap - 1;
 79e:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 7a1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 7a8:	89 c2                	mov    %eax,%edx
 7aa:	8b 00                	mov    (%eax),%eax
 7ac:	39 ca                	cmp    %ecx,%edx
 7ae:	73 30                	jae    7e0 <free+0x50>
 7b0:	39 c1                	cmp    %eax,%ecx
 7b2:	72 04                	jb     7b8 <free+0x28>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 7b4:	39 c2                	cmp    %eax,%edx
 7b6:	72 f0                	jb     7a8 <free+0x18>
      break;
  if(bp + bp->s.size == p->s.ptr){
 7b8:	8b 73 fc             	mov    -0x4(%ebx),%esi
 7bb:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 7be:	39 f8                	cmp    %edi,%eax
 7c0:	74 30                	je     7f2 <free+0x62>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
 7c2:	89 43 f8             	mov    %eax,-0x8(%ebx)
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
 7c5:	8b 42 04             	mov    0x4(%edx),%eax
 7c8:	8d 34 c2             	lea    (%edx,%eax,8),%esi
 7cb:	39 f1                	cmp    %esi,%ecx
 7cd:	74 3a                	je     809 <free+0x79>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
 7cf:	89 0a                	mov    %ecx,(%edx)
  } else
    p->s.ptr = bp;
  freep = p;
}
 7d1:	5b                   	pop    %ebx
  freep = p;
 7d2:	89 15 e0 0b 00 00    	mov    %edx,0xbe0
}
 7d8:	5e                   	pop    %esi
 7d9:	5f                   	pop    %edi
 7da:	5d                   	pop    %ebp
 7db:	c3                   	ret    
 7dc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 7e0:	39 c2                	cmp    %eax,%edx
 7e2:	72 c4                	jb     7a8 <free+0x18>
 7e4:	39 c1                	cmp    %eax,%ecx
 7e6:	73 c0                	jae    7a8 <free+0x18>
  if(bp + bp->s.size == p->s.ptr){
 7e8:	8b 73 fc             	mov    -0x4(%ebx),%esi
 7eb:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 7ee:	39 f8                	cmp    %edi,%eax
 7f0:	75 d0                	jne    7c2 <free+0x32>
    bp->s.size += p->s.ptr->s.size;
 7f2:	03 70 04             	add    0x4(%eax),%esi
 7f5:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 7f8:	8b 02                	mov    (%edx),%eax
 7fa:	8b 00                	mov    (%eax),%eax
 7fc:	89 43 f8             	mov    %eax,-0x8(%ebx)
  if(p + p->s.size == bp){
 7ff:	8b 42 04             	mov    0x4(%edx),%eax
 802:	8d 34 c2             	lea    (%edx,%eax,8),%esi
 805:	39 f1                	cmp    %esi,%ecx
 807:	75 c6                	jne    7cf <free+0x3f>
    p->s.size += bp->s.size;
 809:	03 43 fc             	add    -0x4(%ebx),%eax
  freep = p;
 80c:	89 15 e0 0b 00 00    	mov    %edx,0xbe0
    p->s.size += bp->s.size;
 812:	89 42 04             	mov    %eax,0x4(%edx)
    p->s.ptr = bp->s.ptr;
 815:	8b 4b f8             	mov    -0x8(%ebx),%ecx
 818:	89 0a                	mov    %ecx,(%edx)
}
 81a:	5b                   	pop    %ebx
 81b:	5e                   	pop    %esi
 81c:	5f                   	pop    %edi
 81d:	5d                   	pop    %ebp
 81e:	c3                   	ret    
 81f:	90                   	nop

00000820 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 820:	55                   	push   %ebp
 821:	89 e5                	mov    %esp,%ebp
 823:	57                   	push   %edi
 824:	56                   	push   %esi
 825:	53                   	push   %ebx
 826:	83 ec 1c             	sub    $0x1c,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 829:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
 82c:	8b 3d e0 0b 00 00    	mov    0xbe0,%edi
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 832:	8d 70 07             	lea    0x7(%eax),%esi
 835:	c1 ee 03             	shr    $0x3,%esi
 838:	83 c6 01             	add    $0x1,%esi
  if((prevp = freep) == 0){
 83b:	85 ff                	test   %edi,%edi
 83d:	0f 84 9d 00 00 00    	je     8e0 <malloc+0xc0>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 843:	8b 17                	mov    (%edi),%edx
    if(p->s.size >= nunits){
 845:	8b 4a 04             	mov    0x4(%edx),%ecx
 848:	39 f1                	cmp    %esi,%ecx
 84a:	73 6a                	jae    8b6 <malloc+0x96>
 84c:	bb 00 10 00 00       	mov    $0x1000,%ebx
 851:	39 de                	cmp    %ebx,%esi
 853:	0f 43 de             	cmovae %esi,%ebx
  p = sbrk(nu * sizeof(Header));
 856:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
 85d:	89 45 e4             	mov    %eax,-0x1c(%ebp)
 860:	eb 17                	jmp    879 <malloc+0x59>
 862:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 868:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
 86a:	8b 48 04             	mov    0x4(%eax),%ecx
 86d:	39 f1                	cmp    %esi,%ecx
 86f:	73 4f                	jae    8c0 <malloc+0xa0>
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 871:	8b 3d e0 0b 00 00    	mov    0xbe0,%edi
 877:	89 c2                	mov    %eax,%edx
 879:	39 d7                	cmp    %edx,%edi
 87b:	75 eb                	jne    868 <malloc+0x48>
  p = sbrk(nu * sizeof(Header));
 87d:	83 ec 0c             	sub    $0xc,%esp
 880:	ff 75 e4             	push   -0x1c(%ebp)
 883:	e8 d3 fb ff ff       	call   45b <sbrk>
  if(p == (char*)-1)
 888:	83 c4 10             	add    $0x10,%esp
 88b:	83 f8 ff             	cmp    $0xffffffff,%eax
 88e:	74 1c                	je     8ac <malloc+0x8c>
  hp->s.size = nu;
 890:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 893:	83 ec 0c             	sub    $0xc,%esp
 896:	83 c0 08             	add    $0x8,%eax
 899:	50                   	push   %eax
 89a:	e8 f1 fe ff ff       	call   790 <free>
  return freep;
 89f:	8b 15 e0 0b 00 00    	mov    0xbe0,%edx
      if((p = morecore(nunits)) == 0)
 8a5:	83 c4 10             	add    $0x10,%esp
 8a8:	85 d2                	test   %edx,%edx
 8aa:	75 bc                	jne    868 <malloc+0x48>
        return 0;
  }
}
 8ac:	8d 65 f4             	lea    -0xc(%ebp),%esp
        return 0;
 8af:	31 c0                	xor    %eax,%eax
}
 8b1:	5b                   	pop    %ebx
 8b2:	5e                   	pop    %esi
 8b3:	5f                   	pop    %edi
 8b4:	5d                   	pop    %ebp
 8b5:	c3                   	ret    
    if(p->s.size >= nunits){
 8b6:	89 d0                	mov    %edx,%eax
 8b8:	89 fa                	mov    %edi,%edx
 8ba:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      if(p->s.size == nunits)
 8c0:	39 ce                	cmp    %ecx,%esi
 8c2:	74 4c                	je     910 <malloc+0xf0>
        p->s.size -= nunits;
 8c4:	29 f1                	sub    %esi,%ecx
 8c6:	89 48 04             	mov    %ecx,0x4(%eax)
        p += p->s.size;
 8c9:	8d 04 c8             	lea    (%eax,%ecx,8),%eax
        p->s.size = nunits;
 8cc:	89 70 04             	mov    %esi,0x4(%eax)
      freep = prevp;
 8cf:	89 15 e0 0b 00 00    	mov    %edx,0xbe0
}
 8d5:	8d 65 f4             	lea    -0xc(%ebp),%esp
      return (void*)(p + 1);
 8d8:	83 c0 08             	add    $0x8,%eax
}
 8db:	5b                   	pop    %ebx
 8dc:	5e                   	pop    %esi
 8dd:	5f                   	pop    %edi
 8de:	5d                   	pop    %ebp
 8df:	c3                   	ret    
    base.s.ptr = freep = prevp = &base;
 8e0:	c7 05 e0 0b 00 00 e4 	movl   $0xbe4,0xbe0
 8e7:	0b 00 00 
    base.s.size = 0;
 8ea:	bf e4 0b 00 00       	mov    $0xbe4,%edi
    base.s.ptr = freep = prevp = &base;
 8ef:	c7 05 e4 0b 00 00 e4 	movl   $0xbe4,0xbe4
 8f6:	0b 00 00 
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 8f9:	89 fa                	mov    %edi,%edx
    base.s.size = 0;
 8fb:	c7 05 e8 0b 00 00 00 	movl   $0x0,0xbe8
 902:	00 00 00 
    if(p->s.size >= nunits){
 905:	e9 42 ff ff ff       	jmp    84c <malloc+0x2c>
 90a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        prevp->s.ptr = p->s.ptr;
 910:	8b 08                	mov    (%eax),%ecx
 912:	89 0a                	mov    %ecx,(%edx)
 914:	eb b9                	jmp    8cf <malloc+0xaf>