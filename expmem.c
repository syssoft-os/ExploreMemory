#include <stdio.h>
#include <stdlib.h>

void print_hex(char *comment, void *ptr) {
    unsigned long long int value = (unsigned long long int)ptr;
    printf("%-24s: 0x%016llx\n", comment, value);
}

int b = 43;

int main (int ac, char **av) {
	int a = 42;
	print_hex("Content of a",(void *) a);
	print_hex("Address of a",(void *) &a);
	print_hex("Content of b",(void *) b);
	print_hex("Address of b",(void *) &b);

	int *int_ptr = (int *) malloc(sizeof(int));
	*int_ptr = 44;
	print_hex("Content of int_ptr",(void *) int_ptr);
	print_hex("Address of int_ptr",(void *) &int_ptr);
	print_hex("Content of *int_ptr",(void *) *int_ptr);

	print_hex("Address of main",(void *) &main);
	print_hex("Address of print_hex",(void *) &print_hex);
	print_hex("Address of printf",(void *) &printf);

	int_ptr = (int *) &main;
	print_hex("Content of int_ptr",(void *) int_ptr);
	print_hex("Content of *int_ptr",(void *) *int_ptr);
	*int_ptr = 45;
	print_hex("Content of *int_ptr",(void *) *int_ptr);
	
	return 42;
}

