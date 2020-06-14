# @param {Integer[]} nums
# @return {Boolean}
# 题目链接：https://leetcode-cn.com/problems/jump-game/
def can_jump(nums)
    result = true
    last_zero_idx = nums[0..-2].rindex{|num| num <= 0}
    unreached_zero_indices = []
    unreached_zero_indices << last_zero_idx if last_zero_idx
    
    (last_zero_idx.to_i - 1).downto(0) do |comp_idx|
        if nums[comp_idx] <= 0
            unreached_zero_indices << comp_idx 
        else
            unreached_zero_indices = unreached_zero_indices.reject{|zero_idx| nums[comp_idx] > (zero_idx - comp_idx)}
        end
    end
    
    unreached_zero_indices.empty?
end