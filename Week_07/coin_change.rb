# 零钱兑换 https://leetcode-cn.com/problems/coin-change/
# 思路：看起来就是一个最短路径问题，可以考虑用 BFS 来解决

# @param {Integer[]} coins
# @param {Integer} amount
# @return {Integer}
def coin_change(coins, amount)
    return -1 if amount < coins.min
    coin_set = Set.new coins
    level = 1
    queue = [11]
    until queue.empty?
        n = queue.size
        n.times do |i|
            last_value = queue.shift
            coins.each do |c|
                value = amount - last_value
                return level + 1 if coin_set.include? value
                queue << value
            end
        end
        level += 1
    end
    level
end
