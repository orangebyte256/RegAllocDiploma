#define POS_LENGTH 10000000
#define L1_SIZE_LINE 1
#define REG_COUNT_TEST 4

void foo(unsigned int * __restrict__ arr, unsigned int *__restrict__ pos, unsigned int *__restrict__ values)
{
	
	unsigned int a0 = 0, a1 = 0, a2 = 0, a3 = 3;
	for(int i = 0; i < POS_LENGTH; i++) {
//		int val = *(pos++) % REG_COUNT_TEST;
		switch(i % REG_COUNT_TEST) {
		case 0:
//			a0 += 7;
			arr[0 * L1_SIZE_LINE] += 7;	
			break;
		case 1:
//			a1 += 4;
			arr[1 * L1_SIZE_LINE] += 4;	
			break;
		case 2:
//			a2 += 11;
			arr[2 * L1_SIZE_LINE] += 11;	
			break;
		case 3:
//			a3 += 1;
			arr[3 * L1_SIZE_LINE] += 1;	
			break;
		}	
/*		arr[0 * L1_SIZE_LINE] = a0;
		arr[1 * L1_SIZE_LINE] = a1;
		arr[2 * L1_SIZE_LINE] = a2;
		arr[3 * L1_SIZE_LINE] = a3;
*/	} 
}

