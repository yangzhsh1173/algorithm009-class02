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
# 左右根 <=> 根右左然后倒序
def postorder_traversal(root)
    return [] if root.nil?
    stack, res = [root], []
    until stack.empty?
        node = stack.pop
        unless node.nil?
           res << node.val
           stack << node.left unless node.left.nil?
           stack << node.right unless node.right.nil? 
        end
    end
    res.reverse
end