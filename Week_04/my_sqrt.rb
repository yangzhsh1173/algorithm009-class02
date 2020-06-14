# @param {Integer} x
# @return {Integer}
# 二分查找
def my_sqrt(x)
    l = 0
    r = x
    while l <= r
        mid = l + (r - l)/2
        if mid**2 <= x && x < (mid+1)**2
            return mid
        elsif x < mid**2
            r = mid - 1
        else
            l = mid + 1
        end
    end
end