test: build-test
	./build/test/hello
	./build/test/controllflow
	./build/test/loop
	./build/test/stack

build-test:
	nasm -f macho64 -o build/test/hello.o test/helloworld.s
	nasm -f macho64 -o build/test/controllflow.o test/controllflow.s
	nasm -f macho64 -o build/test/loop.o test/loop.s
	nasm -f macho64 -o build/test/stack.o test/stack.s
	gcc -o build/test/hello build/test/hello.o
	gcc -o build/test/controllflow build/test/controllflow.o
	gcc -o build/test/loop build/test/loop.o
	gcc -o build/test/stack build/test/stack.o

clean-test:
	rm build/test/hello
	rm build/test/hello.o
	rm build/test/controllflow
	rm build/test/controllflow.o
	rm build/test/loop
	rm build/test/loop.o
	rm build/test/stack
	rm build/test/stack.o