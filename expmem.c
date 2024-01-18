#include <stdio.h>
#include <stdlib.h>

void print_hex(char *comment, char *kind, void *ptr) {
    unsigned long long int value = (unsigned long long int)ptr; // uint64_t
    printf("0x%016llx, %10s, %s\n", value, kind, comment);
}

int b = 43;

int main (int ac, char **av) {
	int a = 42;
	print_hex("Content of a","value",(void *) a);
	print_hex("Address of a","stack",(void *) &a);
	print_hex("Content of b","value",(void *) b);
	print_hex("Address of b","global",(void *) &b);

	int *int_ptr = (int *) malloc(sizeof(int));
	*int_ptr = 44;
	print_hex("Content of int_ptr","heap",(void *) int_ptr);
	print_hex("Address of int_ptr","stack",(void *) &int_ptr);
	print_hex("Content of *int_ptr","value",(void *) *int_ptr);

	print_hex("Address of main","code",(void *) &main);
	print_hex("Address of print_hex","code",(void *) &print_hex);
	print_hex("Address of printf","code lib",(void *) &printf);

	return 0;
	
	// Let's crash to program
	int_ptr = (int *) &main;
	print_hex("Content of int_ptr","danger",(void *) int_ptr);
	print_hex("Content of *int_ptr","danger",(void *) *int_ptr);
	*int_ptr = 45;
	print_hex("Content of *int_ptr","danger",(void *) *int_ptr);
	
	return 42;
}

