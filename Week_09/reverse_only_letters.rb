# 917. 仅仅反转字母 https://leetcode-cn.com/problems/reverse-only-letters/
# @param {String} s
# @return {String}
def reverse_only_letters(s)
    i,j = 0,s.size-1
    while i < j
        if /[^a-z]/i === s[i]
            i += 1
        elsif /[^a-z]/i === s[j]
            j -= 1
        else
            s[i],s[j] = s[j],s[i]
            i += 1
            j -= 1
        end
    end
    s
end