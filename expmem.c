#include <stdio.h>

void print_hex(char *comment, void *ptr) {
    unsigned long long int value = (unsigned long long int)ptr;
    printf("%s: 0x%016llx\n", comment, value);
}

int main (int ac, char **av) {
	int a = 42;
	print_hex("Content of a",(void *) a);
	return 42;
}

