# Definition for a binary tree node.
# class TreeNode
#     attr_accessor :val, :left, :right
#     def initialize(val)
#         @val = val
#         @left, @right = nil, nil
#     end
# end

# @param {TreeNode} root
# @return {Integer[]}
# 题目：在每个树行中找最大值
# 题目链接：https://leetcode-cn.com/problems/find-largest-value-in-each-tree-row/
# 解法一：BFS（这个思路很自然能想到）
def largest_values(root)
    return [] if root.nil?
    res = []
    queue = [root]
    while !queue.empty?
        level_max = -Float::INFINITY
        n = queue.length
        n.times do |i|
            node = queue.shift
            level_max = [level_max, node.val].max
            queue << node.left if node.left
            queue << node.right if node.right
        end
        res << level_max
    end
    res
end

# 解法二：DFS，每层维护一个最大值即可
def largest_values(root)
    return [] if root.nil?
    res = []
    dfs root, 0, res
    res
end

def dfs(root, level, res)
    # terminator
    return if root.nil?
    # visited.add root.val
    # procss current level
    res[level] ||= root.val
    res[level] = [res[level], root.val].max

    dfs root.left, level+1, res
    dfs root.right, level+1, res
end