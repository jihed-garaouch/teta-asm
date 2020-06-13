NASM = nasm
LD = ld

AFLAGS = -f elf32 -ggdb
LFLAGS = -melf_i386 -nostdlib -T linker.ld

SOURCES = $(wildcard *.asm)
OBJECTS = $(SOURCES:%.asm=%.o)

teta-asm.elf: linker.ld $(OBJECTS)
	$(LD) $(LFLAGS) $^ -o $@

%.o: %.asm
	$(NASM) $(AFLAGS) $^ -o $@

clean:
	rm -rf teta-asm.elf teta-asm.o

QEMU = qemu-system-i386
QFLAGS =

qemu: teta-asm.elf
	$(QEMU) $(QFLAGS) -kernel $<

.PHONY: clean qemu
