# x的平方根 https://leetcode-cn.com/problems/sqrtx/
# @param {Integer} x
# @return {Integer}

# 解法一：二分查找
def my_sqrt(x)
    if x == 0 || x == 1
        return x
    end
    left, right = 0, x
    while left <= right
        mid = left + (right - left) / 2
        if mid * mid > x
            right = mid - 1
        else
            left = mid
        end
    end
    return mid
end

# 解法二：牛顿迭代法
# 光头哥 https://leetcode.com/problems/sqrtx/discuss/25057/3-4-short-lines-Integer-Newton-Every-Language
def my_sqrt(x)
    r = x
    while r * r > x
        r = (r + x/r) / 2
    end
    return r
end