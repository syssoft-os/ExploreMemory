CC = gcc
CFLAGS = -Wall -g -Wno-int-to-void-pointer-cast
LIBS = -lm -pthread
TARGETS = $(patsubst %.c,%,$(wildcard *.c))

all: $(TARGETS)

%: %.c
	$(CC) $(CFLAGS) -o $@ $< $(LIBS)

clean:
	rm -f $(TARGETS)
