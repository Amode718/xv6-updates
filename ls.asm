
user/_ls:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
  close(fd);
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
   f:	53                   	push   %ebx
  10:	bb 01 00 00 00       	mov    $0x1,%ebx
  15:	51                   	push   %ecx
  16:	83 ec 08             	sub    $0x8,%esp
  19:	8b 31                	mov    (%ecx),%esi
  1b:	8b 79 04             	mov    0x4(%ecx),%edi
  int i;

  if(argc < 2){
  1e:	83 fe 01             	cmp    $0x1,%esi
  21:	7e 1f                	jle    42 <main+0x42>
  23:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  27:	90                   	nop
    ls(".");
    exit();
  }
  for(i=1; i<argc; i++)
    ls(argv[i]);
  28:	83 ec 0c             	sub    $0xc,%esp
  2b:	ff 34 9f             	push   (%edi,%ebx,4)
  for(i=1; i<argc; i++)
  2e:	83 c3 01             	add    $0x1,%ebx
    ls(argv[i]);
  31:	e8 ca 00 00 00       	call   100 <ls>
  for(i=1; i<argc; i++)
  36:	83 c4 10             	add    $0x10,%esp
  39:	39 de                	cmp    %ebx,%esi
  3b:	75 eb                	jne    28 <main+0x28>
  exit();
  3d:	e8 41 05 00 00       	call   583 <exit>
    ls(".");
  42:	83 ec 0c             	sub    $0xc,%esp
  45:	68 10 0b 00 00       	push   $0xb10
  4a:	e8 b1 00 00 00       	call   100 <ls>
    exit();
  4f:	e8 2f 05 00 00       	call   583 <exit>
  54:	66 90                	xchg   %ax,%ax
  56:	66 90                	xchg   %ax,%ax
  58:	66 90                	xchg   %ax,%ax
  5a:	66 90                	xchg   %ax,%ax
  5c:	66 90                	xchg   %ax,%ax
  5e:	66 90                	xchg   %ax,%ax

