# @param {Character[][]} grid
# @return {Integer}
# DFS
def num_islands(grid)
    return 0 if grid.nil? or grid.empty? or grid[0].nil? or grid[0].empty?
    cnt = 0
    (0...grid.size).each do |i|
        (0...grid[0].size).each do |j|
            next if grid[i][j] != '1'
            dfs(grid, i, j)
            cnt += 1
        end
    end
    cnt
end

def dfs(grid, i, j)
    return if i < 0 or i >= grid.size or j < 0 or j >= grid[0].size or grid[i][j] == '0'
    grid[i][j] = '0'
    dfs(grid, i - 1, j)
    dfs(grid, i + 1, j)
    dfs(grid, i, j - 1)
    dfs(grid, i, j + 1)
end

# BFS
def num_islands(grid)
    return 0 if grid.nil? or grid.empty? or grid[0].nil? or grid[0].empty?
    cnt = 0
    (0...grid.size).each do |i|
        (0...grid[0].size).each do |j|
            next if grid[i][j] != '1'
            bfs(grid, i, j)
            cnt += 1
        end
    end
    cnt
end

def bfs(grid, i, j)
    queue = [[i, j]]
    while cur = queue.shift
        grid[cur[0]][cur[1]] = '0'
        if cur[0] - 1 >= 0 and grid[cur[0] - 1][cur[1]] == '1'
            queue.push([cur[0] - 1, cur[1]])
            grid[cur[0] - 1][cur[1]] = '0'
        end
        if cur[0] + 1 < grid.size and grid[cur[0] + 1][cur[1]] == '1'
            queue.push([cur[0] + 1, cur[1]])
            grid[cur[0] + 1][cur[1]] = '0'
        end
        if cur[1] - 1 >= 0 and grid[cur[0]][cur[1] - 1] == '1'
            queue.push([cur[0], cur[1] - 1])
            grid[cur[0]][cur[1] - 1] = '0'
        end
        if cur[1] + 1 < grid[0].size and grid[cur[0]][cur[1] + 1] == '1'
            queue.push([cur[0], cur[1] + 1])
            grid[cur[0]][cur[1] + 1] = '0'
        end
    end
end