# 使用哈希表
def two_sum(nums, target)
   map = Hash.new
   nums.each_index do |index|
       number = nums[index]
       map[number] = index
   end 
   nums.each_index do |index|
    complement = target - nums[index]
    if map.has_key?(complement) && map[complement] != index
        return [index ,map[complement]]
    end
   end
   return []
end