require 'set'
# @param {Integer[]} nums
# @return {Integer[][]}
# 暴力求解
# def three_sum(nums)
#     return [] if nums.nil? || nums.length < 3
#     nums.sort!
#     result_set = Set.new
#     (0...nums.length).each do |k|
#         (k+1...nums.length).each do |i|
#             (i+1...nums.length).each do |j|
#                 result_set << [nums[k], nums[i], nums[j]] if nums[k] + nums[i] + nums[j] == 0
#             end
#         end
#     end
#     result_set
# end

# 哈希表求解
# def three_sum(nums)
#     return [] if nums.nil? || nums.length < 3
#     nums.sort!
#     result_set = Set.new
#     (0...nums.length).each do |k|
#         hash = Hash.new
#         target = -nums[k]
#         (k+1...nums.length).each do |i|
#             result_set << [nums[k], target - nums[i], nums[i]] if hash.has_key?(target - nums[i])
#             hash[nums[i]] = i
#         end
#     end
#     result_set
# end

# 双指针夹逼法
def three_sum(nums)
    return [] if nums.nil? || nums.length < 3
    nums.sort!
    results = []
    (0...nums.size).each do |k|
        break if nums[k] > 0
        next if k > 0 && nums[k] == nums[k-1]
        i, j = k+1, nums.size-1
        while i < j
            sum = nums[i] + nums[j] + nums[k]
            if sum == 0
                results << [nums[i], nums[j], nums[k]]
                while i < j && nums[i] == nums[i+1]
                    i += 1
                end
                while i < j && nums[j] == nums[j-1]
                    j -= 1
                end
                i += 1
                j -= 1
            elsif sum < 0
                i += 1
            else
                j -= 1
            end
        end
    end
    results
end

puts three_sum [-1,0,1,2,-1,-4]