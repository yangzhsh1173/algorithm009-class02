# LRUCache https://leetcode-cn.com/problems/lru-cache/
# 哈希表 + 双向链表

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