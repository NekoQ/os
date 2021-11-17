#!/bin/bash
nasm lab2.asm -f bin -o lab2.bin 
dd if=/dev/zero of=lab2.img bs=1024 count=1440 &> /dev/null
dd if=lab2.bin of=lab2.img seek=0 count=1 conv=notrunc &> /dev/null
mkdir iso
cp lab2.img iso/
mkisofs -o lab2.iso -b lab2.img iso/ &> /dev/null
rm -r lab2.img iso
red=$(tput setaf 1)
normal=$(tput sgr0)
printf "${red}lab2.bin${normal} was generated and can be used by qemu, running:\n"
printf "'qemu-system-x86_64 -fda lab2.bin'\nor"
printf "\n${red}lab2.iso${normal} was generated, that can be used in virtualbox as an optical drive"
