from pwn import *
from LibcSearcher import *

#第二个参数，为已泄露的实际地址,或最后12位(比如：d90)，int类型
obj = LibcSearcher("fgets", 0X7ff39014bd90)

obj.dump("system")        #system 偏移
obj.dump("str_bin_sh")    #/bin/sh 偏移
obj.dump("__libc_start_main_ret")    


# p = process("./x64.test")
# qemu-arm -g 1234 -L /usr/arm-linux-gnueabi ./arm.test
p = process(["qemu-arm", "-g", "1234", "-L", "/usr/arm-linux-gnueabi", "./arm.test"])

p.interactive()

