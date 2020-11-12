cc=gcc -Wall

all: mains maind

mymaths: libmyMath.a

mymathd: libmyMath.so

mains: main.o mymaths
	${cc} main.o libmyMath.a -o mains
	
maind: main.o mymathd
	${cc} main.o libmyMath.so -o maind
	
main.o: main.c 
	${cc} -c main.c -o main.o -I.
	
libmyMath.a: power1.o basicMath1.o
	ar -rcs libmyMath.a power1.o basicMath1.o
	
libmyMath.so: power2.o basicMath2.o
	${cc} -shared -o libmyMath.so power2.o basicMath2.o
	
power1.o: power.c myMath.h
	${cc} -c power.c -o power1.o
	
basicMath1.o: basicMath.c myMath.h
	${cc} -c basicMath.c -o basicMath1.o
	
power2.o: power.c myMath.h
	${cc} -c -fPIC power.c -o power2.o
	
basicMath2.o: basicMath.c myMath.h
	${cc} -c -fPIC basicMath.c -o basicMath2.o
	
clean:
	rm -f *.o *.a *.so mains maind
	
.PHONY: all mymaths mymathd
