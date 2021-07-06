# git测试github连通性

> https://bbs.csdn.net/topics/392383668?utm_medium=distribute.pc_relevant_t0.none-task-discussion_topic-BlogCommendFromBaidu-1.control&depth_1-utm_source=distribute.pc_relevant_t0.none-task-discussion_topic-BlogCommendFromBaidu-1.control

```bash
ssh -T git@github.com
```

在使用ssh加公钥认证时会输入`ssh -T Github.com`，认证成功后会输出如下Log。

```bash
but GitHub does not provide shell access
```

这句话的意思是，GitHub不提供shell（ssh）访问/接入权限。

ssh -T选项的意思为，不分配伪终端。当你在使用ssh协议连接到自己或者其他服务器时，本地终端会显示命令提示符，你可以在上面操作输入命令ls等。

结合上面几点，这句话的意思即为你无法使用ssh协议直接登录github，在github服务器上建立一个伪终端，并进行操作。

所以，这句提示并不是一个错误，而是github输出的一句提示语。 同样你可以在本地使用ssh协议进行git相关操作，并提交到github，没有任何影响。
