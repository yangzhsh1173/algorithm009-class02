# 单词接龙 https://leetcode-cn.com/problems/word-ladder/
# BFS
# @param {String} begin_word
# @param {String} end_word
# @param {String[]} word_list
# @return {Integer}
def ladder_length(begin_word, end_word, word_list)
    word_set = Set.new word_list
    visited = Set.new
    visited << begin_word
    queue = [begin_word]
    level = 1
    until queue.empty?
        n = queue.size
        n.times do |i|
            current_word = queue.shift.split ""
            len = current_word.length
            len.times do |j|
                ori_char = current_word[j]
                for c in 'a'..'z' do
                    next if c.eql? current_word[j]
                    current_word[j] = c
                    temp_word = current_word.join
                    puts temp_word
                    if word_set.include? temp_word
                        return level+1 if temp_word.eql?(end_word)
                        unless visited.include?(temp_word)
                            visited << temp_word
                            queue << temp_word
                        end
                    end
                end
                current_word[j] = ori_char # 恢复
            end
        end
        level += 1
    end
    return 0
end

# Two-ended BFS
def ladder_length(begin_word, end_word, word_list)
    word_set = Set.new word_list
    return 0 unless word_set.include? end_word
    visited = Set.new
    visited << begin_word
    begin_set, end_set = Set.new, Set.new
    begin_set << begin_word
    end_set << end_word
    step = 1
    while !begin_set.empty? && !end_set.empty?
        if begin_set.size > end_set.size
            begin_set, end_set = end_set, begin_set
        end
        next_set = Set.new
        begin_set.each do |word|
            word.length.times do |i|
                word_left = word[0...i]
                word_right = word[i+1...word.length]
                for c in 'a'..'z' do
                    next if c.eql? word[i]
                    temp_word = word_left + c + word_right
                    if word_set.include? temp_word
                        return step+1 if end_set.include? temp_word
                    end
                    if word_set.include?(temp_word) && !visited.include?(temp_word)
                        visited << temp_word
                        next_set << temp_word
                    end
                end
            end
        end
        begin_set = next_set
        step += 1
    end
    0
end