# 选择排序
# 思路：从序列中选择最小的一个放在序列最前面，依次进行。不稳定。
def select_sort(arr)
    min_index, len = 0, arr.length
    for i in (0...len-1) do
        min_index = i
        for j in (i+1...len) do
            if arr[j] < arr[min_index]
                min_index = j
            end
        end
        arr[i], arr[min_index] = arr[min_index], arr[i]
    end
end

# 插入排序
# 思路：把整个序列分成两部分，有序和无序，每次从无序拿出一个元素插入到有序序列的合适位置。稳定。
def insert_sort(arr)
    return if arr.length <= 1
    pre_index = 0
    len = arr.length
    for i in (1...len) do
        current = arr[i]
        while pre_index >= 0 && arr[pre_index] > current
            arr[pre_index + 1] = arr[pre_index]
            pre_index -= 1
        end
        arr[pre_index + 1] = current
    end
end

# 冒泡排序
# 思路：嵌套循环，两两比较，逆序交换，最大的依次沉到最后。稳定。
def bubble_sort(arr)
    len = arr.length
    for i in (0...len-1) do
        for j in (i+1...len) do
            if arr[j] > arr[j+1]
                arr[j], arr[j+1] = arr[j+1], arr[j]
            end
        end
    end
end

# 快速排序
# 思路：分治，选标杆pivot，小元素放到pivot左侧，大元素放到pivot右侧，再分别对左右侧子数组做快排。不稳定。
def quick_sort(arr, left, right)
    return if right <= left
    pivot = partition(arr, left, right)
    quick_sort(arr, left, pivot-1)
    quick_sort(arr, pivot+1, right)
end

def partition(arr, left, right)
    pivot, counter = right, 0
    for i in (left...right) do
        if arr[i] < arr[pivot]
            arr[i], arr[pivot] = arr[pivot], arr[i]
            counter += 1
        end
    end
    arr[counter], arr[pivot] = arr[pivot], arr[counter]
    return counter
end

# 归并排序
# 思路：分治+合并，把数组从中间分开，分别对左右子数组排序，然后再把左右子数组merge。稳定。
def merge_sort(arr, left, right)
    return if right <= left
    mid = left + ((right - left) >> 1)
    merge_sort(arr, left, mid)
    merge_sort(arr, mid+1, right)
    merge(arr, left, mid, right)
end

def merge(arr, left, mid, right)
    temp_arr = Array.new(right - left + 1)
    i, j, k = left, mid+1, 0
    while i <= mid && j <= right
        if arr[i] < arr[j]
            temp_arr[k] = arr[i]
            i += 1
        else
            temp_arr[k] = arr[j]
            j += 1
        end
        k += 1
    end
    while i <= mid
        temp_arr[k] = arr[i]
        k += 1
        i += 1
    end
    while j <= right
        temp_arr[k] = arr[j]
        k += 1
        j += 1
    end

    for p in (0...temp_arr.length) do
        arr[left+p] = temp_arr[p]
    end
end