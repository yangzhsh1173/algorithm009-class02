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
# 这道题的关键是理解递归终止条件：
# 1. 理解叶子节点：左右子节点都为 null 的才为叶子节点。也就是说：左右子节点都为 null 可以作为终止条件；否则，就继续递归。
def min_depth(root)
    if root == nil
        return 0
    end
    if root.left == nil && root.right == nil
        return 1
    end
    left_depth = min_depth(root.left)
    right_depth = min_depth(root.right)
    if root.left == nil || root.right == nil
        return left_depth + right_depth + 1
    end
    return [left_depth, right_depth].min + 1
end

# 国际站看到的简化实现
def min_depth(root)
    return 0 if !root
    d, e = [min_depth(root.left), min_depth(root.right)].sort
    1 + (d>0 ? d : e)
end

# TODO: 非递归解法