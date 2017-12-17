TARGETS = mm3
PAPILIB=../../papi/papi-5.4.3/src/libpapi.a
CFLAGS=-O1

all: $(TARGETS)

mm3: mm3.c
	$(CC) $(CFLAGS) -I ../../papi/papi-5.4.3/src mm3.c $(PAPILIB) -o mm3

clean:
	rm -f $(TARGETS) *.o *.stderr *.stdout core *~
