# 简单二分查找
def binary_search(arr, value)
    low, high = 0, arr.length - 1
    while low <= high
        mid = low + (high - low) / 2
        if arr[mid] == value
            return mid
        elsif arr[mid] < value
            low = mid + 1
        else
            high = mid - 1
        end
    end
    return -1
end

# 变体1：寻找第一个等于 value 的元素
def binary_search_first_equal(arr, value)
    low, high = 0, arr.length - 1
    while low <= high
        mid = low + (high - low) / 2
        if arr[mid] < value
            low = mid + 1
        elsif arr[mid] > value
            high = mid -1
        else
            if mid == 0 || (arr[mid - 1] != value)
                return mid
            end
            high = mid - 1
        end
    end
    return -1
end

# 变体2：寻找最后一个等于 value 的元素
def binary_search_last_equal(arr, value)
    low, high = 0, arr.length - 1
    while low <= high
        mid = low + (high - low) / 2
        if arr[mid] > value
            high = mid - 1
        elsif arr[mid] < value
            low = mid + 1
        else
            if mid == arr.length - 1 || (arr[mid + 1] != value)
                return mid
            end
            low = mid + 1
        end
    end
    return -1
end

# 变体3：寻找第一个大于等于 value 的元素
def binary_search_larger(arr, value)
    low, high = 0, arr.length - 1
    while low <= high
        mid = low + (high - low) / 2
        if arr[mid] < value
            low = mid + 1
        else
            if mid == 0 || (arr[mid-1] < value)
                return mid
            end
            high = mid - 1
        end
    end
    return -1
end

# 变体4：寻找最后一个小于等于 value 的元素
def binary_search_smaller(arr, value)
    low, high = 0, arr.length - 1
    while low <= high
        mid = low + (high - low) / 2
        if arr[mid] > value
            high = mid - 1
        else
            if mid == arr.length - 1 || (arr[mid+1] > value)
                return mid
            end
            low = mid + 1
        end
    end
    return -1
end