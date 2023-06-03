all:
	nasm -f bin ./src/print_str.asm -o ./bin/print_str.bin
	nasm -f bin ./src/print_hex.asm -o ./bin/print_hex.bin
	nasm -f bin ./src/boot.asm -o ./bin/boot.bin

clean:
	rm -rf ./bin/*