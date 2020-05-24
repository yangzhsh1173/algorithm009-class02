#include <stdio.h>

//Definition for singly-linked list.
//struct ListNode {
//	int val;
//	struct ListNode *next;
//};

//思路：使用双指针，感觉链表题需要注意的就是指针的顺序，保证迭代不会中断
struct ListNode* reverseList(struct ListNode* head) {
	struct ListNode *prev = NULL;
	struct ListNode *current = head;
	while (current != NULL) {
		struct ListNode *tempNode = current->next;
		current->next = prev;
		prev = current;
		current = tempNode;
	}
	return prev;
}

int main(int argc, char *argv[]) {
	
}