# 添加与搜索单词-数据结构设计 https://leetcode-cn.com/problems/add-and-search-word-data-structure-design/
# 参考 https://leetcode.com/problems/add-and-search-word-data-structure-design/discuss/59609/Ruby-recursive-solution-beats-100 的实现
# 光头哥的实现 https://leetcode.com/problems/add-and-search-word-data-structure-design/discuss/59576/Tree-solutions-18-20-lines
class WordDictionary

=begin
    Initialize your data structure here.
=end
    def initialize()
        @root = {}
        @end_of_word = '#'
    end


=begin
    Adds a word into the data structure.
    :type word: String
    :rtype: Void
=end
    def add_word(word)
        node = @root
        word.each_char do |char|
            node[char] ||= {}
            node = node[char]
        end
        node[@end_of_word] = @end_of_word
    end


=begin
    Returns if the word is in the data structure. A word could contain the dot character '.' to represent any one letter.
    :type word: String
    :rtype: Boolean
=end
    def search(word)
        node = @root
        return dfs_search word, node
    end

    def dfs_search(word, node)
        return false unless node.is_a? Hash
        return node.has_key?(@end_of_word) if word.length == 0
        char, next_word = word[0], word[1...word.length]
        if word[0] != '.'
           return node.has_key?(char) && dfs_search(next_word, node[char]) 
        end
        results = node.map do |k, v|
            dfs_search next_word, v
        end
        return results.any? # 如果有任一子树分支的结果为 true，则证明有该单词
    end
end