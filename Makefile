all:
	nasm -f bin ./src/utils.asm -o ./bin/utils.bin
	nasm -f bin ./src/boot.asm -o ./bin/boot.bin

clean:
	rm -rf ./bin/*