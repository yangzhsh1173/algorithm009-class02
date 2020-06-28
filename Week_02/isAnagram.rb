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

# 重新用哈希表实现，更Ruby了
def is_anagram(s, t)
    return false unless s.length == t.length
    hash = Hash.new(0)
    s.each_char do |c|
        hash[c] += 1
    end
    t.each_char do |c|
        hash[c] -= 1
    end
    hash.each_value do |value|
        return false unless value == 0
    end
    return true
end

# 参考国际站后的实现
def is_anagram(s, t)
	return false unless s.length == t.length
	hash = Hash.new(0)
	(0...s.length).each do |i|
		hash[s[i]] += 1
		hash[t[i]] -= 1
	end
	hash.each_value do |value|
        return false unless value == 0
    end
    return true
end

# 继续参考国际站，用数组模拟哈希表
def is_anagram(s, t)
	return false unless s.length == t.length
	array = Array.new(26, 0)
	(0...s.length).each do |i|
		array[s[i].ord - 'a'.ord] += 1
		array[t[i].ord - 'a'.ord] -= 1
	end
	array.each do |value|
		return false unless value == 0
	end
    return true
end