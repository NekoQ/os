# Lab 2

## Task
Print different messages with different colors, on different positions on the screen

### Bootable image
First thing that we needed to do is to create a simple bootloader.
Here I used 4 lines of code that make my assembly program bootable.
```asm
bits 16
org 0x7C00
...
times 510 - ($ - $$) db 0
db 0x55, 0xAA
```

`bits 16` - tells assembler that it's a 16 bit code

`org 0x7C00` - is used to tell the assembler where to load the code in memory

`times 510 - ($ - $$) db 0` - a bootloader needs to be exactly 512 bytes in size that's why we fill the free space with 0

`($ - $$)` - '$' returns the current address and '$$' returns the section start address, in this way we find how many bytes we have filled

`510 - ($ - $$)` - calculates how many more bytes do I need to have 510 bytes 

`times ... db 0` - fills the free bytes with 510 0s, because we need to have specific last 2 bytes

`db 0x55, 0xAA` - to have a valid floppy disk boot sector we need 512 bytes in size with the last two being 0x55 and 0xAA (the boot signature)

### Printing messages
To print text to the screen in bios we need to use the `10h` interrupt with the `ah` register set up to `13h` (write string) so we can change the text color and cursor position

```assembly
mov ah, 0x13
mov bp, lab 
mov cx, 5
mov bh, 0
mov dl, 15 
mov dh, 0
mov bl, 11 
int 0x10
```

`mov ah, 0x13` - prepare the ah register to write a string to the screen

`mov bp, lab` - prepare the string to be printed

`mov cx, 5` - `13h` requires the length of the string 

`mov bh, 0` - the page

`mov dl, 15` - X screen coordinate

`mov dh, 0` - Y screen coordinate

`mov bl, 11` - color

`int 0x10` - call the interrupt

## Working example
Use any linux distribution
To run the script, execute, where the 'generate.sh' is located:
```
chmod +x generate.sh && ./generate.sh
```
Next, follow the text from the output
