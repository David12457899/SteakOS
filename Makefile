all:
	nasm -f bin ./src/32bit-main.asm -o ./bin/32bit-main.bin

clean:
	rm -rf ./bin/*