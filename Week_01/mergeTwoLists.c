#include <stdio.h>

void insertNode(struct ListNode *head, struct ListNode *newNode){
	struct ListNode *tmp = NULL;
	while(1) {
		tmp = head->next;
		if(tmp && newNode->val > tmp->val) {
				head = tmp;
				tmp = tmp->next;
		} else {
			head->next = newNode;
			newNode->next = tmp;
			break;
		}
	}
}

struct ListNode* mergeTwoLists(struct ListNode* l1, struct ListNode* l2){
	struct ListNode* tmp1 = NULL;
	struct ListNode head;
	head.next = l2;

	while (l1) {
		tmp1 = l1;
		l1 = l1->next;
		//遍历l1,依次取出节点插入l2
		insertNode(&head, tmp1);
	}

	return head.next;
}

int main(int argc, char *argv[]) {
	
}