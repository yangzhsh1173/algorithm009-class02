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
def swap_pairs(head)
    return head if head.nil? || head.next.nil?
    dumy = ListNode.new
    dumy.next = head
    prev = dumy
    while head != nil && head.next != nil
        first, second = head, head.next

        prev.next, first.next, second.next = second, second.next, first

        prev, head = first, first.next
    end
    dumy.next
end

# 递归来一发
def swap_pairs(head)
    # terminator
    return head if head.nil? || head.next.nil?

    # process current level & drill down
    first, second = head, head.next
    first.next = swap_pairs(second.next)
    second.next = first
    return second
end