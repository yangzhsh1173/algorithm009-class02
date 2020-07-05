# 有效的数独 https://leetcode-cn.com/problems/valid-sudoku/submissions/
def is_valid_sudoku(board)
    boxes = Array.new(3) { Array.new(3) { Set.new } }
    rows = Array.new(9) { Set.new }
    cols = Array.new(9) { Set.new }
    
    board.each_with_index do |array, row|
        array.each_with_index do |num, col|
            next if num == '.'
            return false unless boxes[row/3][col/3].add?(num) && rows[row].add?(num) && cols[col].add?(num)
        end
    end
    true
end