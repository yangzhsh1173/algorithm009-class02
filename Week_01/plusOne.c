#include <stdio.h>

//思路：主要是考虑进位。如果该位的值小于9，则直接返回即可；否则，进位。注意最高位为9的情况（比如 99，999），需要扩充数组长度。
int* plusOne(int* digits, int digitsSize, int* returnSize) {
	for (int i = digitsSize - 1; i >= 0; i--) {
        if (digits[i] < 9) {
            digits[i]++;
            *returnSize = digitsSize;
            return digits; 
        } else {
            digits[i] = 0;
        }
    }
    int *result = (int *)malloc(sizeof(int) * (digitsSize + 1));
    for (int i = 0; i < digitsSize + 1; i++) {
        result[i] = 0;
    }
    result[0] = 1;
    *returnSize = digitsSize + 1;
    return result;
}

int main(int argc, char *argv[]) {
	
}
