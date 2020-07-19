# 91. 解码方法 https://leetcode-cn.com/problems/decode-ways/
# @param {String} s
# @return {Integer}
def num_decodings(s)
    n = s.length
    if n == 0
        return 0
    end
    
    memo = []
    memo[n] = 1
    memo[n-1] = s[n-1] != '0' ? 1 : 0
    
    (n-2).downto(0).each do |i|
       if s[i] == '0'
           memo[i] = 0
       else
           if  (s[i..i+1].between?('1', '26'))
               memo[i] = memo[i+1] + memo[i+2]
           else
               memo[i] = memo[i+1]
           end
       end
    end
    
    return memo[0]
end