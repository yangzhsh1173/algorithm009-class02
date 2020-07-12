# 选择排序
def select_sort(array)
    min_index, len = 0, array.length
    (0...len-1).each do |i|
        min_index = i
        (i+1...len).each do |j|
            if array[j] < array[min_index]
                min_index = j
            end
        end
        array[i], array[min_index] = array[min_index], array[i]
    end
    array
end

# 插入排序
def insert_sort(array)
    len, pre_index, current = array.length, 0, 0
    (1...len).each do |i|
        pre_index = i-1
        current = array[i]
        while pre_index >= 0 && array[pre_index] > current
            array[pre_index+1] = array[pre_index]
            pre_index -= 1
        end
        array[pre_index+1] = current
    end
    return array
end

# 冒泡排序
def bubble_sort(array)
    len = array.length
    (0...len-1).each do |i|
        (i+1...len).each do |j|
            if array[j] > array[j+1]
                array[j], array[j+1] = array[j+1], array[j]
            end
        end
    end
    return array
end

# 快速排序
def quick_sort(array, left, right)
    return if right <= left
    pivot = partition(array, left, right)
    quick_sort(array, left, pivot-1)
    quick_sort(array, pivot+1, right)
end

def partition(array, left, right)
    pivot, counter = right, left
    (left...right).each do |i|
        if array[i] < array[pivot]
            array[i], array[pivot] = array[pivot], array[i]
            counter += 1
        end
    end
    array[counter], array[pivot] = array[pivot], array[counter]
    return counter
end

# 归并排序
def merge_sort(array, left, right)
    return if right <= left
    mid = (left + right) >> 1

    merge_sort(array, left, mid)
    merge_sort(array, mid + 1, right)
    merge(array, left, mid, right)
end

def merge(array, left, mid, right)
    temp_arr = Array.new(right - left + 1)
    i, j, k = left, mid + 1, 0
    while i <= mid && j <= right
        if array[i] <= array[j]
            temp_arr[k] = array[i]
            i += 1
        else
            temp_arr[k] = array[j]
            j += 1
        end
        k += 1
    end

    while i <= mid
        temp_arr[k] = array[i]
        i += 1
        k += 1
    end

    while j <= right
        temp_arr[k] = array[j]
        j += 1
        k += 1
    end

    for p in (0...temp_arr.length) do
        array[left + p] = temp_arr[p]
    end
end

# 堆排序
def heap_sort(array)
    return if array.length == 0

    len = array.length
    i = len / 2 - 1
    # 构建大顶堆
    while i >= 0
        heapify(array, len, i)
        i -= 1
    end

    # 将堆顶元素与末尾元素交换，使末尾元素最大。然后继续调整堆。如此反复。
    i = len - 1
    while i >= 0
        array[i], array[0] = array[0], array[i]
        heapify(array, i, 0)
    end
end

def heapify(array, length, i)
    left, right = 2 * i + 1, 2 * i + 2
    largest = i

    if left < length && array[largest] < array[left]
        largest = left
    end
    if right < length && array[largest] < array[right]
        largest = right
    end

    if largest != i
        array[largest], array[i] = array[i], array[largest]
        heapify(array, length, largest)
    end
end