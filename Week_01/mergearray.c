#include <stdio.h>

//思路：参考了题解，使用双指针并从后向前遍历来解决。我的原始思路比较直接，就是把数组合并后做排序。
void merge(int* nums1, int nums1Size, int m, int* nums2, int nums2Size, int n) {
	int j = m+n-1, p = m-1, q = n-1;
	while (p >= 0 || q >= 0) {
		if (p >= 0 && q >= 0) {
			if (nums1[p] > nums2[q]) {
				nums1[j--] = nums1[p--];
			} else {
				nums1[j--] = nums2[q--];
			}	
		}
		
		if (p<0 && q >= 0) {
			while (q >= 0) {
				nums1[j--] = nums2[q--];
			}
		}
		
		if (p >= 0 && q<0) {
			while (p >= 0) {
				nums1[j--] = nums1[p--];
			}
		}
	}
}

int main(int argc, char *argv[]) {
	
}