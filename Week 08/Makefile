OBJECT = linkedlist.o

all: ll ll2

ll2: $(OBJECT)
	gcc -o $@ use_linkedlist.c $(OBJECT)

ll: $(OBJECT)
	gcc -o $@ use_list_2.c $(OBJECT)

.c.o: linkedlist.c linkedlist.h
	gcc -c $<

clean:
	rm -f $(OBJECT) ll ll2
