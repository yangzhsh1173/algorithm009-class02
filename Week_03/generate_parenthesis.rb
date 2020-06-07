# @param {Integer} n
# @return {String[]}
# 递归：先不用考虑括号合法性，就是把所有括号可能性排列组合的情况下是一个什么样的递归，然后再增加合法性校验
def generate_parenthesis(n)
    result = []
    generate_parenthesis_recursive(0, 0, n, "", result)
    return result
end

def generate_parenthesis_recursive(left, right, n, str, array)
    # 递归终止条件
    if left == n && right == n
        array.push(str)
        return
    end

    # 处理当前层

    # drill down
    if left < n
        generate_parenthesis_recursive(left + 1, right, n, str + "(", array)
    end
    if right < left
        generate_parenthesis_recursive(left, right + 1, n, str + ")", array)
    end
end