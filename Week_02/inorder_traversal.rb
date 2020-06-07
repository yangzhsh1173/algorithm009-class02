# Definition for a binary tree node.
class TreeNode
    attr_accessor :val, :left, :right
    def initialize(val)
        @val = val
        @left, @right = nil, nil
    end
end

# @param {TreeNode} root
# @return {Integer[]}
# 递归解法
def inorder_traversal(root)
    if root == nil
        return []
    end
    result_list = Array.new
    result_list += inorder_traversal(root.left)
    result_list.push(root.val)
    result_list += inorder_traversal(root.right)
end

# 迭代解法：使用栈模拟系统的递归
def inorder_traversal1(root)
    result_list = Array.new
    stack = Array.new
    curr = root
    while curr != nil || !stack.empty?
        while curr != nil
            stack.push(curr)
            curr = curr.left
        end
        curr = stack.pop()
        result_list.push(curr.val)
        curr = curr.right
    end
end