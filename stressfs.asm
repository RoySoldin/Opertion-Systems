
_stressfs:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
#include "fs.h"
#include "fcntl.h"

int
main(int argc, char *argv[])
{
   0:	55                   	push   %ebp
  int fd, i;
  char path[] = "stressfs0";
   1:	b8 73 74 72 65       	mov    $0x65727473,%eax
{
   6:	89 e5                	mov    %esp,%ebp
   8:	57                   	push   %edi
   9:	56                   	push   %esi
   a:	53                   	push   %ebx
  char data[512];

  printf(1, "stressfs starting\n");
  memset(data, 'a', sizeof(data));

  for(i = 0; i < 4; i++)
   b:	31 db                	xor    %ebx,%ebx
{
   d:	83 e4 f0             	and    $0xfffffff0,%esp
  10:	81 ec 30 02 00 00    	sub    $0x230,%esp
  char path[] = "stressfs0";
  16:	89 44 24 26          	mov    %eax,0x26(%esp)
  1a:	b8 73 73 66 73       	mov    $0x73667373,%eax
  1f:	89 44 24 2a          	mov    %eax,0x2a(%esp)
  printf(1, "stressfs starting\n");
  23:	b8 68 08 00 00       	mov    $0x868,%eax
  28:	89 44 24 04          	mov    %eax,0x4(%esp)
  memset(data, 'a', sizeof(data));
  2c:	8d 74 24 30          	lea    0x30(%esp),%esi
  printf(1, "stressfs starting\n");
  30:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  char path[] = "stressfs0";
  37:	66 c7 44 24 2e 30 00 	movw   $0x30,0x2e(%esp)
  printf(1, "stressfs starting\n");
  3e:	e8 ad 04 00 00       	call   4f0 <printf>
  memset(data, 'a', sizeof(data));
  43:	ba 00 02 00 00       	mov    $0x200,%edx
  48:	b9 61 00 00 00       	mov    $0x61,%ecx
  4d:	89 54 24 08          	mov    %edx,0x8(%esp)
  51:	89 4c 24 04          	mov    %ecx,0x4(%esp)
  55:	89 34 24             	mov    %esi,(%esp)
  58:	e8 93 01 00 00       	call   1f0 <memset>
    if(fork() > 0)
  5d:	e8 1e 03 00 00       	call   380 <fork>
  62:	85 c0                	test   %eax,%eax
  64:	0f 8f e4 00 00 00    	jg     14e <main+0x14e>
  for(i = 0; i < 4; i++)
  6a:	43                   	inc    %ebx
  6b:	83 fb 04             	cmp    $0x4,%ebx
  6e:	66 90                	xchg   %ax,%ax
  70:	75 eb                	jne    5d <main+0x5d>
  72:	b0 04                	mov    $0x4,%al
  74:	88 44 24 1f          	mov    %al,0x1f(%esp)
      break;

  printf(1, "write %d\n", i);
  78:	b8 7b 08 00 00       	mov    $0x87b,%eax
  7d:	89 5c 24 08          	mov    %ebx,0x8(%esp)

  path[8] += i;
  fd = open(path, O_CREATE | O_RDWR);
  81:	bb 14 00 00 00       	mov    $0x14,%ebx
  printf(1, "write %d\n", i);
  86:	89 44 24 04          	mov    %eax,0x4(%esp)
  8a:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  91:	e8 5a 04 00 00       	call   4f0 <printf>
  path[8] += i;
  96:	0f b6 44 24 1f       	movzbl 0x1f(%esp),%eax
  9b:	00 44 24 2e          	add    %al,0x2e(%esp)
  fd = open(path, O_CREATE | O_RDWR);
  9f:	b8 02 02 00 00       	mov    $0x202,%eax
  a4:	89 44 24 04          	mov    %eax,0x4(%esp)
  a8:	8d 44 24 26          	lea    0x26(%esp),%eax
  ac:	89 04 24             	mov    %eax,(%esp)
  af:	e8 14 03 00 00       	call   3c8 <open>
  b4:	89 c7                	mov    %eax,%edi
  b6:	8d 76 00             	lea    0x0(%esi),%esi
  b9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
  for(i = 0; i < 20; i++)
//    printf(fd, "%d\n", i);
    write(fd, data, sizeof(data));
  c0:	b8 00 02 00 00       	mov    $0x200,%eax
  c5:	89 44 24 08          	mov    %eax,0x8(%esp)
  c9:	89 74 24 04          	mov    %esi,0x4(%esp)
  cd:	89 3c 24             	mov    %edi,(%esp)
  d0:	e8 d3 02 00 00       	call   3a8 <write>
  for(i = 0; i < 20; i++)
  d5:	4b                   	dec    %ebx
  d6:	75 e8                	jne    c0 <main+0xc0>
  close(fd);
  d8:	89 3c 24             	mov    %edi,(%esp)

  printf(1, "read\n");

  fd = open(path, O_RDONLY);
  db:	31 db                	xor    %ebx,%ebx
  close(fd);
  dd:	e8 ce 02 00 00       	call   3b0 <close>
  printf(1, "read\n");
  e2:	b9 85 08 00 00       	mov    $0x885,%ecx
  e7:	89 4c 24 04          	mov    %ecx,0x4(%esp)
  eb:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  f2:	e8 f9 03 00 00       	call   4f0 <printf>
  fd = open(path, O_RDONLY);
  f7:	8d 44 24 26          	lea    0x26(%esp),%eax
  fb:	89 5c 24 04          	mov    %ebx,0x4(%esp)
  ff:	bb 14 00 00 00       	mov    $0x14,%ebx
 104:	89 04 24             	mov    %eax,(%esp)
 107:	e8 bc 02 00 00       	call   3c8 <open>
 10c:	89 c7                	mov    %eax,%edi
 10e:	66 90                	xchg   %ax,%ax
  for (i = 0; i < 20; i++)
    read(fd, data, sizeof(data));
 110:	ba 00 02 00 00       	mov    $0x200,%edx
 115:	89 54 24 08          	mov    %edx,0x8(%esp)
 119:	89 74 24 04          	mov    %esi,0x4(%esp)
 11d:	89 3c 24             	mov    %edi,(%esp)
 120:	e8 7b 02 00 00       	call   3a0 <read>
  for (i = 0; i < 20; i++)
 125:	4b                   	dec    %ebx
 126:	75 e8                	jne    110 <main+0x110>
  close(fd);
 128:	89 3c 24             	mov    %edi,(%esp)
 12b:	e8 80 02 00 00       	call   3b0 <close>

  int tmp = 0;
 130:	31 c0                	xor    %eax,%eax
 132:	89 44 24 20          	mov    %eax,0x20(%esp)
  wait(&tmp);
 136:	8d 44 24 20          	lea    0x20(%esp),%eax
 13a:	89 04 24             	mov    %eax,(%esp)
 13d:	e8 4e 02 00 00       	call   390 <wait>

  exit(0);
 142:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 149:	e8 3a 02 00 00       	call   388 <exit>
 14e:	88 d8                	mov    %bl,%al
 150:	e9 1f ff ff ff       	jmp    74 <main+0x74>
 155:	66 90                	xchg   %ax,%ax
 157:	66 90                	xchg   %ax,%ax
 159:	66 90                	xchg   %ax,%ax
 15b:	66 90                	xchg   %ax,%ax
 15d:	66 90                	xchg   %ax,%ax
 15f:	90                   	nop

00000160 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, const char *t)
{
 160:	55                   	push   %ebp
 161:	89 e5                	mov    %esp,%ebp
 163:	8b 45 08             	mov    0x8(%ebp),%eax
 166:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 169:	53                   	push   %ebx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 16a:	89 c2                	mov    %eax,%edx
 16c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 170:	41                   	inc    %ecx
 171:	0f b6 59 ff          	movzbl -0x1(%ecx),%ebx
 175:	42                   	inc    %edx
 176:	84 db                	test   %bl,%bl
 178:	88 5a ff             	mov    %bl,-0x1(%edx)
 17b:	75 f3                	jne    170 <strcpy+0x10>
    ;
  return os;
}
 17d:	5b                   	pop    %ebx
 17e:	5d                   	pop    %ebp
 17f:	c3                   	ret    

00000180 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 180:	55                   	push   %ebp
 181:	89 e5                	mov    %esp,%ebp
 183:	8b 4d 08             	mov    0x8(%ebp),%ecx
 186:	53                   	push   %ebx
 187:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  while(*p && *p == *q)
 18a:	0f b6 01             	movzbl (%ecx),%eax
 18d:	0f b6 13             	movzbl (%ebx),%edx
 190:	84 c0                	test   %al,%al
 192:	75 18                	jne    1ac <strcmp+0x2c>
 194:	eb 22                	jmp    1b8 <strcmp+0x38>
 196:	8d 76 00             	lea    0x0(%esi),%esi
 199:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    p++, q++;
 1a0:	41                   	inc    %ecx
  while(*p && *p == *q)
 1a1:	0f b6 01             	movzbl (%ecx),%eax
    p++, q++;
 1a4:	43                   	inc    %ebx
 1a5:	0f b6 13             	movzbl (%ebx),%edx
  while(*p && *p == *q)
 1a8:	84 c0                	test   %al,%al
 1aa:	74 0c                	je     1b8 <strcmp+0x38>
 1ac:	38 d0                	cmp    %dl,%al
 1ae:	74 f0                	je     1a0 <strcmp+0x20>
  return (uchar)*p - (uchar)*q;
}
 1b0:	5b                   	pop    %ebx
  return (uchar)*p - (uchar)*q;
 1b1:	29 d0                	sub    %edx,%eax
}
 1b3:	5d                   	pop    %ebp
 1b4:	c3                   	ret    
 1b5:	8d 76 00             	lea    0x0(%esi),%esi
 1b8:	5b                   	pop    %ebx
 1b9:	31 c0                	xor    %eax,%eax
  return (uchar)*p - (uchar)*q;
 1bb:	29 d0                	sub    %edx,%eax
}
 1bd:	5d                   	pop    %ebp
 1be:	c3                   	ret    
 1bf:	90                   	nop

