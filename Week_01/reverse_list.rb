# Definition for singly-linked list.
class ListNode
    attr_accessor :val, :next
    def initialize(val)
        @val = val
        @next = nil
    end
end

# @param {ListNode} head
# @return {ListNode}
def reverse_list(head)
    prev = nil
    curr = head
    until curr.nil?
        temp = curr.next
        prev = curr
        curr = temp
    end
    return curr
end