Definition for a binary tree node.
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
def preorder_traversal(root)
    if root == nil
        return []
    end
    result_list = Array.new
    result_list.push(root.val)
    result_list += preorder_traversal(root.left)
    result_list += preorder_traversal(root.right)
end

# 迭代解法：参考了https://leetcode-cn.com/problems/binary-tree-preorder-traversal/solution/tu-jie-er-cha-shu-de-si-chong-bian-li-by-z1m/
def preorder_traversal1(root)
    if root == nil
        return []
    end
    result_list = []
    stack = [root]
    while !stack.empty?
        node = stack.pop
        result_list.push(node.val)
        if node.right
            stack.push(node.right)
        end
        if node.left
            stack.push(node.left)
        end
    end
    return result_list
end

# 迭代解法：只维护右子树的栈，左子树结点随时添加到结果，参考了https://leetcode.com/problems/binary-tree-preorder-traversal/discuss/45266/Accepted-iterative-solution-in-Java-using-stack.
def preorder_traversal2(root)
    if root == nil
        return []
    end
    result_list = []
    stack = []
    node = root
    while node
        result_list.push(node.val)
        if node.right
            stack.push(node)
        end
        node = node.left
        if node == nil && !stack.empty?
            node = stack.pop
        end
    end
    return result_list
end

# 比较符合前序思路的迭代解法，参考了 https://leetcode-cn.com/problems/binary-tree-preorder-traversal/solution/tu-jie-er-cha-shu-de-si-chong-bian-li-by-z1m/
def preorder_traversal(root)
    return [] if root.nil?
    stack, res = [root], []
    until stack.empty?
        node = stack.pop
        unless node.nil?
           res << node.val
           stack << node.right unless node.right.nil? 
           stack << node.left unless node.left.nil?
        end
    end
    res
end

# 模板解法（其实更不好理解）
def preorder_traversal(root)
    return [] if root.nil?
    stack, res = [], []
    node = root
    until stack.empty? && node.nil?
        until node.nil?
            res << node.val
            stack << node
            node = node.left
        end
        node = stack.pop.right
    end
    res
end

# 参考国际站的解法