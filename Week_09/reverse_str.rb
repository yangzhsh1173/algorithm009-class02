# 541. 反转字符串 II https://leetcode-cn.com/problems/reverse-string-ii/
# @param {String} s
# @param {Integer} k
# @return {String}
def reverse_str(s, k)
    for i in (0 ... s.length).step k*2
		s[i ... i+k] = s[i ... i+k].reverse
	end
	s
end