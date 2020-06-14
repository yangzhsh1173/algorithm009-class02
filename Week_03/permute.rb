# @param {Integer[]} nums
# @return {Integer[][]}
def permute(nums)
    return [] if number.empty?
    result = []
    track = []
    backtrack nums, track, result
    result
end

def backtrack(nums, track, result)
    if track.length == nums.length
        result << track.clone
        return
    end
    nums.each do |number|
        next if track.include?(number)
        track << number
        backtrack nums, track, result
        track.pop
    end
end

# 还有一种基于交换的解法，效率更高，但我还没理解 https://leetcode.com/problems/permutations/discuss/18247/My-elegant-recursive-C%2B%2B-solution-with-inline-explanation
# 也可以优化查询是否使用过的效率 https://leetcode.com/problems/permutations/discuss/413707/Ruby-solution-using-backtracking

# 国际站看到的一种基于 map 的解法
def permute(nums)
    return [] if nums.empty?
    return [ nums ] if nums.size == 1
    
    result = []
    nums.each do |num|
        l = permute(nums - [num])
        result += l.map { |i| [num] + i }
    end
    result
end

def permute(nums)
    nums.permutation.to_a
end