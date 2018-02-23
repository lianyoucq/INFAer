# 关闭Secure Communication

> Secure Communication 是指TLS或者SSL


## Domain上关闭Secure Communication 
有两种方式，均需要在Domain运行状态下执行
- Administrator Console

    Domain > Properties > General Properties > Enable Secure Communication

- Command
    ```shell
    $INFA_HOME/isp/bin/infacmd.sh updatedomainoptions -dn 《Domain_Name》 -un 《Administrator》 -pd 《Administrator's Password》-do TLSMode=false
    ```
    
    



