# @param {Integer[]} nums
# @param {Integer} target
# @return {Integer[]}
# 暴力求解
def two_sum(nums, target)
    return [] if nums.length < 2
    (0...nums.length).each do |i|
        (i+1...nums.length).each do |j|
            return [i, j] if nums[i] + nums[j] == target
        end
    end
    []
end

# 哈希表
def two_sum(nums, target)
    hash = {}
    nums.each_with_index do |number, i|
        return hash[target-number], i if hash[target-number]
        hash[number] = i
    end
    return [-1, -1]
end