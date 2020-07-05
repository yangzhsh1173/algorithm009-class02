#学习笔记

##字典树（Trie树）
###基本概念
字典树的一个关键点在于，树中每个结点不再是存储完整的值（比如字符串），而是把字符串拆成单个单个的字母，并把每个字母存到结点。当然，也有一种方式是，路径/指针为单个字母，结点的值为统计频次。

定义：字典树，即 Trie 树，又称单词 查找树或键树，是一种树形结 构。典型应用是用于统计和排 序大量的字符串(但不仅限于 字符串)，所以经常被搜索引 擎系统用于文本词频统计。

优点：最大限度地减少 无谓的字符串比较，查询效率 比哈希表高。

###基本性质
1. 结点本身不存完整单词;
2. 从根结点到某一结点，路径上经过的字符连接起来，为该结点对应的 字符串;
3. 每个结点的所有子结点路径代表的字符都不相同。

###适用场景
* 词频感应，比如由“周杰”感应出可能的“周杰伦”等词汇
* 由前缀来推测后面可能的词语

###核心思想
Trie 树的核心思想是空间换时间。 利用字符串的公共前缀来降低查询时间的开销以达到提高效率的目的。

###代码模板

```
# Python 
class Trie(object):
  
	def __init__(self): 
		self.root = {} 
		self.end_of_word = "#" 
 
	def insert(self, word): 
		node = self.root 
		for char in word: 
			node = node.setdefault(char, {}) 
		node[self.end_of_word] = self.end_of_word 
 
	def search(self, word): 
		node = self.root 
		for char in word: 
			if char not in node: 
				return False 
			node = node[char] 
		return self.end_of_word in node 
 
	def startsWith(self, prefix): 
		node = self.root 
		for char in prefix: 
			if char not in node: 
				return False 
			node = node[char] 
		return True
```

## 并查集
###适用场景
* 组团、配对问题
* 朋友圈

###基本操作
* makeSet(s):建立一个新的并查集，其中包含 s 个单元素集合。
* unionSet(x, y):把元素 x 和元素 y 所在的集合合并，要求 x 和 y 所在
的集合不相交，如果相交则不合并。
* find(x):找到元素 x 所在的集合的代表，该操作也可以用于判断两个元 素是否位于同一个集合，只要将它们各自的代表比较一下就可以了。

###代码模板
```
// Java
class UnionFind { 
	private int count = 0; 
	private int[] parent; 
	public UnionFind(int n) { 
		count = n; 
		parent = new int[n]; 
		for (int i = 0; i < n; i++) { 
			parent[i] = i;
		}
	} 
	public int find(int p) { 
		while (p != parent[p]) { 
			parent[p] = parent[parent[p]]; 
			p = parent[p]; 
		}
		return p; 
	}
	public void union(int p, int q) { 
		int rootP = find(p); 
		int rootQ = find(q); 
		if (rootP == rootQ) return; 
		parent[rootP] = rootQ; 
		count--;
	}
}
```
Python

```
# Python 
def init(p): 
	# for i = 0 .. n: p[i] = i; 
	p = [i for i in range(n)] 
 
def union(self, p, i, j): 
	p1 = self.parent(p, i) 
	p2 = self.parent(p, j) 
	p[p1] = p2 
 
def parent(self, p, i): 
	root = i 
	while p[root] != root: 
		root = p[root] 
	while p[i] != i: # 路径压缩 ?
		x = i; i = p[i]; p[x] = root 
	return root
```

##高级搜索

##平衡二叉树
平衡二叉树有很多种，它的出现是为了解决二叉树退化成链表引起的效率问题。常见的或者说需要我们掌握的是 AVL 树、红黑树、2-3树、B树、B+树等几种。

###AVL
