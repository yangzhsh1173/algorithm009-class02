# @param {Integer[]} height
# @return {Integer}
def max_area(height)
    max = 0
    i, j = 0, height.length - 1
    while i < j
        area = (j - i) * [height[i], height[j]].min
        max = [max, area].max
        if height[i] <= height[j]
            i += 1
        else
            j -= 1
        end
    end
    max
end