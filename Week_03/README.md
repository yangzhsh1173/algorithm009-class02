#学习笔记

##递归
递归需要满足的三个条件：

1. 一个问题的解可以分解为几个子问题的解（重复子问题）
2. 这个问题与分解后的子问题，除了数据规模不同，求解思路完全一样
3. 存在递归终止条件

思维要点：

1. 不要人肉递归
2. 找到最近最简方法，将问题拆解为可重复解决的问题
3. 数学归纳法思维（推导） 

递归模板代码：

1. 终止条件
2. 处理当前层逻辑
3. 下探到下一层
4. 清理当前层（可选）

```
# Python
def recursion(level, param1, param2, ...): 
    # recursion terminator 
    if level > MAX_LEVEL: 
	   process_result 
	   return 
    # process logic in current level 
    process(level, data...) 
    # drill down 
    self.recursion(level + 1, p1, ...) 
    # reverse the current level status if needed
```
