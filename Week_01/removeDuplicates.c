#include <stdio.h>

// solution: 快慢指针，快指针用于找到与慢指针不相等的元素，此时慢指针才向前移动一步。时间复杂度O(n)
int removeDuplicates(int *nums, int numsSize) {
	if (numsSize < 2) {
		return numsSize;	
	}
	int i = 0; // 慢指针
	for (int j = 1; j < numsSize; j++) {
		if (nums[j] != nums[i]) {
			++i;
			nums[i] = nums[j];
		}
	}
	return i + 1;
}

int main(int argc, char *argv[]) {
	int nums[4] = {1, 1, 1, 2};
	int size = removeDuplicates(nums, 4);
	printf("%d", size);
}