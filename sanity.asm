
_sanity:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
#include "fcntl.h"
// #include "defs.h"

int
main(int argc, char *argv[])
{	
   0:	55                   	push   %ebp
   1:	89 e5                	mov    %esp,%ebp
   3:	83 e4 f0             	and    $0xfffffff0,%esp
   6:	83 ec 20             	sub    $0x20,%esp
	int pid2;
	int pid3;
	int pid = fork();
   9:	e8 f2 03 00 00       	call   400 <fork>
	if(pid == 0){
   e:	85 c0                	test   %eax,%eax
	int pid = fork();
  10:	89 44 24 1c          	mov    %eax,0x1c(%esp)
	if(pid == 0){
  14:	0f 85 d4 00 00 00    	jne    ee <main+0xee>
		printf(0,"Kid 1 is going to sleep...\n");
  1a:	c7 44 24 04 e8 08 00 	movl   $0x8e8,0x4(%esp)
  21:	00 
  22:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  29:	e8 42 05 00 00       	call   570 <printf>
		sleep(100);
  2e:	c7 04 24 64 00 00 00 	movl   $0x64,(%esp)
  35:	e8 5e 04 00 00       	call   498 <sleep>
		printf(0,"Kid 1 is waking up...\n");
  3a:	c7 44 24 04 04 09 00 	movl   $0x904,0x4(%esp)
  41:	00 
  42:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  49:	e8 22 05 00 00       	call   570 <printf>

		pid2 = fork();
  4e:	e8 ad 03 00 00       	call   400 <fork>
		if(pid2 == 0){
  53:	85 c0                	test   %eax,%eax
		pid2 = fork();
  55:	89 44 24 14          	mov    %eax,0x14(%esp)
		if(pid2 == 0){
  59:	0f 85 15 01 00 00    	jne    174 <main+0x174>
			printf(0,"Kid 2 is going to sleep...\n");
  5f:	c7 44 24 04 1b 09 00 	movl   $0x91b,0x4(%esp)
  66:	00 
  67:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  6e:	e8 fd 04 00 00       	call   570 <printf>
			sleep(120);
  73:	c7 04 24 78 00 00 00 	movl   $0x78,(%esp)
  7a:	e8 19 04 00 00       	call   498 <sleep>
			printf(0,"Kid 2 is waking up...\n");
  7f:	c7 44 24 04 37 09 00 	movl   $0x937,0x4(%esp)
  86:	00 
  87:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  8e:	e8 dd 04 00 00       	call   570 <printf>

			printf(0,"Kid 2 is forking...\n");			
  93:	c7 44 24 04 4e 09 00 	movl   $0x94e,0x4(%esp)
  9a:	00 
  9b:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  a2:	e8 c9 04 00 00       	call   570 <printf>
			pid3 = fork();
  a7:	e8 54 03 00 00       	call   400 <fork>
			if(pid3 == 0)
  ac:	85 c0                	test   %eax,%eax
			pid3 = fork();
  ae:	89 44 24 18          	mov    %eax,0x18(%esp)
			if(pid3 == 0)
  b2:	0f 85 01 01 00 00    	jne    1b9 <main+0x1b9>
			{
				printf(0,"Kid 3 is going to sleep...\n");
  b8:	c7 44 24 04 63 09 00 	movl   $0x963,0x4(%esp)
  bf:	00 
  c0:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  c7:	e8 a4 04 00 00       	call   570 <printf>
				sleep(80);
  cc:	c7 04 24 50 00 00 00 	movl   $0x50,(%esp)
  d3:	e8 c0 03 00 00       	call   498 <sleep>
				printf(0,"Kid 3 is waking up...\n");
  d8:	c7 44 24 04 7f 09 00 	movl   $0x97f,0x4(%esp)
  df:	00 
  e0:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  e7:	e8 84 04 00 00       	call   570 <printf>
  ec:	eb 40                	jmp    12e <main+0x12e>
			sleep(350);
			printf(0,"Dad 2 is waking up...\n");
		}
	}
	else{
		wait(&pid);
  ee:	8d 44 24 1c          	lea    0x1c(%esp),%eax
  f2:	89 04 24             	mov    %eax,(%esp)
  f5:	e8 16 03 00 00       	call   410 <wait>
		printf(0,"Dad 1 is going to sleep...\n");
  fa:	c7 44 24 04 de 09 00 	movl   $0x9de,0x4(%esp)
 101:	00 
 102:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 109:	e8 62 04 00 00       	call   570 <printf>
		sleep(223);
 10e:	c7 04 24 df 00 00 00 	movl   $0xdf,(%esp)
 115:	e8 7e 03 00 00       	call   498 <sleep>
		printf(0,"Dad 1 is waking up...\n");
 11a:	c7 44 24 04 fa 09 00 	movl   $0x9fa,0x4(%esp)
 121:	00 
 122:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 129:	e8 42 04 00 00       	call   570 <printf>
	}

	printf(0,"pid1 is - %d is exiting now...\n", pid);
 12e:	8b 44 24 1c          	mov    0x1c(%esp),%eax
 132:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 139:	89 44 24 08          	mov    %eax,0x8(%esp)
 13d:	b8 14 0a 00 00       	mov    $0xa14,%eax
 142:	89 44 24 04          	mov    %eax,0x4(%esp)
 146:	e8 25 04 00 00       	call   570 <printf>
	printf(0,"pid2 is - %d is exiting now...\n", pid2);
 14b:	8b 44 24 14          	mov    0x14(%esp),%eax
 14f:	ba 34 0a 00 00       	mov    $0xa34,%edx
 154:	89 54 24 04          	mov    %edx,0x4(%esp)
 158:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 15f:	89 44 24 08          	mov    %eax,0x8(%esp)
 163:	e8 08 04 00 00       	call   570 <printf>
	exit(0);
 168:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 16f:	e8 94 02 00 00       	call   408 <exit>
			wait(&pid2);
 174:	8d 44 24 14          	lea    0x14(%esp),%eax
 178:	89 04 24             	mov    %eax,(%esp)
 17b:	e8 90 02 00 00       	call   410 <wait>
			printf(0,"Dad 2 is going to sleep...\n");
 180:	c7 44 24 04 ab 09 00 	movl   $0x9ab,0x4(%esp)
 187:	00 
 188:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 18f:	e8 dc 03 00 00       	call   570 <printf>
			sleep(350);
 194:	c7 04 24 5e 01 00 00 	movl   $0x15e,(%esp)
 19b:	e8 f8 02 00 00       	call   498 <sleep>
			printf(0,"Dad 2 is waking up...\n");
 1a0:	c7 44 24 04 c7 09 00 	movl   $0x9c7,0x4(%esp)
 1a7:	00 
 1a8:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 1af:	e8 bc 03 00 00       	call   570 <printf>
 1b4:	e9 75 ff ff ff       	jmp    12e <main+0x12e>
				wait(&pid3);
 1b9:	8d 44 24 18          	lea    0x18(%esp),%eax
 1bd:	89 04 24             	mov    %eax,(%esp)
 1c0:	e8 4b 02 00 00       	call   410 <wait>
				printf(0,"Kid 2 is exiting...\n");
 1c5:	c7 44 24 04 96 09 00 	movl   $0x996,0x4(%esp)
 1cc:	00 
 1cd:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 1d4:	e8 97 03 00 00       	call   570 <printf>
 1d9:	e9 50 ff ff ff       	jmp    12e <main+0x12e>
 1de:	66 90                	xchg   %ax,%ax

000001e0 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, const char *t)
{
 1e0:	55                   	push   %ebp
 1e1:	89 e5                	mov    %esp,%ebp
 1e3:	8b 45 08             	mov    0x8(%ebp),%eax
 1e6:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 1e9:	53                   	push   %ebx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 1ea:	89 c2                	mov    %eax,%edx
 1ec:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 1f0:	41                   	inc    %ecx
 1f1:	0f b6 59 ff          	movzbl -0x1(%ecx),%ebx
 1f5:	42                   	inc    %edx
 1f6:	84 db                	test   %bl,%bl
 1f8:	88 5a ff             	mov    %bl,-0x1(%edx)
 1fb:	75 f3                	jne    1f0 <strcpy+0x10>
    ;
  return os;
}
 1fd:	5b                   	pop    %ebx
 1fe:	5d                   	pop    %ebp
 1ff:	c3                   	ret    

00000200 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 200:	55                   	push   %ebp
 201:	89 e5                	mov    %esp,%ebp
 203:	8b 4d 08             	mov    0x8(%ebp),%ecx
 206:	53                   	push   %ebx
 207:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  while(*p && *p == *q)
 20a:	0f b6 01             	movzbl (%ecx),%eax
 20d:	0f b6 13             	movzbl (%ebx),%edx
 210:	84 c0                	test   %al,%al
 212:	75 18                	jne    22c <strcmp+0x2c>
 214:	eb 22                	jmp    238 <strcmp+0x38>
 216:	8d 76 00             	lea    0x0(%esi),%esi
 219:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    p++, q++;
 220:	41                   	inc    %ecx
  while(*p && *p == *q)
 221:	0f b6 01             	movzbl (%ecx),%eax
    p++, q++;
 224:	43                   	inc    %ebx
 225:	0f b6 13             	movzbl (%ebx),%edx
  while(*p && *p == *q)
 228:	84 c0                	test   %al,%al
 22a:	74 0c                	je     238 <strcmp+0x38>
 22c:	38 d0                	cmp    %dl,%al
 22e:	74 f0                	je     220 <strcmp+0x20>
  return (uchar)*p - (uchar)*q;
}
 230:	5b                   	pop    %ebx
  return (uchar)*p - (uchar)*q;
 231:	29 d0                	sub    %edx,%eax
}
 233:	5d                   	pop    %ebp
 234:	c3                   	ret    
 235:	8d 76 00             	lea    0x0(%esi),%esi
 238:	5b                   	pop    %ebx
 239:	31 c0                	xor    %eax,%eax
  return (uchar)*p - (uchar)*q;
 23b:	29 d0                	sub    %edx,%eax
}
 23d:	5d                   	pop    %ebp
 23e:	c3                   	ret    
 23f:	90                   	nop

