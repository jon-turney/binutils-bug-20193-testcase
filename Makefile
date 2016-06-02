all:
	gcc -c main.c
	windres -i resource.rc --input-format=rc -o resource.o -O coff --use-temp-file
	gcc main.o resource.o -o 1.exe
	objcopy --add-gnu-debuglink=/dev/null --only-keep-debug 1.exe 3.dbg
	objcopy --strip-all 1.exe 2.exe
	objcopy --add-gnu-debuglink=3.dbg 2.exe 3.exe

clean:
	rm -f *.o *.exe *.dbg
