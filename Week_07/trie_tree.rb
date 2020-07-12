# 实现 Trie 树（前缀树） https://leetcode-cn.com/problems/implement-trie-prefix-tree/

class Trie
    # Initialize your data structure here.
    def initialize()
       @root = {}
       @end_of_word = '#'     
    end


    # Inserts a word into the trie.
    # :type word: String
    # :rtype: Void
    def insert(word)
        node = @root
        word.each_char do |char|
            node[char] ||= {}
            node = node[char]
        end
        node[@end_of_word] = @end_of_word
    end

    # Returns if the word is in the trie.
    # :type word: String
    # :rtype: Boolean
    def search(word)
        node = @root
        word.each_char do |char|
            return false unless node.has_key? char
            node = node[char]
        end
        return node.has_key? @end_of_word
    end


    # Returns if there is any word in the trie that starts with the given prefix.
    # :type prefix: String
    # :rtype: Boolean
    def starts_with(prefix)
        node = @root
        prefix.each_char do |char|
            return false unless node.has_key? char
            node = node[char]
        end
        return true
    end    
    
end
    
