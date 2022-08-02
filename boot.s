.set ALIGN, 1<<0
.set MEMINFO, 1<<1
.set MAGIC, 0x1BADB002
.set FLAGS, 0
.set CHECKSUM, -(MAGIC + FLAGS)
.section .multiboot
.align 4
.long MAGIC
.long FLAGS
.long CHECKSUM
stackBottom:
.skip 1024
stackTop:
.section .text
.global _start
.type _start, @function
_start:
	mov $stackTop,%esp
	call kernel_entry
	cli
hltLoop:
	hlt
	jmp hltLoop

.size _start, .-_start
