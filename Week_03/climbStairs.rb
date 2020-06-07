# @param {Integer} n
# @return {Integer}
# 暴力递归，提示超时
# def climb_stairs(n)
#     if n == 0 || n == 1
#         return 1
#     end
#     return climb_stairs(n-1) + climb_stairs(n-2)
# end

# 递归 + 缓存
# def climb(n, array)
#     if array[n] != nil
#         return array[n]
#     end
#     array[n] = climb(n-1, array) + climb(n-2, array)
#     return array[n]
# end
# def climb_stairs(n)
#     if n < 0
#         return 0
#     end
#     if n <= 2
#         return n
#     end
#     array = []
#     array[1] = 1
#     array[2] = 2
#     return climb(n, array)
# end

# 动态规划1
# def climb_stairs(n)
#     if n <=2 
#         return n
#     end
#     array = []
#     n.times do |i|
#         if i <= 2
#             array[i] = i
#         else
#             array[i] = array[i-1] + array[i-2]
#         end
#     end
#     return array[n-1] + array[n-2]
# end

# 动态规划2
# def climb_stairs(n)
#     if n <= 2
#         return n
#     end
#     first = 1
#     second = 2
#     third = 0
#     i = 3
#     while i <= n
#         third = first + second
#         first = second
#         second = third
#         i += 1
#     end
#     return third
# end

# Ruby style
def climb_stairs(n)
    a = b = 1
    n.times { a, b = b, a+b }
    a
end