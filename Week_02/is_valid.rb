# https://leetcode-cn.com/problems/valid-parentheses/
# @param {String} s
# @return {Boolean}
def is_valid(s)
    return false if s.nil?
    map = {')'=>'(', '}'=>'{', ']'=>'['}
    left_set = ['(', '{', '[']
    stack = []
    s.each_char do |c|
        if left_set.include?(c)
            stack << c
        elsif map[c].eql? stack.last
            stack.pop
        else
            return false
        end
    end
    
    return stack.empty?
end

puts is_valid '()'