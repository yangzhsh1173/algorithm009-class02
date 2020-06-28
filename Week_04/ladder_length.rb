# @param {String} begin_word
# @param {String} end_word
# @param {String[]} word_list
# @return {Integer}
# BFS
def ladder_length(begin_word, end_word, word_list)
    return 0 unless word_list.include?(end_word)
    word_set = Set.new word_list
    to_check = [[begin_word, 1]]
    while !to_check.empty? do 
        pointer = to_check.first.first
        level = to_check.first.last
        return level if pointer == end_word
        to_check.shift
        pointer.size.times do |i|
            left = pointer[0...i]
            right = pointer[(i + 1)...pointer.size]
            for c in "a".."z" do
                next if c == pointer[i]
                temp = left + c + right
                if word_set.include?(temp) then
                    word_set.delete(temp)
                    to_check << [temp, level + 1]
                end
            end
        end
    end
    0
end

# 参考了这个题解的实现 https://leetcode-cn.com/problems/word-ladder/solution/yan-du-you-xian-bian-li-shuang-xiang-yan-du-you-2/
def ladder_length(begin_word, end_word, word_list)
    word_set = Set.new(word_list)
    return 0 unless word_set.include?(end_word)
    visited = Set.new
    visited << begin_word
    queue = [begin_word]
    word_len = begin_word.length
    level = 1
    while !queue.empty?
        n = queue.size
        n.times do |i|
            current_word = queue.shift
            current_word.length.times do |j|
                word_left = current_word[0...j]
                word_right = current_word[j+1...current_word.length]
                for c in 'a'..'z' do
                    next if c == current_word[j]
                    temp_word = word_left + c + word_right
                    if word_set.include?(temp_word)
                        return level + 1 if temp_word.eql?(end_word)
                        unless visited.include?(temp_word)
                            queue << temp_word
                            visited << temp_word
                        end
                    end
                end
            end
        end
        level += 1
    end
    0
end