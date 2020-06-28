# 回文子串 https://leetcode-cn.com/problems/palindromic-substrings/
# @param {String} s
# @return {Integer}
def count_substrings(s)
    return 0 if s.size < 1
    start_at = 0
    end_at = 0
    count = 0
    for i in 0...s.size
        len1 = expand_from_middle(i, i, s)
        len2 = expand_from_middle(i, i+1, s)
        count += len1 + len2
    end
    count
end

def expand_from_middle(left, right, str)
    return 0 if str.nil? || left > right
    count = 0
    while left >= 0 && right < str.size && str[left] == str[right]
        left -= 1
        right += 1
        count += 1
    end
    count
end