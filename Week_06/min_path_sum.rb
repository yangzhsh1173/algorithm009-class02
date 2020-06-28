# 最小路径和 https://leetcode-cn.com/problems/minimum-path-sum/
# @param {Integer[][]} grid
# @return {Integer}
def min_path_sum(grid)
    row_length = grid.length
    col_length = grid.first.length
    
    (0...row_length).each do |row_idx|
        (0...col_length).each do |col_idx|
            if row_idx == 0 && col_idx == 0
                next
            elsif row_idx == 0
                value = grid[row_idx][col_idx] + grid[row_idx][col_idx - 1]
                grid[row_idx][col_idx] = value
            elsif col_idx == 0
                value = grid[row_idx][col_idx] + grid[row_idx-1][col_idx]
                grid[row_idx][col_idx] = value
            else
                prev_left = grid[row_idx][col_idx - 1]
                prev_top = grid[row_idx - 1][col_idx]
                
                min_val = [prev_left, prev_top].min
                grid[row_idx][col_idx] += min_val
            end
        end
    end

    grid.last.last
end