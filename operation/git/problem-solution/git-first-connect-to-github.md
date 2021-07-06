# git第一次连接github让其自动生成known_hosts

> https://blog.csdn.net/fearlessxmm/article/details/90401690

git 解决：The authenticity of host ‘[ssh.github.com]:443 ([192.30.253.123]:443)’ can’t be established.

换了一部电脑，git clone的时候，报了这样的错误：

```bash
The authenticity of host '[ssh.github.com]:443 ([192.30.253.123]:443)' can't be established.
RSA key fingerprint is SHA256:nThbg6kXUpJWGl7E1IGOCspRomTxdCARLviKw6E5SY8.
```

然后下面还有这样的提示：选择 yes

```bash
Are you sure you want to continue connecting (yes/no)? yes
```

原来是少了一个`known_hosts`文件，本来密钥文件应该是三个，现在是两个，便报了这样的错误，此时选择yes回车之后，便可，同时生成了缺少了的`known_hosts`文件：

然后，再试试git clone,如果还是报错的话，就将远程仓库对应的密钥删掉，重新将rsa.pub添加为新的密钥
就可以了。
