# 移动零：https://leetcode-cn.com/problems/move-zeroes/
# 我的解法
def move_zeroes(nums)
    return nums if nums.nil?
    j = 0
    (0...nums.size).each do |i|
        if nums[i] != 0
            nums[j] = nums[i]
            j += 1
        end
    end
    diff = nums.size - j - 1
    (j...nums.size).each do |i|
        nums[i] = 0
    end
end

# 参考国际站解法：交换 0 与 非0
def move_zeroes(nums)
    return if nums.nil?
    j = 0
    (0...nums.size).each do |i|
        if nums[i] != 0
            temp = nums[j]
            nums[j] = nums[i]
            nums[i] = temp
            j += 1
        end
    end
end

# 上面解法的更 Ruby 的写法
def move_zeroes(nums)
    return if nums.nil?
    j = 0
    (0...nums.size).each do |i|
        if nums[i] != 0
            nums[j], nums[i] = nums[i], nums[j]
            j += 1
        end
    end
end