00000240 <strlen>:

uint
strlen(const char *s)
{
 240:	55                   	push   %ebp
 241:	89 e5                	mov    %esp,%ebp
 243:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
 246:	80 39 00             	cmpb   $0x0,(%ecx)
 249:	74 15                	je     260 <strlen+0x20>
 24b:	31 d2                	xor    %edx,%edx
 24d:	8d 76 00             	lea    0x0(%esi),%esi
 250:	42                   	inc    %edx
 251:	80 3c 11 00          	cmpb   $0x0,(%ecx,%edx,1)
 255:	89 d0                	mov    %edx,%eax
 257:	75 f7                	jne    250 <strlen+0x10>
    ;
  return n;
}
 259:	5d                   	pop    %ebp
 25a:	c3                   	ret    
 25b:	90                   	nop
 25c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  for(n = 0; s[n]; n++)
 260:	31 c0                	xor    %eax,%eax
}
 262:	5d                   	pop    %ebp
 263:	c3                   	ret    
 264:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 26a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

00000270 <memset>:

void*
memset(void *dst, int c, uint n)
{
 270:	55                   	push   %ebp
 271:	89 e5                	mov    %esp,%ebp
 273:	8b 55 08             	mov    0x8(%ebp),%edx
 276:	57                   	push   %edi
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
 282:	5f                   	pop    %edi
 283:	89 d0                	mov    %edx,%eax
 285:	5d                   	pop    %ebp
 286:	c3                   	ret    
 287:	89 f6                	mov    %esi,%esi
 289:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

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
 29f:	74 1b                	je     2bc <strchr+0x2c>
    if(*s == c)
 2a1:	38 d1                	cmp    %dl,%cl
 2a3:	75 0f                	jne    2b4 <strchr+0x24>
 2a5:	eb 17                	jmp    2be <strchr+0x2e>
 2a7:	89 f6                	mov    %esi,%esi
 2a9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
 2b0:	38 ca                	cmp    %cl,%dl
 2b2:	74 0a                	je     2be <strchr+0x2e>
  for(; *s; s++)
 2b4:	40                   	inc    %eax
 2b5:	0f b6 10             	movzbl (%eax),%edx
 2b8:	84 d2                	test   %dl,%dl
 2ba:	75 f4                	jne    2b0 <strchr+0x20>
      return (char*)s;
  return 0;
 2bc:	31 c0                	xor    %eax,%eax
}
 2be:	5d                   	pop    %ebp
 2bf:	c3                   	ret    

