class Node
    attr_accessor :key, :value, :next, :prev
    def initialize(key = nil, value = nil)
        @key = key
        @value = value
        @next = nil
        @prev = nil
    end
end

class LRUCache
    attr_accessor :capacity, :size, :head, :tail, :hash
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
        node = self.hash[key]
        move_node_to_head(node)
        return node.value
    end

    def put(key, value)
        if self.hash.has_key?(key)
            node = self.hash[key]
            node.value = value
            move_node_to_head(node)
        else
            node = Node.new(key, value)
            add_node_to_head(node)
            self.hash[key] = node
            self.size += 1
            if self.size > self.capacity
                r_node = remove_tail
                self.hash.delete(r_node.key)
                self.size -= 1
            end
        end
    end

    def move_node_to_head(node)
        remove_node(node)
        add_node_to_head(node)
    end

    def remove_node(node)
        node.prev.next = node.next
        node.next.prev = node.prev
    end

    def add_node_to_head(node)
        node.prev = self.head
        node.next = self.head.next
        self.head.next.prev = node
        self.head.next = node
    end

    def remove_tail
        node = self.tail.prev
        remove_node(node)
        return node
    end
end