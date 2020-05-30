# @param {String[]} strs
# @return {String[][]}
# 方法1：对 strs 每个字符串排序，时间复杂度 O(N * K * logK)，K为最大字符串长度
def group_anagrams(strs)
    if strs.length == 0
        return []
    end
    result_list = Array.new
    map = Hash.new
    strs.each do |string|
        sort_string = string.chars.sort!.join
        if map.has_key?(sort_string)
            map[sort_string].push(string)
        else
            map[sort_string] = [string]
        end
    end
    map.each do |key, value|
        result_list.push(value)
    end
    return result_list
end

# 方法2：对每个字符串计算其哈希值，相同哈希值的就可以放到一个 array 里。时间复杂度为 O(N * K)
def group_anagrams2(strs)
    if strs.length == 0
        return []
    end
    result_list = Array.new
    map = Hash.new
    strs.each do |string|
        hash = count_hash(string)
        if map.has_key?(hash)
            map[hash].push(string)
        else
            map[hash] = [string]
        end
    end
    map.each do |key, value|
        result_list.push(value)
    end
    return result_list
end

def count_hash(string)
	array = Array.new(26, 0)
	string.each_char do |c|
		array[c.ord - 'a'.ord] +=1 #通过ascii计算下标
	end
	
	str = ""
	
	array.each do |i|
		str += '#'
		str += "#{i}"
	end
	return str
end