000002c0 <gets>:

char*
gets(char *buf, int max)
{
 2c0:	55                   	push   %ebp
 2c1:	89 e5                	mov    %esp,%ebp
 2c3:	57                   	push   %edi
 2c4:	56                   	push   %esi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 2c5:	31 f6                	xor    %esi,%esi
{
 2c7:	53                   	push   %ebx
 2c8:	83 ec 3c             	sub    $0x3c,%esp
 2cb:	8b 5d 08             	mov    0x8(%ebp),%ebx
    cc = read(0, &c, 1);
 2ce:	8d 7d e7             	lea    -0x19(%ebp),%edi
  for(i=0; i+1 < max; ){
 2d1:	eb 32                	jmp    305 <gets+0x45>
 2d3:	90                   	nop
 2d4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    cc = read(0, &c, 1);
 2d8:	ba 01 00 00 00       	mov    $0x1,%edx
 2dd:	89 54 24 08          	mov    %edx,0x8(%esp)
 2e1:	89 7c 24 04          	mov    %edi,0x4(%esp)
 2e5:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 2ec:	e8 2f 01 00 00       	call   420 <read>
    if(cc < 1)
 2f1:	85 c0                	test   %eax,%eax
 2f3:	7e 19                	jle    30e <gets+0x4e>
      break;
    buf[i++] = c;
 2f5:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 2f9:	43                   	inc    %ebx
 2fa:	88 43 ff             	mov    %al,-0x1(%ebx)
    if(c == '\n' || c == '\r')
 2fd:	3c 0a                	cmp    $0xa,%al
 2ff:	74 1f                	je     320 <gets+0x60>
 301:	3c 0d                	cmp    $0xd,%al
 303:	74 1b                	je     320 <gets+0x60>
  for(i=0; i+1 < max; ){
 305:	46                   	inc    %esi
 306:	3b 75 0c             	cmp    0xc(%ebp),%esi
 309:	89 5d d4             	mov    %ebx,-0x2c(%ebp)
 30c:	7c ca                	jl     2d8 <gets+0x18>
      break;
  }
  buf[i] = '\0';
 30e:	8b 45 d4             	mov    -0x2c(%ebp),%eax
 311:	c6 00 00             	movb   $0x0,(%eax)
  return buf;
}
 314:	8b 45 08             	mov    0x8(%ebp),%eax
 317:	83 c4 3c             	add    $0x3c,%esp
 31a:	5b                   	pop    %ebx
 31b:	5e                   	pop    %esi
 31c:	5f                   	pop    %edi
 31d:	5d                   	pop    %ebp
 31e:	c3                   	ret    
 31f:	90                   	nop
 320:	8b 45 08             	mov    0x8(%ebp),%eax
 323:	01 c6                	add    %eax,%esi
 325:	89 75 d4             	mov    %esi,-0x2c(%ebp)
 328:	eb e4                	jmp    30e <gets+0x4e>
 32a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00000330 <stat>:

int
stat(const char *n, struct stat *st)
{
 330:	55                   	push   %ebp
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 331:	31 c0                	xor    %eax,%eax
{
 333:	89 e5                	mov    %esp,%ebp
 335:	83 ec 18             	sub    $0x18,%esp
  fd = open(n, O_RDONLY);
 338:	89 44 24 04          	mov    %eax,0x4(%esp)
 33c:	8b 45 08             	mov    0x8(%ebp),%eax
{
 33f:	89 5d f8             	mov    %ebx,-0x8(%ebp)
 342:	89 75 fc             	mov    %esi,-0x4(%ebp)
  fd = open(n, O_RDONLY);
 345:	89 04 24             	mov    %eax,(%esp)
 348:	e8 fb 00 00 00       	call   448 <open>
  if(fd < 0)
 34d:	85 c0                	test   %eax,%eax
 34f:	78 2f                	js     380 <stat+0x50>
 351:	89 c3                	mov    %eax,%ebx
    return -1;
  r = fstat(fd, st);
 353:	8b 45 0c             	mov    0xc(%ebp),%eax
 356:	89 1c 24             	mov    %ebx,(%esp)
 359:	89 44 24 04          	mov    %eax,0x4(%esp)
 35d:	e8 fe 00 00 00       	call   460 <fstat>
  close(fd);
 362:	89 1c 24             	mov    %ebx,(%esp)
  r = fstat(fd, st);
 365:	89 c6                	mov    %eax,%esi
  close(fd);
 367:	e8 c4 00 00 00       	call   430 <close>
  return r;
}
 36c:	89 f0                	mov    %esi,%eax
 36e:	8b 5d f8             	mov    -0x8(%ebp),%ebx
 371:	8b 75 fc             	mov    -0x4(%ebp),%esi
 374:	89 ec                	mov    %ebp,%esp
 376:	5d                   	pop    %ebp
 377:	c3                   	ret    
 378:	90                   	nop
 379:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    return -1;
 380:	be ff ff ff ff       	mov    $0xffffffff,%esi
 385:	eb e5                	jmp    36c <stat+0x3c>
 387:	89 f6                	mov    %esi,%esi
 389:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000390 <atoi>:

int
atoi(const char *s)
{
 390:	55                   	push   %ebp
 391:	89 e5                	mov    %esp,%ebp
 393:	8b 4d 08             	mov    0x8(%ebp),%ecx
 396:	53                   	push   %ebx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 397:	0f be 11             	movsbl (%ecx),%edx
 39a:	88 d0                	mov    %dl,%al
 39c:	2c 30                	sub    $0x30,%al
 39e:	3c 09                	cmp    $0x9,%al
  n = 0;
 3a0:	b8 00 00 00 00       	mov    $0x0,%eax
  while('0' <= *s && *s <= '9')
 3a5:	77 1e                	ja     3c5 <atoi+0x35>
 3a7:	89 f6                	mov    %esi,%esi
 3a9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    n = n*10 + *s++ - '0';
 3b0:	41                   	inc    %ecx
 3b1:	8d 04 80             	lea    (%eax,%eax,4),%eax
 3b4:	8d 44 42 d0          	lea    -0x30(%edx,%eax,2),%eax
  while('0' <= *s && *s <= '9')
 3b8:	0f be 11             	movsbl (%ecx),%edx
 3bb:	88 d3                	mov    %dl,%bl
 3bd:	80 eb 30             	sub    $0x30,%bl
 3c0:	80 fb 09             	cmp    $0x9,%bl
 3c3:	76 eb                	jbe    3b0 <atoi+0x20>
  return n;
}
 3c5:	5b                   	pop    %ebx
 3c6:	5d                   	pop    %ebp
 3c7:	c3                   	ret    
 3c8:	90                   	nop
 3c9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

000003d0 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 3d0:	55                   	push   %ebp
 3d1:	89 e5                	mov    %esp,%ebp
 3d3:	56                   	push   %esi
 3d4:	8b 45 08             	mov    0x8(%ebp),%eax
 3d7:	53                   	push   %ebx
 3d8:	8b 5d 10             	mov    0x10(%ebp),%ebx
 3db:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 3de:	85 db                	test   %ebx,%ebx
 3e0:	7e 1a                	jle    3fc <memmove+0x2c>
 3e2:	31 d2                	xor    %edx,%edx
 3e4:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 3ea:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi
    *dst++ = *src++;
 3f0:	0f b6 0c 16          	movzbl (%esi,%edx,1),%ecx
 3f4:	88 0c 10             	mov    %cl,(%eax,%edx,1)
 3f7:	42                   	inc    %edx
  while(n-- > 0)
 3f8:	39 d3                	cmp    %edx,%ebx
 3fa:	75 f4                	jne    3f0 <memmove+0x20>
  return vdst;
}
 3fc:	5b                   	pop    %ebx
 3fd:	5e                   	pop    %esi
 3fe:	5d                   	pop    %ebp
 3ff:	c3                   	ret    

00000400 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 400:	b8 01 00 00 00       	mov    $0x1,%eax
 405:	cd 40                	int    $0x40
 407:	c3                   	ret    

00000408 <exit>:
SYSCALL(exit)
 408:	b8 02 00 00 00       	mov    $0x2,%eax
 40d:	cd 40                	int    $0x40
 40f:	c3                   	ret    

00000410 <wait>:
SYSCALL(wait)
 410:	b8 03 00 00 00       	mov    $0x3,%eax
 415:	cd 40                	int    $0x40
 417:	c3                   	ret    

00000418 <pipe>:
SYSCALL(pipe)
 418:	b8 04 00 00 00       	mov    $0x4,%eax
 41d:	cd 40                	int    $0x40
 41f:	c3                   	ret    

00000420 <read>:
SYSCALL(read)
 420:	b8 05 00 00 00       	mov    $0x5,%eax
 425:	cd 40                	int    $0x40
 427:	c3                   	ret    

00000428 <write>:
SYSCALL(write)
 428:	b8 10 00 00 00       	mov    $0x10,%eax
 42d:	cd 40                	int    $0x40
 42f:	c3                   	ret    

00000430 <close>:
SYSCALL(close)
 430:	b8 15 00 00 00       	mov    $0x15,%eax
 435:	cd 40                	int    $0x40
 437:	c3                   	ret    

00000438 <kill>:
SYSCALL(kill)
 438:	b8 06 00 00 00       	mov    $0x6,%eax
 43d:	cd 40                	int    $0x40
 43f:	c3                   	ret    

00000440 <exec>:
SYSCALL(exec)
 440:	b8 07 00 00 00       	mov    $0x7,%eax
 445:	cd 40                	int    $0x40
 447:	c3                   	ret    

00000448 <open>:
SYSCALL(open)
 448:	b8 0f 00 00 00       	mov    $0xf,%eax
 44d:	cd 40                	int    $0x40
 44f:	c3                   	ret    

00000450 <mknod>:
SYSCALL(mknod)
 450:	b8 11 00 00 00       	mov    $0x11,%eax
 455:	cd 40                	int    $0x40
 457:	c3                   	ret    

00000458 <unlink>:
SYSCALL(unlink)
 458:	b8 12 00 00 00       	mov    $0x12,%eax
 45d:	cd 40                	int    $0x40
 45f:	c3                   	ret    

00000460 <fstat>:
SYSCALL(fstat)
 460:	b8 08 00 00 00       	mov    $0x8,%eax
 465:	cd 40                	int    $0x40
 467:	c3                   	ret    

00000468 <link>:
SYSCALL(link)
 468:	b8 13 00 00 00       	mov    $0x13,%eax
 46d:	cd 40                	int    $0x40
 46f:	c3                   	ret    

00000470 <mkdir>:
SYSCALL(mkdir)
 470:	b8 14 00 00 00       	mov    $0x14,%eax
 475:	cd 40                	int    $0x40
 477:	c3                   	ret    

00000478 <chdir>:
SYSCALL(chdir)
 478:	b8 09 00 00 00       	mov    $0x9,%eax
 47d:	cd 40                	int    $0x40
 47f:	c3                   	ret    

00000480 <dup>:
SYSCALL(dup)
 480:	b8 0a 00 00 00       	mov    $0xa,%eax
 485:	cd 40                	int    $0x40
 487:	c3                   	ret    

00000488 <getpid>:
SYSCALL(getpid)
 488:	b8 0b 00 00 00       	mov    $0xb,%eax
 48d:	cd 40                	int    $0x40
 48f:	c3                   	ret    

00000490 <sbrk>:
SYSCALL(sbrk)
 490:	b8 0c 00 00 00       	mov    $0xc,%eax
 495:	cd 40                	int    $0x40
 497:	c3                   	ret    

00000498 <sleep>:
SYSCALL(sleep)
 498:	b8 0d 00 00 00       	mov    $0xd,%eax
 49d:	cd 40                	int    $0x40
 49f:	c3                   	ret    

000004a0 <uptime>:
SYSCALL(uptime)
 4a0:	b8 0e 00 00 00       	mov    $0xe,%eax
 4a5:	cd 40                	int    $0x40
 4a7:	c3                   	ret    

000004a8 <detach>:
SYSCALL(detach)
 4a8:	b8 16 00 00 00       	mov    $0x16,%eax
 4ad:	cd 40                	int    $0x40
 4af:	c3                   	ret    

000004b0 <policy>:
SYSCALL(policy)
 4b0:	b8 17 00 00 00       	mov    $0x17,%eax
 4b5:	cd 40                	int    $0x40
 4b7:	c3                   	ret    

000004b8 <priority>:
SYSCALL(priority)
 4b8:	b8 18 00 00 00       	mov    $0x18,%eax
 4bd:	cd 40                	int    $0x40
 4bf:	c3                   	ret    

000004c0 <wait_stat>:
SYSCALL(wait_stat)
 4c0:	b8 19 00 00 00       	mov    $0x19,%eax
 4c5:	cd 40                	int    $0x40
 4c7:	c3                   	ret    
 4c8:	66 90                	xchg   %ax,%ax
 4ca:	66 90                	xchg   %ax,%ax
 4cc:	66 90                	xchg   %ax,%ax
 4ce:	66 90                	xchg   %ax,%ax

000004d0 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
 4d0:	55                   	push   %ebp
 4d1:	89 e5                	mov    %esp,%ebp
 4d3:	57                   	push   %edi
 4d4:	56                   	push   %esi
 4d5:	53                   	push   %ebx
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 4d6:	89 d3                	mov    %edx,%ebx
 4d8:	c1 eb 1f             	shr    $0x1f,%ebx
{
 4db:	83 ec 4c             	sub    $0x4c,%esp
  if(sgn && xx < 0){
 4de:	84 db                	test   %bl,%bl
{
 4e0:	89 45 c0             	mov    %eax,-0x40(%ebp)
 4e3:	89 d0                	mov    %edx,%eax
  if(sgn && xx < 0){
 4e5:	74 79                	je     560 <printint+0x90>
 4e7:	f6 45 08 01          	testb  $0x1,0x8(%ebp)
 4eb:	74 73                	je     560 <printint+0x90>
    neg = 1;
    x = -xx;
 4ed:	f7 d8                	neg    %eax
    neg = 1;
 4ef:	c7 45 c4 01 00 00 00 	movl   $0x1,-0x3c(%ebp)
  } else {
    x = xx;
  }

  i = 0;
 4f6:	31 f6                	xor    %esi,%esi
 4f8:	8d 5d d7             	lea    -0x29(%ebp),%ebx
 4fb:	eb 05                	jmp    502 <printint+0x32>
 4fd:	8d 76 00             	lea    0x0(%esi),%esi
  do{
    buf[i++] = digits[x % base];
 500:	89 fe                	mov    %edi,%esi
 502:	31 d2                	xor    %edx,%edx
 504:	f7 f1                	div    %ecx
 506:	8d 7e 01             	lea    0x1(%esi),%edi
 509:	0f b6 92 5c 0a 00 00 	movzbl 0xa5c(%edx),%edx
  }while((x /= base) != 0);
 510:	85 c0                	test   %eax,%eax
    buf[i++] = digits[x % base];
 512:	88 14 3b             	mov    %dl,(%ebx,%edi,1)
  }while((x /= base) != 0);
 515:	75 e9                	jne    500 <printint+0x30>
  if(neg)
 517:	8b 55 c4             	mov    -0x3c(%ebp),%edx
 51a:	85 d2                	test   %edx,%edx
 51c:	74 08                	je     526 <printint+0x56>
    buf[i++] = '-';
 51e:	c6 44 3d d8 2d       	movb   $0x2d,-0x28(%ebp,%edi,1)
 523:	8d 7e 02             	lea    0x2(%esi),%edi
 526:	8d 74 3d d7          	lea    -0x29(%ebp,%edi,1),%esi
 52a:	8b 7d c0             	mov    -0x40(%ebp),%edi
 52d:	8d 76 00             	lea    0x0(%esi),%esi
 530:	0f b6 06             	movzbl (%esi),%eax
 533:	4e                   	dec    %esi
  write(fd, &c, 1);
 534:	89 5c 24 04          	mov    %ebx,0x4(%esp)
 538:	89 3c 24             	mov    %edi,(%esp)
 53b:	88 45 d7             	mov    %al,-0x29(%ebp)
 53e:	b8 01 00 00 00       	mov    $0x1,%eax
 543:	89 44 24 08          	mov    %eax,0x8(%esp)
 547:	e8 dc fe ff ff       	call   428 <write>

  while(--i >= 0)
 54c:	39 de                	cmp    %ebx,%esi
 54e:	75 e0                	jne    530 <printint+0x60>
    putc(fd, buf[i]);
}
 550:	83 c4 4c             	add    $0x4c,%esp
 553:	5b                   	pop    %ebx
 554:	5e                   	pop    %esi
 555:	5f                   	pop    %edi
 556:	5d                   	pop    %ebp
 557:	c3                   	ret    
 558:	90                   	nop
 559:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
 560:	c7 45 c4 00 00 00 00 	movl   $0x0,-0x3c(%ebp)
 567:	eb 8d                	jmp    4f6 <printint+0x26>
 569:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000570 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 570:	55                   	push   %ebp
 571:	89 e5                	mov    %esp,%ebp
 573:	57                   	push   %edi
 574:	56                   	push   %esi
 575:	53                   	push   %ebx
 576:	83 ec 3c             	sub    $0x3c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 579:	8b 75 0c             	mov    0xc(%ebp),%esi
 57c:	0f b6 1e             	movzbl (%esi),%ebx
 57f:	84 db                	test   %bl,%bl
 581:	0f 84 d1 00 00 00    	je     658 <printf+0xe8>
  state = 0;
 587:	31 ff                	xor    %edi,%edi
 589:	46                   	inc    %esi
  ap = (uint*)(void*)&fmt + 1;
 58a:	8d 45 10             	lea    0x10(%ebp),%eax
  write(fd, &c, 1);
 58d:	89 fa                	mov    %edi,%edx
 58f:	8b 7d 08             	mov    0x8(%ebp),%edi
  ap = (uint*)(void*)&fmt + 1;
 592:	89 45 d0             	mov    %eax,-0x30(%ebp)
 595:	eb 41                	jmp    5d8 <printf+0x68>
 597:	89 f6                	mov    %esi,%esi
 599:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
 5a0:	83 f8 25             	cmp    $0x25,%eax
 5a3:	89 55 d4             	mov    %edx,-0x2c(%ebp)
        state = '%';
 5a6:	ba 25 00 00 00       	mov    $0x25,%edx
      if(c == '%'){
 5ab:	74 1e                	je     5cb <printf+0x5b>
  write(fd, &c, 1);
 5ad:	b8 01 00 00 00       	mov    $0x1,%eax
 5b2:	89 44 24 08          	mov    %eax,0x8(%esp)
 5b6:	8d 45 e2             	lea    -0x1e(%ebp),%eax
 5b9:	89 44 24 04          	mov    %eax,0x4(%esp)
 5bd:	89 3c 24             	mov    %edi,(%esp)
 5c0:	88 5d e2             	mov    %bl,-0x1e(%ebp)
 5c3:	e8 60 fe ff ff       	call   428 <write>
 5c8:	8b 55 d4             	mov    -0x2c(%ebp),%edx
 5cb:	46                   	inc    %esi
  for(i = 0; fmt[i]; i++){
 5cc:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
 5d0:	84 db                	test   %bl,%bl
 5d2:	0f 84 80 00 00 00    	je     658 <printf+0xe8>
    if(state == 0){
 5d8:	85 d2                	test   %edx,%edx
    c = fmt[i] & 0xff;
 5da:	0f be cb             	movsbl %bl,%ecx
 5dd:	0f b6 c3             	movzbl %bl,%eax
    if(state == 0){
 5e0:	74 be                	je     5a0 <printf+0x30>
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
 5e2:	83 fa 25             	cmp    $0x25,%edx
 5e5:	75 e4                	jne    5cb <printf+0x5b>
      if(c == 'd'){
 5e7:	83 f8 64             	cmp    $0x64,%eax
 5ea:	0f 84 f0 00 00 00    	je     6e0 <printf+0x170>
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
 5f0:	81 e1 f7 00 00 00    	and    $0xf7,%ecx
 5f6:	83 f9 70             	cmp    $0x70,%ecx
 5f9:	74 65                	je     660 <printf+0xf0>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
 5fb:	83 f8 73             	cmp    $0x73,%eax
 5fe:	0f 84 8c 00 00 00    	je     690 <printf+0x120>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 604:	83 f8 63             	cmp    $0x63,%eax
 607:	0f 84 13 01 00 00    	je     720 <printf+0x1b0>
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
 60d:	83 f8 25             	cmp    $0x25,%eax
 610:	0f 84 e2 00 00 00    	je     6f8 <printf+0x188>
  write(fd, &c, 1);
 616:	b8 01 00 00 00       	mov    $0x1,%eax
 61b:	46                   	inc    %esi
 61c:	89 44 24 08          	mov    %eax,0x8(%esp)
 620:	8d 45 e7             	lea    -0x19(%ebp),%eax
 623:	89 44 24 04          	mov    %eax,0x4(%esp)
 627:	89 3c 24             	mov    %edi,(%esp)
 62a:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
 62e:	e8 f5 fd ff ff       	call   428 <write>
 633:	ba 01 00 00 00       	mov    $0x1,%edx
 638:	8d 45 e6             	lea    -0x1a(%ebp),%eax
 63b:	89 54 24 08          	mov    %edx,0x8(%esp)
 63f:	89 44 24 04          	mov    %eax,0x4(%esp)
 643:	89 3c 24             	mov    %edi,(%esp)
 646:	88 5d e6             	mov    %bl,-0x1a(%ebp)
 649:	e8 da fd ff ff       	call   428 <write>
  for(i = 0; fmt[i]; i++){
 64e:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 652:	31 d2                	xor    %edx,%edx
  for(i = 0; fmt[i]; i++){
 654:	84 db                	test   %bl,%bl
 656:	75 80                	jne    5d8 <printf+0x68>
    }
  }
}
 658:	83 c4 3c             	add    $0x3c,%esp
 65b:	5b                   	pop    %ebx
 65c:	5e                   	pop    %esi
 65d:	5f                   	pop    %edi
 65e:	5d                   	pop    %ebp
 65f:	c3                   	ret    
        printint(fd, *ap, 16, 0);
 660:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 667:	b9 10 00 00 00       	mov    $0x10,%ecx
 66c:	8b 5d d0             	mov    -0x30(%ebp),%ebx
 66f:	89 f8                	mov    %edi,%eax
 671:	8b 13                	mov    (%ebx),%edx
 673:	e8 58 fe ff ff       	call   4d0 <printint>
        ap++;
 678:	89 d8                	mov    %ebx,%eax
      state = 0;
 67a:	31 d2                	xor    %edx,%edx
        ap++;
 67c:	83 c0 04             	add    $0x4,%eax
 67f:	89 45 d0             	mov    %eax,-0x30(%ebp)
 682:	e9 44 ff ff ff       	jmp    5cb <printf+0x5b>
 687:	89 f6                	mov    %esi,%esi
 689:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
        s = (char*)*ap;
 690:	8b 45 d0             	mov    -0x30(%ebp),%eax
 693:	8b 10                	mov    (%eax),%edx
        ap++;
 695:	83 c0 04             	add    $0x4,%eax
 698:	89 45 d0             	mov    %eax,-0x30(%ebp)
        if(s == 0)
 69b:	85 d2                	test   %edx,%edx
 69d:	0f 84 aa 00 00 00    	je     74d <printf+0x1dd>
        while(*s != 0){
 6a3:	0f b6 02             	movzbl (%edx),%eax
        s = (char*)*ap;
 6a6:	89 d3                	mov    %edx,%ebx
        while(*s != 0){
 6a8:	84 c0                	test   %al,%al
 6aa:	74 27                	je     6d3 <printf+0x163>
 6ac:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 6b0:	88 45 e3             	mov    %al,-0x1d(%ebp)
  write(fd, &c, 1);
 6b3:	b8 01 00 00 00       	mov    $0x1,%eax
          s++;
 6b8:	43                   	inc    %ebx
  write(fd, &c, 1);
 6b9:	89 44 24 08          	mov    %eax,0x8(%esp)
 6bd:	8d 45 e3             	lea    -0x1d(%ebp),%eax
 6c0:	89 44 24 04          	mov    %eax,0x4(%esp)
 6c4:	89 3c 24             	mov    %edi,(%esp)
 6c7:	e8 5c fd ff ff       	call   428 <write>
        while(*s != 0){
 6cc:	0f b6 03             	movzbl (%ebx),%eax
 6cf:	84 c0                	test   %al,%al
 6d1:	75 dd                	jne    6b0 <printf+0x140>
      state = 0;
 6d3:	31 d2                	xor    %edx,%edx
 6d5:	e9 f1 fe ff ff       	jmp    5cb <printf+0x5b>
 6da:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        printint(fd, *ap, 10, 1);
 6e0:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 6e7:	b9 0a 00 00 00       	mov    $0xa,%ecx
 6ec:	e9 7b ff ff ff       	jmp    66c <printf+0xfc>
 6f1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  write(fd, &c, 1);
 6f8:	b9 01 00 00 00       	mov    $0x1,%ecx
 6fd:	8d 45 e5             	lea    -0x1b(%ebp),%eax
 700:	89 4c 24 08          	mov    %ecx,0x8(%esp)
 704:	89 44 24 04          	mov    %eax,0x4(%esp)
 708:	89 3c 24             	mov    %edi,(%esp)
 70b:	88 5d e5             	mov    %bl,-0x1b(%ebp)
 70e:	e8 15 fd ff ff       	call   428 <write>
      state = 0;
 713:	31 d2                	xor    %edx,%edx
 715:	e9 b1 fe ff ff       	jmp    5cb <printf+0x5b>
 71a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        putc(fd, *ap);
 720:	8b 5d d0             	mov    -0x30(%ebp),%ebx
 723:	8b 03                	mov    (%ebx),%eax
        ap++;
 725:	83 c3 04             	add    $0x4,%ebx
  write(fd, &c, 1);
 728:	89 3c 24             	mov    %edi,(%esp)
        putc(fd, *ap);
 72b:	88 45 e4             	mov    %al,-0x1c(%ebp)
  write(fd, &c, 1);
 72e:	b8 01 00 00 00       	mov    $0x1,%eax
 733:	89 44 24 08          	mov    %eax,0x8(%esp)
 737:	8d 45 e4             	lea    -0x1c(%ebp),%eax
 73a:	89 44 24 04          	mov    %eax,0x4(%esp)
 73e:	e8 e5 fc ff ff       	call   428 <write>
      state = 0;
 743:	31 d2                	xor    %edx,%edx
        ap++;
 745:	89 5d d0             	mov    %ebx,-0x30(%ebp)
 748:	e9 7e fe ff ff       	jmp    5cb <printf+0x5b>
          s = "(null)";
 74d:	bb 54 0a 00 00       	mov    $0xa54,%ebx
        while(*s != 0){
 752:	b0 28                	mov    $0x28,%al
 754:	e9 57 ff ff ff       	jmp    6b0 <printf+0x140>
 759:	66 90                	xchg   %ax,%ax
 75b:	66 90                	xchg   %ax,%ax
 75d:	66 90                	xchg   %ax,%ax
 75f:	90                   	nop

00000760 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 760:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 761:	a1 e8 0c 00 00       	mov    0xce8,%eax
{
 766:	89 e5                	mov    %esp,%ebp
 768:	57                   	push   %edi
 769:	56                   	push   %esi
 76a:	53                   	push   %ebx
 76b:	8b 5d 08             	mov    0x8(%ebp),%ebx
  bp = (Header*)ap - 1;
 76e:	8d 4b f8             	lea    -0x8(%ebx),%ecx
 771:	eb 0d                	jmp    780 <free+0x20>
 773:	90                   	nop
 774:	90                   	nop
 775:	90                   	nop
 776:	90                   	nop
 777:	90                   	nop
 778:	90                   	nop
 779:	90                   	nop
 77a:	90                   	nop
 77b:	90                   	nop
 77c:	90                   	nop
 77d:	90                   	nop
 77e:	90                   	nop
 77f:	90                   	nop
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 780:	39 c8                	cmp    %ecx,%eax
 782:	8b 10                	mov    (%eax),%edx
 784:	73 32                	jae    7b8 <free+0x58>
 786:	39 d1                	cmp    %edx,%ecx
 788:	72 04                	jb     78e <free+0x2e>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 78a:	39 d0                	cmp    %edx,%eax
 78c:	72 32                	jb     7c0 <free+0x60>
      break;
  if(bp + bp->s.size == p->s.ptr){
 78e:	8b 73 fc             	mov    -0x4(%ebx),%esi
 791:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 794:	39 fa                	cmp    %edi,%edx
 796:	74 30                	je     7c8 <free+0x68>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 798:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 79b:	8b 50 04             	mov    0x4(%eax),%edx
 79e:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 7a1:	39 f1                	cmp    %esi,%ecx
 7a3:	74 3c                	je     7e1 <free+0x81>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 7a5:	89 08                	mov    %ecx,(%eax)
  freep = p;
}
 7a7:	5b                   	pop    %ebx
  freep = p;
 7a8:	a3 e8 0c 00 00       	mov    %eax,0xce8
}
 7ad:	5e                   	pop    %esi
 7ae:	5f                   	pop    %edi
 7af:	5d                   	pop    %ebp
 7b0:	c3                   	ret    
 7b1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 7b8:	39 d0                	cmp    %edx,%eax
 7ba:	72 04                	jb     7c0 <free+0x60>
 7bc:	39 d1                	cmp    %edx,%ecx
 7be:	72 ce                	jb     78e <free+0x2e>
{
 7c0:	89 d0                	mov    %edx,%eax
 7c2:	eb bc                	jmp    780 <free+0x20>
 7c4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    bp->s.size += p->s.ptr->s.size;
 7c8:	8b 7a 04             	mov    0x4(%edx),%edi
 7cb:	01 fe                	add    %edi,%esi
 7cd:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 7d0:	8b 10                	mov    (%eax),%edx
 7d2:	8b 12                	mov    (%edx),%edx
 7d4:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 7d7:	8b 50 04             	mov    0x4(%eax),%edx
 7da:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 7dd:	39 f1                	cmp    %esi,%ecx
 7df:	75 c4                	jne    7a5 <free+0x45>
    p->s.size += bp->s.size;
 7e1:	8b 4b fc             	mov    -0x4(%ebx),%ecx
  freep = p;
 7e4:	a3 e8 0c 00 00       	mov    %eax,0xce8
    p->s.size += bp->s.size;
 7e9:	01 ca                	add    %ecx,%edx
 7eb:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 7ee:	8b 53 f8             	mov    -0x8(%ebx),%edx
 7f1:	89 10                	mov    %edx,(%eax)
}
 7f3:	5b                   	pop    %ebx
 7f4:	5e                   	pop    %esi
 7f5:	5f                   	pop    %edi
 7f6:	5d                   	pop    %ebp
 7f7:	c3                   	ret    
 7f8:	90                   	nop
 7f9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

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
 80c:	8b 15 e8 0c 00 00    	mov    0xce8,%edx
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 812:	8d 78 07             	lea    0x7(%eax),%edi
 815:	c1 ef 03             	shr    $0x3,%edi
 818:	47                   	inc    %edi
  if((prevp = freep) == 0){
 819:	85 d2                	test   %edx,%edx
 81b:	0f 84 8f 00 00 00    	je     8b0 <malloc+0xb0>
 821:	8b 02                	mov    (%edx),%eax
 823:	8b 48 04             	mov    0x4(%eax),%ecx
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
 826:	39 cf                	cmp    %ecx,%edi
 828:	76 66                	jbe    890 <malloc+0x90>
 82a:	81 ff 00 10 00 00    	cmp    $0x1000,%edi
 830:	bb 00 10 00 00       	mov    $0x1000,%ebx
 835:	0f 43 df             	cmovae %edi,%ebx
  p = sbrk(nu * sizeof(Header));
 838:	8d 34 dd 00 00 00 00 	lea    0x0(,%ebx,8),%esi
 83f:	eb 10                	jmp    851 <malloc+0x51>
 841:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 848:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
 84a:	8b 48 04             	mov    0x4(%eax),%ecx
 84d:	39 f9                	cmp    %edi,%ecx
 84f:	73 3f                	jae    890 <malloc+0x90>
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 851:	39 05 e8 0c 00 00    	cmp    %eax,0xce8
 857:	89 c2                	mov    %eax,%edx
 859:	75 ed                	jne    848 <malloc+0x48>
  p = sbrk(nu * sizeof(Header));
 85b:	89 34 24             	mov    %esi,(%esp)
 85e:	e8 2d fc ff ff       	call   490 <sbrk>
  if(p == (char*)-1)
 863:	83 f8 ff             	cmp    $0xffffffff,%eax
 866:	74 18                	je     880 <malloc+0x80>
  hp->s.size = nu;
 868:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 86b:	83 c0 08             	add    $0x8,%eax
 86e:	89 04 24             	mov    %eax,(%esp)
 871:	e8 ea fe ff ff       	call   760 <free>
  return freep;
 876:	8b 15 e8 0c 00 00    	mov    0xce8,%edx
      if((p = morecore(nunits)) == 0)
 87c:	85 d2                	test   %edx,%edx
 87e:	75 c8                	jne    848 <malloc+0x48>
        return 0;
  }
}
 880:	83 c4 1c             	add    $0x1c,%esp
        return 0;
 883:	31 c0                	xor    %eax,%eax
}
 885:	5b                   	pop    %ebx
 886:	5e                   	pop    %esi
 887:	5f                   	pop    %edi
 888:	5d                   	pop    %ebp
 889:	c3                   	ret    
 88a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      if(p->s.size == nunits)
 890:	39 cf                	cmp    %ecx,%edi
 892:	74 4c                	je     8e0 <malloc+0xe0>
        p->s.size -= nunits;
 894:	29 f9                	sub    %edi,%ecx
 896:	89 48 04             	mov    %ecx,0x4(%eax)
        p += p->s.size;
 899:	8d 04 c8             	lea    (%eax,%ecx,8),%eax
        p->s.size = nunits;
 89c:	89 78 04             	mov    %edi,0x4(%eax)
      freep = prevp;
 89f:	89 15 e8 0c 00 00    	mov    %edx,0xce8
}
 8a5:	83 c4 1c             	add    $0x1c,%esp
      return (void*)(p + 1);
 8a8:	83 c0 08             	add    $0x8,%eax
}
 8ab:	5b                   	pop    %ebx
 8ac:	5e                   	pop    %esi
 8ad:	5f                   	pop    %edi
 8ae:	5d                   	pop    %ebp
 8af:	c3                   	ret    
    base.s.ptr = freep = prevp = &base;
 8b0:	b8 ec 0c 00 00       	mov    $0xcec,%eax
 8b5:	ba ec 0c 00 00       	mov    $0xcec,%edx
    base.s.size = 0;
 8ba:	31 c9                	xor    %ecx,%ecx
    base.s.ptr = freep = prevp = &base;
 8bc:	a3 e8 0c 00 00       	mov    %eax,0xce8
    base.s.size = 0;
 8c1:	b8 ec 0c 00 00       	mov    $0xcec,%eax
    base.s.ptr = freep = prevp = &base;
 8c6:	89 15 ec 0c 00 00    	mov    %edx,0xcec
    base.s.size = 0;
 8cc:	89 0d f0 0c 00 00    	mov    %ecx,0xcf0
 8d2:	e9 53 ff ff ff       	jmp    82a <malloc+0x2a>
 8d7:	89 f6                	mov    %esi,%esi
 8d9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
        prevp->s.ptr = p->s.ptr;
 8e0:	8b 08                	mov    (%eax),%ecx
 8e2:	89 0a                	mov    %ecx,(%edx)
 8e4:	eb b9                	jmp    89f <malloc+0x9f>
