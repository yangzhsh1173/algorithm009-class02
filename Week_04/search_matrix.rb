# @param {Integer[][]} matrix
# @param {Integer} target
# @return {Boolean}
# 搜索二维矩阵：https://leetcode-cn.com/problems/search-a-2d-matrix/
def search_matrix(matrix, target)
    m = matrix.length
    return false if m == 0
    n = matrix[0].length
    
    start = 0
    finish = m*n-1
    
    while (start <= finish) do 
        mid = (start+finish) / 2
        
        item = matrix[mid / n][mid % n]
        
        
        if item > target
            finish = mid - 1
        elsif item < target
            start = mid + 1
        else
            return true
        end
    end
    
    return false
end