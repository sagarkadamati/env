GLIB_CFLAGS = -I/usr/include/glib-2.0 -I/usr/lib/x86_64-linux-gnu/glib-2.0/include
CFLAGS = -Wall -g -O2
CFLAGS = -g -O2
LIB = -lSM -lICE -lX11 -lXmu -lglib-2.0

all:
	@gcc ${GLIB_CFLAGS} ${CFLAGS} -MD -c -o main.o main.c
	@gcc ${CFLAGS} -o wmctrl main.o  ${LIB}
	@gcc -Wall -O3 -o findkey findkey.c
	@rm -rf main.d main.o
clean:
	@rm -rf *.o wmctrl *~ *.d findkey

