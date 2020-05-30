# @param {String} s
# @param {String} t
# @return {Boolean}
# 方法1：排序
def is_anagram1(s, t)
    if s.length() != t.length()
        return false
    end
    str1 = s.chars.sort!.join()
    str2 = t.chars.sort!.join()
    return str1.eql?(str2)
end

# 方法2: 哈希表
def is_anagram1(s, t)
    if s.length() != t.length()
		return false
	end
	counter = Hash.new
	s.each_char do |c|
		if counter.has_key?(c)
			counter[c] += 1
		else
			counter[c] = 1
		end
	end
	t.each_char do |c|
		unless counter.has_key?(c)
			return false
		else
			counter[c] -= 1
		end
	end
	counter.each do |key, value|
		if value != 0
			return false
		end
	end
	return true
end