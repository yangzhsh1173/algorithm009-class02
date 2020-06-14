# @param {Integer[]} nums
# @param {Integer} target
# @return {Integer}
# 搜索旋转排序数组：https://leetcode-cn.com/problems/search-in-rotated-sorted-array/
def search(nums, target)
    return -1 if nums.size == 0
    return 0 if nums[0] == target
    return nums.size-1 if nums[-1] == target
    res = bsearch(nums, target, 0, nums.length - 1)
    res.nil? ? -1 : res
end
  
  
def bsearch(nums, target, left, right)
    while left < right
        mid = ((left+right)/2).to_i
        return mid if nums[mid] == target
        if nums[mid] >= nums[0]
        if target >= nums[0] && target < nums[mid]
            right -= 1
        else
            left += 1
        end
        else
        if target < nums[0] && target > nums[mid]
            left += 1
        else
            right -= 1
        end
        end
    end
end