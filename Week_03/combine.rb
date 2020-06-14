# @param {Integer} n
# @param {Integer} k
# @return {Integer[][]}
def combine(n, k)
    if n < 0 || k < 0 || n < k
        return []
    end
    result = []
    find_combinations n, k, 1, [], result
    result
end

def find_combinations(n, k, start, combinations, result)
    if combinations.length == k
        result << combinations.clone
        return
    end
    (start..n-(k-combinations.length)+1).each do |i|
        combinations << i
        find_combinations n, k, i+1, combinations, result
        combinations.pop
    end
end

# 方案二：利用公式 combine(n, k) = combine(n-1, k-1) + combine(n-1, k) 递归
def combine(n, k)
    return [(1..k).to_a] if k == n or k == 0
    combine(n-1, k-1).each { |e| e << n } + combine(n-1, k)
end

# 方案三：直接利用系统库方法
def combine(n, k)
    (1..n).to_a.combination(k).to_a
end