all:
	nasm -f bin ./src/bootloader/32bit-main.asm -o ./bin/32bit-main.bin

kernel:
	/usr/local/i386elfgcc/bin/i386-elf-gcc -ffreestanding -c ./src/kernel/function.c -o ./src/kernel/function.o

clean:
	rm -rf ./bin/*