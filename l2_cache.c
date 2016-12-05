#include "def.h"
#include <stdio.h>
#define N 10000000

void clear();

static __inline__ unsigned long long rdtsc(void)
{
    unsigned long long int x;
    __asm__ volatile (".byte 0x0f, 0x31" : "=A" (x));
    return x;
}

//int foo(unsigned int *__restrict__ pos, unsigned int *__restrict__ values)
int foo()//unsigned int *__restrict__ pos)
{
	unsigned int arr[L1_SIZE_LINE * REG_COUNT_TEST];	
	clear();
	for(int i = 0; i < L1_SIZE_LINE * REG_COUNT_TEST; i++) {
		arr[i] = i + arr[i - 1];
	}
	unsigned long long start = rdtsc();
	for(int i = 0; i < POS_LENGTH; i++) {
//		int val = *(pos++);
//		arr[(i % REG_COUNT_TEST) * L1_SIZE_LINE] += *(values++);
		switch(i % REG_COUNT_TEST) {
		case 0:
			arr[0 * L1_SIZE_LINE] += 7 * arr[0 * L1_SIZE_LINE + 1] + 4 * arr[0 * L1_SIZE_LINE + 2];	
			break;
		case 1:
			arr[1 * L1_SIZE_LINE] += 4 * arr[1 * L1_SIZE_LINE + 1] + 4 * arr[1 * L1_SIZE_LINE + 2];	
			break;
		case 2:
			arr[2 * L1_SIZE_LINE] += 17 * arr[2 * L1_SIZE_LINE + 1] + 4 * arr[2 * L1_SIZE_LINE + 2];	
			break;
		case 3:
			arr[3 * L1_SIZE_LINE] += 1 * arr[3 * L1_SIZE_LINE + 1] + 4 * arr[3 * L1_SIZE_LINE + 2];	
			break;
		case 4:
			arr[4 * L1_SIZE_LINE] += 27 * arr[4 * L1_SIZE_LINE + 1] + 4 * arr[4 * L1_SIZE_LINE + 2];	
			break;
		case 5:
			arr[5 * L1_SIZE_LINE] += 24 * arr[5 * L1_SIZE_LINE + 1] + 4 * arr[5 * L1_SIZE_LINE + 2];	
			break;
		case 6:
			arr[6 * L1_SIZE_LINE] += 21 * arr[6 * L1_SIZE_LINE + 1] + 4 * arr[6 * L1_SIZE_LINE + 2];	
			break;
		case 7:
			arr[7 * L1_SIZE_LINE] += 221 * arr[7 * L1_SIZE_LINE + 1] + 4 * arr[7 * L1_SIZE_LINE + 2];	
			break;

		}	

	}
	unsigned long long end = rdtsc();
	printf("%llu \n", (end - start) / N);
	int res = 0;
	for(int i = 0; i < REG_COUNT_TEST; i++) {
		res += arr[i * L1_SIZE_LINE];
	}
	return res;
}


