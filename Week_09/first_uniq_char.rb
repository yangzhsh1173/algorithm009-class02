# 387. 字符串中的第一个唯一字符 https://leetcode-cn.com/problems/first-unique-character-in-a-string/
# @param {String} s
# @return {Integer}
def first_uniq_char(s)
    hash = {}
    s.each_char {|x| hash[x] ||= 0; hash[x] += 1}
    s.each_char.with_index {|x, i| return i if hash[x] == 1}
    -1
end