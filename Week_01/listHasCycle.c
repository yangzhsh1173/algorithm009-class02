#include <stdio.h>

//思路：利用快慢指针
bool hasCycle(struct ListNode *head) {
	if (head == NULL) {
		return false;
	}

	struct ListNode *fast = head;
	struct ListNode *slow = head;

	while(slow != NULL && fast != NULL && fast->next != NULL) {
		slow = slow->next;
		fast = fast->next->next;
		if (slow == fast) {
			return true;
		}
	}

	return false;
}

int main(int argc, char *argv[]) {
	
}