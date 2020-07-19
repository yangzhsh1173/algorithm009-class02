# 32. 最长有效括号 https://leetcode-cn.com/problems/longest-valid-parentheses/
# @param {String} s
# @return {Integer}
def longest_valid_parentheses(s)
    stack,max_len = [-1],0
  s.length.times do |i|
    top = stack.last
    if top!=-1 && s[top] =='(' && s[i] ==')'
      stack.pop
      max_len = [max_len,i-stack.last].max
    else
      stack << i
    end
  end
  max_len
end