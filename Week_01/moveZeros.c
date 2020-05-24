#include <stdio.h>

//solution1: 第一次遍历查找非零元素的个数，第二次遍历修改数组元素值
void moveZeroes1(int *nums, int numsSize){
	if (nums == NULL || numsSize < 2) {
		return;
	}
	int count = 0;
	for (int i = 0; i < numsSize; i++) {
		if (nums[i] != 0) {
			nums[count++] = nums[i]; //count增加计数，并把非零元素移到前面
		}
	}
	for (int j = count; j < numsSize; j++) {
		nums[j] = 0;
	}
}

//solution2: 使用额外的数组
void moveZeroes2(int *nums, int numsSize) {
	if (nums == NULL || numsSize < 2) {
		return;
	}
	int array[numsSize];
	int head = 0;
	int tail = numsSize - 1;
	for (int i = 0; i < numsSize; i++) {
		if (nums[i] != 0) {
			array[head++] = nums[i];
		} else {
			array[tail--] = nums[i];
		}
	}
}

//solution3: 使用双指针，一个用于记录非0元素。其实我感觉数组类的算法题要想性能最好，很多都是这种思路，并记住一定不能直接做添加删除操作，要充分利用随机访问特性。
void moveZeroes(int *nums, int numsSize) {
	if (nums == NULL || numsSize < 2) {
		return;
	}
	int j = 0;
	for (int i = 0; i < numsSize; i++) {
		if (nums[i] != 0) {
			nums[j] = nums[i];
			if (i != j) {
				nums[i] = 0;
			}
			j++;
		}
	}
}

int main(int argc, char *argv[]) {
	int nums[] = {0,1,0,3,12};
}
