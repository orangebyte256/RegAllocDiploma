#define POS_LENGTH 10000000
#define L1_SIZE_LINE 4096
#define REG_COUNT_TEST 8

int foo(unsigned int *__restrict__ pos, unsigned int *__restrict__ values)
{
	unsigned int arr[L1_SIZE_LINE * REG_COUNT_TEST];	
	for(int i = 0; i < POS_LENGTH; i++) {
//		int val = *(pos++) % REG_COUNT_TEST;
		switch(i % REG_COUNT_TEST) {
		case 0:
			arr[0 * L1_SIZE_LINE] += 7;	
			break;
		case 1:
			arr[1 * L1_SIZE_LINE] += 4;	
			break;
		case 2:
			arr[2 * L1_SIZE_LINE] += 11;	
			break;
		case 3:
			arr[3 * L1_SIZE_LINE] += 1;	
			break;
		case 4:
			arr[4 * L1_SIZE_LINE] += 27;	
			break;
		case 5:
			arr[5 * L1_SIZE_LINE] += 24;	
			break;
		case 6:
			arr[6 * L1_SIZE_LINE] += 21;	
			break;
		case 7:
			arr[7 * L1_SIZE_LINE] += 221;	
			break;

		}	
/*		arr[0 * L1_SIZE_LINE] = a0;
		arr[1 * L1_SIZE_LINE] = a1;
		arr[2 * L1_SIZE_LINE] = a2;
		arr[3 * L1_SIZE_LINE] = a3;
*/	}
	int res = 0;
	for(int i = 0; i < REG_COUNT_TEST; i++) {
		res += arr[i * L1_SIZE_LINE];
	}
	return res;
}

