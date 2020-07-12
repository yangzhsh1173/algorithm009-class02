#学习笔记

##位运算
位运算主要包括：左右移位，按位与，按位或，按位取反，按位异或。

###XOR

异或操作的一些特点：

* x^0 = x，即 x 与 0 异或得到自身
* x^1s = ~x，即 x 与 全 1 异或得到的结果是 x 取反（注：1s=~0）
* x^(~x)=1s
* x^x=0
* 交换律：c=a^b，则 b^c=a, a^c=b
* a^b^c=a^(b^c)=(a^b)^c

###指定位置的位运算

1. 将 x 最右边的 n 位清零：x & (~0<<n)
2. 获取 x 的第 n 位值：(x>>n)&1
3. 获取 x 第 n 位的幂值：x & (1<<n
4. 仅将第n位置为1：x | (1<<n)
5. 仅将第n位置为0: x&(~(1<<n))
6. 将x最高位至第n位(含)清零: x&((1<<n)-1)
7. 将第n位至第0位(含)清零: x&(~((1<<(n+1))-1))

###实战中常用的位运算

####判断奇偶
* x%2==1 可以用 (x&1)==1 替换
* x%2==0 可以用 (x&1)==0 替换

####右移代替除2
* x=x/2 --> x>>1
* mid = (left + right)/2 --> mid = (left + right) >> 1

####将最低位的1清零
x=x&(x-1)

####得到最低位的1（即保留最低位的1，其余位清零）
x=x&(-x)

####x&

##LRU Cache
没什么好说的，代码写熟就对了。

Ruby 的实现。

```
class Node
    attr_accessor :key, :val, :prev, :next
    def initialize(key = nil, val = nil)
        @val = val
        @key = key
        @next = nil
        @prev = nil
    end
end

class LRUCache
    attr_accessor :capacity, :hash, :head, :tail, :size
    def initialize(capacity)
        @capacity = capacity
        @size = 0
        @hash = {}
        @head = Node.new
        @tail = Node.new
        @head.next = @tail
        @tail.prev = @head
    end

    def get(key)
       return -1 if !self.hash.has_key?(key) 
       # 根据 key 找到 node 并调整 node 到链表头部
       node = self.hash[key]
       move_to_head(node)
       return node.val
    end

    def put(key, value)
        if self.hash.has_key?(key)
            node = self.hash[key]
            node.val = value
            move_to_head(node)
        else
            node = Node.new(key, value)
            self.hash[key] = node #添加 node 到哈希表
            add_to_head(node) #添加 node 到链表头
            self.size += 1
            # 判断是否超出 cache 上限
            if self.size > self.capacity
                # 删除尾部 node（即最近没有使用的 node）
                r_node = remove_tail
                # 删除哈希表里对应的键值对
                self.hash.delete(r_node.key)
                self.size -= 1
            end
        end
    end

    def move_to_head(node)
        remove_node(node)
        add_to_head(node)
    end

    def add_to_head(node)
        node.prev = self.head
        node.next = self.head.next
        self.head.next.prev = node
        self.head.next = node
    end

    def remove_node(node)
        node.prev.next = node.next
        node.next.prev = node.prev
    end

    def remove_tail
        node = self.tail.prev
        remove_node(node)
        return node
    end
end
```

##排序
* 比较类排序
  * 交换排序：冒泡排序，快速排序
  * 插入排序：简单插入排序，希尔排序
  * 选择排序：简单选择排序，堆排序
  * 归并排序：二路归并排序，多路归并排序
* 非比较类排序（了解为主）
  * 计数排序
  * 桶排序
  * 基数排序

###初级排序 O(n^2)
####选择排序
定义：每次选择最小值，然后放到待排序数组的起始位置

代码实现

```
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
```

####插入排序
思路：从前到后逐步构建有序序列；对于未排序的数据，插入到前面已排序序列的合适位置。

代码实现

```
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
```

####冒泡排序
嵌套循环，每次交换逆序的相邻元素。

代码实现：

```
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
```

###高级排序 O(nlogn)
####快速排序
快排是利用了分治的思想，具体来说：

取标杆 pivot，把小元素放 pivot 左侧，大元素放 pivot 右侧。然后依次对左子数组和右子数组做同样的快排，从而达到整个序列有序的效果。

代码实现：

```
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
```

####归并排序
同样用了分支的思想，具体来说：

1. 把长度为 n 的输入序列分为两半（两个长度为 n/2 的子序列）
2. 分别对这两个子序列做归并排序
3. 最后把两个有序的子序列进行合并

这也叫做 2-路归并。如果有多个子序列，则就是多路归并。

代码实现：

```
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
```

####堆排序
1. 根据数组建立小顶堆
2. 依次取堆顶元素，并删除

再简单总结下堆排序的基本思路：

　　a.**将无需序列构建成一个堆，根据升序降序需求选择大顶堆或小顶堆;**

　　b.**将堆顶元素与末尾元素交换，将最大元素"沉"到数组末端;**

　　c.**重新调整结构，使其满足堆定义，然后继续交换堆顶元素与当前末尾元素，反复执行调整+交换步骤，直到整个序列有序。**

代码实现：

```
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
```