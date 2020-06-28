# Definition for a binary tree node.
class TreeNode
    attr_accessor :val, :left, :right
    def initialize(val)
        @val = val
        @left, @right = nil, nil
    end
end

# @param {TreeNode} root
# @return {Integer[][]}
# 用BFS的方式实现
def level_order(root)
    return [] if root.nil?
    queue, res = [root], []
    until queue.empty?
        n = queue.size
        level_res = []
        n.times do |i|
            node = queue.shift
            level_res << node.val
            queue << node.left unless node.left.nil?
            queue << node.right unless node.right.nil?    
        end
        res << level_res
    end
    res
end

# 用DFS的方式实现
def level_order(root)
    res = []
    dfs 0, root, res
    res
end

def dfs(level, root, res)
    return [] if root.nil?
    res[level] ||= []
    res[level] << root.val
    dfs level+1, root.left, res
    dfs level+2, root.right, res
end