00000060 <fmtname>:
{
  60:	55                   	push   %ebp
  61:	89 e5                	mov    %esp,%ebp
  63:	56                   	push   %esi
  64:	53                   	push   %ebx
  65:	8b 75 08             	mov    0x8(%ebp),%esi
  for(p=path+strlen(path); p >= path && *p != '/'; p--)
  68:	83 ec 0c             	sub    $0xc,%esp
  6b:	56                   	push   %esi
  6c:	e8 4f 03 00 00       	call   3c0 <strlen>
  71:	83 c4 10             	add    $0x10,%esp
  74:	01 f0                	add    %esi,%eax
  76:	89 c3                	mov    %eax,%ebx
  78:	73 0f                	jae    89 <fmtname+0x29>
  7a:	eb 12                	jmp    8e <fmtname+0x2e>
  7c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  80:	8d 43 ff             	lea    -0x1(%ebx),%eax
  83:	39 c6                	cmp    %eax,%esi
  85:	77 0a                	ja     91 <fmtname+0x31>
  87:	89 c3                	mov    %eax,%ebx
  89:	80 3b 2f             	cmpb   $0x2f,(%ebx)
  8c:	75 f2                	jne    80 <fmtname+0x20>
  p++;
  8e:	83 c3 01             	add    $0x1,%ebx
  if(strlen(p) >= DIRSIZ)
  91:	83 ec 0c             	sub    $0xc,%esp
  94:	53                   	push   %ebx
  95:	e8 26 03 00 00       	call   3c0 <strlen>
  9a:	83 c4 10             	add    $0x10,%esp
  9d:	83 f8 0d             	cmp    $0xd,%eax
  a0:	77 4a                	ja     ec <fmtname+0x8c>
  memmove(buf, p, strlen(p));
  a2:	83 ec 0c             	sub    $0xc,%esp
  a5:	53                   	push   %ebx
  a6:	e8 15 03 00 00       	call   3c0 <strlen>
  ab:	83 c4 0c             	add    $0xc,%esp
  ae:	50                   	push   %eax
  af:	53                   	push   %ebx
  b0:	68 88 0b 00 00       	push   $0xb88
  b5:	e8 96 04 00 00       	call   550 <memmove>
  memset(buf+strlen(p), ' ', DIRSIZ-strlen(p));
  ba:	89 1c 24             	mov    %ebx,(%esp)
  bd:	e8 fe 02 00 00       	call   3c0 <strlen>
  c2:	89 1c 24             	mov    %ebx,(%esp)
  return buf;
  c5:	bb 88 0b 00 00       	mov    $0xb88,%ebx
  memset(buf+strlen(p), ' ', DIRSIZ-strlen(p));
  ca:	89 c6                	mov    %eax,%esi
  cc:	e8 ef 02 00 00       	call   3c0 <strlen>
  d1:	ba 0e 00 00 00       	mov    $0xe,%edx
  d6:	83 c4 0c             	add    $0xc,%esp
  d9:	29 f2                	sub    %esi,%edx
  db:	05 88 0b 00 00       	add    $0xb88,%eax
  e0:	52                   	push   %edx
  e1:	6a 20                	push   $0x20
  e3:	50                   	push   %eax
  e4:	e8 07 03 00 00       	call   3f0 <memset>
  return buf;
  e9:	83 c4 10             	add    $0x10,%esp
}
  ec:	8d 65 f8             	lea    -0x8(%ebp),%esp
  ef:	89 d8                	mov    %ebx,%eax
  f1:	5b                   	pop    %ebx
  f2:	5e                   	pop    %esi
  f3:	5d                   	pop    %ebp
  f4:	c3                   	ret    
  f5:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  fc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000100 <ls>:
{
 100:	55                   	push   %ebp
 101:	89 e5                	mov    %esp,%ebp
 103:	57                   	push   %edi
 104:	56                   	push   %esi
 105:	53                   	push   %ebx
 106:	81 ec 64 02 00 00    	sub    $0x264,%esp
 10c:	8b 7d 08             	mov    0x8(%ebp),%edi
  if((fd = open(path, 0)) < 0){
 10f:	6a 00                	push   $0x0
 111:	57                   	push   %edi
 112:	e8 ac 04 00 00       	call   5c3 <open>
 117:	83 c4 10             	add    $0x10,%esp
 11a:	85 c0                	test   %eax,%eax
 11c:	0f 88 96 01 00 00    	js     2b8 <ls+0x1b8>
  if(fstat(fd, &st) < 0){
 122:	83 ec 08             	sub    $0x8,%esp
 125:	8d b5 d4 fd ff ff    	lea    -0x22c(%ebp),%esi
 12b:	89 c3                	mov    %eax,%ebx
 12d:	56                   	push   %esi
 12e:	50                   	push   %eax
 12f:	e8 a7 04 00 00       	call   5db <fstat>
 134:	83 c4 10             	add    $0x10,%esp
 137:	85 c0                	test   %eax,%eax
 139:	0f 88 b1 01 00 00    	js     2f0 <ls+0x1f0>
  switch(st.type){
 13f:	0f b7 85 d4 fd ff ff 	movzwl -0x22c(%ebp),%eax
 146:	66 83 f8 01          	cmp    $0x1,%ax
 14a:	74 64                	je     1b0 <ls+0xb0>
 14c:	66 83 f8 02          	cmp    $0x2,%ax
 150:	74 1e                	je     170 <ls+0x70>
  close(fd);
 152:	83 ec 0c             	sub    $0xc,%esp
 155:	53                   	push   %ebx
 156:	e8 50 04 00 00       	call   5ab <close>
 15b:	83 c4 10             	add    $0x10,%esp
}
 15e:	8d 65 f4             	lea    -0xc(%ebp),%esp
 161:	5b                   	pop    %ebx
 162:	5e                   	pop    %esi
 163:	5f                   	pop    %edi
 164:	5d                   	pop    %ebp
 165:	c3                   	ret    
 166:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 16d:	8d 76 00             	lea    0x0(%esi),%esi
    printf("%s %d %d %d\n", fmtname(path), st.type, st.ino, st.size);
 170:	83 ec 0c             	sub    $0xc,%esp
 173:	8b 95 e4 fd ff ff    	mov    -0x21c(%ebp),%edx
 179:	8b b5 dc fd ff ff    	mov    -0x224(%ebp),%esi
 17f:	57                   	push   %edi
 180:	89 95 b4 fd ff ff    	mov    %edx,-0x24c(%ebp)
 186:	e8 d5 fe ff ff       	call   60 <fmtname>
 18b:	8b 95 b4 fd ff ff    	mov    -0x24c(%ebp),%edx
 191:	89 14 24             	mov    %edx,(%esp)
 194:	56                   	push   %esi
 195:	6a 02                	push   $0x2
 197:	50                   	push   %eax
 198:	68 f0 0a 00 00       	push   $0xaf0
 19d:	e8 7e 07 00 00       	call   920 <printf>
    break;
 1a2:	83 c4 20             	add    $0x20,%esp
 1a5:	eb ab                	jmp    152 <ls+0x52>
 1a7:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 1ae:	66 90                	xchg   %ax,%ax
    if(strlen(path) + 1 + DIRSIZ + 1 > sizeof buf){
 1b0:	83 ec 0c             	sub    $0xc,%esp
 1b3:	57                   	push   %edi
 1b4:	e8 07 02 00 00       	call   3c0 <strlen>
 1b9:	83 c4 10             	add    $0x10,%esp
 1bc:	83 c0 10             	add    $0x10,%eax
 1bf:	3d 00 02 00 00       	cmp    $0x200,%eax
 1c4:	0f 87 0e 01 00 00    	ja     2d8 <ls+0x1d8>
    strcpy(buf, path);
 1ca:	83 ec 08             	sub    $0x8,%esp
 1cd:	57                   	push   %edi
 1ce:	8d bd e8 fd ff ff    	lea    -0x218(%ebp),%edi
 1d4:	57                   	push   %edi
 1d5:	e8 56 01 00 00       	call   330 <strcpy>
    p = buf+strlen(buf);
 1da:	89 3c 24             	mov    %edi,(%esp)
 1dd:	e8 de 01 00 00       	call   3c0 <strlen>
    while(read(fd, &de, sizeof(de)) == sizeof(de)){
 1e2:	83 c4 10             	add    $0x10,%esp
    p = buf+strlen(buf);
 1e5:	01 f8                	add    %edi,%eax
    *p++ = '/';
 1e7:	8d 48 01             	lea    0x1(%eax),%ecx
    p = buf+strlen(buf);
 1ea:	89 85 a8 fd ff ff    	mov    %eax,-0x258(%ebp)
    *p++ = '/';
 1f0:	89 8d a4 fd ff ff    	mov    %ecx,-0x25c(%ebp)
 1f6:	c6 00 2f             	movb   $0x2f,(%eax)
    while(read(fd, &de, sizeof(de)) == sizeof(de)){
 1f9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 200:	83 ec 04             	sub    $0x4,%esp
 203:	8d 85 c4 fd ff ff    	lea    -0x23c(%ebp),%eax
 209:	6a 10                	push   $0x10
 20b:	50                   	push   %eax
 20c:	53                   	push   %ebx
 20d:	e8 89 03 00 00       	call   59b <read>
 212:	83 c4 10             	add    $0x10,%esp
 215:	83 f8 10             	cmp    $0x10,%eax
 218:	0f 85 34 ff ff ff    	jne    152 <ls+0x52>
      if(de.inum == 0)
 21e:	66 83 bd c4 fd ff ff 	cmpw   $0x0,-0x23c(%ebp)
 225:	00 
 226:	74 d8                	je     200 <ls+0x100>
      memmove(p, de.name, DIRSIZ);
 228:	83 ec 04             	sub    $0x4,%esp
 22b:	8d 85 c6 fd ff ff    	lea    -0x23a(%ebp),%eax
 231:	6a 0e                	push   $0xe
 233:	50                   	push   %eax
 234:	ff b5 a4 fd ff ff    	push   -0x25c(%ebp)
 23a:	e8 11 03 00 00       	call   550 <memmove>
      p[DIRSIZ] = 0;
 23f:	8b 85 a8 fd ff ff    	mov    -0x258(%ebp),%eax
 245:	c6 40 0f 00          	movb   $0x0,0xf(%eax)
      if(stat(buf, &st) < 0){
 249:	58                   	pop    %eax
 24a:	5a                   	pop    %edx
 24b:	56                   	push   %esi
 24c:	57                   	push   %edi
 24d:	e8 6e 02 00 00       	call   4c0 <stat>
 252:	83 c4 10             	add    $0x10,%esp
 255:	85 c0                	test   %eax,%eax
 257:	0f 88 bb 00 00 00    	js     318 <ls+0x218>
      printf("%s %d %d %d\n", fmtname(buf), st.type, st.ino, st.size);
 25d:	83 ec 0c             	sub    $0xc,%esp
 260:	8b 8d e4 fd ff ff    	mov    -0x21c(%ebp),%ecx
 266:	8b 95 dc fd ff ff    	mov    -0x224(%ebp),%edx
 26c:	57                   	push   %edi
 26d:	0f bf 85 d4 fd ff ff 	movswl -0x22c(%ebp),%eax
 274:	89 8d ac fd ff ff    	mov    %ecx,-0x254(%ebp)
 27a:	89 95 b0 fd ff ff    	mov    %edx,-0x250(%ebp)
 280:	89 85 b4 fd ff ff    	mov    %eax,-0x24c(%ebp)
 286:	e8 d5 fd ff ff       	call   60 <fmtname>
 28b:	8b 8d ac fd ff ff    	mov    -0x254(%ebp),%ecx
 291:	8b 95 b0 fd ff ff    	mov    -0x250(%ebp),%edx
 297:	89 0c 24             	mov    %ecx,(%esp)
 29a:	52                   	push   %edx
 29b:	ff b5 b4 fd ff ff    	push   -0x24c(%ebp)
 2a1:	50                   	push   %eax
 2a2:	68 f0 0a 00 00       	push   $0xaf0
 2a7:	e8 74 06 00 00       	call   920 <printf>
 2ac:	83 c4 20             	add    $0x20,%esp
 2af:	e9 4c ff ff ff       	jmp    200 <ls+0x100>
 2b4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    fprintf(2, "ls: cannot open %s\n", path);
 2b8:	83 ec 04             	sub    $0x4,%esp
 2bb:	57                   	push   %edi
 2bc:	68 c8 0a 00 00       	push   $0xac8
 2c1:	6a 02                	push   $0x2
 2c3:	e8 38 06 00 00       	call   900 <fprintf>
    return;
 2c8:	83 c4 10             	add    $0x10,%esp
}
 2cb:	8d 65 f4             	lea    -0xc(%ebp),%esp
 2ce:	5b                   	pop    %ebx
 2cf:	5e                   	pop    %esi
 2d0:	5f                   	pop    %edi
 2d1:	5d                   	pop    %ebp
 2d2:	c3                   	ret    
 2d3:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 2d7:	90                   	nop
      fprintf(2, "ls: path too long\n");
 2d8:	83 ec 08             	sub    $0x8,%esp
 2db:	68 fd 0a 00 00       	push   $0xafd
 2e0:	6a 02                	push   $0x2
 2e2:	e8 19 06 00 00       	call   900 <fprintf>
      break;
 2e7:	83 c4 10             	add    $0x10,%esp
 2ea:	e9 63 fe ff ff       	jmp    152 <ls+0x52>
 2ef:	90                   	nop
    fprintf(2, "ls: cannot stat %s\n", path);
 2f0:	83 ec 04             	sub    $0x4,%esp
 2f3:	57                   	push   %edi
 2f4:	68 dc 0a 00 00       	push   $0xadc
 2f9:	6a 02                	push   $0x2
 2fb:	e8 00 06 00 00       	call   900 <fprintf>
    close(fd);
 300:	89 1c 24             	mov    %ebx,(%esp)
 303:	e8 a3 02 00 00       	call   5ab <close>
    return;
 308:	83 c4 10             	add    $0x10,%esp
}
 30b:	8d 65 f4             	lea    -0xc(%ebp),%esp
 30e:	5b                   	pop    %ebx
 30f:	5e                   	pop    %esi
 310:	5f                   	pop    %edi
 311:	5d                   	pop    %ebp
 312:	c3                   	ret    
 313:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 317:	90                   	nop
        fprintf(2, "ls: cannot stat %s\n", buf);
 318:	83 ec 04             	sub    $0x4,%esp
 31b:	57                   	push   %edi
 31c:	68 dc 0a 00 00       	push   $0xadc
 321:	6a 02                	push   $0x2
 323:	e8 d8 05 00 00       	call   900 <fprintf>
        continue;
 328:	83 c4 10             	add    $0x10,%esp
 32b:	e9 d0 fe ff ff       	jmp    200 <ls+0x100>

00000330 <strcpy>:
#include "user/user.h"
#include "../kernel/x86.h"

char*
strcpy(char *s, const char *t)
{
 330:	55                   	push   %ebp
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 331:	31 c0                	xor    %eax,%eax
{
 333:	89 e5                	mov    %esp,%ebp
 335:	53                   	push   %ebx
 336:	8b 4d 08             	mov    0x8(%ebp),%ecx
 339:	8b 5d 0c             	mov    0xc(%ebp),%ebx
 33c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  while((*s++ = *t++) != 0)
 340:	0f b6 14 03          	movzbl (%ebx,%eax,1),%edx
 344:	88 14 01             	mov    %dl,(%ecx,%eax,1)
 347:	83 c0 01             	add    $0x1,%eax
 34a:	84 d2                	test   %dl,%dl
 34c:	75 f2                	jne    340 <strcpy+0x10>
    ;
  return os;
}
 34e:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 351:	89 c8                	mov    %ecx,%eax
 353:	c9                   	leave  
 354:	c3                   	ret    
 355:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 35c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000360 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 360:	55                   	push   %ebp
 361:	89 e5                	mov    %esp,%ebp
 363:	53                   	push   %ebx
 364:	8b 55 08             	mov    0x8(%ebp),%edx
 367:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  while(*p && *p == *q)
 36a:	0f b6 02             	movzbl (%edx),%eax
 36d:	84 c0                	test   %al,%al
 36f:	75 17                	jne    388 <strcmp+0x28>
 371:	eb 3a                	jmp    3ad <strcmp+0x4d>
 373:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 377:	90                   	nop
 378:	0f b6 42 01          	movzbl 0x1(%edx),%eax
    p++, q++;
 37c:	83 c2 01             	add    $0x1,%edx
 37f:	8d 59 01             	lea    0x1(%ecx),%ebx
  while(*p && *p == *q)
 382:	84 c0                	test   %al,%al
 384:	74 1a                	je     3a0 <strcmp+0x40>
    p++, q++;
 386:	89 d9                	mov    %ebx,%ecx
  while(*p && *p == *q)
 388:	0f b6 19             	movzbl (%ecx),%ebx
 38b:	38 c3                	cmp    %al,%bl
 38d:	74 e9                	je     378 <strcmp+0x18>
  return (uchar)*p - (uchar)*q;
 38f:	29 d8                	sub    %ebx,%eax
}
 391:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 394:	c9                   	leave  
 395:	c3                   	ret    
 396:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 39d:	8d 76 00             	lea    0x0(%esi),%esi
  return (uchar)*p - (uchar)*q;
 3a0:	0f b6 59 01          	movzbl 0x1(%ecx),%ebx
 3a4:	31 c0                	xor    %eax,%eax
 3a6:	29 d8                	sub    %ebx,%eax
}
 3a8:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 3ab:	c9                   	leave  
 3ac:	c3                   	ret    
  return (uchar)*p - (uchar)*q;
 3ad:	0f b6 19             	movzbl (%ecx),%ebx
 3b0:	31 c0                	xor    %eax,%eax
 3b2:	eb db                	jmp    38f <strcmp+0x2f>
 3b4:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 3bb:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 3bf:	90                   	nop

000003c0 <strlen>:

uint
strlen(const char *s)
{
 3c0:	55                   	push   %ebp
 3c1:	89 e5                	mov    %esp,%ebp
 3c3:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  for(n = 0; s[n]; n++)
 3c6:	80 3a 00             	cmpb   $0x0,(%edx)
 3c9:	74 15                	je     3e0 <strlen+0x20>
 3cb:	31 c0                	xor    %eax,%eax
 3cd:	8d 76 00             	lea    0x0(%esi),%esi
 3d0:	83 c0 01             	add    $0x1,%eax
 3d3:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
 3d7:	89 c1                	mov    %eax,%ecx
 3d9:	75 f5                	jne    3d0 <strlen+0x10>
    ;
  return n;
}
 3db:	89 c8                	mov    %ecx,%eax
 3dd:	5d                   	pop    %ebp
 3de:	c3                   	ret    
 3df:	90                   	nop
  for(n = 0; s[n]; n++)
 3e0:	31 c9                	xor    %ecx,%ecx
}
 3e2:	5d                   	pop    %ebp
 3e3:	89 c8                	mov    %ecx,%eax
 3e5:	c3                   	ret    
 3e6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 3ed:	8d 76 00             	lea    0x0(%esi),%esi

000003f0 <memset>:

void*
memset(void *dst, int c, uint n)
{
 3f0:	55                   	push   %ebp
 3f1:	89 e5                	mov    %esp,%ebp
 3f3:	57                   	push   %edi
 3f4:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 3f7:	8b 4d 10             	mov    0x10(%ebp),%ecx
 3fa:	8b 45 0c             	mov    0xc(%ebp),%eax
 3fd:	89 d7                	mov    %edx,%edi
 3ff:	fc                   	cld    
 400:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 402:	8b 7d fc             	mov    -0x4(%ebp),%edi
 405:	89 d0                	mov    %edx,%eax
 407:	c9                   	leave  
 408:	c3                   	ret    
 409:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000410 <strchr>:

char*
strchr(const char *s, char c)
{
 410:	55                   	push   %ebp
 411:	89 e5                	mov    %esp,%ebp
 413:	8b 45 08             	mov    0x8(%ebp),%eax
 416:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 41a:	0f b6 10             	movzbl (%eax),%edx
 41d:	84 d2                	test   %dl,%dl
 41f:	75 12                	jne    433 <strchr+0x23>
 421:	eb 1d                	jmp    440 <strchr+0x30>
 423:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 427:	90                   	nop
 428:	0f b6 50 01          	movzbl 0x1(%eax),%edx
 42c:	83 c0 01             	add    $0x1,%eax
 42f:	84 d2                	test   %dl,%dl
 431:	74 0d                	je     440 <strchr+0x30>
    if(*s == c)
 433:	38 d1                	cmp    %dl,%cl
 435:	75 f1                	jne    428 <strchr+0x18>
      return (char*)s;
  return 0;
}
 437:	5d                   	pop    %ebp
 438:	c3                   	ret    
 439:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  return 0;
 440:	31 c0                	xor    %eax,%eax
}
 442:	5d                   	pop    %ebp
 443:	c3                   	ret    
 444:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 44b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 44f:	90                   	nop

00000450 <gets>:

char*
gets(char *buf, int max)
{
 450:	55                   	push   %ebp
 451:	89 e5                	mov    %esp,%ebp
 453:	57                   	push   %edi
 454:	56                   	push   %esi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    cc = read(0, &c, 1);
 455:	8d 7d e7             	lea    -0x19(%ebp),%edi
{
 458:	53                   	push   %ebx
  for(i=0; i+1 < max; ){
 459:	31 db                	xor    %ebx,%ebx
{
 45b:	83 ec 1c             	sub    $0x1c,%esp
  for(i=0; i+1 < max; ){
 45e:	eb 27                	jmp    487 <gets+0x37>
    cc = read(0, &c, 1);
 460:	83 ec 04             	sub    $0x4,%esp
 463:	6a 01                	push   $0x1
 465:	57                   	push   %edi
 466:	6a 00                	push   $0x0
 468:	e8 2e 01 00 00       	call   59b <read>
    if(cc < 1)
 46d:	83 c4 10             	add    $0x10,%esp
 470:	85 c0                	test   %eax,%eax
 472:	7e 1d                	jle    491 <gets+0x41>
      break;
    buf[i++] = c;
 474:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 478:	8b 55 08             	mov    0x8(%ebp),%edx
 47b:	88 44 1a ff          	mov    %al,-0x1(%edx,%ebx,1)
    if(c == '\n' || c == '\r')
 47f:	3c 0a                	cmp    $0xa,%al
 481:	74 1d                	je     4a0 <gets+0x50>
 483:	3c 0d                	cmp    $0xd,%al
 485:	74 19                	je     4a0 <gets+0x50>
  for(i=0; i+1 < max; ){
 487:	89 de                	mov    %ebx,%esi
 489:	83 c3 01             	add    $0x1,%ebx
 48c:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 48f:	7c cf                	jl     460 <gets+0x10>
      break;
  }
  buf[i] = '\0';
 491:	8b 45 08             	mov    0x8(%ebp),%eax
 494:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
  return buf;
}
 498:	8d 65 f4             	lea    -0xc(%ebp),%esp
 49b:	5b                   	pop    %ebx
 49c:	5e                   	pop    %esi
 49d:	5f                   	pop    %edi
 49e:	5d                   	pop    %ebp
 49f:	c3                   	ret    
  buf[i] = '\0';
 4a0:	8b 45 08             	mov    0x8(%ebp),%eax
 4a3:	89 de                	mov    %ebx,%esi
 4a5:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
}
 4a9:	8d 65 f4             	lea    -0xc(%ebp),%esp
 4ac:	5b                   	pop    %ebx
 4ad:	5e                   	pop    %esi
 4ae:	5f                   	pop    %edi
 4af:	5d                   	pop    %ebp
 4b0:	c3                   	ret    
 4b1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 4b8:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 4bf:	90                   	nop

000004c0 <stat>:

int
stat(const char *n, struct stat *st)
{
 4c0:	55                   	push   %ebp
 4c1:	89 e5                	mov    %esp,%ebp
 4c3:	56                   	push   %esi
 4c4:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 4c5:	83 ec 08             	sub    $0x8,%esp
 4c8:	6a 00                	push   $0x0
 4ca:	ff 75 08             	push   0x8(%ebp)
 4cd:	e8 f1 00 00 00       	call   5c3 <open>
  if(fd < 0)
 4d2:	83 c4 10             	add    $0x10,%esp
 4d5:	85 c0                	test   %eax,%eax
 4d7:	78 27                	js     500 <stat+0x40>
    return -1;
  r = fstat(fd, st);
 4d9:	83 ec 08             	sub    $0x8,%esp
 4dc:	ff 75 0c             	push   0xc(%ebp)
 4df:	89 c3                	mov    %eax,%ebx
 4e1:	50                   	push   %eax
 4e2:	e8 f4 00 00 00       	call   5db <fstat>
  close(fd);
 4e7:	89 1c 24             	mov    %ebx,(%esp)
  r = fstat(fd, st);
 4ea:	89 c6                	mov    %eax,%esi
  close(fd);
 4ec:	e8 ba 00 00 00       	call   5ab <close>
  return r;
 4f1:	83 c4 10             	add    $0x10,%esp
}
 4f4:	8d 65 f8             	lea    -0x8(%ebp),%esp
 4f7:	89 f0                	mov    %esi,%eax
 4f9:	5b                   	pop    %ebx
 4fa:	5e                   	pop    %esi
 4fb:	5d                   	pop    %ebp
 4fc:	c3                   	ret    
 4fd:	8d 76 00             	lea    0x0(%esi),%esi
    return -1;
 500:	be ff ff ff ff       	mov    $0xffffffff,%esi
 505:	eb ed                	jmp    4f4 <stat+0x34>
 507:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 50e:	66 90                	xchg   %ax,%ax

00000510 <atoi>:

int
atoi(const char *s)
{
 510:	55                   	push   %ebp
 511:	89 e5                	mov    %esp,%ebp
 513:	53                   	push   %ebx
 514:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 517:	0f be 02             	movsbl (%edx),%eax
 51a:	8d 48 d0             	lea    -0x30(%eax),%ecx
 51d:	80 f9 09             	cmp    $0x9,%cl
  n = 0;
 520:	b9 00 00 00 00       	mov    $0x0,%ecx
  while('0' <= *s && *s <= '9')
 525:	77 1e                	ja     545 <atoi+0x35>
 527:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 52e:	66 90                	xchg   %ax,%ax
    n = n*10 + *s++ - '0';
 530:	83 c2 01             	add    $0x1,%edx
 533:	8d 0c 89             	lea    (%ecx,%ecx,4),%ecx
 536:	8d 4c 48 d0          	lea    -0x30(%eax,%ecx,2),%ecx
  while('0' <= *s && *s <= '9')
 53a:	0f be 02             	movsbl (%edx),%eax
 53d:	8d 58 d0             	lea    -0x30(%eax),%ebx
 540:	80 fb 09             	cmp    $0x9,%bl
 543:	76 eb                	jbe    530 <atoi+0x20>
  return n;
}
 545:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 548:	89 c8                	mov    %ecx,%eax
 54a:	c9                   	leave  
 54b:	c3                   	ret    
 54c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000550 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 550:	55                   	push   %ebp
 551:	89 e5                	mov    %esp,%ebp
 553:	57                   	push   %edi
 554:	8b 45 10             	mov    0x10(%ebp),%eax
 557:	8b 55 08             	mov    0x8(%ebp),%edx
 55a:	56                   	push   %esi
 55b:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 55e:	85 c0                	test   %eax,%eax
 560:	7e 13                	jle    575 <memmove+0x25>
 562:	01 d0                	add    %edx,%eax
  dst = vdst;
 564:	89 d7                	mov    %edx,%edi
 566:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 56d:	8d 76 00             	lea    0x0(%esi),%esi
    *dst++ = *src++;
 570:	a4                   	movsb  %ds:(%esi),%es:(%edi)
  while(n-- > 0)
 571:	39 f8                	cmp    %edi,%eax
 573:	75 fb                	jne    570 <memmove+0x20>
  return vdst;
}
 575:	5e                   	pop    %esi
 576:	89 d0                	mov    %edx,%eax
 578:	5f                   	pop    %edi
 579:	5d                   	pop    %ebp
 57a:	c3                   	ret    

0000057b <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 57b:	b8 01 00 00 00       	mov    $0x1,%eax
 580:	cd 40                	int    $0x40
 582:	c3                   	ret    

00000583 <exit>:
SYSCALL(exit)
 583:	b8 02 00 00 00       	mov    $0x2,%eax
 588:	cd 40                	int    $0x40
 58a:	c3                   	ret    

0000058b <wait>:
SYSCALL(wait)
 58b:	b8 03 00 00 00       	mov    $0x3,%eax
 590:	cd 40                	int    $0x40
 592:	c3                   	ret    

00000593 <pipe>:
SYSCALL(pipe)
 593:	b8 04 00 00 00       	mov    $0x4,%eax
 598:	cd 40                	int    $0x40
 59a:	c3                   	ret    

0000059b <read>:
SYSCALL(read)
 59b:	b8 05 00 00 00       	mov    $0x5,%eax
 5a0:	cd 40                	int    $0x40
 5a2:	c3                   	ret    

000005a3 <write>:
SYSCALL(write)
 5a3:	b8 10 00 00 00       	mov    $0x10,%eax
 5a8:	cd 40                	int    $0x40
 5aa:	c3                   	ret    

000005ab <close>:
SYSCALL(close)
 5ab:	b8 15 00 00 00       	mov    $0x15,%eax
 5b0:	cd 40                	int    $0x40
 5b2:	c3                   	ret    

000005b3 <kill>:
SYSCALL(kill)
 5b3:	b8 06 00 00 00       	mov    $0x6,%eax
 5b8:	cd 40                	int    $0x40
 5ba:	c3                   	ret    

000005bb <exec>:
SYSCALL(exec)
 5bb:	b8 07 00 00 00       	mov    $0x7,%eax
 5c0:	cd 40                	int    $0x40
 5c2:	c3                   	ret    

000005c3 <open>:
SYSCALL(open)
 5c3:	b8 0f 00 00 00       	mov    $0xf,%eax
 5c8:	cd 40                	int    $0x40
 5ca:	c3                   	ret    

000005cb <mknod>:
SYSCALL(mknod)
 5cb:	b8 11 00 00 00       	mov    $0x11,%eax
 5d0:	cd 40                	int    $0x40
 5d2:	c3                   	ret    

000005d3 <unlink>:
SYSCALL(unlink)
 5d3:	b8 12 00 00 00       	mov    $0x12,%eax
 5d8:	cd 40                	int    $0x40
 5da:	c3                   	ret    

000005db <fstat>:
SYSCALL(fstat)
 5db:	b8 08 00 00 00       	mov    $0x8,%eax
 5e0:	cd 40                	int    $0x40
 5e2:	c3                   	ret    

000005e3 <link>:
SYSCALL(link)
 5e3:	b8 13 00 00 00       	mov    $0x13,%eax
 5e8:	cd 40                	int    $0x40
 5ea:	c3                   	ret    

000005eb <mkdir>:
SYSCALL(mkdir)
 5eb:	b8 14 00 00 00       	mov    $0x14,%eax
 5f0:	cd 40                	int    $0x40
 5f2:	c3                   	ret    

000005f3 <chdir>:
SYSCALL(chdir)
 5f3:	b8 09 00 00 00       	mov    $0x9,%eax
 5f8:	cd 40                	int    $0x40
 5fa:	c3                   	ret    

000005fb <dup>:
SYSCALL(dup)
 5fb:	b8 0a 00 00 00       	mov    $0xa,%eax
 600:	cd 40                	int    $0x40
 602:	c3                   	ret    

00000603 <getpid>:
SYSCALL(getpid)
 603:	b8 0b 00 00 00       	mov    $0xb,%eax
 608:	cd 40                	int    $0x40
 60a:	c3                   	ret    

0000060b <sbrk>:
SYSCALL(sbrk)
 60b:	b8 0c 00 00 00       	mov    $0xc,%eax
 610:	cd 40                	int    $0x40
 612:	c3                   	ret    

00000613 <sleep>:
SYSCALL(sleep)
 613:	b8 0d 00 00 00       	mov    $0xd,%eax
 618:	cd 40                	int    $0x40
 61a:	c3                   	ret    

0000061b <uptime>:
SYSCALL(uptime)
 61b:	b8 0e 00 00 00       	mov    $0xe,%eax
 620:	cd 40                	int    $0x40
 622:	c3                   	ret    

00000623 <cpuhalt>:
SYSCALL(cpuhalt)
 623:	b8 16 00 00 00       	mov    $0x16,%eax
 628:	cd 40                	int    $0x40
 62a:	c3                   	ret    
 62b:	66 90                	xchg   %ax,%ax
 62d:	66 90                	xchg   %ax,%ax
 62f:	90                   	nop

00000630 <printint.constprop.0>:
  for (i = 0; i < (sizeof(uint) * 2); i++, x <<= 4)
    putc(fd, digits[x >> (sizeof(uint) * 8 - 4)]);
}

static void
printint(int fd, int xx, int base, int sgn)
 630:	55                   	push   %ebp
 631:	89 e5                	mov    %esp,%ebp
 633:	57                   	push   %edi
 634:	56                   	push   %esi
 635:	53                   	push   %ebx
 636:	83 ec 3c             	sub    $0x3c,%esp
 639:	89 55 c4             	mov    %edx,-0x3c(%ebp)
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 63c:	85 c0                	test   %eax,%eax
 63e:	0f 89 84 00 00 00    	jns    6c8 <printint.constprop.0+0x98>
 644:	83 e1 01             	and    $0x1,%ecx
 647:	74 7f                	je     6c8 <printint.constprop.0+0x98>
    neg = 1;
 649:	c7 45 bc 01 00 00 00 	movl   $0x1,-0x44(%ebp)
    x = -xx;
 650:	f7 d8                	neg    %eax
 652:	89 c1                	mov    %eax,%ecx
  } else {
    x = xx;
  }

  i = 0;
 654:	31 db                	xor    %ebx,%ebx
 656:	8d 75 d7             	lea    -0x29(%ebp),%esi
 659:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  do{
    buf[i++] = digits[x % base];
 660:	89 c8                	mov    %ecx,%eax
 662:	31 d2                	xor    %edx,%edx
 664:	89 cf                	mov    %ecx,%edi
 666:	f7 75 c4             	divl   -0x3c(%ebp)
 669:	0f b6 92 74 0b 00 00 	movzbl 0xb74(%edx),%edx
 670:	89 45 c0             	mov    %eax,-0x40(%ebp)
 673:	89 d8                	mov    %ebx,%eax
 675:	8d 5b 01             	lea    0x1(%ebx),%ebx
  }while((x /= base) != 0);
 678:	8b 4d c0             	mov    -0x40(%ebp),%ecx
    buf[i++] = digits[x % base];
 67b:	88 14 1e             	mov    %dl,(%esi,%ebx,1)
  }while((x /= base) != 0);
 67e:	3b 7d c4             	cmp    -0x3c(%ebp),%edi
 681:	73 dd                	jae    660 <printint.constprop.0+0x30>
  if(neg)
 683:	8b 4d bc             	mov    -0x44(%ebp),%ecx
 686:	85 c9                	test   %ecx,%ecx
 688:	74 0c                	je     696 <printint.constprop.0+0x66>
    buf[i++] = '-';
 68a:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
    buf[i++] = digits[x % base];
 68f:	89 d8                	mov    %ebx,%eax
    buf[i++] = '-';
 691:	ba 2d 00 00 00       	mov    $0x2d,%edx

  while(--i >= 0)
 696:	8d 5c 05 d7          	lea    -0x29(%ebp,%eax,1),%ebx
 69a:	eb 0a                	jmp    6a6 <printint.constprop.0+0x76>
 69c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    putc(fd, buf[i]);
 6a0:	0f b6 13             	movzbl (%ebx),%edx
 6a3:	83 eb 01             	sub    $0x1,%ebx
  write(fd, &c, 1);
 6a6:	83 ec 04             	sub    $0x4,%esp
 6a9:	88 55 d7             	mov    %dl,-0x29(%ebp)
 6ac:	6a 01                	push   $0x1
 6ae:	56                   	push   %esi
 6af:	6a 01                	push   $0x1
 6b1:	e8 ed fe ff ff       	call   5a3 <write>
  while(--i >= 0)
 6b6:	83 c4 10             	add    $0x10,%esp
 6b9:	39 de                	cmp    %ebx,%esi
 6bb:	75 e3                	jne    6a0 <printint.constprop.0+0x70>
}
 6bd:	8d 65 f4             	lea    -0xc(%ebp),%esp
 6c0:	5b                   	pop    %ebx
 6c1:	5e                   	pop    %esi
 6c2:	5f                   	pop    %edi
 6c3:	5d                   	pop    %ebp
 6c4:	c3                   	ret    
 6c5:	8d 76 00             	lea    0x0(%esi),%esi
  neg = 0;
 6c8:	c7 45 bc 00 00 00 00 	movl   $0x0,-0x44(%ebp)
    x = xx;
 6cf:	89 c1                	mov    %eax,%ecx
 6d1:	eb 81                	jmp    654 <printint.constprop.0+0x24>
 6d3:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 6da:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

000006e0 <vprintf.constprop.0>:
static void vprintf(int fd, const char *fmt, va_list ap)
 6e0:	55                   	push   %ebp
 6e1:	89 e5                	mov    %esp,%ebp
 6e3:	57                   	push   %edi
 6e4:	56                   	push   %esi
 6e5:	53                   	push   %ebx
 6e6:	83 ec 2c             	sub    $0x2c,%esp
 6e9:	89 55 d4             	mov    %edx,-0x2c(%ebp)
{
  char *s;
  int c, i, state;

  state = 0;
  for(i = 0; fmt[i]; i++){
 6ec:	0f b6 10             	movzbl (%eax),%edx
 6ef:	84 d2                	test   %dl,%dl
 6f1:	74 6c                	je     75f <vprintf.constprop.0+0x7f>
 6f3:	8d 58 01             	lea    0x1(%eax),%ebx
 6f6:	31 ff                	xor    %edi,%edi
 6f8:	8d 75 e7             	lea    -0x19(%ebp),%esi
 6fb:	eb 25                	jmp    722 <vprintf.constprop.0+0x42>
 6fd:	8d 76 00             	lea    0x0(%esi),%esi
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
 700:	83 f8 25             	cmp    $0x25,%eax
 703:	74 4b                	je     750 <vprintf.constprop.0+0x70>
  write(fd, &c, 1);
 705:	83 ec 04             	sub    $0x4,%esp
 708:	88 55 e7             	mov    %dl,-0x19(%ebp)
 70b:	6a 01                	push   $0x1
 70d:	56                   	push   %esi
 70e:	6a 01                	push   $0x1
 710:	e8 8e fe ff ff       	call   5a3 <write>
        state = '%';
      } else {
        putc(fd, c);
 715:	83 c4 10             	add    $0x10,%esp
  for(i = 0; fmt[i]; i++){
 718:	0f b6 13             	movzbl (%ebx),%edx
 71b:	83 c3 01             	add    $0x1,%ebx
 71e:	84 d2                	test   %dl,%dl
 720:	74 3d                	je     75f <vprintf.constprop.0+0x7f>
    c = fmt[i] & 0xff;
 722:	0f b6 c2             	movzbl %dl,%eax
    if(state == 0){
 725:	85 ff                	test   %edi,%edi
 727:	74 d7                	je     700 <vprintf.constprop.0+0x20>
      }
    } else if(state == '%'){
 729:	83 ff 25             	cmp    $0x25,%edi
 72c:	75 ea                	jne    718 <vprintf.constprop.0+0x38>
      if(c == 'd'){
 72e:	83 f8 25             	cmp    $0x25,%eax
 731:	0f 84 a9 01 00 00    	je     8e0 <vprintf.constprop.0+0x200>
 737:	83 e8 63             	sub    $0x63,%eax
 73a:	83 f8 15             	cmp    $0x15,%eax
 73d:	77 31                	ja     770 <vprintf.constprop.0+0x90>
 73f:	ff 24 85 1c 0b 00 00 	jmp    *0xb1c(,%eax,4)
 746:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 74d:	8d 76 00             	lea    0x0(%esi),%esi
  for(i = 0; fmt[i]; i++){
 750:	0f b6 13             	movzbl (%ebx),%edx
 753:	83 c3 01             	add    $0x1,%ebx
        state = '%';
 756:	bf 25 00 00 00       	mov    $0x25,%edi
  for(i = 0; fmt[i]; i++){
 75b:	84 d2                	test   %dl,%dl
 75d:	75 c3                	jne    722 <vprintf.constprop.0+0x42>
        putc(fd, c);
      }
      state = 0;
    }
  }
}
 75f:	8d 65 f4             	lea    -0xc(%ebp),%esp
 762:	5b                   	pop    %ebx
 763:	5e                   	pop    %esi
 764:	5f                   	pop    %edi
 765:	5d                   	pop    %ebp
 766:	c3                   	ret    
 767:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 76e:	66 90                	xchg   %ax,%ax
  write(fd, &c, 1);
 770:	83 ec 04             	sub    $0x4,%esp
 773:	88 55 d0             	mov    %dl,-0x30(%ebp)
 776:	6a 01                	push   $0x1
 778:	56                   	push   %esi
 779:	6a 01                	push   $0x1
 77b:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
 77f:	e8 1f fe ff ff       	call   5a3 <write>
        putc(fd, c);
 784:	0f b6 55 d0          	movzbl -0x30(%ebp),%edx
  write(fd, &c, 1);
 788:	83 c4 0c             	add    $0xc,%esp
 78b:	88 55 e7             	mov    %dl,-0x19(%ebp)
 78e:	6a 01                	push   $0x1
      state = 0;
 790:	31 ff                	xor    %edi,%edi
  write(fd, &c, 1);
 792:	56                   	push   %esi
 793:	6a 01                	push   $0x1
 795:	e8 09 fe ff ff       	call   5a3 <write>
        putc(fd, c);
 79a:	83 c4 10             	add    $0x10,%esp
 79d:	e9 76 ff ff ff       	jmp    718 <vprintf.constprop.0+0x38>
 7a2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        putc(fd, va_arg(ap, uint));
 7a8:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  write(fd, &c, 1);
 7ab:	83 ec 04             	sub    $0x4,%esp
        putc(fd, va_arg(ap, uint));
 7ae:	8d 78 04             	lea    0x4(%eax),%edi
 7b1:	8b 00                	mov    (%eax),%eax
  write(fd, &c, 1);
 7b3:	6a 01                	push   $0x1
 7b5:	56                   	push   %esi
 7b6:	6a 01                	push   $0x1
        putc(fd, va_arg(ap, uint));
 7b8:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
 7bb:	e8 e3 fd ff ff       	call   5a3 <write>
        putc(fd, va_arg(ap, uint));
 7c0:	89 7d d4             	mov    %edi,-0x2c(%ebp)
 7c3:	83 c4 10             	add    $0x10,%esp
      state = 0;
 7c6:	31 ff                	xor    %edi,%edi
 7c8:	e9 4b ff ff ff       	jmp    718 <vprintf.constprop.0+0x38>
 7cd:	8d 76 00             	lea    0x0(%esi),%esi
        printint(fd, va_arg(ap, int), 10, 1);
 7d0:	8b 45 d4             	mov    -0x2c(%ebp),%eax
 7d3:	b9 01 00 00 00       	mov    $0x1,%ecx
 7d8:	8d 78 04             	lea    0x4(%eax),%edi
        printint(fd, va_arg(ap, uint), 10, 0);
 7db:	8b 00                	mov    (%eax),%eax
 7dd:	ba 0a 00 00 00       	mov    $0xa,%edx
 7e2:	e8 49 fe ff ff       	call   630 <printint.constprop.0>
 7e7:	89 7d d4             	mov    %edi,-0x2c(%ebp)
      state = 0;
 7ea:	31 ff                	xor    %edi,%edi
 7ec:	e9 27 ff ff ff       	jmp    718 <vprintf.constprop.0+0x38>
 7f1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        printint(fd, va_arg(ap, uint), 10, 0);
 7f8:	8b 45 d4             	mov    -0x2c(%ebp),%eax
 7fb:	31 c9                	xor    %ecx,%ecx
 7fd:	8d 78 04             	lea    0x4(%eax),%edi
 800:	eb d9                	jmp    7db <vprintf.constprop.0+0xfb>
 802:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        printptr(fd, va_arg(ap, uint));
 808:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  write(fd, &c, 1);
 80b:	83 ec 04             	sub    $0x4,%esp
 80e:	c6 45 e7 30          	movb   $0x30,-0x19(%ebp)
        printptr(fd, va_arg(ap, uint));
 812:	8b 38                	mov    (%eax),%edi
  write(fd, &c, 1);
 814:	6a 01                	push   $0x1
        printptr(fd, va_arg(ap, uint));
 816:	8d 48 04             	lea    0x4(%eax),%ecx
  write(fd, &c, 1);
 819:	56                   	push   %esi
 81a:	6a 01                	push   $0x1
        printptr(fd, va_arg(ap, uint));
 81c:	89 4d d0             	mov    %ecx,-0x30(%ebp)
  write(fd, &c, 1);
 81f:	e8 7f fd ff ff       	call   5a3 <write>
 824:	83 c4 0c             	add    $0xc,%esp
 827:	c6 45 e7 78          	movb   $0x78,-0x19(%ebp)
 82b:	6a 01                	push   $0x1
 82d:	56                   	push   %esi
 82e:	6a 01                	push   $0x1
 830:	e8 6e fd ff ff       	call   5a3 <write>
  putc(fd, 'x');
 835:	c7 45 d4 08 00 00 00 	movl   $0x8,-0x2c(%ebp)
 83c:	83 c4 10             	add    $0x10,%esp
 83f:	90                   	nop
  write(fd, &c, 1);
 840:	83 ec 04             	sub    $0x4,%esp
    putc(fd, digits[x >> (sizeof(uint) * 8 - 4)]);
 843:	89 f8                	mov    %edi,%eax
  for (i = 0; i < (sizeof(uint) * 2); i++, x <<= 4)
 845:	c1 e7 04             	shl    $0x4,%edi
  write(fd, &c, 1);
 848:	6a 01                	push   $0x1
    putc(fd, digits[x >> (sizeof(uint) * 8 - 4)]);
 84a:	c1 e8 1c             	shr    $0x1c,%eax
  write(fd, &c, 1);
 84d:	56                   	push   %esi
 84e:	0f b6 80 74 0b 00 00 	movzbl 0xb74(%eax),%eax
 855:	6a 01                	push   $0x1
 857:	88 45 e7             	mov    %al,-0x19(%ebp)
 85a:	e8 44 fd ff ff       	call   5a3 <write>
  for (i = 0; i < (sizeof(uint) * 2); i++, x <<= 4)
 85f:	83 c4 10             	add    $0x10,%esp
 862:	83 6d d4 01          	subl   $0x1,-0x2c(%ebp)
 866:	75 d8                	jne    840 <vprintf.constprop.0+0x160>
        printptr(fd, va_arg(ap, uint));
 868:	8b 45 d0             	mov    -0x30(%ebp),%eax
      state = 0;
 86b:	31 ff                	xor    %edi,%edi
        printptr(fd, va_arg(ap, uint));
 86d:	89 45 d4             	mov    %eax,-0x2c(%ebp)
 870:	e9 a3 fe ff ff       	jmp    718 <vprintf.constprop.0+0x38>
 875:	8d 76 00             	lea    0x0(%esi),%esi
        s = va_arg(ap, char*);
 878:	8b 45 d4             	mov    -0x2c(%ebp),%eax
 87b:	8b 38                	mov    (%eax),%edi
 87d:	8d 48 04             	lea    0x4(%eax),%ecx
 880:	89 4d d4             	mov    %ecx,-0x2c(%ebp)
        if(s == 0)
 883:	85 ff                	test   %edi,%edi
 885:	74 64                	je     8eb <vprintf.constprop.0+0x20b>
        while(*s != 0){
 887:	0f b6 07             	movzbl (%edi),%eax
 88a:	84 c0                	test   %al,%al
 88c:	74 1f                	je     8ad <vprintf.constprop.0+0x1cd>
 88e:	66 90                	xchg   %ax,%ax
  write(fd, &c, 1);
 890:	83 ec 04             	sub    $0x4,%esp
          s++;
 893:	83 c7 01             	add    $0x1,%edi
 896:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
 899:	6a 01                	push   $0x1
 89b:	56                   	push   %esi
 89c:	6a 01                	push   $0x1
 89e:	e8 00 fd ff ff       	call   5a3 <write>
        while(*s != 0){
 8a3:	0f b6 07             	movzbl (%edi),%eax
 8a6:	83 c4 10             	add    $0x10,%esp
 8a9:	84 c0                	test   %al,%al
 8ab:	75 e3                	jne    890 <vprintf.constprop.0+0x1b0>
      state = 0;
 8ad:	31 ff                	xor    %edi,%edi
 8af:	e9 64 fe ff ff       	jmp    718 <vprintf.constprop.0+0x38>
 8b4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        printint(fd, va_arg(ap, int), 16, 0);
 8b8:	8b 45 d4             	mov    -0x2c(%ebp),%eax
 8bb:	31 c9                	xor    %ecx,%ecx
 8bd:	ba 10 00 00 00       	mov    $0x10,%edx
 8c2:	8d 78 04             	lea    0x4(%eax),%edi
 8c5:	8b 00                	mov    (%eax),%eax
 8c7:	e8 64 fd ff ff       	call   630 <printint.constprop.0>
 8cc:	89 7d d4             	mov    %edi,-0x2c(%ebp)
      state = 0;
 8cf:	31 ff                	xor    %edi,%edi
 8d1:	e9 42 fe ff ff       	jmp    718 <vprintf.constprop.0+0x38>
 8d6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 8dd:	8d 76 00             	lea    0x0(%esi),%esi
        putc(fd, c);
 8e0:	88 55 e7             	mov    %dl,-0x19(%ebp)
  write(fd, &c, 1);
 8e3:	83 ec 04             	sub    $0x4,%esp
 8e6:	e9 a3 fe ff ff       	jmp    78e <vprintf.constprop.0+0xae>
          s = "(null)";
 8eb:	bf 12 0b 00 00       	mov    $0xb12,%edi
        while(*s != 0){
 8f0:	b8 28 00 00 00       	mov    $0x28,%eax
 8f5:	eb 99                	jmp    890 <vprintf.constprop.0+0x1b0>
 8f7:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 8fe:	66 90                	xchg   %ax,%ax

00000900 <fprintf>:
// Print to the given fd. Only understands %d,%x, %p, %s, %c.
void
fprintf(int fd, const char *fmt, ...)
{
 900:	55                   	push   %ebp
 901:	89 e5                	mov    %esp,%ebp
 903:	83 ec 08             	sub    $0x8,%esp
 va_list ap;
 va_start(ap, fmt); 
 vprintf(1,fmt,ap);
 906:	8b 45 0c             	mov    0xc(%ebp),%eax
 909:	8d 55 10             	lea    0x10(%ebp),%edx
 90c:	e8 cf fd ff ff       	call   6e0 <vprintf.constprop.0>
}
 911:	c9                   	leave  
 912:	c3                   	ret    
 913:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 91a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00000920 <printf>:
void
printf(const char *fmt, ...)
{
 920:	55                   	push   %ebp
 921:	89 e5                	mov    %esp,%ebp
 923:	83 ec 08             	sub    $0x8,%esp
  va_list ap;
  va_start(ap, fmt); 
  vprintf(1,fmt,ap);
 926:	8b 45 08             	mov    0x8(%ebp),%eax
 929:	8d 55 0c             	lea    0xc(%ebp),%edx
 92c:	e8 af fd ff ff       	call   6e0 <vprintf.constprop.0>
}
 931:	c9                   	leave  
 932:	c3                   	ret    
 933:	66 90                	xchg   %ax,%ax
 935:	66 90                	xchg   %ax,%ax
 937:	66 90                	xchg   %ax,%ax
 939:	66 90                	xchg   %ax,%ax
 93b:	66 90                	xchg   %ax,%ax
 93d:	66 90                	xchg   %ax,%ax
 93f:	90                   	nop

00000940 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 940:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 941:	a1 98 0b 00 00       	mov    0xb98,%eax
{
 946:	89 e5                	mov    %esp,%ebp
 948:	57                   	push   %edi
 949:	56                   	push   %esi
 94a:	53                   	push   %ebx
 94b:	8b 5d 08             	mov    0x8(%ebp),%ebx
  bp = (Header*)ap - 1;
 94e:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 951:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 958:	89 c2                	mov    %eax,%edx
 95a:	8b 00                	mov    (%eax),%eax
 95c:	39 ca                	cmp    %ecx,%edx
 95e:	73 30                	jae    990 <free+0x50>
 960:	39 c1                	cmp    %eax,%ecx
 962:	72 04                	jb     968 <free+0x28>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 964:	39 c2                	cmp    %eax,%edx
 966:	72 f0                	jb     958 <free+0x18>
      break;
  if(bp + bp->s.size == p->s.ptr){
 968:	8b 73 fc             	mov    -0x4(%ebx),%esi
 96b:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 96e:	39 f8                	cmp    %edi,%eax
 970:	74 30                	je     9a2 <free+0x62>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
 972:	89 43 f8             	mov    %eax,-0x8(%ebx)
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
 975:	8b 42 04             	mov    0x4(%edx),%eax
 978:	8d 34 c2             	lea    (%edx,%eax,8),%esi
 97b:	39 f1                	cmp    %esi,%ecx
 97d:	74 3a                	je     9b9 <free+0x79>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
 97f:	89 0a                	mov    %ecx,(%edx)
  } else
    p->s.ptr = bp;
  freep = p;
}
 981:	5b                   	pop    %ebx
  freep = p;
 982:	89 15 98 0b 00 00    	mov    %edx,0xb98
}
 988:	5e                   	pop    %esi
 989:	5f                   	pop    %edi
 98a:	5d                   	pop    %ebp
 98b:	c3                   	ret    
 98c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 990:	39 c2                	cmp    %eax,%edx
 992:	72 c4                	jb     958 <free+0x18>
 994:	39 c1                	cmp    %eax,%ecx
 996:	73 c0                	jae    958 <free+0x18>
  if(bp + bp->s.size == p->s.ptr){
 998:	8b 73 fc             	mov    -0x4(%ebx),%esi
 99b:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 99e:	39 f8                	cmp    %edi,%eax
 9a0:	75 d0                	jne    972 <free+0x32>
    bp->s.size += p->s.ptr->s.size;
 9a2:	03 70 04             	add    0x4(%eax),%esi
 9a5:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 9a8:	8b 02                	mov    (%edx),%eax
 9aa:	8b 00                	mov    (%eax),%eax
 9ac:	89 43 f8             	mov    %eax,-0x8(%ebx)
  if(p + p->s.size == bp){
 9af:	8b 42 04             	mov    0x4(%edx),%eax
 9b2:	8d 34 c2             	lea    (%edx,%eax,8),%esi
 9b5:	39 f1                	cmp    %esi,%ecx
 9b7:	75 c6                	jne    97f <free+0x3f>
    p->s.size += bp->s.size;
 9b9:	03 43 fc             	add    -0x4(%ebx),%eax
  freep = p;
 9bc:	89 15 98 0b 00 00    	mov    %edx,0xb98
    p->s.size += bp->s.size;
 9c2:	89 42 04             	mov    %eax,0x4(%edx)
    p->s.ptr = bp->s.ptr;
 9c5:	8b 4b f8             	mov    -0x8(%ebx),%ecx
 9c8:	89 0a                	mov    %ecx,(%edx)
}
 9ca:	5b                   	pop    %ebx
 9cb:	5e                   	pop    %esi
 9cc:	5f                   	pop    %edi
 9cd:	5d                   	pop    %ebp
 9ce:	c3                   	ret    
 9cf:	90                   	nop

000009d0 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 9d0:	55                   	push   %ebp
 9d1:	89 e5                	mov    %esp,%ebp
 9d3:	57                   	push   %edi
 9d4:	56                   	push   %esi
 9d5:	53                   	push   %ebx
 9d6:	83 ec 1c             	sub    $0x1c,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 9d9:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
 9dc:	8b 3d 98 0b 00 00    	mov    0xb98,%edi
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 9e2:	8d 70 07             	lea    0x7(%eax),%esi
 9e5:	c1 ee 03             	shr    $0x3,%esi
 9e8:	83 c6 01             	add    $0x1,%esi
  if((prevp = freep) == 0){
 9eb:	85 ff                	test   %edi,%edi
 9ed:	0f 84 9d 00 00 00    	je     a90 <malloc+0xc0>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 9f3:	8b 17                	mov    (%edi),%edx
    if(p->s.size >= nunits){
 9f5:	8b 4a 04             	mov    0x4(%edx),%ecx
 9f8:	39 f1                	cmp    %esi,%ecx
 9fa:	73 6a                	jae    a66 <malloc+0x96>
 9fc:	bb 00 10 00 00       	mov    $0x1000,%ebx
 a01:	39 de                	cmp    %ebx,%esi
 a03:	0f 43 de             	cmovae %esi,%ebx
  p = sbrk(nu * sizeof(Header));
 a06:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
 a0d:	89 45 e4             	mov    %eax,-0x1c(%ebp)
 a10:	eb 17                	jmp    a29 <malloc+0x59>
 a12:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 a18:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
 a1a:	8b 48 04             	mov    0x4(%eax),%ecx
 a1d:	39 f1                	cmp    %esi,%ecx
 a1f:	73 4f                	jae    a70 <malloc+0xa0>
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 a21:	8b 3d 98 0b 00 00    	mov    0xb98,%edi
 a27:	89 c2                	mov    %eax,%edx
 a29:	39 d7                	cmp    %edx,%edi
 a2b:	75 eb                	jne    a18 <malloc+0x48>
  p = sbrk(nu * sizeof(Header));
 a2d:	83 ec 0c             	sub    $0xc,%esp
 a30:	ff 75 e4             	push   -0x1c(%ebp)
 a33:	e8 d3 fb ff ff       	call   60b <sbrk>
  if(p == (char*)-1)
 a38:	83 c4 10             	add    $0x10,%esp
 a3b:	83 f8 ff             	cmp    $0xffffffff,%eax
 a3e:	74 1c                	je     a5c <malloc+0x8c>
  hp->s.size = nu;
 a40:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 a43:	83 ec 0c             	sub    $0xc,%esp
 a46:	83 c0 08             	add    $0x8,%eax
 a49:	50                   	push   %eax
 a4a:	e8 f1 fe ff ff       	call   940 <free>
  return freep;
 a4f:	8b 15 98 0b 00 00    	mov    0xb98,%edx
      if((p = morecore(nunits)) == 0)
 a55:	83 c4 10             	add    $0x10,%esp
 a58:	85 d2                	test   %edx,%edx
 a5a:	75 bc                	jne    a18 <malloc+0x48>
        return 0;
  }
}
 a5c:	8d 65 f4             	lea    -0xc(%ebp),%esp
        return 0;
 a5f:	31 c0                	xor    %eax,%eax
}
 a61:	5b                   	pop    %ebx
 a62:	5e                   	pop    %esi
 a63:	5f                   	pop    %edi
 a64:	5d                   	pop    %ebp
 a65:	c3                   	ret    
    if(p->s.size >= nunits){
 a66:	89 d0                	mov    %edx,%eax
 a68:	89 fa                	mov    %edi,%edx
 a6a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      if(p->s.size == nunits)
 a70:	39 ce                	cmp    %ecx,%esi
 a72:	74 4c                	je     ac0 <malloc+0xf0>
        p->s.size -= nunits;
 a74:	29 f1                	sub    %esi,%ecx
 a76:	89 48 04             	mov    %ecx,0x4(%eax)
        p += p->s.size;
 a79:	8d 04 c8             	lea    (%eax,%ecx,8),%eax
        p->s.size = nunits;
 a7c:	89 70 04             	mov    %esi,0x4(%eax)
      freep = prevp;
 a7f:	89 15 98 0b 00 00    	mov    %edx,0xb98
}
 a85:	8d 65 f4             	lea    -0xc(%ebp),%esp
      return (void*)(p + 1);
 a88:	83 c0 08             	add    $0x8,%eax
}
 a8b:	5b                   	pop    %ebx
 a8c:	5e                   	pop    %esi
 a8d:	5f                   	pop    %edi
 a8e:	5d                   	pop    %ebp
 a8f:	c3                   	ret    
    base.s.ptr = freep = prevp = &base;
 a90:	c7 05 98 0b 00 00 9c 	movl   $0xb9c,0xb98
 a97:	0b 00 00 
    base.s.size = 0;
 a9a:	bf 9c 0b 00 00       	mov    $0xb9c,%edi
    base.s.ptr = freep = prevp = &base;
 a9f:	c7 05 9c 0b 00 00 9c 	movl   $0xb9c,0xb9c
 aa6:	0b 00 00 
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 aa9:	89 fa                	mov    %edi,%edx
    base.s.size = 0;
 aab:	c7 05 a0 0b 00 00 00 	movl   $0x0,0xba0
 ab2:	00 00 00 
    if(p->s.size >= nunits){
 ab5:	e9 42 ff ff ff       	jmp    9fc <malloc+0x2c>
 aba:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        prevp->s.ptr = p->s.ptr;
 ac0:	8b 08                	mov    (%eax),%ecx
 ac2:	89 0a                	mov    %ecx,(%edx)
 ac4:	eb b9                	jmp    a7f <malloc+0xaf>