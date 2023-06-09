all:
	nasm -f bin ./src/boot_sect_main.asm -o ./bin/boot_sect_main.bin

clean:
	rm -rf ./bin/*