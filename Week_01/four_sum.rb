# @param {Integer[]} nums
# @param {Integer} target
# @return {Integer[][]}
# 双指针法
def four_sum(nums, target)
    return [] if nums.nil? || nums.length < 4
    nums.sort!
    results = []
    (0...nums.size-3).each do |i|
        break if nums[i] > 0
        next if i > 0 && nums[i] == nums[i-1]
        (i+1...nums.size-2).each do |j|
            break if nums[j] > -nums[i]
            next if nums[j] == nums[j-1]
            k, l = j+1, nums.size-1
            while k < l
                sum = nums[i] + nums[j] + nums[k] + nums[l]
                if sum == 0
                    results << [nums[i], nums[j], nums[k], nums[l]]
                    while k < l && nums[k] == nums[k+1]
                        k += 1
                    end
                    while k < l && nums[l] == nums[l-1]
                        l -= 1
                    end
                    k += 1
                    l -= 1
                elsif sum < 0
                    k += 1
                else
                    l -= 1
                end
            end
        end
    end
    results
end