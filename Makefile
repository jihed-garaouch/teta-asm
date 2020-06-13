NASM = nasm
LD = ld

AFLAGS = -f elf32
LFLAGS = -melf_i386 -nostdlib -T linker.ld

teta-asm.elf: linker.ld teta-asm.o
	$(LD) $(LFLAGS) $^ -o $@

teta-asm.o: teta-asm.asm
	$(NASM) $(AFLAGS) $^ -o $@

clean:
	rm -rf teta-asm.elf teta-asm.o

QEMU = qemu-system-i386
QFLAGS =

qemu: teta-asm.elf
	$(QEMU) $(QFLAGS) -kernel $<

.PHONY: clean qemu
