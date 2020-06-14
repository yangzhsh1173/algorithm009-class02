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