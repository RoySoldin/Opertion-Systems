
_sh:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
  return 0;
}

int
main(void)
{
       0:	55                   	push   %ebp
       1:	89 e5                	mov    %esp,%ebp
       3:	53                   	push   %ebx
       4:	83 e4 f0             	and    $0xfffffff0,%esp
       7:	83 ec 20             	sub    $0x20,%esp
  static char buf[100];
  int fd;

  // Ensure that three file descriptors are open.
  while((fd = open("console", O_RDWR)) >= 0){
       a:	eb 0d                	jmp    19 <main+0x19>
       c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    if(fd >= 3){
      10:	83 f8 02             	cmp    $0x2,%eax
      13:	0f 8f c0 00 00 00    	jg     d9 <main+0xd9>
  while((fd = open("console", O_RDWR)) >= 0){
      19:	b9 02 00 00 00       	mov    $0x2,%ecx
      1e:	89 4c 24 04          	mov    %ecx,0x4(%esp)
      22:	c7 04 24 0f 15 00 00 	movl   $0x150f,(%esp)
      29:	e8 9a 0f 00 00       	call   fc8 <open>
      2e:	85 c0                	test   %eax,%eax
      30:	79 de                	jns    10 <main+0x10>
      continue;
    }
    if(fork1() == 0)
      runcmd(parsecmd(buf));
    int tmp = 0;
    wait(&tmp);
      32:	8d 5c 24 1c          	lea    0x1c(%esp),%ebx
      36:	eb 2c                	jmp    64 <main+0x64>
      38:	90                   	nop
      39:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
int
fork1(void)
{
  int pid;

  pid = fork();
      40:	e8 3b 0f 00 00       	call   f80 <fork>
  if(pid == -1)
      45:	83 f8 ff             	cmp    $0xffffffff,%eax
      48:	0f 84 a4 00 00 00    	je     f2 <main+0xf2>
    if(fork1() == 0)
      4e:	85 c0                	test   %eax,%eax
      50:	0f 84 a8 00 00 00    	je     fe <main+0xfe>
    int tmp = 0;
      56:	31 d2                	xor    %edx,%edx
    wait(&tmp);
      58:	89 1c 24             	mov    %ebx,(%esp)
    int tmp = 0;
      5b:	89 54 24 1c          	mov    %edx,0x1c(%esp)
    wait(&tmp);
      5f:	e8 2c 0f 00 00       	call   f90 <wait>
  while(getcmd(buf, sizeof(buf)) >= 0){
      64:	b8 64 00 00 00       	mov    $0x64,%eax
      69:	89 44 24 04          	mov    %eax,0x4(%esp)
      6d:	c7 04 24 20 1b 00 00 	movl   $0x1b20,(%esp)
      74:	e8 a7 00 00 00       	call   120 <getcmd>
      79:	85 c0                	test   %eax,%eax
      7b:	78 69                	js     e6 <main+0xe6>
    if(buf[0] == 'c' && buf[1] == 'd' && buf[2] == ' '){
      7d:	80 3d 20 1b 00 00 63 	cmpb   $0x63,0x1b20
      84:	75 ba                	jne    40 <main+0x40>
      86:	80 3d 21 1b 00 00 64 	cmpb   $0x64,0x1b21
      8d:	75 b1                	jne    40 <main+0x40>
      8f:	80 3d 22 1b 00 00 20 	cmpb   $0x20,0x1b22
      96:	75 a8                	jne    40 <main+0x40>
      buf[strlen(buf)-1] = 0;  // chop \n
      98:	c7 04 24 20 1b 00 00 	movl   $0x1b20,(%esp)
      9f:	e8 1c 0d 00 00       	call   dc0 <strlen>
      if(chdir(buf+3) < 0)
      a4:	c7 04 24 23 1b 00 00 	movl   $0x1b23,(%esp)
      buf[strlen(buf)-1] = 0;  // chop \n
      ab:	c6 80 1f 1b 00 00 00 	movb   $0x0,0x1b1f(%eax)
      if(chdir(buf+3) < 0)
      b2:	e8 41 0f 00 00       	call   ff8 <chdir>
      b7:	85 c0                	test   %eax,%eax
      b9:	79 a9                	jns    64 <main+0x64>
        printf(2, "cannot cd %s\n", buf+3);
      bb:	c7 44 24 08 23 1b 00 	movl   $0x1b23,0x8(%esp)
      c2:	00 
      c3:	c7 44 24 04 17 15 00 	movl   $0x1517,0x4(%esp)
      ca:	00 
      cb:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
      d2:	e8 19 10 00 00       	call   10f0 <printf>
      d7:	eb 8b                	jmp    64 <main+0x64>
      close(fd);
      d9:	89 04 24             	mov    %eax,(%esp)
      dc:	e8 cf 0e 00 00       	call   fb0 <close>
      break;
      e1:	e9 4c ff ff ff       	jmp    32 <main+0x32>
  exit(0);
      e6:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
      ed:	e8 96 0e 00 00       	call   f88 <exit>
    panic("fork");
      f2:	c7 04 24 98 14 00 00 	movl   $0x1498,(%esp)
      f9:	e8 82 00 00 00       	call   180 <panic>
      runcmd(parsecmd(buf));
      fe:	c7 04 24 20 1b 00 00 	movl   $0x1b20,(%esp)
     105:	e8 d6 0b 00 00       	call   ce0 <parsecmd>
     10a:	89 04 24             	mov    %eax,(%esp)
     10d:	e8 9e 00 00 00       	call   1b0 <runcmd>
     112:	66 90                	xchg   %ax,%ax
     114:	66 90                	xchg   %ax,%ax
     116:	66 90                	xchg   %ax,%ax
     118:	66 90                	xchg   %ax,%ax
     11a:	66 90                	xchg   %ax,%ax
     11c:	66 90                	xchg   %ax,%ax
     11e:	66 90                	xchg   %ax,%ax

00000120 <getcmd>:
{
     120:	55                   	push   %ebp
  printf(2, "$ ");
     121:	b8 68 14 00 00       	mov    $0x1468,%eax
{
     126:	89 e5                	mov    %esp,%ebp
     128:	83 ec 18             	sub    $0x18,%esp
     12b:	89 5d f8             	mov    %ebx,-0x8(%ebp)
     12e:	8b 5d 08             	mov    0x8(%ebp),%ebx
     131:	89 75 fc             	mov    %esi,-0x4(%ebp)
     134:	8b 75 0c             	mov    0xc(%ebp),%esi
  printf(2, "$ ");
     137:	89 44 24 04          	mov    %eax,0x4(%esp)
     13b:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
     142:	e8 a9 0f 00 00       	call   10f0 <printf>
  memset(buf, 0, nbuf);
     147:	31 d2                	xor    %edx,%edx
     149:	89 74 24 08          	mov    %esi,0x8(%esp)
     14d:	89 54 24 04          	mov    %edx,0x4(%esp)
     151:	89 1c 24             	mov    %ebx,(%esp)
     154:	e8 97 0c 00 00       	call   df0 <memset>
  gets(buf, nbuf);
     159:	89 74 24 04          	mov    %esi,0x4(%esp)
     15d:	89 1c 24             	mov    %ebx,(%esp)
     160:	e8 db 0c 00 00       	call   e40 <gets>
  if(buf[0] == 0) // EOF
     165:	31 c0                	xor    %eax,%eax
}
     167:	8b 75 fc             	mov    -0x4(%ebp),%esi
  if(buf[0] == 0) // EOF
     16a:	80 3b 00             	cmpb   $0x0,(%ebx)
}
     16d:	8b 5d f8             	mov    -0x8(%ebp),%ebx
  if(buf[0] == 0) // EOF
     170:	0f 94 c0             	sete   %al
}
     173:	89 ec                	mov    %ebp,%esp
  if(buf[0] == 0) // EOF
     175:	f7 d8                	neg    %eax
}
     177:	5d                   	pop    %ebp
     178:	c3                   	ret    
     179:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000180 <panic>:
{
     180:	55                   	push   %ebp
     181:	89 e5                	mov    %esp,%ebp
     183:	83 ec 18             	sub    $0x18,%esp
  printf(2, "%s\n", s);
     186:	8b 45 08             	mov    0x8(%ebp),%eax
     189:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
     190:	89 44 24 08          	mov    %eax,0x8(%esp)
     194:	b8 0b 15 00 00       	mov    $0x150b,%eax
     199:	89 44 24 04          	mov    %eax,0x4(%esp)
     19d:	e8 4e 0f 00 00       	call   10f0 <printf>
  exit(0);
     1a2:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
     1a9:	e8 da 0d 00 00       	call   f88 <exit>
     1ae:	66 90                	xchg   %ax,%ax

000001b0 <runcmd>:
{
     1b0:	55                   	push   %ebp
     1b1:	89 e5                	mov    %esp,%ebp
     1b3:	57                   	push   %edi
     1b4:	56                   	push   %esi
     1b5:	53                   	push   %ebx
     1b6:	83 ec 4c             	sub    $0x4c,%esp
  if(cmd == 0)
     1b9:	8b 4d 08             	mov    0x8(%ebp),%ecx
     1bc:	85 c9                	test   %ecx,%ecx
     1be:	74 70                	je     230 <runcmd+0x80>
  switch(cmd->type){
     1c0:	8b 45 08             	mov    0x8(%ebp),%eax
     1c3:	83 38 05             	cmpl   $0x5,(%eax)
     1c6:	0f 87 80 01 00 00    	ja     34c <runcmd+0x19c>
     1cc:	8b 00                	mov    (%eax),%eax
     1ce:	ff 24 85 28 15 00 00 	jmp    *0x1528(,%eax,4)
    if(ecmd->argv[0] == 0)
     1d5:	8b 45 08             	mov    0x8(%ebp),%eax
     1d8:	8b 40 04             	mov    0x4(%eax),%eax
     1db:	85 c0                	test   %eax,%eax
     1dd:	74 51                	je     230 <runcmd+0x80>
    exec(ecmd->argv[0], ecmd->argv);
     1df:	8b 7d 08             	mov    0x8(%ebp),%edi
     1e2:	8d 77 04             	lea    0x4(%edi),%esi
     1e5:	89 75 cc             	mov    %esi,-0x34(%ebp)
     1e8:	89 74 24 04          	mov    %esi,0x4(%esp)
     1ec:	89 04 24             	mov    %eax,(%esp)
     1ef:	e8 cc 0d 00 00       	call   fc0 <exec>
    int fd = open("/path", O_RDONLY);
     1f4:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
     1fb:	00 
     1fc:	c7 04 24 72 14 00 00 	movl   $0x1472,(%esp)
     203:	e8 c0 0d 00 00       	call   fc8 <open>
    if(fd > 0)
     208:	85 c0                	test   %eax,%eax
     20a:	0f 8f 9b 01 00 00    	jg     3ab <runcmd+0x1fb>
    printf(2, "exec %s failed\n", ecmd->argv[0]);
     210:	8b 45 08             	mov    0x8(%ebp),%eax
     213:	8b 40 04             	mov    0x4(%eax),%eax
     216:	c7 44 24 04 78 14 00 	movl   $0x1478,0x4(%esp)
     21d:	00 
     21e:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
     225:	89 44 24 08          	mov    %eax,0x8(%esp)
     229:	e8 c2 0e 00 00       	call   10f0 <printf>
     22e:	66 90                	xchg   %ax,%ax
      exit(0);
     230:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
     237:	e8 4c 0d 00 00       	call   f88 <exit>
  pid = fork();
     23c:	e8 3f 0d 00 00       	call   f80 <fork>
  if(pid == -1)
     241:	83 f8 ff             	cmp    $0xffffffff,%eax
     244:	0f 84 0e 01 00 00    	je     358 <runcmd+0x1a8>
    if(fork1() == 0)
     24a:	85 c0                	test   %eax,%eax
     24c:	75 e2                	jne    230 <runcmd+0x80>
      runcmd(bcmd->cmd);
     24e:	8b 45 08             	mov    0x8(%ebp),%eax
     251:	8b 40 04             	mov    0x4(%eax),%eax
     254:	89 04 24             	mov    %eax,(%esp)
     257:	e8 54 ff ff ff       	call   1b0 <runcmd>
    if(pipe(p) < 0)
     25c:	8d 45 e0             	lea    -0x20(%ebp),%eax
     25f:	89 04 24             	mov    %eax,(%esp)
     262:	e8 31 0d 00 00       	call   f98 <pipe>
     267:	85 c0                	test   %eax,%eax
     269:	0f 88 f5 00 00 00    	js     364 <runcmd+0x1b4>
  pid = fork();
     26f:	e8 0c 0d 00 00       	call   f80 <fork>
  if(pid == -1)
     274:	83 f8 ff             	cmp    $0xffffffff,%eax
     277:	0f 84 db 00 00 00    	je     358 <runcmd+0x1a8>
    if(fork1() == 0){
     27d:	85 c0                	test   %eax,%eax
     27f:	90                   	nop
     280:	0f 84 ee 01 00 00    	je     474 <runcmd+0x2c4>
  pid = fork();
     286:	e8 f5 0c 00 00       	call   f80 <fork>
  if(pid == -1)
     28b:	83 f8 ff             	cmp    $0xffffffff,%eax
     28e:	66 90                	xchg   %ax,%ax
     290:	0f 84 c2 00 00 00    	je     358 <runcmd+0x1a8>
    if(fork1() == 0){
     296:	85 c0                	test   %eax,%eax
     298:	0f 84 d2 00 00 00    	je     370 <runcmd+0x1c0>
    close(p[0]);
     29e:	8b 45 e0             	mov    -0x20(%ebp),%eax
    wait(&tmp);
     2a1:	8d 5d dc             	lea    -0x24(%ebp),%ebx
    close(p[0]);
     2a4:	89 04 24             	mov    %eax,(%esp)
     2a7:	e8 04 0d 00 00       	call   fb0 <close>
    close(p[1]);
     2ac:	8b 45 e4             	mov    -0x1c(%ebp),%eax
     2af:	89 04 24             	mov    %eax,(%esp)
     2b2:	e8 f9 0c 00 00       	call   fb0 <close>
    wait(&tmp);
     2b7:	89 1c 24             	mov    %ebx,(%esp)
     2ba:	e8 d1 0c 00 00       	call   f90 <wait>
    wait(&tmp);
     2bf:	89 1c 24             	mov    %ebx,(%esp)
     2c2:	e8 c9 0c 00 00       	call   f90 <wait>
    break;
     2c7:	e9 64 ff ff ff       	jmp    230 <runcmd+0x80>
     2cc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  pid = fork();
     2d0:	e8 ab 0c 00 00       	call   f80 <fork>
  if(pid == -1)
     2d5:	83 f8 ff             	cmp    $0xffffffff,%eax
     2d8:	74 7e                	je     358 <runcmd+0x1a8>
    if(fork1() == 0)
     2da:	85 c0                	test   %eax,%eax
     2dc:	0f 84 6c ff ff ff    	je     24e <runcmd+0x9e>
    wait(&tmp);
     2e2:	8d 45 dc             	lea    -0x24(%ebp),%eax
     2e5:	89 04 24             	mov    %eax,(%esp)
     2e8:	e8 a3 0c 00 00       	call   f90 <wait>
    runcmd(lcmd->right);
     2ed:	8b 45 08             	mov    0x8(%ebp),%eax
     2f0:	8b 40 08             	mov    0x8(%eax),%eax
     2f3:	89 04 24             	mov    %eax,(%esp)
     2f6:	e8 b5 fe ff ff       	call   1b0 <runcmd>
    close(rcmd->fd);
     2fb:	8b 45 08             	mov    0x8(%ebp),%eax
     2fe:	8b 40 14             	mov    0x14(%eax),%eax
     301:	89 04 24             	mov    %eax,(%esp)
     304:	e8 a7 0c 00 00       	call   fb0 <close>
    if(open(rcmd->file, rcmd->mode) < 0){
     309:	8b 45 08             	mov    0x8(%ebp),%eax
     30c:	8b 40 10             	mov    0x10(%eax),%eax
     30f:	89 44 24 04          	mov    %eax,0x4(%esp)
     313:	8b 45 08             	mov    0x8(%ebp),%eax
     316:	8b 40 08             	mov    0x8(%eax),%eax
     319:	89 04 24             	mov    %eax,(%esp)
     31c:	e8 a7 0c 00 00       	call   fc8 <open>
     321:	85 c0                	test   %eax,%eax
      printf(2, "open %s failed\n", rcmd->file);
     323:	8b 45 08             	mov    0x8(%ebp),%eax
    if(open(rcmd->file, rcmd->mode) < 0){
     326:	0f 89 25 ff ff ff    	jns    251 <runcmd+0xa1>
      printf(2, "open %s failed\n", rcmd->file);
     32c:	8b 40 08             	mov    0x8(%eax),%eax
     32f:	c7 44 24 04 88 14 00 	movl   $0x1488,0x4(%esp)
     336:	00 
     337:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
     33e:	89 44 24 08          	mov    %eax,0x8(%esp)
     342:	e8 a9 0d 00 00       	call   10f0 <printf>
     347:	e9 e4 fe ff ff       	jmp    230 <runcmd+0x80>
    panic("runcmd");
     34c:	c7 04 24 6b 14 00 00 	movl   $0x146b,(%esp)
     353:	e8 28 fe ff ff       	call   180 <panic>
    panic("fork");
     358:	c7 04 24 98 14 00 00 	movl   $0x1498,(%esp)
     35f:	e8 1c fe ff ff       	call   180 <panic>
      panic("pipe");
     364:	c7 04 24 9d 14 00 00 	movl   $0x149d,(%esp)
     36b:	e8 10 fe ff ff       	call   180 <panic>
      close(0);
     370:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
     377:	e8 34 0c 00 00       	call   fb0 <close>
      dup(p[0]);
     37c:	8b 45 e0             	mov    -0x20(%ebp),%eax
     37f:	89 04 24             	mov    %eax,(%esp)
     382:	e8 79 0c 00 00       	call   1000 <dup>
      close(p[0]);
     387:	8b 45 e0             	mov    -0x20(%ebp),%eax
     38a:	89 04 24             	mov    %eax,(%esp)
     38d:	e8 1e 0c 00 00       	call   fb0 <close>
      close(p[1]);
     392:	8b 45 e4             	mov    -0x1c(%ebp),%eax
     395:	89 04 24             	mov    %eax,(%esp)
     398:	e8 13 0c 00 00       	call   fb0 <close>
      runcmd(pcmd->right);
     39d:	8b 45 08             	mov    0x8(%ebp),%eax
     3a0:	8b 40 08             	mov    0x8(%eax),%eax
     3a3:	89 04 24             	mov    %eax,(%esp)
     3a6:	e8 05 fe ff ff       	call   1b0 <runcmd>
    {
     3ab:	89 65 c4             	mov    %esp,-0x3c(%ebp)
      char buf[CHUNK];
     3ae:	81 ec 00 04 00 00    	sub    $0x400,%esp
      for (int i = 0, c = 0; i < CHUNK; ++i , ++c)
     3b4:	31 f6                	xor    %esi,%esi
      char buf[CHUNK];
     3b6:	8d 5c 24 0c          	lea    0xc(%esp),%ebx
      read(fd, &buf,CHUNK); 
     3ba:	c7 44 24 08 00 04 00 	movl   $0x400,0x8(%esp)
     3c1:	00 
     3c2:	89 5c 24 04          	mov    %ebx,0x4(%esp)
     3c6:	89 04 24             	mov    %eax,(%esp)
     3c9:	e8 d2 0b 00 00       	call   fa0 <read>
      char path[PATH_SIZE];
     3ce:	81 ec 00 04 00 00    	sub    $0x400,%esp
     3d4:	89 da                	mov    %ebx,%edx
     3d6:	8d 83 00 04 00 00    	lea    0x400(%ebx),%eax
     3dc:	89 45 d4             	mov    %eax,-0x2c(%ebp)
     3df:	8d 44 24 0d          	lea    0xd(%esp),%eax
     3e3:	8d 7c 24 0c          	lea    0xc(%esp),%edi
     3e7:	89 45 c8             	mov    %eax,-0x38(%ebp)
     3ea:	eb 0e                	jmp    3fa <runcmd+0x24a>
     3ec:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
          path[c] = buf[i];
     3f0:	88 04 37             	mov    %al,(%edi,%esi,1)
     3f3:	46                   	inc    %esi
     3f4:	42                   	inc    %edx
      for (int i = 0, c = 0; i < CHUNK; ++i , ++c)
     3f5:	3b 55 d4             	cmp    -0x2c(%ebp),%edx
     3f8:	74 72                	je     46c <runcmd+0x2bc>
        if(buf[i] != ':')
     3fa:	0f b6 02             	movzbl (%edx),%eax
     3fd:	3c 3a                	cmp    $0x3a,%al
     3ff:	75 ef                	jne    3f0 <runcmd+0x240>
     401:	8b 45 08             	mov    0x8(%ebp),%eax
     404:	89 f3                	mov    %esi,%ebx
     406:	89 55 d0             	mov    %edx,-0x30(%ebp)
     409:	8b 40 04             	mov    0x4(%eax),%eax
     40c:	eb 10                	jmp    41e <runcmd+0x26e>
     40e:	66 90                	xchg   %ax,%ax
            path[c] = ecmd->argv[0][j];
     410:	8b 45 08             	mov    0x8(%ebp),%eax
     413:	8b 40 04             	mov    0x4(%eax),%eax
     416:	0f b6 0c 08          	movzbl (%eax,%ecx,1),%ecx
     41a:	88 0c 1f             	mov    %cl,(%edi,%ebx,1)
          for (int j = 0; j < strlen(ecmd->argv[0]); ++j, ++c)
     41d:	43                   	inc    %ebx
     41e:	89 04 24             	mov    %eax,(%esp)
     421:	e8 9a 09 00 00       	call   dc0 <strlen>
     426:	89 d9                	mov    %ebx,%ecx
     428:	29 f1                	sub    %esi,%ecx
     42a:	39 c8                	cmp    %ecx,%eax
     42c:	77 e2                	ja     410 <runcmd+0x260>
          printf(2,"%s\n",path); //  for Debug
     42e:	b8 0b 15 00 00       	mov    $0x150b,%eax
     433:	89 44 24 04          	mov    %eax,0x4(%esp)
     437:	89 7c 24 08          	mov    %edi,0x8(%esp)
     43b:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
     442:	e8 a9 0c 00 00       	call   10f0 <printf>
          exec(path, ecmd->argv);
     447:	8b 45 cc             	mov    -0x34(%ebp),%eax
     44a:	89 3c 24             	mov    %edi,(%esp)
     44d:	89 44 24 04          	mov    %eax,0x4(%esp)
     451:	e8 6a 0b 00 00       	call   fc0 <exec>
     456:	8b 55 c8             	mov    -0x38(%ebp),%edx
     459:	89 f8                	mov    %edi,%eax
     45b:	01 d3                	add    %edx,%ebx
     45d:	8b 55 d0             	mov    -0x30(%ebp),%edx
            path[j] = '\0';
     460:	c6 00 00             	movb   $0x0,(%eax)
     463:	40                   	inc    %eax
          for(int j=0 ; j<=c ; ++j)
     464:	39 d8                	cmp    %ebx,%eax
     466:	75 f8                	jne    460 <runcmd+0x2b0>
     468:	31 f6                	xor    %esi,%esi
     46a:	eb 88                	jmp    3f4 <runcmd+0x244>
     46c:	8b 65 c4             	mov    -0x3c(%ebp),%esp
     46f:	e9 9c fd ff ff       	jmp    210 <runcmd+0x60>
      close(1);
     474:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
     47b:	e8 30 0b 00 00       	call   fb0 <close>
      dup(p[1]);
     480:	8b 45 e4             	mov    -0x1c(%ebp),%eax
     483:	89 04 24             	mov    %eax,(%esp)
     486:	e8 75 0b 00 00       	call   1000 <dup>
      close(p[0]);
     48b:	8b 45 e0             	mov    -0x20(%ebp),%eax
     48e:	89 04 24             	mov    %eax,(%esp)
     491:	e8 1a 0b 00 00       	call   fb0 <close>
      close(p[1]);
     496:	8b 45 e4             	mov    -0x1c(%ebp),%eax
     499:	89 04 24             	mov    %eax,(%esp)
     49c:	e8 0f 0b 00 00       	call   fb0 <close>
      runcmd(pcmd->left);
     4a1:	8b 45 08             	mov    0x8(%ebp),%eax
     4a4:	8b 40 04             	mov    0x4(%eax),%eax
     4a7:	89 04 24             	mov    %eax,(%esp)
     4aa:	e8 01 fd ff ff       	call   1b0 <runcmd>
     4af:	90                   	nop

000004b0 <fork1>:
{
     4b0:	55                   	push   %ebp
     4b1:	89 e5                	mov    %esp,%ebp
     4b3:	83 ec 18             	sub    $0x18,%esp
  pid = fork();
     4b6:	e8 c5 0a 00 00       	call   f80 <fork>
  if(pid == -1)
     4bb:	83 f8 ff             	cmp    $0xffffffff,%eax
     4be:	74 02                	je     4c2 <fork1+0x12>
  return pid;
}
     4c0:	c9                   	leave  
     4c1:	c3                   	ret    
    panic("fork");
     4c2:	c7 04 24 98 14 00 00 	movl   $0x1498,(%esp)
     4c9:	e8 b2 fc ff ff       	call   180 <panic>
     4ce:	66 90                	xchg   %ax,%ax

000004d0 <execcmd>:
//PAGEBREAK!
// Constructors

struct cmd*
execcmd(void)
{
     4d0:	55                   	push   %ebp
     4d1:	89 e5                	mov    %esp,%ebp
     4d3:	53                   	push   %ebx
     4d4:	83 ec 14             	sub    $0x14,%esp
  struct execcmd *cmd;

  cmd = malloc(sizeof(*cmd));
     4d7:	c7 04 24 54 00 00 00 	movl   $0x54,(%esp)
     4de:	e8 9d 0e 00 00       	call   1380 <malloc>
  memset(cmd, 0, sizeof(*cmd));
     4e3:	31 d2                	xor    %edx,%edx
     4e5:	89 54 24 04          	mov    %edx,0x4(%esp)
  cmd = malloc(sizeof(*cmd));
     4e9:	89 c3                	mov    %eax,%ebx
  memset(cmd, 0, sizeof(*cmd));
     4eb:	b8 54 00 00 00       	mov    $0x54,%eax
     4f0:	89 1c 24             	mov    %ebx,(%esp)
     4f3:	89 44 24 08          	mov    %eax,0x8(%esp)
     4f7:	e8 f4 08 00 00       	call   df0 <memset>
  cmd->type = EXEC;
  return (struct cmd*)cmd;
}
     4fc:	89 d8                	mov    %ebx,%eax
  cmd->type = EXEC;
     4fe:	c7 03 01 00 00 00    	movl   $0x1,(%ebx)
}
     504:	83 c4 14             	add    $0x14,%esp
     507:	5b                   	pop    %ebx
     508:	5d                   	pop    %ebp
     509:	c3                   	ret    
     50a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00000510 <redircmd>:

struct cmd*
redircmd(struct cmd *subcmd, char *file, char *efile, int mode, int fd)
{
     510:	55                   	push   %ebp
     511:	89 e5                	mov    %esp,%ebp
     513:	53                   	push   %ebx
     514:	83 ec 14             	sub    $0x14,%esp
  struct redircmd *cmd;

  cmd = malloc(sizeof(*cmd));
     517:	c7 04 24 18 00 00 00 	movl   $0x18,(%esp)
     51e:	e8 5d 0e 00 00       	call   1380 <malloc>
  memset(cmd, 0, sizeof(*cmd));
     523:	31 d2                	xor    %edx,%edx
     525:	89 54 24 04          	mov    %edx,0x4(%esp)
  cmd = malloc(sizeof(*cmd));
     529:	89 c3                	mov    %eax,%ebx
  memset(cmd, 0, sizeof(*cmd));
     52b:	b8 18 00 00 00       	mov    $0x18,%eax
     530:	89 1c 24             	mov    %ebx,(%esp)
     533:	89 44 24 08          	mov    %eax,0x8(%esp)
     537:	e8 b4 08 00 00       	call   df0 <memset>
  cmd->type = REDIR;
  cmd->cmd = subcmd;
     53c:	8b 45 08             	mov    0x8(%ebp),%eax
  cmd->type = REDIR;
     53f:	c7 03 02 00 00 00    	movl   $0x2,(%ebx)
  cmd->cmd = subcmd;
     545:	89 43 04             	mov    %eax,0x4(%ebx)
  cmd->file = file;
     548:	8b 45 0c             	mov    0xc(%ebp),%eax
     54b:	89 43 08             	mov    %eax,0x8(%ebx)
  cmd->efile = efile;
     54e:	8b 45 10             	mov    0x10(%ebp),%eax
     551:	89 43 0c             	mov    %eax,0xc(%ebx)
  cmd->mode = mode;
     554:	8b 45 14             	mov    0x14(%ebp),%eax
     557:	89 43 10             	mov    %eax,0x10(%ebx)
  cmd->fd = fd;
     55a:	8b 45 18             	mov    0x18(%ebp),%eax
     55d:	89 43 14             	mov    %eax,0x14(%ebx)
  return (struct cmd*)cmd;
}
     560:	83 c4 14             	add    $0x14,%esp
     563:	89 d8                	mov    %ebx,%eax
     565:	5b                   	pop    %ebx
     566:	5d                   	pop    %ebp
     567:	c3                   	ret    
     568:	90                   	nop
     569:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000570 <pipecmd>:

struct cmd*
pipecmd(struct cmd *left, struct cmd *right)
{
     570:	55                   	push   %ebp
     571:	89 e5                	mov    %esp,%ebp
     573:	53                   	push   %ebx
     574:	83 ec 14             	sub    $0x14,%esp
  struct pipecmd *cmd;

  cmd = malloc(sizeof(*cmd));
     577:	c7 04 24 0c 00 00 00 	movl   $0xc,(%esp)
     57e:	e8 fd 0d 00 00       	call   1380 <malloc>
  memset(cmd, 0, sizeof(*cmd));
     583:	31 d2                	xor    %edx,%edx
     585:	89 54 24 04          	mov    %edx,0x4(%esp)
  cmd = malloc(sizeof(*cmd));
     589:	89 c3                	mov    %eax,%ebx
  memset(cmd, 0, sizeof(*cmd));
     58b:	b8 0c 00 00 00       	mov    $0xc,%eax
     590:	89 1c 24             	mov    %ebx,(%esp)
     593:	89 44 24 08          	mov    %eax,0x8(%esp)
     597:	e8 54 08 00 00       	call   df0 <memset>
  cmd->type = PIPE;
  cmd->left = left;
     59c:	8b 45 08             	mov    0x8(%ebp),%eax
  cmd->type = PIPE;
     59f:	c7 03 03 00 00 00    	movl   $0x3,(%ebx)
  cmd->left = left;
     5a5:	89 43 04             	mov    %eax,0x4(%ebx)
  cmd->right = right;
     5a8:	8b 45 0c             	mov    0xc(%ebp),%eax
     5ab:	89 43 08             	mov    %eax,0x8(%ebx)
  return (struct cmd*)cmd;
}
     5ae:	83 c4 14             	add    $0x14,%esp
     5b1:	89 d8                	mov    %ebx,%eax
     5b3:	5b                   	pop    %ebx
     5b4:	5d                   	pop    %ebp
     5b5:	c3                   	ret    
     5b6:	8d 76 00             	lea    0x0(%esi),%esi
     5b9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000005c0 <listcmd>:

struct cmd*
listcmd(struct cmd *left, struct cmd *right)
{
     5c0:	55                   	push   %ebp
     5c1:	89 e5                	mov    %esp,%ebp
     5c3:	53                   	push   %ebx
     5c4:	83 ec 14             	sub    $0x14,%esp
  struct listcmd *cmd;

  cmd = malloc(sizeof(*cmd));
     5c7:	c7 04 24 0c 00 00 00 	movl   $0xc,(%esp)
     5ce:	e8 ad 0d 00 00       	call   1380 <malloc>
  memset(cmd, 0, sizeof(*cmd));
     5d3:	31 d2                	xor    %edx,%edx
     5d5:	89 54 24 04          	mov    %edx,0x4(%esp)
  cmd = malloc(sizeof(*cmd));
     5d9:	89 c3                	mov    %eax,%ebx
  memset(cmd, 0, sizeof(*cmd));
     5db:	b8 0c 00 00 00       	mov    $0xc,%eax
     5e0:	89 1c 24             	mov    %ebx,(%esp)
     5e3:	89 44 24 08          	mov    %eax,0x8(%esp)
     5e7:	e8 04 08 00 00       	call   df0 <memset>
  cmd->type = LIST;
  cmd->left = left;
     5ec:	8b 45 08             	mov    0x8(%ebp),%eax
  cmd->type = LIST;
     5ef:	c7 03 04 00 00 00    	movl   $0x4,(%ebx)
  cmd->left = left;
     5f5:	89 43 04             	mov    %eax,0x4(%ebx)
  cmd->right = right;
     5f8:	8b 45 0c             	mov    0xc(%ebp),%eax
     5fb:	89 43 08             	mov    %eax,0x8(%ebx)
  return (struct cmd*)cmd;
}
     5fe:	83 c4 14             	add    $0x14,%esp
     601:	89 d8                	mov    %ebx,%eax
     603:	5b                   	pop    %ebx
     604:	5d                   	pop    %ebp
     605:	c3                   	ret    
     606:	8d 76 00             	lea    0x0(%esi),%esi
     609:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000610 <backcmd>:

struct cmd*
backcmd(struct cmd *subcmd)
{
     610:	55                   	push   %ebp
     611:	89 e5                	mov    %esp,%ebp
     613:	53                   	push   %ebx
     614:	83 ec 14             	sub    $0x14,%esp
  struct backcmd *cmd;

  cmd = malloc(sizeof(*cmd));
     617:	c7 04 24 08 00 00 00 	movl   $0x8,(%esp)
     61e:	e8 5d 0d 00 00       	call   1380 <malloc>
  memset(cmd, 0, sizeof(*cmd));
     623:	31 d2                	xor    %edx,%edx
     625:	89 54 24 04          	mov    %edx,0x4(%esp)
  cmd = malloc(sizeof(*cmd));
     629:	89 c3                	mov    %eax,%ebx
  memset(cmd, 0, sizeof(*cmd));
     62b:	b8 08 00 00 00       	mov    $0x8,%eax
     630:	89 1c 24             	mov    %ebx,(%esp)
     633:	89 44 24 08          	mov    %eax,0x8(%esp)
     637:	e8 b4 07 00 00       	call   df0 <memset>
  cmd->type = BACK;
  cmd->cmd = subcmd;
     63c:	8b 45 08             	mov    0x8(%ebp),%eax
  cmd->type = BACK;
     63f:	c7 03 05 00 00 00    	movl   $0x5,(%ebx)
  cmd->cmd = subcmd;
     645:	89 43 04             	mov    %eax,0x4(%ebx)
  return (struct cmd*)cmd;
}
     648:	83 c4 14             	add    $0x14,%esp
     64b:	89 d8                	mov    %ebx,%eax
     64d:	5b                   	pop    %ebx
     64e:	5d                   	pop    %ebp
     64f:	c3                   	ret    

00000650 <gettoken>:
char whitespace[] = " \t\r\n\v";
char symbols[] = "<|>&;()";

int
gettoken(char **ps, char *es, char **q, char **eq)
{
     650:	55                   	push   %ebp
     651:	89 e5                	mov    %esp,%ebp
     653:	57                   	push   %edi
     654:	56                   	push   %esi
     655:	53                   	push   %ebx
     656:	83 ec 1c             	sub    $0x1c,%esp
  char *s;
  int ret;

  s = *ps;
     659:	8b 45 08             	mov    0x8(%ebp),%eax
{
     65c:	8b 5d 0c             	mov    0xc(%ebp),%ebx
     65f:	8b 7d 10             	mov    0x10(%ebp),%edi
  s = *ps;
     662:	8b 30                	mov    (%eax),%esi
  while(s < es && strchr(whitespace, *s))
     664:	39 de                	cmp    %ebx,%esi
     666:	72 0d                	jb     675 <gettoken+0x25>
     668:	eb 22                	jmp    68c <gettoken+0x3c>
     66a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    s++;
     670:	46                   	inc    %esi
  while(s < es && strchr(whitespace, *s))
     671:	39 f3                	cmp    %esi,%ebx
     673:	74 17                	je     68c <gettoken+0x3c>
     675:	0f be 06             	movsbl (%esi),%eax
     678:	c7 04 24 18 1b 00 00 	movl   $0x1b18,(%esp)
     67f:	89 44 24 04          	mov    %eax,0x4(%esp)
     683:	e8 88 07 00 00       	call   e10 <strchr>
     688:	85 c0                	test   %eax,%eax
     68a:	75 e4                	jne    670 <gettoken+0x20>
  if(q)
     68c:	85 ff                	test   %edi,%edi
     68e:	74 02                	je     692 <gettoken+0x42>
    *q = s;
     690:	89 37                	mov    %esi,(%edi)
  ret = *s;
     692:	0f be 06             	movsbl (%esi),%eax
  switch(*s){
     695:	3c 29                	cmp    $0x29,%al
     697:	7f 57                	jg     6f0 <gettoken+0xa0>
     699:	3c 28                	cmp    $0x28,%al
     69b:	0f 8d cb 00 00 00    	jge    76c <gettoken+0x11c>
     6a1:	31 ff                	xor    %edi,%edi
     6a3:	84 c0                	test   %al,%al
     6a5:	0f 85 cd 00 00 00    	jne    778 <gettoken+0x128>
    ret = 'a';
    while(s < es && !strchr(whitespace, *s) && !strchr(symbols, *s))
      s++;
    break;
  }
  if(eq)
     6ab:	8b 55 14             	mov    0x14(%ebp),%edx
     6ae:	85 d2                	test   %edx,%edx
     6b0:	74 05                	je     6b7 <gettoken+0x67>
    *eq = s;
     6b2:	8b 45 14             	mov    0x14(%ebp),%eax
     6b5:	89 30                	mov    %esi,(%eax)

  while(s < es && strchr(whitespace, *s))
     6b7:	39 de                	cmp    %ebx,%esi
     6b9:	72 0a                	jb     6c5 <gettoken+0x75>
     6bb:	eb 1f                	jmp    6dc <gettoken+0x8c>
     6bd:	8d 76 00             	lea    0x0(%esi),%esi
    s++;
     6c0:	46                   	inc    %esi
  while(s < es && strchr(whitespace, *s))
     6c1:	39 f3                	cmp    %esi,%ebx
     6c3:	74 17                	je     6dc <gettoken+0x8c>
     6c5:	0f be 06             	movsbl (%esi),%eax
     6c8:	c7 04 24 18 1b 00 00 	movl   $0x1b18,(%esp)
     6cf:	89 44 24 04          	mov    %eax,0x4(%esp)
     6d3:	e8 38 07 00 00       	call   e10 <strchr>
     6d8:	85 c0                	test   %eax,%eax
     6da:	75 e4                	jne    6c0 <gettoken+0x70>
  *ps = s;
     6dc:	8b 45 08             	mov    0x8(%ebp),%eax
     6df:	89 30                	mov    %esi,(%eax)
  return ret;
}
     6e1:	83 c4 1c             	add    $0x1c,%esp
     6e4:	89 f8                	mov    %edi,%eax
     6e6:	5b                   	pop    %ebx
     6e7:	5e                   	pop    %esi
     6e8:	5f                   	pop    %edi
     6e9:	5d                   	pop    %ebp
     6ea:	c3                   	ret    
     6eb:	90                   	nop
     6ec:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  switch(*s){
     6f0:	3c 3e                	cmp    $0x3e,%al
     6f2:	75 1c                	jne    710 <gettoken+0xc0>
    if(*s == '>'){
     6f4:	80 7e 01 3e          	cmpb   $0x3e,0x1(%esi)
    s++;
     6f8:	8d 46 01             	lea    0x1(%esi),%eax
    if(*s == '>'){
     6fb:	0f 84 94 00 00 00    	je     795 <gettoken+0x145>
    s++;
     701:	89 c6                	mov    %eax,%esi
     703:	bf 3e 00 00 00       	mov    $0x3e,%edi
     708:	eb a1                	jmp    6ab <gettoken+0x5b>
     70a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  switch(*s){
     710:	7f 56                	jg     768 <gettoken+0x118>
     712:	88 c1                	mov    %al,%cl
     714:	80 e9 3b             	sub    $0x3b,%cl
     717:	80 f9 01             	cmp    $0x1,%cl
     71a:	76 50                	jbe    76c <gettoken+0x11c>
    while(s < es && !strchr(whitespace, *s) && !strchr(symbols, *s))
     71c:	39 f3                	cmp    %esi,%ebx
     71e:	77 27                	ja     747 <gettoken+0xf7>
     720:	eb 5e                	jmp    780 <gettoken+0x130>
     722:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
     728:	0f be 06             	movsbl (%esi),%eax
     72b:	c7 04 24 10 1b 00 00 	movl   $0x1b10,(%esp)
     732:	89 44 24 04          	mov    %eax,0x4(%esp)
     736:	e8 d5 06 00 00       	call   e10 <strchr>
     73b:	85 c0                	test   %eax,%eax
     73d:	75 1c                	jne    75b <gettoken+0x10b>
      s++;
     73f:	46                   	inc    %esi
    while(s < es && !strchr(whitespace, *s) && !strchr(symbols, *s))
     740:	39 f3                	cmp    %esi,%ebx
     742:	74 3c                	je     780 <gettoken+0x130>
     744:	0f be 06             	movsbl (%esi),%eax
     747:	89 44 24 04          	mov    %eax,0x4(%esp)
     74b:	c7 04 24 18 1b 00 00 	movl   $0x1b18,(%esp)
     752:	e8 b9 06 00 00       	call   e10 <strchr>
     757:	85 c0                	test   %eax,%eax
     759:	74 cd                	je     728 <gettoken+0xd8>
    ret = 'a';
     75b:	bf 61 00 00 00       	mov    $0x61,%edi
     760:	e9 46 ff ff ff       	jmp    6ab <gettoken+0x5b>
     765:	8d 76 00             	lea    0x0(%esi),%esi
  switch(*s){
     768:	3c 7c                	cmp    $0x7c,%al
     76a:	75 b0                	jne    71c <gettoken+0xcc>
  ret = *s;
     76c:	0f be f8             	movsbl %al,%edi
    s++;
     76f:	46                   	inc    %esi
    break;
     770:	e9 36 ff ff ff       	jmp    6ab <gettoken+0x5b>
     775:	8d 76 00             	lea    0x0(%esi),%esi
  switch(*s){
     778:	3c 26                	cmp    $0x26,%al
     77a:	75 a0                	jne    71c <gettoken+0xcc>
     77c:	eb ee                	jmp    76c <gettoken+0x11c>
     77e:	66 90                	xchg   %ax,%ax
  if(eq)
     780:	8b 45 14             	mov    0x14(%ebp),%eax
     783:	bf 61 00 00 00       	mov    $0x61,%edi
     788:	85 c0                	test   %eax,%eax
     78a:	0f 85 22 ff ff ff    	jne    6b2 <gettoken+0x62>
     790:	e9 47 ff ff ff       	jmp    6dc <gettoken+0x8c>
      s++;
     795:	83 c6 02             	add    $0x2,%esi
      ret = '+';
     798:	bf 2b 00 00 00       	mov    $0x2b,%edi
     79d:	e9 09 ff ff ff       	jmp    6ab <gettoken+0x5b>
     7a2:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     7a9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000007b0 <peek>:

int
peek(char **ps, char *es, char *toks)
{
     7b0:	55                   	push   %ebp
     7b1:	89 e5                	mov    %esp,%ebp
     7b3:	57                   	push   %edi
     7b4:	56                   	push   %esi
     7b5:	53                   	push   %ebx
     7b6:	83 ec 1c             	sub    $0x1c,%esp
     7b9:	8b 7d 08             	mov    0x8(%ebp),%edi
     7bc:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *s;

  s = *ps;
     7bf:	8b 1f                	mov    (%edi),%ebx
  while(s < es && strchr(whitespace, *s))
     7c1:	39 f3                	cmp    %esi,%ebx
     7c3:	72 10                	jb     7d5 <peek+0x25>
     7c5:	eb 25                	jmp    7ec <peek+0x3c>
     7c7:	89 f6                	mov    %esi,%esi
     7c9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    s++;
     7d0:	43                   	inc    %ebx
  while(s < es && strchr(whitespace, *s))
     7d1:	39 de                	cmp    %ebx,%esi
     7d3:	74 17                	je     7ec <peek+0x3c>
     7d5:	0f be 03             	movsbl (%ebx),%eax
     7d8:	c7 04 24 18 1b 00 00 	movl   $0x1b18,(%esp)
     7df:	89 44 24 04          	mov    %eax,0x4(%esp)
     7e3:	e8 28 06 00 00       	call   e10 <strchr>
     7e8:	85 c0                	test   %eax,%eax
     7ea:	75 e4                	jne    7d0 <peek+0x20>
  *ps = s;
     7ec:	89 1f                	mov    %ebx,(%edi)
  return *s && strchr(toks, *s);
     7ee:	31 c0                	xor    %eax,%eax
     7f0:	0f be 13             	movsbl (%ebx),%edx
     7f3:	84 d2                	test   %dl,%dl
     7f5:	74 17                	je     80e <peek+0x5e>
     7f7:	8b 45 10             	mov    0x10(%ebp),%eax
     7fa:	89 54 24 04          	mov    %edx,0x4(%esp)
     7fe:	89 04 24             	mov    %eax,(%esp)
     801:	e8 0a 06 00 00       	call   e10 <strchr>
     806:	85 c0                	test   %eax,%eax
     808:	0f 95 c0             	setne  %al
     80b:	0f b6 c0             	movzbl %al,%eax
}
     80e:	83 c4 1c             	add    $0x1c,%esp
     811:	5b                   	pop    %ebx
     812:	5e                   	pop    %esi
     813:	5f                   	pop    %edi
     814:	5d                   	pop    %ebp
     815:	c3                   	ret    
     816:	8d 76 00             	lea    0x0(%esi),%esi
     819:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000820 <parseredirs>:
  return cmd;
}

struct cmd*
parseredirs(struct cmd *cmd, char **ps, char *es)
{
     820:	55                   	push   %ebp
     821:	89 e5                	mov    %esp,%ebp
     823:	57                   	push   %edi
     824:	56                   	push   %esi
     825:	53                   	push   %ebx
     826:	83 ec 3c             	sub    $0x3c,%esp
     829:	8b 75 0c             	mov    0xc(%ebp),%esi
     82c:	8b 5d 10             	mov    0x10(%ebp),%ebx
     82f:	90                   	nop
  int tok;
  char *q, *eq;

  while(peek(ps, es, "<>")){
     830:	b8 bf 14 00 00       	mov    $0x14bf,%eax
     835:	89 44 24 08          	mov    %eax,0x8(%esp)
     839:	89 5c 24 04          	mov    %ebx,0x4(%esp)
     83d:	89 34 24             	mov    %esi,(%esp)
     840:	e8 6b ff ff ff       	call   7b0 <peek>
     845:	85 c0                	test   %eax,%eax
     847:	0f 84 93 00 00 00    	je     8e0 <parseredirs+0xc0>
    tok = gettoken(ps, es, 0, 0);
     84d:	31 c0                	xor    %eax,%eax
     84f:	89 44 24 0c          	mov    %eax,0xc(%esp)
     853:	31 c0                	xor    %eax,%eax
     855:	89 44 24 08          	mov    %eax,0x8(%esp)
     859:	89 5c 24 04          	mov    %ebx,0x4(%esp)
     85d:	89 34 24             	mov    %esi,(%esp)
     860:	e8 eb fd ff ff       	call   650 <gettoken>
    if(gettoken(ps, es, &q, &eq) != 'a')
     865:	89 5c 24 04          	mov    %ebx,0x4(%esp)
     869:	89 34 24             	mov    %esi,(%esp)
    tok = gettoken(ps, es, 0, 0);
     86c:	89 c7                	mov    %eax,%edi
    if(gettoken(ps, es, &q, &eq) != 'a')
     86e:	8d 45 e4             	lea    -0x1c(%ebp),%eax
     871:	89 44 24 0c          	mov    %eax,0xc(%esp)
     875:	8d 45 e0             	lea    -0x20(%ebp),%eax
     878:	89 44 24 08          	mov    %eax,0x8(%esp)
     87c:	e8 cf fd ff ff       	call   650 <gettoken>
     881:	83 f8 61             	cmp    $0x61,%eax
     884:	75 65                	jne    8eb <parseredirs+0xcb>
      panic("missing file for redirection");
    switch(tok){
     886:	83 ff 3c             	cmp    $0x3c,%edi
     889:	74 45                	je     8d0 <parseredirs+0xb0>
     88b:	83 ff 3e             	cmp    $0x3e,%edi
     88e:	66 90                	xchg   %ax,%ax
     890:	74 05                	je     897 <parseredirs+0x77>
     892:	83 ff 2b             	cmp    $0x2b,%edi
     895:	75 99                	jne    830 <parseredirs+0x10>
      break;
    case '>':
      cmd = redircmd(cmd, q, eq, O_WRONLY|O_CREATE, 1);
      break;
    case '+':  // >>
      cmd = redircmd(cmd, q, eq, O_WRONLY|O_CREATE, 1);
     897:	ba 01 00 00 00       	mov    $0x1,%edx
     89c:	b9 01 02 00 00       	mov    $0x201,%ecx
     8a1:	89 54 24 10          	mov    %edx,0x10(%esp)
     8a5:	89 4c 24 0c          	mov    %ecx,0xc(%esp)
     8a9:	8b 45 e4             	mov    -0x1c(%ebp),%eax
     8ac:	89 44 24 08          	mov    %eax,0x8(%esp)
     8b0:	8b 45 e0             	mov    -0x20(%ebp),%eax
     8b3:	89 44 24 04          	mov    %eax,0x4(%esp)
     8b7:	8b 45 08             	mov    0x8(%ebp),%eax
     8ba:	89 04 24             	mov    %eax,(%esp)
     8bd:	e8 4e fc ff ff       	call   510 <redircmd>
     8c2:	89 45 08             	mov    %eax,0x8(%ebp)
      break;
     8c5:	e9 66 ff ff ff       	jmp    830 <parseredirs+0x10>
     8ca:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      cmd = redircmd(cmd, q, eq, O_RDONLY, 0);
     8d0:	31 ff                	xor    %edi,%edi
     8d2:	31 c0                	xor    %eax,%eax
     8d4:	89 7c 24 10          	mov    %edi,0x10(%esp)
     8d8:	89 44 24 0c          	mov    %eax,0xc(%esp)
     8dc:	eb cb                	jmp    8a9 <parseredirs+0x89>
     8de:	66 90                	xchg   %ax,%ax
    }
  }
  return cmd;
}
     8e0:	8b 45 08             	mov    0x8(%ebp),%eax
     8e3:	83 c4 3c             	add    $0x3c,%esp
     8e6:	5b                   	pop    %ebx
     8e7:	5e                   	pop    %esi
     8e8:	5f                   	pop    %edi
     8e9:	5d                   	pop    %ebp
     8ea:	c3                   	ret    
      panic("missing file for redirection");
     8eb:	c7 04 24 a2 14 00 00 	movl   $0x14a2,(%esp)
     8f2:	e8 89 f8 ff ff       	call   180 <panic>
     8f7:	89 f6                	mov    %esi,%esi
     8f9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000900 <parseexec>:
  return cmd;
}

struct cmd*
parseexec(char **ps, char *es)
{
     900:	55                   	push   %ebp
  char *q, *eq;
  int tok, argc;
  struct execcmd *cmd;
  struct cmd *ret;

  if(peek(ps, es, "("))
     901:	ba c2 14 00 00       	mov    $0x14c2,%edx
{
     906:	89 e5                	mov    %esp,%ebp
     908:	57                   	push   %edi
     909:	56                   	push   %esi
     90a:	53                   	push   %ebx
     90b:	83 ec 3c             	sub    $0x3c,%esp
     90e:	8b 75 08             	mov    0x8(%ebp),%esi
     911:	8b 7d 0c             	mov    0xc(%ebp),%edi
  if(peek(ps, es, "("))
     914:	89 54 24 08          	mov    %edx,0x8(%esp)
     918:	89 34 24             	mov    %esi,(%esp)
     91b:	89 7c 24 04          	mov    %edi,0x4(%esp)
     91f:	e8 8c fe ff ff       	call   7b0 <peek>
     924:	85 c0                	test   %eax,%eax
     926:	0f 85 9c 00 00 00    	jne    9c8 <parseexec+0xc8>
     92c:	89 c3                	mov    %eax,%ebx
    return parseblock(ps, es);

  ret = execcmd();
     92e:	e8 9d fb ff ff       	call   4d0 <execcmd>
  cmd = (struct execcmd*)ret;

  argc = 0;
  ret = parseredirs(ret, ps, es);
     933:	89 7c 24 08          	mov    %edi,0x8(%esp)
     937:	89 74 24 04          	mov    %esi,0x4(%esp)
     93b:	89 04 24             	mov    %eax,(%esp)
  ret = execcmd();
     93e:	89 45 d0             	mov    %eax,-0x30(%ebp)
  ret = parseredirs(ret, ps, es);
     941:	e8 da fe ff ff       	call   820 <parseredirs>
     946:	89 45 d4             	mov    %eax,-0x2c(%ebp)
     949:	eb 1b                	jmp    966 <parseexec+0x66>
     94b:	90                   	nop
     94c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    cmd->argv[argc] = q;
    cmd->eargv[argc] = eq;
    argc++;
    if(argc >= MAXARGS)
      panic("too many args");
    ret = parseredirs(ret, ps, es);
     950:	8b 45 d4             	mov    -0x2c(%ebp),%eax
     953:	89 7c 24 08          	mov    %edi,0x8(%esp)
     957:	89 74 24 04          	mov    %esi,0x4(%esp)
     95b:	89 04 24             	mov    %eax,(%esp)
     95e:	e8 bd fe ff ff       	call   820 <parseredirs>
     963:	89 45 d4             	mov    %eax,-0x2c(%ebp)
  while(!peek(ps, es, "|)&;")){
     966:	b8 d9 14 00 00       	mov    $0x14d9,%eax
     96b:	89 44 24 08          	mov    %eax,0x8(%esp)
     96f:	89 7c 24 04          	mov    %edi,0x4(%esp)
     973:	89 34 24             	mov    %esi,(%esp)
     976:	e8 35 fe ff ff       	call   7b0 <peek>
     97b:	85 c0                	test   %eax,%eax
     97d:	75 69                	jne    9e8 <parseexec+0xe8>
    if((tok=gettoken(ps, es, &q, &eq)) == 0)
     97f:	8d 45 e4             	lea    -0x1c(%ebp),%eax
     982:	89 44 24 0c          	mov    %eax,0xc(%esp)
     986:	8d 45 e0             	lea    -0x20(%ebp),%eax
     989:	89 44 24 08          	mov    %eax,0x8(%esp)
     98d:	89 7c 24 04          	mov    %edi,0x4(%esp)
     991:	89 34 24             	mov    %esi,(%esp)
     994:	e8 b7 fc ff ff       	call   650 <gettoken>
     999:	85 c0                	test   %eax,%eax
     99b:	74 4b                	je     9e8 <parseexec+0xe8>
    if(tok != 'a')
     99d:	83 f8 61             	cmp    $0x61,%eax
     9a0:	75 65                	jne    a07 <parseexec+0x107>
    cmd->argv[argc] = q;
     9a2:	8b 45 e0             	mov    -0x20(%ebp),%eax
     9a5:	8b 55 d0             	mov    -0x30(%ebp),%edx
     9a8:	89 44 9a 04          	mov    %eax,0x4(%edx,%ebx,4)
    cmd->eargv[argc] = eq;
     9ac:	8b 45 e4             	mov    -0x1c(%ebp),%eax
     9af:	89 44 9a 2c          	mov    %eax,0x2c(%edx,%ebx,4)
    argc++;
     9b3:	43                   	inc    %ebx
    if(argc >= MAXARGS)
     9b4:	83 fb 0a             	cmp    $0xa,%ebx
     9b7:	75 97                	jne    950 <parseexec+0x50>
      panic("too many args");
     9b9:	c7 04 24 cb 14 00 00 	movl   $0x14cb,(%esp)
     9c0:	e8 bb f7 ff ff       	call   180 <panic>
     9c5:	8d 76 00             	lea    0x0(%esi),%esi
    return parseblock(ps, es);
     9c8:	89 7c 24 04          	mov    %edi,0x4(%esp)
     9cc:	89 34 24             	mov    %esi,(%esp)
     9cf:	e8 9c 01 00 00       	call   b70 <parseblock>
     9d4:	89 45 d4             	mov    %eax,-0x2c(%ebp)
  }
  cmd->argv[argc] = 0;
  cmd->eargv[argc] = 0;
  return ret;
}
     9d7:	8b 45 d4             	mov    -0x2c(%ebp),%eax
     9da:	83 c4 3c             	add    $0x3c,%esp
     9dd:	5b                   	pop    %ebx
     9de:	5e                   	pop    %esi
     9df:	5f                   	pop    %edi
     9e0:	5d                   	pop    %ebp
     9e1:	c3                   	ret    
     9e2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
     9e8:	8b 45 d0             	mov    -0x30(%ebp),%eax
     9eb:	8d 04 98             	lea    (%eax,%ebx,4),%eax
  cmd->argv[argc] = 0;
     9ee:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
  cmd->eargv[argc] = 0;
     9f5:	c7 40 2c 00 00 00 00 	movl   $0x0,0x2c(%eax)
}
     9fc:	8b 45 d4             	mov    -0x2c(%ebp),%eax
     9ff:	83 c4 3c             	add    $0x3c,%esp
     a02:	5b                   	pop    %ebx
     a03:	5e                   	pop    %esi
     a04:	5f                   	pop    %edi
     a05:	5d                   	pop    %ebp
     a06:	c3                   	ret    
      panic("syntax");
     a07:	c7 04 24 c4 14 00 00 	movl   $0x14c4,(%esp)
     a0e:	e8 6d f7 ff ff       	call   180 <panic>
     a13:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
     a19:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000a20 <parsepipe>:
{
     a20:	55                   	push   %ebp
     a21:	89 e5                	mov    %esp,%ebp
     a23:	83 ec 28             	sub    $0x28,%esp
     a26:	89 5d f4             	mov    %ebx,-0xc(%ebp)
     a29:	8b 5d 08             	mov    0x8(%ebp),%ebx
     a2c:	89 75 f8             	mov    %esi,-0x8(%ebp)
     a2f:	8b 75 0c             	mov    0xc(%ebp),%esi
     a32:	89 7d fc             	mov    %edi,-0x4(%ebp)
  cmd = parseexec(ps, es);
     a35:	89 1c 24             	mov    %ebx,(%esp)
     a38:	89 74 24 04          	mov    %esi,0x4(%esp)
     a3c:	e8 bf fe ff ff       	call   900 <parseexec>
  if(peek(ps, es, "|")){
     a41:	b9 de 14 00 00       	mov    $0x14de,%ecx
     a46:	89 4c 24 08          	mov    %ecx,0x8(%esp)
     a4a:	89 74 24 04          	mov    %esi,0x4(%esp)
     a4e:	89 1c 24             	mov    %ebx,(%esp)
  cmd = parseexec(ps, es);
     a51:	89 c7                	mov    %eax,%edi
  if(peek(ps, es, "|")){
     a53:	e8 58 fd ff ff       	call   7b0 <peek>
     a58:	85 c0                	test   %eax,%eax
     a5a:	75 14                	jne    a70 <parsepipe+0x50>
}
     a5c:	89 f8                	mov    %edi,%eax
     a5e:	8b 5d f4             	mov    -0xc(%ebp),%ebx
     a61:	8b 75 f8             	mov    -0x8(%ebp),%esi
     a64:	8b 7d fc             	mov    -0x4(%ebp),%edi
     a67:	89 ec                	mov    %ebp,%esp
     a69:	5d                   	pop    %ebp
     a6a:	c3                   	ret    
     a6b:	90                   	nop
     a6c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    gettoken(ps, es, 0, 0);
     a70:	31 d2                	xor    %edx,%edx
     a72:	31 c0                	xor    %eax,%eax
     a74:	89 54 24 08          	mov    %edx,0x8(%esp)
     a78:	89 74 24 04          	mov    %esi,0x4(%esp)
     a7c:	89 1c 24             	mov    %ebx,(%esp)
     a7f:	89 44 24 0c          	mov    %eax,0xc(%esp)
     a83:	e8 c8 fb ff ff       	call   650 <gettoken>
    cmd = pipecmd(cmd, parsepipe(ps, es));
     a88:	89 74 24 04          	mov    %esi,0x4(%esp)
     a8c:	89 1c 24             	mov    %ebx,(%esp)
     a8f:	e8 8c ff ff ff       	call   a20 <parsepipe>
}
     a94:	8b 5d f4             	mov    -0xc(%ebp),%ebx
    cmd = pipecmd(cmd, parsepipe(ps, es));
     a97:	89 7d 08             	mov    %edi,0x8(%ebp)
}
     a9a:	8b 75 f8             	mov    -0x8(%ebp),%esi
     a9d:	8b 7d fc             	mov    -0x4(%ebp),%edi
    cmd = pipecmd(cmd, parsepipe(ps, es));
     aa0:	89 45 0c             	mov    %eax,0xc(%ebp)
}
     aa3:	89 ec                	mov    %ebp,%esp
     aa5:	5d                   	pop    %ebp
    cmd = pipecmd(cmd, parsepipe(ps, es));
     aa6:	e9 c5 fa ff ff       	jmp    570 <pipecmd>
     aab:	90                   	nop
     aac:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000ab0 <parseline>:
{
     ab0:	55                   	push   %ebp
     ab1:	89 e5                	mov    %esp,%ebp
     ab3:	57                   	push   %edi
     ab4:	56                   	push   %esi
     ab5:	53                   	push   %ebx
     ab6:	83 ec 1c             	sub    $0x1c,%esp
     ab9:	8b 5d 08             	mov    0x8(%ebp),%ebx
     abc:	8b 75 0c             	mov    0xc(%ebp),%esi
  cmd = parsepipe(ps, es);
     abf:	89 1c 24             	mov    %ebx,(%esp)
     ac2:	89 74 24 04          	mov    %esi,0x4(%esp)
     ac6:	e8 55 ff ff ff       	call   a20 <parsepipe>
     acb:	89 c7                	mov    %eax,%edi
  while(peek(ps, es, "&")){
     acd:	eb 23                	jmp    af2 <parseline+0x42>
     acf:	90                   	nop
    gettoken(ps, es, 0, 0);
     ad0:	31 c0                	xor    %eax,%eax
     ad2:	89 44 24 0c          	mov    %eax,0xc(%esp)
     ad6:	31 c0                	xor    %eax,%eax
     ad8:	89 44 24 08          	mov    %eax,0x8(%esp)
     adc:	89 74 24 04          	mov    %esi,0x4(%esp)
     ae0:	89 1c 24             	mov    %ebx,(%esp)
     ae3:	e8 68 fb ff ff       	call   650 <gettoken>
    cmd = backcmd(cmd);
     ae8:	89 3c 24             	mov    %edi,(%esp)
     aeb:	e8 20 fb ff ff       	call   610 <backcmd>
     af0:	89 c7                	mov    %eax,%edi
  while(peek(ps, es, "&")){
     af2:	b8 e0 14 00 00       	mov    $0x14e0,%eax
     af7:	89 44 24 08          	mov    %eax,0x8(%esp)
     afb:	89 74 24 04          	mov    %esi,0x4(%esp)
     aff:	89 1c 24             	mov    %ebx,(%esp)
     b02:	e8 a9 fc ff ff       	call   7b0 <peek>
     b07:	85 c0                	test   %eax,%eax
     b09:	75 c5                	jne    ad0 <parseline+0x20>
  if(peek(ps, es, ";")){
     b0b:	b9 dc 14 00 00       	mov    $0x14dc,%ecx
     b10:	89 4c 24 08          	mov    %ecx,0x8(%esp)
     b14:	89 74 24 04          	mov    %esi,0x4(%esp)
     b18:	89 1c 24             	mov    %ebx,(%esp)
     b1b:	e8 90 fc ff ff       	call   7b0 <peek>
     b20:	85 c0                	test   %eax,%eax
     b22:	75 0c                	jne    b30 <parseline+0x80>
}
     b24:	83 c4 1c             	add    $0x1c,%esp
     b27:	89 f8                	mov    %edi,%eax
     b29:	5b                   	pop    %ebx
     b2a:	5e                   	pop    %esi
     b2b:	5f                   	pop    %edi
     b2c:	5d                   	pop    %ebp
     b2d:	c3                   	ret    
     b2e:	66 90                	xchg   %ax,%ax
    gettoken(ps, es, 0, 0);
     b30:	31 d2                	xor    %edx,%edx
     b32:	31 c0                	xor    %eax,%eax
     b34:	89 54 24 08          	mov    %edx,0x8(%esp)
     b38:	89 74 24 04          	mov    %esi,0x4(%esp)
     b3c:	89 1c 24             	mov    %ebx,(%esp)
     b3f:	89 44 24 0c          	mov    %eax,0xc(%esp)
     b43:	e8 08 fb ff ff       	call   650 <gettoken>
    cmd = listcmd(cmd, parseline(ps, es));
     b48:	89 74 24 04          	mov    %esi,0x4(%esp)
     b4c:	89 1c 24             	mov    %ebx,(%esp)
     b4f:	e8 5c ff ff ff       	call   ab0 <parseline>
     b54:	89 7d 08             	mov    %edi,0x8(%ebp)
     b57:	89 45 0c             	mov    %eax,0xc(%ebp)
}
     b5a:	83 c4 1c             	add    $0x1c,%esp
     b5d:	5b                   	pop    %ebx
     b5e:	5e                   	pop    %esi
     b5f:	5f                   	pop    %edi
     b60:	5d                   	pop    %ebp
    cmd = listcmd(cmd, parseline(ps, es));
     b61:	e9 5a fa ff ff       	jmp    5c0 <listcmd>
     b66:	8d 76 00             	lea    0x0(%esi),%esi
     b69:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000b70 <parseblock>:
{
     b70:	55                   	push   %ebp
  if(!peek(ps, es, "("))
     b71:	b8 c2 14 00 00       	mov    $0x14c2,%eax
{
     b76:	89 e5                	mov    %esp,%ebp
     b78:	83 ec 28             	sub    $0x28,%esp
     b7b:	89 5d f4             	mov    %ebx,-0xc(%ebp)
     b7e:	8b 5d 08             	mov    0x8(%ebp),%ebx
     b81:	89 75 f8             	mov    %esi,-0x8(%ebp)
     b84:	8b 75 0c             	mov    0xc(%ebp),%esi
  if(!peek(ps, es, "("))
     b87:	89 44 24 08          	mov    %eax,0x8(%esp)
{
     b8b:	89 7d fc             	mov    %edi,-0x4(%ebp)
  if(!peek(ps, es, "("))
     b8e:	89 1c 24             	mov    %ebx,(%esp)
     b91:	89 74 24 04          	mov    %esi,0x4(%esp)
     b95:	e8 16 fc ff ff       	call   7b0 <peek>
     b9a:	85 c0                	test   %eax,%eax
     b9c:	74 74                	je     c12 <parseblock+0xa2>
  gettoken(ps, es, 0, 0);
     b9e:	31 c9                	xor    %ecx,%ecx
     ba0:	31 ff                	xor    %edi,%edi
     ba2:	89 4c 24 0c          	mov    %ecx,0xc(%esp)
     ba6:	89 7c 24 08          	mov    %edi,0x8(%esp)
     baa:	89 74 24 04          	mov    %esi,0x4(%esp)
     bae:	89 1c 24             	mov    %ebx,(%esp)
     bb1:	e8 9a fa ff ff       	call   650 <gettoken>
  cmd = parseline(ps, es);
     bb6:	89 74 24 04          	mov    %esi,0x4(%esp)
     bba:	89 1c 24             	mov    %ebx,(%esp)
     bbd:	e8 ee fe ff ff       	call   ab0 <parseline>
  if(!peek(ps, es, ")"))
     bc2:	89 74 24 04          	mov    %esi,0x4(%esp)
     bc6:	89 1c 24             	mov    %ebx,(%esp)
  cmd = parseline(ps, es);
     bc9:	89 c7                	mov    %eax,%edi
  if(!peek(ps, es, ")"))
     bcb:	b8 fe 14 00 00       	mov    $0x14fe,%eax
     bd0:	89 44 24 08          	mov    %eax,0x8(%esp)
     bd4:	e8 d7 fb ff ff       	call   7b0 <peek>
     bd9:	85 c0                	test   %eax,%eax
     bdb:	74 41                	je     c1e <parseblock+0xae>
  gettoken(ps, es, 0, 0);
     bdd:	31 d2                	xor    %edx,%edx
     bdf:	31 c0                	xor    %eax,%eax
     be1:	89 54 24 08          	mov    %edx,0x8(%esp)
     be5:	89 74 24 04          	mov    %esi,0x4(%esp)
     be9:	89 1c 24             	mov    %ebx,(%esp)
     bec:	89 44 24 0c          	mov    %eax,0xc(%esp)
     bf0:	e8 5b fa ff ff       	call   650 <gettoken>
  cmd = parseredirs(cmd, ps, es);
     bf5:	89 74 24 08          	mov    %esi,0x8(%esp)
     bf9:	89 5c 24 04          	mov    %ebx,0x4(%esp)
     bfd:	89 3c 24             	mov    %edi,(%esp)
     c00:	e8 1b fc ff ff       	call   820 <parseredirs>
}
     c05:	8b 5d f4             	mov    -0xc(%ebp),%ebx
     c08:	8b 75 f8             	mov    -0x8(%ebp),%esi
     c0b:	8b 7d fc             	mov    -0x4(%ebp),%edi
     c0e:	89 ec                	mov    %ebp,%esp
     c10:	5d                   	pop    %ebp
     c11:	c3                   	ret    
    panic("parseblock");
     c12:	c7 04 24 e2 14 00 00 	movl   $0x14e2,(%esp)
     c19:	e8 62 f5 ff ff       	call   180 <panic>
    panic("syntax - missing )");
     c1e:	c7 04 24 ed 14 00 00 	movl   $0x14ed,(%esp)
     c25:	e8 56 f5 ff ff       	call   180 <panic>
     c2a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00000c30 <nulterminate>:

// NUL-terminate all the counted strings.
struct cmd*
nulterminate(struct cmd *cmd)
{
     c30:	55                   	push   %ebp
     c31:	89 e5                	mov    %esp,%ebp
     c33:	53                   	push   %ebx
     c34:	83 ec 14             	sub    $0x14,%esp
     c37:	8b 5d 08             	mov    0x8(%ebp),%ebx
  struct execcmd *ecmd;
  struct listcmd *lcmd;
  struct pipecmd *pcmd;
  struct redircmd *rcmd;

  if(cmd == 0)
     c3a:	85 db                	test   %ebx,%ebx
     c3c:	74 1d                	je     c5b <nulterminate+0x2b>
    return 0;

  switch(cmd->type){
     c3e:	83 3b 05             	cmpl   $0x5,(%ebx)
     c41:	77 18                	ja     c5b <nulterminate+0x2b>
     c43:	8b 03                	mov    (%ebx),%eax
     c45:	ff 24 85 40 15 00 00 	jmp    *0x1540(,%eax,4)
     c4c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    nulterminate(lcmd->right);
    break;

  case BACK:
    bcmd = (struct backcmd*)cmd;
    nulterminate(bcmd->cmd);
     c50:	8b 43 04             	mov    0x4(%ebx),%eax
     c53:	89 04 24             	mov    %eax,(%esp)
     c56:	e8 d5 ff ff ff       	call   c30 <nulterminate>
    break;
  }
  return cmd;
}
     c5b:	83 c4 14             	add    $0x14,%esp
     c5e:	89 d8                	mov    %ebx,%eax
     c60:	5b                   	pop    %ebx
     c61:	5d                   	pop    %ebp
     c62:	c3                   	ret    
     c63:	90                   	nop
     c64:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    nulterminate(lcmd->left);
     c68:	8b 43 04             	mov    0x4(%ebx),%eax
     c6b:	89 04 24             	mov    %eax,(%esp)
     c6e:	e8 bd ff ff ff       	call   c30 <nulterminate>
    nulterminate(lcmd->right);
     c73:	8b 43 08             	mov    0x8(%ebx),%eax
     c76:	89 04 24             	mov    %eax,(%esp)
     c79:	e8 b2 ff ff ff       	call   c30 <nulterminate>
}
     c7e:	83 c4 14             	add    $0x14,%esp
     c81:	89 d8                	mov    %ebx,%eax
     c83:	5b                   	pop    %ebx
     c84:	5d                   	pop    %ebp
     c85:	c3                   	ret    
     c86:	8d 76 00             	lea    0x0(%esi),%esi
     c89:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    for(i=0; ecmd->argv[i]; i++)
     c90:	8b 4b 04             	mov    0x4(%ebx),%ecx
     c93:	8d 43 08             	lea    0x8(%ebx),%eax
     c96:	85 c9                	test   %ecx,%ecx
     c98:	74 c1                	je     c5b <nulterminate+0x2b>
     c9a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      *ecmd->eargv[i] = 0;
     ca0:	8b 50 24             	mov    0x24(%eax),%edx
     ca3:	83 c0 04             	add    $0x4,%eax
     ca6:	c6 02 00             	movb   $0x0,(%edx)
    for(i=0; ecmd->argv[i]; i++)
     ca9:	8b 50 fc             	mov    -0x4(%eax),%edx
     cac:	85 d2                	test   %edx,%edx
     cae:	75 f0                	jne    ca0 <nulterminate+0x70>
}
     cb0:	83 c4 14             	add    $0x14,%esp
     cb3:	89 d8                	mov    %ebx,%eax
     cb5:	5b                   	pop    %ebx
     cb6:	5d                   	pop    %ebp
     cb7:	c3                   	ret    
     cb8:	90                   	nop
     cb9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    nulterminate(rcmd->cmd);
     cc0:	8b 43 04             	mov    0x4(%ebx),%eax
     cc3:	89 04 24             	mov    %eax,(%esp)
     cc6:	e8 65 ff ff ff       	call   c30 <nulterminate>
    *rcmd->efile = 0;
     ccb:	8b 43 0c             	mov    0xc(%ebx),%eax
     cce:	c6 00 00             	movb   $0x0,(%eax)
}
     cd1:	83 c4 14             	add    $0x14,%esp
     cd4:	89 d8                	mov    %ebx,%eax
     cd6:	5b                   	pop    %ebx
     cd7:	5d                   	pop    %ebp
     cd8:	c3                   	ret    
     cd9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000ce0 <parsecmd>:
{
     ce0:	55                   	push   %ebp
     ce1:	89 e5                	mov    %esp,%ebp
     ce3:	56                   	push   %esi
     ce4:	53                   	push   %ebx
     ce5:	83 ec 10             	sub    $0x10,%esp
  es = s + strlen(s);
     ce8:	8b 5d 08             	mov    0x8(%ebp),%ebx
     ceb:	89 1c 24             	mov    %ebx,(%esp)
     cee:	e8 cd 00 00 00       	call   dc0 <strlen>
     cf3:	01 c3                	add    %eax,%ebx
  cmd = parseline(&s, es);
     cf5:	8d 45 08             	lea    0x8(%ebp),%eax
     cf8:	89 5c 24 04          	mov    %ebx,0x4(%esp)
     cfc:	89 04 24             	mov    %eax,(%esp)
     cff:	e8 ac fd ff ff       	call   ab0 <parseline>
  peek(&s, es, "");
     d04:	89 5c 24 04          	mov    %ebx,0x4(%esp)
  cmd = parseline(&s, es);
     d08:	89 c6                	mov    %eax,%esi
  peek(&s, es, "");
     d0a:	b8 87 14 00 00       	mov    $0x1487,%eax
     d0f:	89 44 24 08          	mov    %eax,0x8(%esp)
     d13:	8d 45 08             	lea    0x8(%ebp),%eax
     d16:	89 04 24             	mov    %eax,(%esp)
     d19:	e8 92 fa ff ff       	call   7b0 <peek>
  if(s != es){
     d1e:	8b 45 08             	mov    0x8(%ebp),%eax
     d21:	39 d8                	cmp    %ebx,%eax
     d23:	75 11                	jne    d36 <parsecmd+0x56>
  nulterminate(cmd);
     d25:	89 34 24             	mov    %esi,(%esp)
     d28:	e8 03 ff ff ff       	call   c30 <nulterminate>
}
     d2d:	83 c4 10             	add    $0x10,%esp
     d30:	89 f0                	mov    %esi,%eax
     d32:	5b                   	pop    %ebx
     d33:	5e                   	pop    %esi
     d34:	5d                   	pop    %ebp
     d35:	c3                   	ret    
    printf(2, "leftovers: %s\n", s);
     d36:	89 44 24 08          	mov    %eax,0x8(%esp)
     d3a:	c7 44 24 04 00 15 00 	movl   $0x1500,0x4(%esp)
     d41:	00 
     d42:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
     d49:	e8 a2 03 00 00       	call   10f0 <printf>
    panic("syntax");
     d4e:	c7 04 24 c4 14 00 00 	movl   $0x14c4,(%esp)
     d55:	e8 26 f4 ff ff       	call   180 <panic>
     d5a:	66 90                	xchg   %ax,%ax
     d5c:	66 90                	xchg   %ax,%ax
     d5e:	66 90                	xchg   %ax,%ax

00000d60 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, const char *t)
{
     d60:	55                   	push   %ebp
     d61:	89 e5                	mov    %esp,%ebp
     d63:	8b 45 08             	mov    0x8(%ebp),%eax
     d66:	8b 4d 0c             	mov    0xc(%ebp),%ecx
     d69:	53                   	push   %ebx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
     d6a:	89 c2                	mov    %eax,%edx
     d6c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
     d70:	41                   	inc    %ecx
     d71:	0f b6 59 ff          	movzbl -0x1(%ecx),%ebx
     d75:	42                   	inc    %edx
     d76:	84 db                	test   %bl,%bl
     d78:	88 5a ff             	mov    %bl,-0x1(%edx)
     d7b:	75 f3                	jne    d70 <strcpy+0x10>
    ;
  return os;
}
     d7d:	5b                   	pop    %ebx
     d7e:	5d                   	pop    %ebp
     d7f:	c3                   	ret    

00000d80 <strcmp>:

int
strcmp(const char *p, const char *q)
{
     d80:	55                   	push   %ebp
     d81:	89 e5                	mov    %esp,%ebp
     d83:	8b 4d 08             	mov    0x8(%ebp),%ecx
     d86:	53                   	push   %ebx
     d87:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  while(*p && *p == *q)
     d8a:	0f b6 01             	movzbl (%ecx),%eax
     d8d:	0f b6 13             	movzbl (%ebx),%edx
     d90:	84 c0                	test   %al,%al
     d92:	75 18                	jne    dac <strcmp+0x2c>
     d94:	eb 22                	jmp    db8 <strcmp+0x38>
     d96:	8d 76 00             	lea    0x0(%esi),%esi
     d99:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    p++, q++;
     da0:	41                   	inc    %ecx
  while(*p && *p == *q)
     da1:	0f b6 01             	movzbl (%ecx),%eax
    p++, q++;
     da4:	43                   	inc    %ebx
     da5:	0f b6 13             	movzbl (%ebx),%edx
  while(*p && *p == *q)
     da8:	84 c0                	test   %al,%al
     daa:	74 0c                	je     db8 <strcmp+0x38>
     dac:	38 d0                	cmp    %dl,%al
     dae:	74 f0                	je     da0 <strcmp+0x20>
  return (uchar)*p - (uchar)*q;
}
     db0:	5b                   	pop    %ebx
  return (uchar)*p - (uchar)*q;
     db1:	29 d0                	sub    %edx,%eax
}
     db3:	5d                   	pop    %ebp
     db4:	c3                   	ret    
     db5:	8d 76 00             	lea    0x0(%esi),%esi
     db8:	5b                   	pop    %ebx
     db9:	31 c0                	xor    %eax,%eax
  return (uchar)*p - (uchar)*q;
     dbb:	29 d0                	sub    %edx,%eax
}
     dbd:	5d                   	pop    %ebp
     dbe:	c3                   	ret    
     dbf:	90                   	nop

00000dc0 <strlen>:

uint
strlen(const char *s)
{
     dc0:	55                   	push   %ebp
     dc1:	89 e5                	mov    %esp,%ebp
     dc3:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
     dc6:	80 39 00             	cmpb   $0x0,(%ecx)
     dc9:	74 15                	je     de0 <strlen+0x20>
     dcb:	31 d2                	xor    %edx,%edx
     dcd:	8d 76 00             	lea    0x0(%esi),%esi
     dd0:	42                   	inc    %edx
     dd1:	80 3c 11 00          	cmpb   $0x0,(%ecx,%edx,1)
     dd5:	89 d0                	mov    %edx,%eax
     dd7:	75 f7                	jne    dd0 <strlen+0x10>
    ;
  return n;
}
     dd9:	5d                   	pop    %ebp
     dda:	c3                   	ret    
     ddb:	90                   	nop
     ddc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  for(n = 0; s[n]; n++)
     de0:	31 c0                	xor    %eax,%eax
}
     de2:	5d                   	pop    %ebp
     de3:	c3                   	ret    
     de4:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
     dea:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

00000df0 <memset>:

void*
memset(void *dst, int c, uint n)
{
     df0:	55                   	push   %ebp
     df1:	89 e5                	mov    %esp,%ebp
     df3:	8b 55 08             	mov    0x8(%ebp),%edx
     df6:	57                   	push   %edi
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
     df7:	8b 4d 10             	mov    0x10(%ebp),%ecx
     dfa:	8b 45 0c             	mov    0xc(%ebp),%eax
     dfd:	89 d7                	mov    %edx,%edi
     dff:	fc                   	cld    
     e00:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
     e02:	5f                   	pop    %edi
     e03:	89 d0                	mov    %edx,%eax
     e05:	5d                   	pop    %ebp
     e06:	c3                   	ret    
     e07:	89 f6                	mov    %esi,%esi
     e09:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000e10 <strchr>:

char*
strchr(const char *s, char c)
{
     e10:	55                   	push   %ebp
     e11:	89 e5                	mov    %esp,%ebp
     e13:	8b 45 08             	mov    0x8(%ebp),%eax
     e16:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
     e1a:	0f b6 10             	movzbl (%eax),%edx
     e1d:	84 d2                	test   %dl,%dl
     e1f:	74 1b                	je     e3c <strchr+0x2c>
    if(*s == c)
     e21:	38 d1                	cmp    %dl,%cl
     e23:	75 0f                	jne    e34 <strchr+0x24>
     e25:	eb 17                	jmp    e3e <strchr+0x2e>
     e27:	89 f6                	mov    %esi,%esi
     e29:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
     e30:	38 ca                	cmp    %cl,%dl
     e32:	74 0a                	je     e3e <strchr+0x2e>
  for(; *s; s++)
     e34:	40                   	inc    %eax
     e35:	0f b6 10             	movzbl (%eax),%edx
     e38:	84 d2                	test   %dl,%dl
     e3a:	75 f4                	jne    e30 <strchr+0x20>
      return (char*)s;
  return 0;
     e3c:	31 c0                	xor    %eax,%eax
}
     e3e:	5d                   	pop    %ebp
     e3f:	c3                   	ret    

00000e40 <gets>:

char*
gets(char *buf, int max)
{
     e40:	55                   	push   %ebp
     e41:	89 e5                	mov    %esp,%ebp
     e43:	57                   	push   %edi
     e44:	56                   	push   %esi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
     e45:	31 f6                	xor    %esi,%esi
{
     e47:	53                   	push   %ebx
     e48:	83 ec 3c             	sub    $0x3c,%esp
     e4b:	8b 5d 08             	mov    0x8(%ebp),%ebx
    cc = read(0, &c, 1);
     e4e:	8d 7d e7             	lea    -0x19(%ebp),%edi
  for(i=0; i+1 < max; ){
     e51:	eb 32                	jmp    e85 <gets+0x45>
     e53:	90                   	nop
     e54:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    cc = read(0, &c, 1);
     e58:	ba 01 00 00 00       	mov    $0x1,%edx
     e5d:	89 54 24 08          	mov    %edx,0x8(%esp)
     e61:	89 7c 24 04          	mov    %edi,0x4(%esp)
     e65:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
     e6c:	e8 2f 01 00 00       	call   fa0 <read>
    if(cc < 1)
     e71:	85 c0                	test   %eax,%eax
     e73:	7e 19                	jle    e8e <gets+0x4e>
      break;
    buf[i++] = c;
     e75:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
     e79:	43                   	inc    %ebx
     e7a:	88 43 ff             	mov    %al,-0x1(%ebx)
    if(c == '\n' || c == '\r')
     e7d:	3c 0a                	cmp    $0xa,%al
     e7f:	74 1f                	je     ea0 <gets+0x60>
     e81:	3c 0d                	cmp    $0xd,%al
     e83:	74 1b                	je     ea0 <gets+0x60>
  for(i=0; i+1 < max; ){
     e85:	46                   	inc    %esi
     e86:	3b 75 0c             	cmp    0xc(%ebp),%esi
     e89:	89 5d d4             	mov    %ebx,-0x2c(%ebp)
     e8c:	7c ca                	jl     e58 <gets+0x18>
      break;
  }
  buf[i] = '\0';
     e8e:	8b 45 d4             	mov    -0x2c(%ebp),%eax
     e91:	c6 00 00             	movb   $0x0,(%eax)
  return buf;
}
     e94:	8b 45 08             	mov    0x8(%ebp),%eax
     e97:	83 c4 3c             	add    $0x3c,%esp
     e9a:	5b                   	pop    %ebx
     e9b:	5e                   	pop    %esi
     e9c:	5f                   	pop    %edi
     e9d:	5d                   	pop    %ebp
     e9e:	c3                   	ret    
     e9f:	90                   	nop
     ea0:	8b 45 08             	mov    0x8(%ebp),%eax
     ea3:	01 c6                	add    %eax,%esi
     ea5:	89 75 d4             	mov    %esi,-0x2c(%ebp)
     ea8:	eb e4                	jmp    e8e <gets+0x4e>
     eaa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00000eb0 <stat>:

int
stat(const char *n, struct stat *st)
{
     eb0:	55                   	push   %ebp
  int fd;
  int r;

  fd = open(n, O_RDONLY);
     eb1:	31 c0                	xor    %eax,%eax
{
     eb3:	89 e5                	mov    %esp,%ebp
     eb5:	83 ec 18             	sub    $0x18,%esp
  fd = open(n, O_RDONLY);
     eb8:	89 44 24 04          	mov    %eax,0x4(%esp)
     ebc:	8b 45 08             	mov    0x8(%ebp),%eax
{
     ebf:	89 5d f8             	mov    %ebx,-0x8(%ebp)
     ec2:	89 75 fc             	mov    %esi,-0x4(%ebp)
  fd = open(n, O_RDONLY);
     ec5:	89 04 24             	mov    %eax,(%esp)
     ec8:	e8 fb 00 00 00       	call   fc8 <open>
  if(fd < 0)
     ecd:	85 c0                	test   %eax,%eax
     ecf:	78 2f                	js     f00 <stat+0x50>
     ed1:	89 c3                	mov    %eax,%ebx
    return -1;
  r = fstat(fd, st);
     ed3:	8b 45 0c             	mov    0xc(%ebp),%eax
     ed6:	89 1c 24             	mov    %ebx,(%esp)
     ed9:	89 44 24 04          	mov    %eax,0x4(%esp)
     edd:	e8 fe 00 00 00       	call   fe0 <fstat>
  close(fd);
     ee2:	89 1c 24             	mov    %ebx,(%esp)
  r = fstat(fd, st);
     ee5:	89 c6                	mov    %eax,%esi
  close(fd);
     ee7:	e8 c4 00 00 00       	call   fb0 <close>
  return r;
}
     eec:	89 f0                	mov    %esi,%eax
     eee:	8b 5d f8             	mov    -0x8(%ebp),%ebx
     ef1:	8b 75 fc             	mov    -0x4(%ebp),%esi
     ef4:	89 ec                	mov    %ebp,%esp
     ef6:	5d                   	pop    %ebp
     ef7:	c3                   	ret    
     ef8:	90                   	nop
     ef9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    return -1;
     f00:	be ff ff ff ff       	mov    $0xffffffff,%esi
     f05:	eb e5                	jmp    eec <stat+0x3c>
     f07:	89 f6                	mov    %esi,%esi
     f09:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000f10 <atoi>:

int
atoi(const char *s)
{
     f10:	55                   	push   %ebp
     f11:	89 e5                	mov    %esp,%ebp
     f13:	8b 4d 08             	mov    0x8(%ebp),%ecx
     f16:	53                   	push   %ebx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
     f17:	0f be 11             	movsbl (%ecx),%edx
     f1a:	88 d0                	mov    %dl,%al
     f1c:	2c 30                	sub    $0x30,%al
     f1e:	3c 09                	cmp    $0x9,%al
  n = 0;
     f20:	b8 00 00 00 00       	mov    $0x0,%eax
  while('0' <= *s && *s <= '9')
     f25:	77 1e                	ja     f45 <atoi+0x35>
     f27:	89 f6                	mov    %esi,%esi
     f29:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    n = n*10 + *s++ - '0';
     f30:	41                   	inc    %ecx
     f31:	8d 04 80             	lea    (%eax,%eax,4),%eax
     f34:	8d 44 42 d0          	lea    -0x30(%edx,%eax,2),%eax
  while('0' <= *s && *s <= '9')
     f38:	0f be 11             	movsbl (%ecx),%edx
     f3b:	88 d3                	mov    %dl,%bl
     f3d:	80 eb 30             	sub    $0x30,%bl
     f40:	80 fb 09             	cmp    $0x9,%bl
     f43:	76 eb                	jbe    f30 <atoi+0x20>
  return n;
}
     f45:	5b                   	pop    %ebx
     f46:	5d                   	pop    %ebp
     f47:	c3                   	ret    
     f48:	90                   	nop
     f49:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000f50 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
     f50:	55                   	push   %ebp
     f51:	89 e5                	mov    %esp,%ebp
     f53:	56                   	push   %esi
     f54:	8b 45 08             	mov    0x8(%ebp),%eax
     f57:	53                   	push   %ebx
     f58:	8b 5d 10             	mov    0x10(%ebp),%ebx
     f5b:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
     f5e:	85 db                	test   %ebx,%ebx
     f60:	7e 1a                	jle    f7c <memmove+0x2c>
     f62:	31 d2                	xor    %edx,%edx
     f64:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
     f6a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi
    *dst++ = *src++;
     f70:	0f b6 0c 16          	movzbl (%esi,%edx,1),%ecx
     f74:	88 0c 10             	mov    %cl,(%eax,%edx,1)
     f77:	42                   	inc    %edx
  while(n-- > 0)
     f78:	39 d3                	cmp    %edx,%ebx
     f7a:	75 f4                	jne    f70 <memmove+0x20>
  return vdst;
}
     f7c:	5b                   	pop    %ebx
     f7d:	5e                   	pop    %esi
     f7e:	5d                   	pop    %ebp
     f7f:	c3                   	ret    

00000f80 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
     f80:	b8 01 00 00 00       	mov    $0x1,%eax
     f85:	cd 40                	int    $0x40
     f87:	c3                   	ret    

00000f88 <exit>:
SYSCALL(exit)
     f88:	b8 02 00 00 00       	mov    $0x2,%eax
     f8d:	cd 40                	int    $0x40
     f8f:	c3                   	ret    

00000f90 <wait>:
SYSCALL(wait)
     f90:	b8 03 00 00 00       	mov    $0x3,%eax
     f95:	cd 40                	int    $0x40
     f97:	c3                   	ret    

00000f98 <pipe>:
SYSCALL(pipe)
     f98:	b8 04 00 00 00       	mov    $0x4,%eax
     f9d:	cd 40                	int    $0x40
     f9f:	c3                   	ret    

00000fa0 <read>:
SYSCALL(read)
     fa0:	b8 05 00 00 00       	mov    $0x5,%eax
     fa5:	cd 40                	int    $0x40
     fa7:	c3                   	ret    

00000fa8 <write>:
SYSCALL(write)
     fa8:	b8 10 00 00 00       	mov    $0x10,%eax
     fad:	cd 40                	int    $0x40
     faf:	c3                   	ret    

00000fb0 <close>:
SYSCALL(close)
     fb0:	b8 15 00 00 00       	mov    $0x15,%eax
     fb5:	cd 40                	int    $0x40
     fb7:	c3                   	ret    

00000fb8 <kill>:
SYSCALL(kill)
     fb8:	b8 06 00 00 00       	mov    $0x6,%eax
     fbd:	cd 40                	int    $0x40
     fbf:	c3                   	ret    

00000fc0 <exec>:
SYSCALL(exec)
     fc0:	b8 07 00 00 00       	mov    $0x7,%eax
     fc5:	cd 40                	int    $0x40
     fc7:	c3                   	ret    

00000fc8 <open>:
SYSCALL(open)
     fc8:	b8 0f 00 00 00       	mov    $0xf,%eax
     fcd:	cd 40                	int    $0x40
     fcf:	c3                   	ret    

00000fd0 <mknod>:
SYSCALL(mknod)
     fd0:	b8 11 00 00 00       	mov    $0x11,%eax
     fd5:	cd 40                	int    $0x40
     fd7:	c3                   	ret    

00000fd8 <unlink>:
SYSCALL(unlink)
     fd8:	b8 12 00 00 00       	mov    $0x12,%eax
     fdd:	cd 40                	int    $0x40
     fdf:	c3                   	ret    

00000fe0 <fstat>:
SYSCALL(fstat)
     fe0:	b8 08 00 00 00       	mov    $0x8,%eax
     fe5:	cd 40                	int    $0x40
     fe7:	c3                   	ret    

00000fe8 <link>:
SYSCALL(link)
     fe8:	b8 13 00 00 00       	mov    $0x13,%eax
     fed:	cd 40                	int    $0x40
     fef:	c3                   	ret    

00000ff0 <mkdir>:
SYSCALL(mkdir)
     ff0:	b8 14 00 00 00       	mov    $0x14,%eax
     ff5:	cd 40                	int    $0x40
     ff7:	c3                   	ret    

00000ff8 <chdir>:
SYSCALL(chdir)
     ff8:	b8 09 00 00 00       	mov    $0x9,%eax
     ffd:	cd 40                	int    $0x40
     fff:	c3                   	ret    

00001000 <dup>:
SYSCALL(dup)
    1000:	b8 0a 00 00 00       	mov    $0xa,%eax
    1005:	cd 40                	int    $0x40
    1007:	c3                   	ret    

00001008 <getpid>:
SYSCALL(getpid)
    1008:	b8 0b 00 00 00       	mov    $0xb,%eax
    100d:	cd 40                	int    $0x40
    100f:	c3                   	ret    

00001010 <sbrk>:
SYSCALL(sbrk)
    1010:	b8 0c 00 00 00       	mov    $0xc,%eax
    1015:	cd 40                	int    $0x40
    1017:	c3                   	ret    

00001018 <sleep>:
SYSCALL(sleep)
    1018:	b8 0d 00 00 00       	mov    $0xd,%eax
    101d:	cd 40                	int    $0x40
    101f:	c3                   	ret    

00001020 <uptime>:
SYSCALL(uptime)
    1020:	b8 0e 00 00 00       	mov    $0xe,%eax
    1025:	cd 40                	int    $0x40
    1027:	c3                   	ret    

00001028 <detach>:
SYSCALL(detach)
    1028:	b8 16 00 00 00       	mov    $0x16,%eax
    102d:	cd 40                	int    $0x40
    102f:	c3                   	ret    

00001030 <policy>:
SYSCALL(policy)
    1030:	b8 17 00 00 00       	mov    $0x17,%eax
    1035:	cd 40                	int    $0x40
    1037:	c3                   	ret    

00001038 <priority>:
SYSCALL(priority)
    1038:	b8 18 00 00 00       	mov    $0x18,%eax
    103d:	cd 40                	int    $0x40
    103f:	c3                   	ret    

00001040 <wait_stat>:
SYSCALL(wait_stat)
    1040:	b8 19 00 00 00       	mov    $0x19,%eax
    1045:	cd 40                	int    $0x40
    1047:	c3                   	ret    
    1048:	66 90                	xchg   %ax,%ax
    104a:	66 90                	xchg   %ax,%ax
    104c:	66 90                	xchg   %ax,%ax
    104e:	66 90                	xchg   %ax,%ax

00001050 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
    1050:	55                   	push   %ebp
    1051:	89 e5                	mov    %esp,%ebp
    1053:	57                   	push   %edi
    1054:	56                   	push   %esi
    1055:	53                   	push   %ebx
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    1056:	89 d3                	mov    %edx,%ebx
    1058:	c1 eb 1f             	shr    $0x1f,%ebx
{
    105b:	83 ec 4c             	sub    $0x4c,%esp
  if(sgn && xx < 0){
    105e:	84 db                	test   %bl,%bl
{
    1060:	89 45 c0             	mov    %eax,-0x40(%ebp)
    1063:	89 d0                	mov    %edx,%eax
  if(sgn && xx < 0){
    1065:	74 79                	je     10e0 <printint+0x90>
    1067:	f6 45 08 01          	testb  $0x1,0x8(%ebp)
    106b:	74 73                	je     10e0 <printint+0x90>
    neg = 1;
    x = -xx;
    106d:	f7 d8                	neg    %eax
    neg = 1;
    106f:	c7 45 c4 01 00 00 00 	movl   $0x1,-0x3c(%ebp)
  } else {
    x = xx;
  }

  i = 0;
    1076:	31 f6                	xor    %esi,%esi
    1078:	8d 5d d7             	lea    -0x29(%ebp),%ebx
    107b:	eb 05                	jmp    1082 <printint+0x32>
    107d:	8d 76 00             	lea    0x0(%esi),%esi
  do{
    buf[i++] = digits[x % base];
    1080:	89 fe                	mov    %edi,%esi
    1082:	31 d2                	xor    %edx,%edx
    1084:	f7 f1                	div    %ecx
    1086:	8d 7e 01             	lea    0x1(%esi),%edi
    1089:	0f b6 92 60 15 00 00 	movzbl 0x1560(%edx),%edx
  }while((x /= base) != 0);
    1090:	85 c0                	test   %eax,%eax
    buf[i++] = digits[x % base];
    1092:	88 14 3b             	mov    %dl,(%ebx,%edi,1)
  }while((x /= base) != 0);
    1095:	75 e9                	jne    1080 <printint+0x30>
  if(neg)
    1097:	8b 55 c4             	mov    -0x3c(%ebp),%edx
    109a:	85 d2                	test   %edx,%edx
    109c:	74 08                	je     10a6 <printint+0x56>
    buf[i++] = '-';
    109e:	c6 44 3d d8 2d       	movb   $0x2d,-0x28(%ebp,%edi,1)
    10a3:	8d 7e 02             	lea    0x2(%esi),%edi
    10a6:	8d 74 3d d7          	lea    -0x29(%ebp,%edi,1),%esi
    10aa:	8b 7d c0             	mov    -0x40(%ebp),%edi
    10ad:	8d 76 00             	lea    0x0(%esi),%esi
    10b0:	0f b6 06             	movzbl (%esi),%eax
    10b3:	4e                   	dec    %esi
  write(fd, &c, 1);
    10b4:	89 5c 24 04          	mov    %ebx,0x4(%esp)
    10b8:	89 3c 24             	mov    %edi,(%esp)
    10bb:	88 45 d7             	mov    %al,-0x29(%ebp)
    10be:	b8 01 00 00 00       	mov    $0x1,%eax
    10c3:	89 44 24 08          	mov    %eax,0x8(%esp)
    10c7:	e8 dc fe ff ff       	call   fa8 <write>

  while(--i >= 0)
    10cc:	39 de                	cmp    %ebx,%esi
    10ce:	75 e0                	jne    10b0 <printint+0x60>
    putc(fd, buf[i]);
}
    10d0:	83 c4 4c             	add    $0x4c,%esp
    10d3:	5b                   	pop    %ebx
    10d4:	5e                   	pop    %esi
    10d5:	5f                   	pop    %edi
    10d6:	5d                   	pop    %ebp
    10d7:	c3                   	ret    
    10d8:	90                   	nop
    10d9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
    10e0:	c7 45 c4 00 00 00 00 	movl   $0x0,-0x3c(%ebp)
    10e7:	eb 8d                	jmp    1076 <printint+0x26>
    10e9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

000010f0 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
    10f0:	55                   	push   %ebp
    10f1:	89 e5                	mov    %esp,%ebp
    10f3:	57                   	push   %edi
    10f4:	56                   	push   %esi
    10f5:	53                   	push   %ebx
    10f6:	83 ec 3c             	sub    $0x3c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    10f9:	8b 75 0c             	mov    0xc(%ebp),%esi
    10fc:	0f b6 1e             	movzbl (%esi),%ebx
    10ff:	84 db                	test   %bl,%bl
    1101:	0f 84 d1 00 00 00    	je     11d8 <printf+0xe8>
  state = 0;
    1107:	31 ff                	xor    %edi,%edi
    1109:	46                   	inc    %esi
  ap = (uint*)(void*)&fmt + 1;
    110a:	8d 45 10             	lea    0x10(%ebp),%eax
  write(fd, &c, 1);
    110d:	89 fa                	mov    %edi,%edx
    110f:	8b 7d 08             	mov    0x8(%ebp),%edi
  ap = (uint*)(void*)&fmt + 1;
    1112:	89 45 d0             	mov    %eax,-0x30(%ebp)
    1115:	eb 41                	jmp    1158 <printf+0x68>
    1117:	89 f6                	mov    %esi,%esi
    1119:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
    1120:	83 f8 25             	cmp    $0x25,%eax
    1123:	89 55 d4             	mov    %edx,-0x2c(%ebp)
        state = '%';
    1126:	ba 25 00 00 00       	mov    $0x25,%edx
      if(c == '%'){
    112b:	74 1e                	je     114b <printf+0x5b>
  write(fd, &c, 1);
    112d:	b8 01 00 00 00       	mov    $0x1,%eax
    1132:	89 44 24 08          	mov    %eax,0x8(%esp)
    1136:	8d 45 e2             	lea    -0x1e(%ebp),%eax
    1139:	89 44 24 04          	mov    %eax,0x4(%esp)
    113d:	89 3c 24             	mov    %edi,(%esp)
    1140:	88 5d e2             	mov    %bl,-0x1e(%ebp)
    1143:	e8 60 fe ff ff       	call   fa8 <write>
    1148:	8b 55 d4             	mov    -0x2c(%ebp),%edx
    114b:	46                   	inc    %esi
  for(i = 0; fmt[i]; i++){
    114c:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
    1150:	84 db                	test   %bl,%bl
    1152:	0f 84 80 00 00 00    	je     11d8 <printf+0xe8>
    if(state == 0){
    1158:	85 d2                	test   %edx,%edx
    c = fmt[i] & 0xff;
    115a:	0f be cb             	movsbl %bl,%ecx
    115d:	0f b6 c3             	movzbl %bl,%eax
    if(state == 0){
    1160:	74 be                	je     1120 <printf+0x30>
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
    1162:	83 fa 25             	cmp    $0x25,%edx
    1165:	75 e4                	jne    114b <printf+0x5b>
      if(c == 'd'){
    1167:	83 f8 64             	cmp    $0x64,%eax
    116a:	0f 84 f0 00 00 00    	je     1260 <printf+0x170>
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
    1170:	81 e1 f7 00 00 00    	and    $0xf7,%ecx
    1176:	83 f9 70             	cmp    $0x70,%ecx
    1179:	74 65                	je     11e0 <printf+0xf0>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
    117b:	83 f8 73             	cmp    $0x73,%eax
    117e:	0f 84 8c 00 00 00    	je     1210 <printf+0x120>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
    1184:	83 f8 63             	cmp    $0x63,%eax
    1187:	0f 84 13 01 00 00    	je     12a0 <printf+0x1b0>
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
    118d:	83 f8 25             	cmp    $0x25,%eax
    1190:	0f 84 e2 00 00 00    	je     1278 <printf+0x188>
  write(fd, &c, 1);
    1196:	b8 01 00 00 00       	mov    $0x1,%eax
    119b:	46                   	inc    %esi
    119c:	89 44 24 08          	mov    %eax,0x8(%esp)
    11a0:	8d 45 e7             	lea    -0x19(%ebp),%eax
    11a3:	89 44 24 04          	mov    %eax,0x4(%esp)
    11a7:	89 3c 24             	mov    %edi,(%esp)
    11aa:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
    11ae:	e8 f5 fd ff ff       	call   fa8 <write>
    11b3:	ba 01 00 00 00       	mov    $0x1,%edx
    11b8:	8d 45 e6             	lea    -0x1a(%ebp),%eax
    11bb:	89 54 24 08          	mov    %edx,0x8(%esp)
    11bf:	89 44 24 04          	mov    %eax,0x4(%esp)
    11c3:	89 3c 24             	mov    %edi,(%esp)
    11c6:	88 5d e6             	mov    %bl,-0x1a(%ebp)
    11c9:	e8 da fd ff ff       	call   fa8 <write>
  for(i = 0; fmt[i]; i++){
    11ce:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
    11d2:	31 d2                	xor    %edx,%edx
  for(i = 0; fmt[i]; i++){
    11d4:	84 db                	test   %bl,%bl
    11d6:	75 80                	jne    1158 <printf+0x68>
    }
  }
}
    11d8:	83 c4 3c             	add    $0x3c,%esp
    11db:	5b                   	pop    %ebx
    11dc:	5e                   	pop    %esi
    11dd:	5f                   	pop    %edi
    11de:	5d                   	pop    %ebp
    11df:	c3                   	ret    
        printint(fd, *ap, 16, 0);
    11e0:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    11e7:	b9 10 00 00 00       	mov    $0x10,%ecx
    11ec:	8b 5d d0             	mov    -0x30(%ebp),%ebx
    11ef:	89 f8                	mov    %edi,%eax
    11f1:	8b 13                	mov    (%ebx),%edx
    11f3:	e8 58 fe ff ff       	call   1050 <printint>
        ap++;
    11f8:	89 d8                	mov    %ebx,%eax
      state = 0;
    11fa:	31 d2                	xor    %edx,%edx
        ap++;
    11fc:	83 c0 04             	add    $0x4,%eax
    11ff:	89 45 d0             	mov    %eax,-0x30(%ebp)
    1202:	e9 44 ff ff ff       	jmp    114b <printf+0x5b>
    1207:	89 f6                	mov    %esi,%esi
    1209:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
        s = (char*)*ap;
    1210:	8b 45 d0             	mov    -0x30(%ebp),%eax
    1213:	8b 10                	mov    (%eax),%edx
        ap++;
    1215:	83 c0 04             	add    $0x4,%eax
    1218:	89 45 d0             	mov    %eax,-0x30(%ebp)
        if(s == 0)
    121b:	85 d2                	test   %edx,%edx
    121d:	0f 84 aa 00 00 00    	je     12cd <printf+0x1dd>
        while(*s != 0){
    1223:	0f b6 02             	movzbl (%edx),%eax
        s = (char*)*ap;
    1226:	89 d3                	mov    %edx,%ebx
        while(*s != 0){
    1228:	84 c0                	test   %al,%al
    122a:	74 27                	je     1253 <printf+0x163>
    122c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    1230:	88 45 e3             	mov    %al,-0x1d(%ebp)
  write(fd, &c, 1);
    1233:	b8 01 00 00 00       	mov    $0x1,%eax
          s++;
    1238:	43                   	inc    %ebx
  write(fd, &c, 1);
    1239:	89 44 24 08          	mov    %eax,0x8(%esp)
    123d:	8d 45 e3             	lea    -0x1d(%ebp),%eax
    1240:	89 44 24 04          	mov    %eax,0x4(%esp)
    1244:	89 3c 24             	mov    %edi,(%esp)
    1247:	e8 5c fd ff ff       	call   fa8 <write>
        while(*s != 0){
    124c:	0f b6 03             	movzbl (%ebx),%eax
    124f:	84 c0                	test   %al,%al
    1251:	75 dd                	jne    1230 <printf+0x140>
      state = 0;
    1253:	31 d2                	xor    %edx,%edx
    1255:	e9 f1 fe ff ff       	jmp    114b <printf+0x5b>
    125a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        printint(fd, *ap, 10, 1);
    1260:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    1267:	b9 0a 00 00 00       	mov    $0xa,%ecx
    126c:	e9 7b ff ff ff       	jmp    11ec <printf+0xfc>
    1271:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  write(fd, &c, 1);
    1278:	b9 01 00 00 00       	mov    $0x1,%ecx
    127d:	8d 45 e5             	lea    -0x1b(%ebp),%eax
    1280:	89 4c 24 08          	mov    %ecx,0x8(%esp)
    1284:	89 44 24 04          	mov    %eax,0x4(%esp)
    1288:	89 3c 24             	mov    %edi,(%esp)
    128b:	88 5d e5             	mov    %bl,-0x1b(%ebp)
    128e:	e8 15 fd ff ff       	call   fa8 <write>
      state = 0;
    1293:	31 d2                	xor    %edx,%edx
    1295:	e9 b1 fe ff ff       	jmp    114b <printf+0x5b>
    129a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        putc(fd, *ap);
    12a0:	8b 5d d0             	mov    -0x30(%ebp),%ebx
    12a3:	8b 03                	mov    (%ebx),%eax
        ap++;
    12a5:	83 c3 04             	add    $0x4,%ebx
  write(fd, &c, 1);
    12a8:	89 3c 24             	mov    %edi,(%esp)
        putc(fd, *ap);
    12ab:	88 45 e4             	mov    %al,-0x1c(%ebp)
  write(fd, &c, 1);
    12ae:	b8 01 00 00 00       	mov    $0x1,%eax
    12b3:	89 44 24 08          	mov    %eax,0x8(%esp)
    12b7:	8d 45 e4             	lea    -0x1c(%ebp),%eax
    12ba:	89 44 24 04          	mov    %eax,0x4(%esp)
    12be:	e8 e5 fc ff ff       	call   fa8 <write>
      state = 0;
    12c3:	31 d2                	xor    %edx,%edx
        ap++;
    12c5:	89 5d d0             	mov    %ebx,-0x30(%ebp)
    12c8:	e9 7e fe ff ff       	jmp    114b <printf+0x5b>
          s = "(null)";
    12cd:	bb 58 15 00 00       	mov    $0x1558,%ebx
        while(*s != 0){
    12d2:	b0 28                	mov    $0x28,%al
    12d4:	e9 57 ff ff ff       	jmp    1230 <printf+0x140>
    12d9:	66 90                	xchg   %ax,%ax
    12db:	66 90                	xchg   %ax,%ax
    12dd:	66 90                	xchg   %ax,%ax
    12df:	90                   	nop

000012e0 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
    12e0:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    12e1:	a1 84 1b 00 00       	mov    0x1b84,%eax
{
    12e6:	89 e5                	mov    %esp,%ebp
    12e8:	57                   	push   %edi
    12e9:	56                   	push   %esi
    12ea:	53                   	push   %ebx
    12eb:	8b 5d 08             	mov    0x8(%ebp),%ebx
  bp = (Header*)ap - 1;
    12ee:	8d 4b f8             	lea    -0x8(%ebx),%ecx
    12f1:	eb 0d                	jmp    1300 <free+0x20>
    12f3:	90                   	nop
    12f4:	90                   	nop
    12f5:	90                   	nop
    12f6:	90                   	nop
    12f7:	90                   	nop
    12f8:	90                   	nop
    12f9:	90                   	nop
    12fa:	90                   	nop
    12fb:	90                   	nop
    12fc:	90                   	nop
    12fd:	90                   	nop
    12fe:	90                   	nop
    12ff:	90                   	nop
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    1300:	39 c8                	cmp    %ecx,%eax
    1302:	8b 10                	mov    (%eax),%edx
    1304:	73 32                	jae    1338 <free+0x58>
    1306:	39 d1                	cmp    %edx,%ecx
    1308:	72 04                	jb     130e <free+0x2e>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    130a:	39 d0                	cmp    %edx,%eax
    130c:	72 32                	jb     1340 <free+0x60>
      break;
  if(bp + bp->s.size == p->s.ptr){
    130e:	8b 73 fc             	mov    -0x4(%ebx),%esi
    1311:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
    1314:	39 fa                	cmp    %edi,%edx
    1316:	74 30                	je     1348 <free+0x68>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
    1318:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
    131b:	8b 50 04             	mov    0x4(%eax),%edx
    131e:	8d 34 d0             	lea    (%eax,%edx,8),%esi
    1321:	39 f1                	cmp    %esi,%ecx
    1323:	74 3c                	je     1361 <free+0x81>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
    1325:	89 08                	mov    %ecx,(%eax)
  freep = p;
}
    1327:	5b                   	pop    %ebx
  freep = p;
    1328:	a3 84 1b 00 00       	mov    %eax,0x1b84
}
    132d:	5e                   	pop    %esi
    132e:	5f                   	pop    %edi
    132f:	5d                   	pop    %ebp
    1330:	c3                   	ret    
    1331:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    1338:	39 d0                	cmp    %edx,%eax
    133a:	72 04                	jb     1340 <free+0x60>
    133c:	39 d1                	cmp    %edx,%ecx
    133e:	72 ce                	jb     130e <free+0x2e>
{
    1340:	89 d0                	mov    %edx,%eax
    1342:	eb bc                	jmp    1300 <free+0x20>
    1344:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    bp->s.size += p->s.ptr->s.size;
    1348:	8b 7a 04             	mov    0x4(%edx),%edi
    134b:	01 fe                	add    %edi,%esi
    134d:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
    1350:	8b 10                	mov    (%eax),%edx
    1352:	8b 12                	mov    (%edx),%edx
    1354:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
    1357:	8b 50 04             	mov    0x4(%eax),%edx
    135a:	8d 34 d0             	lea    (%eax,%edx,8),%esi
    135d:	39 f1                	cmp    %esi,%ecx
    135f:	75 c4                	jne    1325 <free+0x45>
    p->s.size += bp->s.size;
    1361:	8b 4b fc             	mov    -0x4(%ebx),%ecx
  freep = p;
    1364:	a3 84 1b 00 00       	mov    %eax,0x1b84
    p->s.size += bp->s.size;
    1369:	01 ca                	add    %ecx,%edx
    136b:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
    136e:	8b 53 f8             	mov    -0x8(%ebx),%edx
    1371:	89 10                	mov    %edx,(%eax)
}
    1373:	5b                   	pop    %ebx
    1374:	5e                   	pop    %esi
    1375:	5f                   	pop    %edi
    1376:	5d                   	pop    %ebp
    1377:	c3                   	ret    
    1378:	90                   	nop
    1379:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00001380 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
    1380:	55                   	push   %ebp
    1381:	89 e5                	mov    %esp,%ebp
    1383:	57                   	push   %edi
    1384:	56                   	push   %esi
    1385:	53                   	push   %ebx
    1386:	83 ec 1c             	sub    $0x1c,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    1389:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
    138c:	8b 15 84 1b 00 00    	mov    0x1b84,%edx
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    1392:	8d 78 07             	lea    0x7(%eax),%edi
    1395:	c1 ef 03             	shr    $0x3,%edi
    1398:	47                   	inc    %edi
  if((prevp = freep) == 0){
    1399:	85 d2                	test   %edx,%edx
    139b:	0f 84 8f 00 00 00    	je     1430 <malloc+0xb0>
    13a1:	8b 02                	mov    (%edx),%eax
    13a3:	8b 48 04             	mov    0x4(%eax),%ecx
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
    13a6:	39 cf                	cmp    %ecx,%edi
    13a8:	76 66                	jbe    1410 <malloc+0x90>
    13aa:	81 ff 00 10 00 00    	cmp    $0x1000,%edi
    13b0:	bb 00 10 00 00       	mov    $0x1000,%ebx
    13b5:	0f 43 df             	cmovae %edi,%ebx
  p = sbrk(nu * sizeof(Header));
    13b8:	8d 34 dd 00 00 00 00 	lea    0x0(,%ebx,8),%esi
    13bf:	eb 10                	jmp    13d1 <malloc+0x51>
    13c1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    13c8:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
    13ca:	8b 48 04             	mov    0x4(%eax),%ecx
    13cd:	39 f9                	cmp    %edi,%ecx
    13cf:	73 3f                	jae    1410 <malloc+0x90>
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
    13d1:	39 05 84 1b 00 00    	cmp    %eax,0x1b84
    13d7:	89 c2                	mov    %eax,%edx
    13d9:	75 ed                	jne    13c8 <malloc+0x48>
  p = sbrk(nu * sizeof(Header));
    13db:	89 34 24             	mov    %esi,(%esp)
    13de:	e8 2d fc ff ff       	call   1010 <sbrk>
  if(p == (char*)-1)
    13e3:	83 f8 ff             	cmp    $0xffffffff,%eax
    13e6:	74 18                	je     1400 <malloc+0x80>
  hp->s.size = nu;
    13e8:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
    13eb:	83 c0 08             	add    $0x8,%eax
    13ee:	89 04 24             	mov    %eax,(%esp)
    13f1:	e8 ea fe ff ff       	call   12e0 <free>
  return freep;
    13f6:	8b 15 84 1b 00 00    	mov    0x1b84,%edx
      if((p = morecore(nunits)) == 0)
    13fc:	85 d2                	test   %edx,%edx
    13fe:	75 c8                	jne    13c8 <malloc+0x48>
        return 0;
  }
}
    1400:	83 c4 1c             	add    $0x1c,%esp
        return 0;
    1403:	31 c0                	xor    %eax,%eax
}
    1405:	5b                   	pop    %ebx
    1406:	5e                   	pop    %esi
    1407:	5f                   	pop    %edi
    1408:	5d                   	pop    %ebp
    1409:	c3                   	ret    
    140a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      if(p->s.size == nunits)
    1410:	39 cf                	cmp    %ecx,%edi
    1412:	74 4c                	je     1460 <malloc+0xe0>
        p->s.size -= nunits;
    1414:	29 f9                	sub    %edi,%ecx
    1416:	89 48 04             	mov    %ecx,0x4(%eax)
        p += p->s.size;
    1419:	8d 04 c8             	lea    (%eax,%ecx,8),%eax
        p->s.size = nunits;
    141c:	89 78 04             	mov    %edi,0x4(%eax)
      freep = prevp;
    141f:	89 15 84 1b 00 00    	mov    %edx,0x1b84
}
    1425:	83 c4 1c             	add    $0x1c,%esp
      return (void*)(p + 1);
    1428:	83 c0 08             	add    $0x8,%eax
}
    142b:	5b                   	pop    %ebx
    142c:	5e                   	pop    %esi
    142d:	5f                   	pop    %edi
    142e:	5d                   	pop    %ebp
    142f:	c3                   	ret    
    base.s.ptr = freep = prevp = &base;
    1430:	b8 88 1b 00 00       	mov    $0x1b88,%eax
    1435:	ba 88 1b 00 00       	mov    $0x1b88,%edx
    base.s.size = 0;
    143a:	31 c9                	xor    %ecx,%ecx
    base.s.ptr = freep = prevp = &base;
    143c:	a3 84 1b 00 00       	mov    %eax,0x1b84
    base.s.size = 0;
    1441:	b8 88 1b 00 00       	mov    $0x1b88,%eax
    base.s.ptr = freep = prevp = &base;
    1446:	89 15 88 1b 00 00    	mov    %edx,0x1b88
    base.s.size = 0;
    144c:	89 0d 8c 1b 00 00    	mov    %ecx,0x1b8c
    1452:	e9 53 ff ff ff       	jmp    13aa <malloc+0x2a>
    1457:	89 f6                	mov    %esi,%esi
    1459:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
        prevp->s.ptr = p->s.ptr;
    1460:	8b 08                	mov    (%eax),%ecx
    1462:	89 0a                	mov    %ecx,(%edx)
    1464:	eb b9                	jmp    141f <malloc+0x9f>
