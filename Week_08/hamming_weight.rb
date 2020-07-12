# 位 1 的个数
# @lc code=start
# @param {Integer} n, a positive integer
# @return {Integer}
# 方法1：遍历按位与1
def hamming_weight(n)
    bits = 0
    mask = 1
    32.times do
        bits += 1 if (n & mask) != 0
        mask <<= 1
    end
    bits
end

# 方法2：利用 n & (n-1) 会将最低位 1 设置为 0 的特性
# 这种方法对位数就不会有限制了
def hamming_weight(n)
    sum = 0
    while n != 0
        sum += 1
        n &= n-1
    end
    sum
end