# 300. 最长上升子序列 https://leetcode-cn.com/problems/longest-increasing-subsequence/
# @param {Integer[]} nums
# @return {Integer}
def length_of_lis(nums)
    return 0 if nums.empty?
    curr_subs = {}
    nums.each do |n|
        if curr_subs.empty?
            curr_subs[n] = 1
        else
            max = nil
            curr_subs.each do |sub|
                if sub.first < n      
                    max = sub.last if max.nil? || max<sub.last
                end
            end
            if !max.nil?
                curr_subs[n] = max+1
            else
                curr_subs[n] = 1
            end
        end
    end
    p curr_subs
    return curr_subs.values.max
end