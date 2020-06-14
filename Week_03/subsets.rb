# @param {Integer[]} nums
# @return {Integer[][]}
# 递归
def subsets(nums)
    results = []
    dfs nums, results, [], 0
    results
end

def dfs(nums, results, current, index)
    # terminator
    if index == nums.length
        results << current.clone
        return
    end

    # process && drill down
    dfs nums, results, current, index + 1 # not pick the number

    current << nums[index] # pick the number and drill down
    dfs nums, results, current, index + 1

    # revert
    current.pop
end

# 迭代法思路：逐步把元素加到已有的集合里，比如已经有了 [[]]，则可以添加[[], [1]]。然后再往下走
def subsets(nums)
    return [] if nums.empty?
    results = [[]]
    nums.each do |number|
        temp = []
        results.each do |set|
            subset = set.clone
            subset << number
            temp << subset
        end
        results = results + temp
    end
    results
end

# 参考国际站的解法
# 这个是比较传统的递归思路
def subsets(nums)
    results = []
    backtrack nums, results, [], 0
    results
end
def backtrack(nums, results, current, start)
    results << current.clone
    (start...nums.length).each do |i|
        current << nums[i]
        backtrack nums, results, current, i+1
        current.pop
    end
end

# 这个利用了 Ruby 的语言特性 new array，思路其实跟上一个一样
def subsets(nums)
    results = []
    backtrack nums, results, [], 0
end
def backtrack(nums, results, current, start)
    results << current
    (start...nums.length) do |i|
        backtrack nums, results, current + nums[i], i+1
    end
end

# 光头哥的解法，使用了高阶函数https://leetcode.com/problems/subsets/discuss/27560/1-3-lines-Ruby-solutions
def subsets(nums)
    subsets = [[]]
    nums.each { |n| subsets += subsets.map { |s| s + [n] } }
    subsets
end

def subsets(nums)
(0..nums.size).flat_map{ |k| nums.combination(k).to_a }
end

def subsets(nums)
    nums.reduce([[]]) { |subsets, n| subsets + subsets.map { |s| s + [n] } }
end

# 这一类问题的解法https://leetcode.com/problems/subsets/discuss/27281/A-general-approach-to-backtracking-questions-in-Java-(Subsets-Permutations-Combination-Sum-Palindrome-Partitioning)