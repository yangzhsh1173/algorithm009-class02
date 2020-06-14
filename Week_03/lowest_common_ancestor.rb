# Definition for a binary tree node.
# class TreeNode
#     attr_accessor :val, :left, :right
#     def initialize(val)
#         @val = val
#         @left, @right = nil, nil
#     end
# end

# @param {TreeNode} root
# @param {TreeNode} p
# @param {TreeNode} q
# @return {TreeNode}
# 思路：
# 1. 如果 root 左右节点都不为空，则 p、q 肯定为与 root 的左右子树，不会在同一子树内
# 2. 如果 root 为 p 或 q 的一个，则另一个需要在 root 的子树内，root 为最近公共祖先
def lowest_common_ancestor(root, p, q)
    if root == nil || root == p || root == q
        return root
    end
    l = lowest_common_ancestor(root.left, p, q)
    r = lowest_common_ancestor(root.right, p, q)
    if l && r
        return root
    end
    return left ? left : right
end

def method_name
    # 终止条件

    # 处理当前层

    # 进入下一层

    # 清理当前层状态
end