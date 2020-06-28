# @param {Integer} n
# @return {Integer}
# 递归解法，会超时
def climb_stairs(n)
    return n if n <= 2
    climb_stairs(n-1) + climb_stairs(n-2)
end

# 第一次实现
def climb_stairs(n)
    return n if n <= 2
    first, second, third = 1, 2, 0
    (n-2).times.each do |i|
        third = first + second
        first = second
        second = third
    end
    third
end

# 更 Ruby 的实现
def climb_stairs(n)
    a, b = 1, 1
    n.times { |i| a, b = b, a+b}
    a
end