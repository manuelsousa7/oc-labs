TARGETS = cm1 
PAPILIB=../../papi/papi-5.4.3/src/libpapi.a

all: $(TARGETS)

cm1: cm1.c
	$(CC) $(CFLAGS) -I ../../papi/papi-5.4.3/src cm1.c $(PAPILIB) -o cm1

clean:
	rm -f $(TARGETS) *.o *.stderr *.stdout core *~
	rm *.out *.dat
	touch cm1_plot.dat
