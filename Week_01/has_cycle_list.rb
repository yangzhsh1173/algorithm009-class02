# Definition for singly-linked list.
class ListNode
    attr_accessor :val, :next
    def initialize(val)
        @val = val
        @next = nil
    end
end

# @param {ListNode} head
# @return {Boolean}
def hasCycle(head)
    return false if head.nil? || head.next.nil?
    return true if head.next == head
    slow, fast = head, head.next
    while slow != nil && fast != nil && slow != fast
        slow = slow.next
        fast = fast.next.next
    end
    return true if slow == fast
    false
end