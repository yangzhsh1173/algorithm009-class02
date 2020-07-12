# 2 的幂
# @lc code=start
# @param {Integer} n
# @return {Boolean}
# 利用 n & n-1 将最低位 1 设置为 0 的特性
def is_power_of_two(n)
    return n > 0 && (n & n-1) == 0
end

# 利用 n & -n 将最低位 1 设为 1 其他位设置为 0 的特性
def is_power_of_two(n)
    return n > 0 && (n & -n) == n
end