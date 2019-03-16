test: build-test
	./build/test/hello
	./build/test/controllflow
	./build/test/loop
	./build/test/stack
	./build/test/stack2
	./build/test/call
	./build/test/arguments

build-test:
	nasm -f macho64 -o build/test/hello.o test/helloworld.s
	nasm -f macho64 -o build/test/controllflow.o test/controllflow.s
	nasm -f macho64 -o build/test/loop.o test/loop.s
	nasm -f macho64 -o build/test/stack.o test/stack.s
	nasm -f macho64 -o build/test/stack2.o test/stack2.s
	nasm -f macho64 -o build/test/call.o test/call.s
	nasm -f macho64 -o build/test/arguments.o test/arguments.s
	gcc -o build/test/hello build/test/hello.o
	gcc -o build/test/controllflow build/test/controllflow.o
	gcc -o build/test/loop build/test/loop.o
	gcc -o build/test/stack build/test/stack.o
	gcc -o build/test/stack2 build/test/stack2.o
	gcc -o build/test/call build/test/call.o
	gcc -o build/test/arguments build/test/arguments.o

clean-test:
	rm build/test/hello
	rm build/test/hello.o
	rm build/test/controllflow
	rm build/test/controllflow.o
	rm build/test/loop
	rm build/test/loop.o
	rm build/test/stack
	rm build/test/stack.o
	rm build/test/stack2
	rm build/test/stack2.o
	rm build/test/call
	rm build/test/call.o
	rm build/test/arguments
	rm build/test/arguments.o