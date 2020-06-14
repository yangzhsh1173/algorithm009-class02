# Definition for a binary tree node.
# class TreeNode
#     attr_accessor :val, :left, :right
#     def initialize(val)
#         @val = val
#         @left, @right = nil, nil
#     end
# end

# @param {TreeNode} root
# @return {Integer[][]}
def level_order(root)
    return [] if root == nil
    res = []
    queue = [root]
    while !queue.empty?
        n = queue.length
        level_list = []
        n.times do |i|
            node = queue.shift
            level_list << node.val
            queue << node.left if node.left != nil
            queue << node.right if node.right != nil
        end
        res << level_list
    end
    res
end

# DFS 方案
def level_order(root)
    output = []
    dfs root, output, 0
    output
end
  
def dfs(node, output, level)
    return output unless node

    output[level] ||= []
    output[level] << node.val
    dfs node.left, output, level+1
    dfs node.right, output, level+1
end

# 参考国际站的解法
def level_order(root)
    return [] if root.nil?
    traversal([root], [])
end

def traversal(nodes, result)
    return result if nodes.empty?
    result << nodes.map{|node| node.val}
    next_level_nodes = nodes.map{|node| [node.left, node.right]}.flatten.compact
    traversal(next_level_nodes, result)
end