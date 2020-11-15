cc=gcc -Wall
forShared=-c -fPIC
forSharedD=powerForShared.o basicMathForShared.o
main=main.o
all: mains maind

mymaths: libmyMath.a

mymathd: libmyMath.so

mains: main.o mymaths
	${cc} ${main} libmyMath.a -o mains
	
maind: main.o mymathd
	${cc} ${main} libmyMath.so -o maind
	
main.o: main.c 
	${cc} -c main.c -o ${main} -I.
	
libmyMath.a: power.o basicMath.o
	ar -rcs libmyMath.a power.o basicMath.o
	
libmyMath.so: powerForShared.o basicMathForShared.o
	${cc} -shared -o libmyMath.so ${forSharedD}
	
power.o: power.c myMath.h
	${cc} -c power.c -o power.o
	
basicMath.o: basicMath.c myMath.h
	${cc} -c basicMath.c -o basicMath.o
	
powerForShared.o: power.c myMath.h
	${cc} ${forShared} power.c -o powerForShared.o
	
basicMathForShared.o: basicMath.c myMath.h
	${cc} ${forShared} basicMath.c -o basicMathForShared.o
	
clean:
	rm -f *.o *.a *.so mains maind
	
.PHONY: all mymaths mymathd