000001c0 <strlen>:

uint
strlen(const char *s)
{
 1c0:	55                   	push   %ebp
 1c1:	89 e5                	mov    %esp,%ebp
 1c3:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
 1c6:	80 39 00             	cmpb   $0x0,(%ecx)
 1c9:	74 15                	je     1e0 <strlen+0x20>
 1cb:	31 d2                	xor    %edx,%edx
 1cd:	8d 76 00             	lea    0x0(%esi),%esi
 1d0:	42                   	inc    %edx
 1d1:	80 3c 11 00          	cmpb   $0x0,(%ecx,%edx,1)
 1d5:	89 d0                	mov    %edx,%eax
 1d7:	75 f7                	jne    1d0 <strlen+0x10>
    ;
  return n;
}
 1d9:	5d                   	pop    %ebp
 1da:	c3                   	ret    
 1db:	90                   	nop
 1dc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  for(n = 0; s[n]; n++)
 1e0:	31 c0                	xor    %eax,%eax
}
 1e2:	5d                   	pop    %ebp
 1e3:	c3                   	ret    
 1e4:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 1ea:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

000001f0 <memset>:

void*
memset(void *dst, int c, uint n)
{
 1f0:	55                   	push   %ebp
 1f1:	89 e5                	mov    %esp,%ebp
 1f3:	8b 55 08             	mov    0x8(%ebp),%edx
 1f6:	57                   	push   %edi
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 1f7:	8b 4d 10             	mov    0x10(%ebp),%ecx
 1fa:	8b 45 0c             	mov    0xc(%ebp),%eax
 1fd:	89 d7                	mov    %edx,%edi
 1ff:	fc                   	cld    
 200:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 202:	5f                   	pop    %edi
 203:	89 d0                	mov    %edx,%eax
 205:	5d                   	pop    %ebp
 206:	c3                   	ret    
 207:	89 f6                	mov    %esi,%esi
 209:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000210 <strchr>:

char*
strchr(const char *s, char c)
{
 210:	55                   	push   %ebp
 211:	89 e5                	mov    %esp,%ebp
 213:	8b 45 08             	mov    0x8(%ebp),%eax
 216:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 21a:	0f b6 10             	movzbl (%eax),%edx
 21d:	84 d2                	test   %dl,%dl
 21f:	74 1b                	je     23c <strchr+0x2c>
    if(*s == c)
 221:	38 d1                	cmp    %dl,%cl
 223:	75 0f                	jne    234 <strchr+0x24>
 225:	eb 17                	jmp    23e <strchr+0x2e>
 227:	89 f6                	mov    %esi,%esi
 229:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
 230:	38 ca                	cmp    %cl,%dl
 232:	74 0a                	je     23e <strchr+0x2e>
  for(; *s; s++)
 234:	40                   	inc    %eax
 235:	0f b6 10             	movzbl (%eax),%edx
 238:	84 d2                	test   %dl,%dl
 23a:	75 f4                	jne    230 <strchr+0x20>
      return (char*)s;
  return 0;
 23c:	31 c0                	xor    %eax,%eax
}
 23e:	5d                   	pop    %ebp
 23f:	c3                   	ret    

00000240 <gets>:

char*
gets(char *buf, int max)
{
 240:	55                   	push   %ebp
 241:	89 e5                	mov    %esp,%ebp
 243:	57                   	push   %edi
 244:	56                   	push   %esi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 245:	31 f6                	xor    %esi,%esi
{
 247:	53                   	push   %ebx
 248:	83 ec 3c             	sub    $0x3c,%esp
 24b:	8b 5d 08             	mov    0x8(%ebp),%ebx
    cc = read(0, &c, 1);
 24e:	8d 7d e7             	lea    -0x19(%ebp),%edi
  for(i=0; i+1 < max; ){
 251:	eb 32                	jmp    285 <gets+0x45>
 253:	90                   	nop
 254:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    cc = read(0, &c, 1);
 258:	ba 01 00 00 00       	mov    $0x1,%edx
 25d:	89 54 24 08          	mov    %edx,0x8(%esp)
 261:	89 7c 24 04          	mov    %edi,0x4(%esp)
 265:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 26c:	e8 2f 01 00 00       	call   3a0 <read>
    if(cc < 1)
 271:	85 c0                	test   %eax,%eax
 273:	7e 19                	jle    28e <gets+0x4e>
      break;
    buf[i++] = c;
 275:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 279:	43                   	inc    %ebx
 27a:	88 43 ff             	mov    %al,-0x1(%ebx)
    if(c == '\n' || c == '\r')
 27d:	3c 0a                	cmp    $0xa,%al
 27f:	74 1f                	je     2a0 <gets+0x60>
 281:	3c 0d                	cmp    $0xd,%al
 283:	74 1b                	je     2a0 <gets+0x60>
  for(i=0; i+1 < max; ){
 285:	46                   	inc    %esi
 286:	3b 75 0c             	cmp    0xc(%ebp),%esi
 289:	89 5d d4             	mov    %ebx,-0x2c(%ebp)
 28c:	7c ca                	jl     258 <gets+0x18>
      break;
  }
  buf[i] = '\0';
 28e:	8b 45 d4             	mov    -0x2c(%ebp),%eax
 291:	c6 00 00             	movb   $0x0,(%eax)
  return buf;
}
 294:	8b 45 08             	mov    0x8(%ebp),%eax
 297:	83 c4 3c             	add    $0x3c,%esp
 29a:	5b                   	pop    %ebx
 29b:	5e                   	pop    %esi
 29c:	5f                   	pop    %edi
 29d:	5d                   	pop    %ebp
 29e:	c3                   	ret    
 29f:	90                   	nop
 2a0:	8b 45 08             	mov    0x8(%ebp),%eax
 2a3:	01 c6                	add    %eax,%esi
 2a5:	89 75 d4             	mov    %esi,-0x2c(%ebp)
 2a8:	eb e4                	jmp    28e <gets+0x4e>
 2aa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

000002b0 <stat>:

int
stat(const char *n, struct stat *st)
{
 2b0:	55                   	push   %ebp
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 2b1:	31 c0                	xor    %eax,%eax
{
 2b3:	89 e5                	mov    %esp,%ebp
 2b5:	83 ec 18             	sub    $0x18,%esp
  fd = open(n, O_RDONLY);
 2b8:	89 44 24 04          	mov    %eax,0x4(%esp)
 2bc:	8b 45 08             	mov    0x8(%ebp),%eax
{
 2bf:	89 5d f8             	mov    %ebx,-0x8(%ebp)
 2c2:	89 75 fc             	mov    %esi,-0x4(%ebp)
  fd = open(n, O_RDONLY);
 2c5:	89 04 24             	mov    %eax,(%esp)
 2c8:	e8 fb 00 00 00       	call   3c8 <open>
  if(fd < 0)
 2cd:	85 c0                	test   %eax,%eax
 2cf:	78 2f                	js     300 <stat+0x50>
 2d1:	89 c3                	mov    %eax,%ebx
    return -1;
  r = fstat(fd, st);
 2d3:	8b 45 0c             	mov    0xc(%ebp),%eax
 2d6:	89 1c 24             	mov    %ebx,(%esp)
 2d9:	89 44 24 04          	mov    %eax,0x4(%esp)
 2dd:	e8 fe 00 00 00       	call   3e0 <fstat>
  close(fd);
 2e2:	89 1c 24             	mov    %ebx,(%esp)
  r = fstat(fd, st);
 2e5:	89 c6                	mov    %eax,%esi
  close(fd);
 2e7:	e8 c4 00 00 00       	call   3b0 <close>
  return r;
}
 2ec:	89 f0                	mov    %esi,%eax
 2ee:	8b 5d f8             	mov    -0x8(%ebp),%ebx
 2f1:	8b 75 fc             	mov    -0x4(%ebp),%esi
 2f4:	89 ec                	mov    %ebp,%esp
 2f6:	5d                   	pop    %ebp
 2f7:	c3                   	ret    
 2f8:	90                   	nop
 2f9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    return -1;
 300:	be ff ff ff ff       	mov    $0xffffffff,%esi
 305:	eb e5                	jmp    2ec <stat+0x3c>
 307:	89 f6                	mov    %esi,%esi
 309:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000310 <atoi>:

int
atoi(const char *s)
{
 310:	55                   	push   %ebp
 311:	89 e5                	mov    %esp,%ebp
 313:	8b 4d 08             	mov    0x8(%ebp),%ecx
 316:	53                   	push   %ebx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 317:	0f be 11             	movsbl (%ecx),%edx
 31a:	88 d0                	mov    %dl,%al
 31c:	2c 30                	sub    $0x30,%al
 31e:	3c 09                	cmp    $0x9,%al
  n = 0;
 320:	b8 00 00 00 00       	mov    $0x0,%eax
  while('0' <= *s && *s <= '9')
 325:	77 1e                	ja     345 <atoi+0x35>
 327:	89 f6                	mov    %esi,%esi
 329:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    n = n*10 + *s++ - '0';
 330:	41                   	inc    %ecx
 331:	8d 04 80             	lea    (%eax,%eax,4),%eax
 334:	8d 44 42 d0          	lea    -0x30(%edx,%eax,2),%eax
  while('0' <= *s && *s <= '9')
 338:	0f be 11             	movsbl (%ecx),%edx
 33b:	88 d3                	mov    %dl,%bl
 33d:	80 eb 30             	sub    $0x30,%bl
 340:	80 fb 09             	cmp    $0x9,%bl
 343:	76 eb                	jbe    330 <atoi+0x20>
  return n;
}
 345:	5b                   	pop    %ebx
 346:	5d                   	pop    %ebp
 347:	c3                   	ret    
 348:	90                   	nop
 349:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000350 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 350:	55                   	push   %ebp
 351:	89 e5                	mov    %esp,%ebp
 353:	56                   	push   %esi
 354:	8b 45 08             	mov    0x8(%ebp),%eax
 357:	53                   	push   %ebx
 358:	8b 5d 10             	mov    0x10(%ebp),%ebx
 35b:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 35e:	85 db                	test   %ebx,%ebx
 360:	7e 1a                	jle    37c <memmove+0x2c>
 362:	31 d2                	xor    %edx,%edx
 364:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 36a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi
    *dst++ = *src++;
 370:	0f b6 0c 16          	movzbl (%esi,%edx,1),%ecx
 374:	88 0c 10             	mov    %cl,(%eax,%edx,1)
 377:	42                   	inc    %edx
  while(n-- > 0)
 378:	39 d3                	cmp    %edx,%ebx
 37a:	75 f4                	jne    370 <memmove+0x20>
  return vdst;
}
 37c:	5b                   	pop    %ebx
 37d:	5e                   	pop    %esi
 37e:	5d                   	pop    %ebp
 37f:	c3                   	ret    

00000380 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 380:	b8 01 00 00 00       	mov    $0x1,%eax
 385:	cd 40                	int    $0x40
 387:	c3                   	ret    

00000388 <exit>:
SYSCALL(exit)
 388:	b8 02 00 00 00       	mov    $0x2,%eax
 38d:	cd 40                	int    $0x40
 38f:	c3                   	ret    

00000390 <wait>:
SYSCALL(wait)
 390:	b8 03 00 00 00       	mov    $0x3,%eax
 395:	cd 40                	int    $0x40
 397:	c3                   	ret    

00000398 <pipe>:
SYSCALL(pipe)
 398:	b8 04 00 00 00       	mov    $0x4,%eax
 39d:	cd 40                	int    $0x40
 39f:	c3                   	ret    

000003a0 <read>:
SYSCALL(read)
 3a0:	b8 05 00 00 00       	mov    $0x5,%eax
 3a5:	cd 40                	int    $0x40
 3a7:	c3                   	ret    

000003a8 <write>:
SYSCALL(write)
 3a8:	b8 10 00 00 00       	mov    $0x10,%eax
 3ad:	cd 40                	int    $0x40
 3af:	c3                   	ret    

000003b0 <close>:
SYSCALL(close)
 3b0:	b8 15 00 00 00       	mov    $0x15,%eax
 3b5:	cd 40                	int    $0x40
 3b7:	c3                   	ret    

000003b8 <kill>:
SYSCALL(kill)
 3b8:	b8 06 00 00 00       	mov    $0x6,%eax
 3bd:	cd 40                	int    $0x40
 3bf:	c3                   	ret    

000003c0 <exec>:
SYSCALL(exec)
 3c0:	b8 07 00 00 00       	mov    $0x7,%eax
 3c5:	cd 40                	int    $0x40
 3c7:	c3                   	ret    

000003c8 <open>:
SYSCALL(open)
 3c8:	b8 0f 00 00 00       	mov    $0xf,%eax
 3cd:	cd 40                	int    $0x40
 3cf:	c3                   	ret    

000003d0 <mknod>:
SYSCALL(mknod)
 3d0:	b8 11 00 00 00       	mov    $0x11,%eax
 3d5:	cd 40                	int    $0x40
 3d7:	c3                   	ret    

000003d8 <unlink>:
SYSCALL(unlink)
 3d8:	b8 12 00 00 00       	mov    $0x12,%eax
 3dd:	cd 40                	int    $0x40
 3df:	c3                   	ret    

000003e0 <fstat>:
SYSCALL(fstat)
 3e0:	b8 08 00 00 00       	mov    $0x8,%eax
 3e5:	cd 40                	int    $0x40
 3e7:	c3                   	ret    

000003e8 <link>:
SYSCALL(link)
 3e8:	b8 13 00 00 00       	mov    $0x13,%eax
 3ed:	cd 40                	int    $0x40
 3ef:	c3                   	ret    

000003f0 <mkdir>:
SYSCALL(mkdir)
 3f0:	b8 14 00 00 00       	mov    $0x14,%eax
 3f5:	cd 40                	int    $0x40
 3f7:	c3                   	ret    

000003f8 <chdir>:
SYSCALL(chdir)
 3f8:	b8 09 00 00 00       	mov    $0x9,%eax
 3fd:	cd 40                	int    $0x40
 3ff:	c3                   	ret    

00000400 <dup>:
SYSCALL(dup)
 400:	b8 0a 00 00 00       	mov    $0xa,%eax
 405:	cd 40                	int    $0x40
 407:	c3                   	ret    

00000408 <getpid>:
SYSCALL(getpid)
 408:	b8 0b 00 00 00       	mov    $0xb,%eax
 40d:	cd 40                	int    $0x40
 40f:	c3                   	ret    

00000410 <sbrk>:
SYSCALL(sbrk)
 410:	b8 0c 00 00 00       	mov    $0xc,%eax
 415:	cd 40                	int    $0x40
 417:	c3                   	ret    

00000418 <sleep>:
SYSCALL(sleep)
 418:	b8 0d 00 00 00       	mov    $0xd,%eax
 41d:	cd 40                	int    $0x40
 41f:	c3                   	ret    

00000420 <uptime>:
SYSCALL(uptime)
 420:	b8 0e 00 00 00       	mov    $0xe,%eax
 425:	cd 40                	int    $0x40
 427:	c3                   	ret    

00000428 <detach>:
SYSCALL(detach)
 428:	b8 16 00 00 00       	mov    $0x16,%eax
 42d:	cd 40                	int    $0x40
 42f:	c3                   	ret    

00000430 <policy>:
SYSCALL(policy)
 430:	b8 17 00 00 00       	mov    $0x17,%eax
 435:	cd 40                	int    $0x40
 437:	c3                   	ret    

00000438 <priority>:
SYSCALL(priority)
 438:	b8 18 00 00 00       	mov    $0x18,%eax
 43d:	cd 40                	int    $0x40
 43f:	c3                   	ret    

00000440 <wait_stat>:
SYSCALL(wait_stat)
 440:	b8 19 00 00 00       	mov    $0x19,%eax
 445:	cd 40                	int    $0x40
 447:	c3                   	ret    
 448:	66 90                	xchg   %ax,%ax
 44a:	66 90                	xchg   %ax,%ax
 44c:	66 90                	xchg   %ax,%ax
 44e:	66 90                	xchg   %ax,%ax

00000450 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
 450:	55                   	push   %ebp
 451:	89 e5                	mov    %esp,%ebp
 453:	57                   	push   %edi
 454:	56                   	push   %esi
 455:	53                   	push   %ebx
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 456:	89 d3                	mov    %edx,%ebx
 458:	c1 eb 1f             	shr    $0x1f,%ebx
{
 45b:	83 ec 4c             	sub    $0x4c,%esp
  if(sgn && xx < 0){
 45e:	84 db                	test   %bl,%bl
{
 460:	89 45 c0             	mov    %eax,-0x40(%ebp)
 463:	89 d0                	mov    %edx,%eax
  if(sgn && xx < 0){
 465:	74 79                	je     4e0 <printint+0x90>
 467:	f6 45 08 01          	testb  $0x1,0x8(%ebp)
 46b:	74 73                	je     4e0 <printint+0x90>
    neg = 1;
    x = -xx;
 46d:	f7 d8                	neg    %eax
    neg = 1;
 46f:	c7 45 c4 01 00 00 00 	movl   $0x1,-0x3c(%ebp)
  } else {
    x = xx;
  }

  i = 0;
 476:	31 f6                	xor    %esi,%esi
 478:	8d 5d d7             	lea    -0x29(%ebp),%ebx
 47b:	eb 05                	jmp    482 <printint+0x32>
 47d:	8d 76 00             	lea    0x0(%esi),%esi
  do{
    buf[i++] = digits[x % base];
 480:	89 fe                	mov    %edi,%esi
 482:	31 d2                	xor    %edx,%edx
 484:	f7 f1                	div    %ecx
 486:	8d 7e 01             	lea    0x1(%esi),%edi
 489:	0f b6 92 94 08 00 00 	movzbl 0x894(%edx),%edx
  }while((x /= base) != 0);
 490:	85 c0                	test   %eax,%eax
    buf[i++] = digits[x % base];
 492:	88 14 3b             	mov    %dl,(%ebx,%edi,1)
  }while((x /= base) != 0);
 495:	75 e9                	jne    480 <printint+0x30>
  if(neg)
 497:	8b 55 c4             	mov    -0x3c(%ebp),%edx
 49a:	85 d2                	test   %edx,%edx
 49c:	74 08                	je     4a6 <printint+0x56>
    buf[i++] = '-';
 49e:	c6 44 3d d8 2d       	movb   $0x2d,-0x28(%ebp,%edi,1)
 4a3:	8d 7e 02             	lea    0x2(%esi),%edi
 4a6:	8d 74 3d d7          	lea    -0x29(%ebp,%edi,1),%esi
 4aa:	8b 7d c0             	mov    -0x40(%ebp),%edi
 4ad:	8d 76 00             	lea    0x0(%esi),%esi
 4b0:	0f b6 06             	movzbl (%esi),%eax
 4b3:	4e                   	dec    %esi
  write(fd, &c, 1);
 4b4:	89 5c 24 04          	mov    %ebx,0x4(%esp)
 4b8:	89 3c 24             	mov    %edi,(%esp)
 4bb:	88 45 d7             	mov    %al,-0x29(%ebp)
 4be:	b8 01 00 00 00       	mov    $0x1,%eax
 4c3:	89 44 24 08          	mov    %eax,0x8(%esp)
 4c7:	e8 dc fe ff ff       	call   3a8 <write>

  while(--i >= 0)
 4cc:	39 de                	cmp    %ebx,%esi
 4ce:	75 e0                	jne    4b0 <printint+0x60>
    putc(fd, buf[i]);
}
 4d0:	83 c4 4c             	add    $0x4c,%esp
 4d3:	5b                   	pop    %ebx
 4d4:	5e                   	pop    %esi
 4d5:	5f                   	pop    %edi
 4d6:	5d                   	pop    %ebp
 4d7:	c3                   	ret    
 4d8:	90                   	nop
 4d9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
 4e0:	c7 45 c4 00 00 00 00 	movl   $0x0,-0x3c(%ebp)
 4e7:	eb 8d                	jmp    476 <printint+0x26>
 4e9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

000004f0 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 4f0:	55                   	push   %ebp
 4f1:	89 e5                	mov    %esp,%ebp
 4f3:	57                   	push   %edi
 4f4:	56                   	push   %esi
 4f5:	53                   	push   %ebx
 4f6:	83 ec 3c             	sub    $0x3c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 4f9:	8b 75 0c             	mov    0xc(%ebp),%esi
 4fc:	0f b6 1e             	movzbl (%esi),%ebx
 4ff:	84 db                	test   %bl,%bl
 501:	0f 84 d1 00 00 00    	je     5d8 <printf+0xe8>
  state = 0;
 507:	31 ff                	xor    %edi,%edi
 509:	46                   	inc    %esi
  ap = (uint*)(void*)&fmt + 1;
 50a:	8d 45 10             	lea    0x10(%ebp),%eax
  write(fd, &c, 1);
 50d:	89 fa                	mov    %edi,%edx
 50f:	8b 7d 08             	mov    0x8(%ebp),%edi
  ap = (uint*)(void*)&fmt + 1;
 512:	89 45 d0             	mov    %eax,-0x30(%ebp)
 515:	eb 41                	jmp    558 <printf+0x68>
 517:	89 f6                	mov    %esi,%esi
 519:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
 520:	83 f8 25             	cmp    $0x25,%eax
 523:	89 55 d4             	mov    %edx,-0x2c(%ebp)
        state = '%';
 526:	ba 25 00 00 00       	mov    $0x25,%edx
      if(c == '%'){
 52b:	74 1e                	je     54b <printf+0x5b>
  write(fd, &c, 1);
 52d:	b8 01 00 00 00       	mov    $0x1,%eax
 532:	89 44 24 08          	mov    %eax,0x8(%esp)
 536:	8d 45 e2             	lea    -0x1e(%ebp),%eax
 539:	89 44 24 04          	mov    %eax,0x4(%esp)
 53d:	89 3c 24             	mov    %edi,(%esp)
 540:	88 5d e2             	mov    %bl,-0x1e(%ebp)
 543:	e8 60 fe ff ff       	call   3a8 <write>
 548:	8b 55 d4             	mov    -0x2c(%ebp),%edx
 54b:	46                   	inc    %esi
  for(i = 0; fmt[i]; i++){
 54c:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
 550:	84 db                	test   %bl,%bl
 552:	0f 84 80 00 00 00    	je     5d8 <printf+0xe8>
    if(state == 0){
 558:	85 d2                	test   %edx,%edx
    c = fmt[i] & 0xff;
 55a:	0f be cb             	movsbl %bl,%ecx
 55d:	0f b6 c3             	movzbl %bl,%eax
    if(state == 0){
 560:	74 be                	je     520 <printf+0x30>
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
 562:	83 fa 25             	cmp    $0x25,%edx
 565:	75 e4                	jne    54b <printf+0x5b>
      if(c == 'd'){
 567:	83 f8 64             	cmp    $0x64,%eax
 56a:	0f 84 f0 00 00 00    	je     660 <printf+0x170>
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
 570:	81 e1 f7 00 00 00    	and    $0xf7,%ecx
 576:	83 f9 70             	cmp    $0x70,%ecx
 579:	74 65                	je     5e0 <printf+0xf0>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
 57b:	83 f8 73             	cmp    $0x73,%eax
 57e:	0f 84 8c 00 00 00    	je     610 <printf+0x120>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 584:	83 f8 63             	cmp    $0x63,%eax
 587:	0f 84 13 01 00 00    	je     6a0 <printf+0x1b0>
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
 58d:	83 f8 25             	cmp    $0x25,%eax
 590:	0f 84 e2 00 00 00    	je     678 <printf+0x188>
  write(fd, &c, 1);
 596:	b8 01 00 00 00       	mov    $0x1,%eax
 59b:	46                   	inc    %esi
 59c:	89 44 24 08          	mov    %eax,0x8(%esp)
 5a0:	8d 45 e7             	lea    -0x19(%ebp),%eax
 5a3:	89 44 24 04          	mov    %eax,0x4(%esp)
 5a7:	89 3c 24             	mov    %edi,(%esp)
 5aa:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
 5ae:	e8 f5 fd ff ff       	call   3a8 <write>
 5b3:	ba 01 00 00 00       	mov    $0x1,%edx
 5b8:	8d 45 e6             	lea    -0x1a(%ebp),%eax
 5bb:	89 54 24 08          	mov    %edx,0x8(%esp)
 5bf:	89 44 24 04          	mov    %eax,0x4(%esp)
 5c3:	89 3c 24             	mov    %edi,(%esp)
 5c6:	88 5d e6             	mov    %bl,-0x1a(%ebp)
 5c9:	e8 da fd ff ff       	call   3a8 <write>
  for(i = 0; fmt[i]; i++){
 5ce:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 5d2:	31 d2                	xor    %edx,%edx
  for(i = 0; fmt[i]; i++){
 5d4:	84 db                	test   %bl,%bl
 5d6:	75 80                	jne    558 <printf+0x68>
    }
  }
}
 5d8:	83 c4 3c             	add    $0x3c,%esp
 5db:	5b                   	pop    %ebx
 5dc:	5e                   	pop    %esi
 5dd:	5f                   	pop    %edi
 5de:	5d                   	pop    %ebp
 5df:	c3                   	ret    
        printint(fd, *ap, 16, 0);
 5e0:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 5e7:	b9 10 00 00 00       	mov    $0x10,%ecx
 5ec:	8b 5d d0             	mov    -0x30(%ebp),%ebx
 5ef:	89 f8                	mov    %edi,%eax
 5f1:	8b 13                	mov    (%ebx),%edx
 5f3:	e8 58 fe ff ff       	call   450 <printint>
        ap++;
 5f8:	89 d8                	mov    %ebx,%eax
      state = 0;
 5fa:	31 d2                	xor    %edx,%edx
        ap++;
 5fc:	83 c0 04             	add    $0x4,%eax
 5ff:	89 45 d0             	mov    %eax,-0x30(%ebp)
 602:	e9 44 ff ff ff       	jmp    54b <printf+0x5b>
 607:	89 f6                	mov    %esi,%esi
 609:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
        s = (char*)*ap;
 610:	8b 45 d0             	mov    -0x30(%ebp),%eax
 613:	8b 10                	mov    (%eax),%edx
        ap++;
 615:	83 c0 04             	add    $0x4,%eax
 618:	89 45 d0             	mov    %eax,-0x30(%ebp)
        if(s == 0)
 61b:	85 d2                	test   %edx,%edx
 61d:	0f 84 aa 00 00 00    	je     6cd <printf+0x1dd>
        while(*s != 0){
 623:	0f b6 02             	movzbl (%edx),%eax
        s = (char*)*ap;
 626:	89 d3                	mov    %edx,%ebx
        while(*s != 0){
 628:	84 c0                	test   %al,%al
 62a:	74 27                	je     653 <printf+0x163>
 62c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 630:	88 45 e3             	mov    %al,-0x1d(%ebp)
  write(fd, &c, 1);
 633:	b8 01 00 00 00       	mov    $0x1,%eax
          s++;
 638:	43                   	inc    %ebx
  write(fd, &c, 1);
 639:	89 44 24 08          	mov    %eax,0x8(%esp)
 63d:	8d 45 e3             	lea    -0x1d(%ebp),%eax
 640:	89 44 24 04          	mov    %eax,0x4(%esp)
 644:	89 3c 24             	mov    %edi,(%esp)
 647:	e8 5c fd ff ff       	call   3a8 <write>
        while(*s != 0){
 64c:	0f b6 03             	movzbl (%ebx),%eax
 64f:	84 c0                	test   %al,%al
 651:	75 dd                	jne    630 <printf+0x140>
      state = 0;
 653:	31 d2                	xor    %edx,%edx
 655:	e9 f1 fe ff ff       	jmp    54b <printf+0x5b>
 65a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        printint(fd, *ap, 10, 1);
 660:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 667:	b9 0a 00 00 00       	mov    $0xa,%ecx
 66c:	e9 7b ff ff ff       	jmp    5ec <printf+0xfc>
 671:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  write(fd, &c, 1);
 678:	b9 01 00 00 00       	mov    $0x1,%ecx
 67d:	8d 45 e5             	lea    -0x1b(%ebp),%eax
 680:	89 4c 24 08          	mov    %ecx,0x8(%esp)
 684:	89 44 24 04          	mov    %eax,0x4(%esp)
 688:	89 3c 24             	mov    %edi,(%esp)
 68b:	88 5d e5             	mov    %bl,-0x1b(%ebp)
 68e:	e8 15 fd ff ff       	call   3a8 <write>
      state = 0;
 693:	31 d2                	xor    %edx,%edx
 695:	e9 b1 fe ff ff       	jmp    54b <printf+0x5b>
 69a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        putc(fd, *ap);
 6a0:	8b 5d d0             	mov    -0x30(%ebp),%ebx
 6a3:	8b 03                	mov    (%ebx),%eax
        ap++;
 6a5:	83 c3 04             	add    $0x4,%ebx
  write(fd, &c, 1);
 6a8:	89 3c 24             	mov    %edi,(%esp)
        putc(fd, *ap);
 6ab:	88 45 e4             	mov    %al,-0x1c(%ebp)
  write(fd, &c, 1);
 6ae:	b8 01 00 00 00       	mov    $0x1,%eax
 6b3:	89 44 24 08          	mov    %eax,0x8(%esp)
 6b7:	8d 45 e4             	lea    -0x1c(%ebp),%eax
 6ba:	89 44 24 04          	mov    %eax,0x4(%esp)
 6be:	e8 e5 fc ff ff       	call   3a8 <write>
      state = 0;
 6c3:	31 d2                	xor    %edx,%edx
        ap++;
 6c5:	89 5d d0             	mov    %ebx,-0x30(%ebp)
 6c8:	e9 7e fe ff ff       	jmp    54b <printf+0x5b>
          s = "(null)";
 6cd:	bb 8b 08 00 00       	mov    $0x88b,%ebx
        while(*s != 0){
 6d2:	b0 28                	mov    $0x28,%al
 6d4:	e9 57 ff ff ff       	jmp    630 <printf+0x140>
 6d9:	66 90                	xchg   %ax,%ax
 6db:	66 90                	xchg   %ax,%ax
 6dd:	66 90                	xchg   %ax,%ax
 6df:	90                   	nop

000006e0 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 6e0:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 6e1:	a1 24 0b 00 00       	mov    0xb24,%eax
{
 6e6:	89 e5                	mov    %esp,%ebp
 6e8:	57                   	push   %edi
 6e9:	56                   	push   %esi
 6ea:	53                   	push   %ebx
 6eb:	8b 5d 08             	mov    0x8(%ebp),%ebx
  bp = (Header*)ap - 1;
 6ee:	8d 4b f8             	lea    -0x8(%ebx),%ecx
 6f1:	eb 0d                	jmp    700 <free+0x20>
 6f3:	90                   	nop
 6f4:	90                   	nop
 6f5:	90                   	nop
 6f6:	90                   	nop
 6f7:	90                   	nop
 6f8:	90                   	nop
 6f9:	90                   	nop
 6fa:	90                   	nop
 6fb:	90                   	nop
 6fc:	90                   	nop
 6fd:	90                   	nop
 6fe:	90                   	nop
 6ff:	90                   	nop
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 700:	39 c8                	cmp    %ecx,%eax
 702:	8b 10                	mov    (%eax),%edx
 704:	73 32                	jae    738 <free+0x58>
 706:	39 d1                	cmp    %edx,%ecx
 708:	72 04                	jb     70e <free+0x2e>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 70a:	39 d0                	cmp    %edx,%eax
 70c:	72 32                	jb     740 <free+0x60>
      break;
  if(bp + bp->s.size == p->s.ptr){
 70e:	8b 73 fc             	mov    -0x4(%ebx),%esi
 711:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 714:	39 fa                	cmp    %edi,%edx
 716:	74 30                	je     748 <free+0x68>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 718:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 71b:	8b 50 04             	mov    0x4(%eax),%edx
 71e:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 721:	39 f1                	cmp    %esi,%ecx
 723:	74 3c                	je     761 <free+0x81>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 725:	89 08                	mov    %ecx,(%eax)
  freep = p;
}
 727:	5b                   	pop    %ebx
  freep = p;
 728:	a3 24 0b 00 00       	mov    %eax,0xb24
}
 72d:	5e                   	pop    %esi
 72e:	5f                   	pop    %edi
 72f:	5d                   	pop    %ebp
 730:	c3                   	ret    
 731:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 738:	39 d0                	cmp    %edx,%eax
 73a:	72 04                	jb     740 <free+0x60>
 73c:	39 d1                	cmp    %edx,%ecx
 73e:	72 ce                	jb     70e <free+0x2e>
{
 740:	89 d0                	mov    %edx,%eax
 742:	eb bc                	jmp    700 <free+0x20>
 744:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    bp->s.size += p->s.ptr->s.size;
 748:	8b 7a 04             	mov    0x4(%edx),%edi
 74b:	01 fe                	add    %edi,%esi
 74d:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 750:	8b 10                	mov    (%eax),%edx
 752:	8b 12                	mov    (%edx),%edx
 754:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 757:	8b 50 04             	mov    0x4(%eax),%edx
 75a:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 75d:	39 f1                	cmp    %esi,%ecx
 75f:	75 c4                	jne    725 <free+0x45>
    p->s.size += bp->s.size;
 761:	8b 4b fc             	mov    -0x4(%ebx),%ecx
  freep = p;
 764:	a3 24 0b 00 00       	mov    %eax,0xb24
    p->s.size += bp->s.size;
 769:	01 ca                	add    %ecx,%edx
 76b:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 76e:	8b 53 f8             	mov    -0x8(%ebx),%edx
 771:	89 10                	mov    %edx,(%eax)
}
 773:	5b                   	pop    %ebx
 774:	5e                   	pop    %esi
 775:	5f                   	pop    %edi
 776:	5d                   	pop    %ebp
 777:	c3                   	ret    
 778:	90                   	nop
 779:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

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
 78c:	8b 15 24 0b 00 00    	mov    0xb24,%edx
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 792:	8d 78 07             	lea    0x7(%eax),%edi
 795:	c1 ef 03             	shr    $0x3,%edi
 798:	47                   	inc    %edi
  if((prevp = freep) == 0){
 799:	85 d2                	test   %edx,%edx
 79b:	0f 84 8f 00 00 00    	je     830 <malloc+0xb0>
 7a1:	8b 02                	mov    (%edx),%eax
 7a3:	8b 48 04             	mov    0x4(%eax),%ecx
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
 7a6:	39 cf                	cmp    %ecx,%edi
 7a8:	76 66                	jbe    810 <malloc+0x90>
 7aa:	81 ff 00 10 00 00    	cmp    $0x1000,%edi
 7b0:	bb 00 10 00 00       	mov    $0x1000,%ebx
 7b5:	0f 43 df             	cmovae %edi,%ebx
  p = sbrk(nu * sizeof(Header));
 7b8:	8d 34 dd 00 00 00 00 	lea    0x0(,%ebx,8),%esi
 7bf:	eb 10                	jmp    7d1 <malloc+0x51>
 7c1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 7c8:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
 7ca:	8b 48 04             	mov    0x4(%eax),%ecx
 7cd:	39 f9                	cmp    %edi,%ecx
 7cf:	73 3f                	jae    810 <malloc+0x90>
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 7d1:	39 05 24 0b 00 00    	cmp    %eax,0xb24
 7d7:	89 c2                	mov    %eax,%edx
 7d9:	75 ed                	jne    7c8 <malloc+0x48>
  p = sbrk(nu * sizeof(Header));
 7db:	89 34 24             	mov    %esi,(%esp)
 7de:	e8 2d fc ff ff       	call   410 <sbrk>
  if(p == (char*)-1)
 7e3:	83 f8 ff             	cmp    $0xffffffff,%eax
 7e6:	74 18                	je     800 <malloc+0x80>
  hp->s.size = nu;
 7e8:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 7eb:	83 c0 08             	add    $0x8,%eax
 7ee:	89 04 24             	mov    %eax,(%esp)
 7f1:	e8 ea fe ff ff       	call   6e0 <free>
  return freep;
 7f6:	8b 15 24 0b 00 00    	mov    0xb24,%edx
      if((p = morecore(nunits)) == 0)
 7fc:	85 d2                	test   %edx,%edx
 7fe:	75 c8                	jne    7c8 <malloc+0x48>
        return 0;
  }
}
 800:	83 c4 1c             	add    $0x1c,%esp
        return 0;
 803:	31 c0                	xor    %eax,%eax
}
 805:	5b                   	pop    %ebx
 806:	5e                   	pop    %esi
 807:	5f                   	pop    %edi
 808:	5d                   	pop    %ebp
 809:	c3                   	ret    
 80a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      if(p->s.size == nunits)
 810:	39 cf                	cmp    %ecx,%edi
 812:	74 4c                	je     860 <malloc+0xe0>
        p->s.size -= nunits;
 814:	29 f9                	sub    %edi,%ecx
 816:	89 48 04             	mov    %ecx,0x4(%eax)
        p += p->s.size;
 819:	8d 04 c8             	lea    (%eax,%ecx,8),%eax
        p->s.size = nunits;
 81c:	89 78 04             	mov    %edi,0x4(%eax)
      freep = prevp;
 81f:	89 15 24 0b 00 00    	mov    %edx,0xb24
}
 825:	83 c4 1c             	add    $0x1c,%esp
      return (void*)(p + 1);
 828:	83 c0 08             	add    $0x8,%eax
}
 82b:	5b                   	pop    %ebx
 82c:	5e                   	pop    %esi
 82d:	5f                   	pop    %edi
 82e:	5d                   	pop    %ebp
 82f:	c3                   	ret    
    base.s.ptr = freep = prevp = &base;
 830:	b8 28 0b 00 00       	mov    $0xb28,%eax
 835:	ba 28 0b 00 00       	mov    $0xb28,%edx
    base.s.size = 0;
 83a:	31 c9                	xor    %ecx,%ecx
    base.s.ptr = freep = prevp = &base;
 83c:	a3 24 0b 00 00       	mov    %eax,0xb24
    base.s.size = 0;
 841:	b8 28 0b 00 00       	mov    $0xb28,%eax
    base.s.ptr = freep = prevp = &base;
 846:	89 15 28 0b 00 00    	mov    %edx,0xb28
    base.s.size = 0;
 84c:	89 0d 2c 0b 00 00    	mov    %ecx,0xb2c
 852:	e9 53 ff ff ff       	jmp    7aa <malloc+0x2a>
 857:	89 f6                	mov    %esi,%esi
 859:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
        prevp->s.ptr = p->s.ptr;
 860:	8b 08                	mov    (%eax),%ecx
 862:	89 0a                	mov    %ecx,(%edx)
 864:	eb b9                	jmp    81f <malloc+0x9f>
