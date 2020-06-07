# Definition for a binary tree node.
class TreeNode
    attr_accessor :val, :left, :right
    def initialize(val)
        @val = val
        @left, @right = nil, nil
    end
end

# @param {TreeNode} root
# @return {Boolean}
# 递归 + 上下界的方法，参考了官方题解思路
def is_valid_bst(root)
    max = 1.0 / 0.0
    min = -1.0 / 0.0
    return is_valid(root, min, max)
end

def is_valid(root, lower, upper)
    if root == nil
        return true
    end
    if root.val <= lower || root.val >= upper
        return false
    end

    return is_valid(root.left, lower, root.val) && is_valid(root.right, root.val, upper)
end

# 中序遍历：当前节点比前一个遍历到的节点大才符号要求
def is_valid_bst_order(root)
    if root == nil
        return true
    end
    stack = []
    curr = root
    inorder = -1.0 / 0.0
    while curr != nil || !stack.empty?
        while curr != nil
            stack.push(curr)
            curr = curr.left
        end
        curr = stack.pop
        if curr.val <= inorder
            return false
        end
        inorder = curr.val
        curr = curr.right
    end
    return true
end