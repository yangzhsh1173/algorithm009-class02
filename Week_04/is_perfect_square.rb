# 有效的完全平方数 https://leetcode-cn.com/problems/valid-perfect-square/
# 二分查找
def is_perfect_square(num)
    return true if num < 2
    left, right = 1, num / 2
    while left <= right
        mid = left + (right - left) / 2
        if mid * mid > num
            right = mid - 1
        elsif mid * mid < num
            left = mid + 1
        else
            return true
        end
    end
    return false
end

# 牛顿迭代法
def is_perfect_square(num)
    return true if num < 2
    r = num
    while r * r > num
        r = (r + num/r) / 2
    end
    return r * r == num
end