# https://leetcode-cn.com/problems/linked-list-cycle-ii/
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
# 哈希表
def detectCycle(head)
    return nil if head.nil? || head.next.nil?
    hash = Hash.new
    i = 0
    while head != nil
        return hash[head] if hash.has_key?(head)
        hash[head] = i
        i += 1
    end
    return nil
end

# 快慢指针
def detectCycle(head)
    slow, fast = head, head
    while fast != nil && fast.next != nil
        slow = slow.next
        fast = fast.next.next
        break if slow == fast
    end
    return nil if fast.nil? || fast.next.nil?
    fast = head
    while slow != fast
        slow, fast = slow.next, fast.next
    end
    return fast
end