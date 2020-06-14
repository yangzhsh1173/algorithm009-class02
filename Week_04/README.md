#学习笔记

##深度优先搜索和广度优先搜索

**深度优先搜索DFS代码模板**

递归实现：

```
#Python
def dfs(node, visited())
    if node in visited: # terminator
        # already visited 
        return
       
    visited.add(node)
    
    # process current node here. 
	...
	for next_node in node.children(): 
		if next_node not in visited: 
			dfs(next_node, visited)

```

二叉树的情况：

```
void dfs(TreeNode root) {
    if (root == null) {
        return;
    }
    dfs(root.left);
    dfs(root.right);
}
```

或者下面这种形式：

```
visited = set()
def dfs(node, visited):
    visited.add(node)
    # process current node here.
    ...
    for next_node in node.children(): 
        if not next_node in visited: 
            dfs(next node, visited)
```

非递归实现：用一个栈来模拟递归调用

```
def DFS(self, tree): 
	if tree.root is None: 
		return [] 
	visited, stack = [], [tree.root]
	while stack: 
		node = stack.pop() 
		visited.add(node)
		process (node) 
		nodes = generate_related_nodes(node) 
		stack.push(nodes) 
	# other processing work 
	...
```

**广度优先搜索BFS代码模板**

代码模板：用一个队列来实现

```
# Python
def BFS(graph, start, end):
    visited = set()
	queue = [] 
	queue.append([start]) 
	while queue: 
		node = queue.pop() 
		visited.add(node)
		process(node) 
		nodes = generate_related_nodes(node) 
		queue.push(nodes)
	# other processing work 
	...
```

对二叉树的情况：

```
void bfs(TreeNode root) {
    Queue<TreeNode> queue = new ArrayDeque<>();
    queue.add(root);
    while (!queue.isEmpty()) {
        TreeNode node = queue.poll(); // Java 的 pop 写作 poll()
        if (node.left != null) {
            queue.add(node.left);
        }
        if (node.right != null) {
            queue.add(node.right);
        }
    }
}
```

BFS对于层序遍历、最短路径更加适用，可以参考 https://leetcode-cn.com/problems/binary-tree-level-order-traversal/solution/bfs-de-shi-yong-chang-jing-zong-jie-ceng-xu-bian-l/ 这篇文章的分析。

##贪心算法
思路：每一步都选择当前状态下的最优解，以希望达到全局最优解。但只有某些特殊场景下才会达到。适用场景：

* 子问题的最优解能递推得到最终问题的最优解。这种子问题最优解被称为最优子结构。

与动态优化的区别：

* 贪心算法：当下局部做最优判断/选择，不能回退
* 动态规划：可以保留之前的运算结果结果，可以回退。即最优判断+回退。

##二分查找
最重要的熟练！！！

代码模板：

```
# Python
left, right = 0, len(array) - 1 
while left <= right: 
	  mid = (left + right) / 2 
	  if array[mid] == target: 
		    # find the target!! 
		    break or return result 
	  elif array[mid] < target: 
		    left = mid + 1 
	  else: 
		    right = mid - 1
```