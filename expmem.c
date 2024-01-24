#include <stdio.h>
#include <stdlib.h>
#include <assert.h>
#include <pthread.h>
#include <stdint.h>

uint64_t random_uint64() {
    uint64_t r = 0;
    for (int i = 0; i < 64; i += 15) {
        r |= ((uint64_t)rand() & 0x7fff) << i;
    }
    return r;
}

void print_hex(char *comment, char *kind, void *ptr) {
    unsigned long long int value = (unsigned long long int)ptr; // uint64_t
    printf("0x%016llx, %10s, %s\n", value, kind, comment);
}

int b = 43;

void growing_stack ( int depth ) {
	int a = 42;
	// print_hex("Address of depth","stack",(void *) &depth);
	print_hex("Address of a","stack",(void *) &a);
	if (depth > 0) {
		growing_stack(depth - 1);
	}
}

void *thread_main ( void *arg ) {
	growing_stack(10);
	return NULL;
}

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

	growing_stack(10);

	pthread_t thread;
	int ret = pthread_create(&thread, NULL, thread_main, NULL);
	assert(ret == 0);
	pthread_join(thread, NULL);

	int *somewhere = (int *) 0x12345678;
	while (1) {
		print_hex("Adress of somewhere","danger",(void *) somewhere);
		*somewhere = 42;
		somewhere = (int *) random_uint64();
	}
	return 0;
	
	// Let's crash to program
	int_ptr = (int *) &main;
	print_hex("Content of int_ptr","danger",(void *) int_ptr);
	print_hex("Content of *int_ptr","danger",(void *) *int_ptr);
	*int_ptr = 45;
	print_hex("Content of *int_ptr","danger",(void *) *int_ptr);
	
	return 42;
}

