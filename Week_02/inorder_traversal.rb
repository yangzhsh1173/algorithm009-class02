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

# 改进的递归实现
def inorder_traversal(root)
    return [] if root.nil?
    res = []
    res += inorder_traversal(root.left)
    res << root.val
    res += inorder_traversal(root.right)
    res
end

# 更通用的递归写法（用一个 helper 或者叫 dfs）
def inorder_traversal(root)
    res = []
    helper root, res
    res
end
def helper(root, res)
    return [] if root.nil?
    helper root.left, res
    res << root.val
    helper root.right, res
end

# 参考国际站的递归实现
def inorder_traversal(root)
    return [] if root == nil
    return inorder_traversal(root.left) + [root.val] + inorder_traversal(root.right)
end