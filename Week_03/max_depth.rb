# Definition for a binary tree node.
# class TreeNode
#     attr_accessor :val, :left, :right
#     def initialize(val)
#         @val = val
#         @left, @right = nil, nil
#     end
# end

# @param {TreeNode} root
# @return {Integer}
# 递归法：问题转换为求Max(左子树深度，右子树深度) + 1
def max_depth(root)
    if root == nil
        return 0
    end
    return [max_depth(root.left), max_depth(root.right)].max + 1
end

# 还有 BFS 的方法，待补充