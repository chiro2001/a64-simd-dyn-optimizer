CC ?= gcc
CFLAGS ?= -O2 -mcpu=hip09 -static

timing_sve: timing_sve.c
	$(CC) $(CFLAGS) -o $@ $<

clean:
	rm -f timing_sve
