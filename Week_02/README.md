#学习笔记

##哈希表、映射、集合
哈希表：由哈希函数（计算索引）+数组（存储容器）构成。

通常来说，查询、添加、删除的时间复杂度为O(1)。最坏情况下为O(n)。此时哈希表会退化为链表（如果使用的是链地址法）。

解决哈希冲突的常用方法：链地址法，开放定址法，再哈希法，建立公共溢出区

对于优化查询效率的场景，可以考虑用哈希表，以空间换时间。

##树、二叉树、二叉搜索树

记住二叉树的模板代码（包括前/中/后序遍历的代码，包括递归与迭代解法）

```
C++
struct TreeNode {
  int val;
  TreeNode *left;
  TreeNode *right;
  TreeNode(int x) : val(x), left(NULL), right(NULL) {}
}
```

```
Ruby
class TreeNode
    attr_accessor :val, :left, :right
    def initialize(val)
        @val = val
        @left, @right = nil, nil
    end
end
```

```
前序递归
def preorder_traversal(root)
    if root == nil
        return []
    end
    result_list = Array.new
    result_list.push(root.val)
    result_list += preorder_traversal(root.left)
    result_list += preorder_traversal(root.right)
end
```

```
中序递归
def inorder_traversal(root)
    if root == nil
        return []
    end
    result_list = Array.new
    result_list += inorder_traversal(root.left)
    result_list.push(root.val)
    result_list += inorder_traversal(root.right)
end
```

```
后序递归
def postorder_traversal(root)
    if root == nil
        return []
    end
    result_list = Array.new
    result_list += postorder_traversal(root.left)
    result_list += postorder_traversal(root.right)
    result_list.push(root.val)
end
```

二叉搜索树：

* 左子树上所有结点的值均小于它的根结点的值
* 右子树上所有结点的值均大于它的根结点的值

二叉搜索树的中序遍历是升序排列的。

二叉搜索树的查询/添加/删除平均时间复杂度都是O(logn)的，最坏情况下复杂度为O(n)。

##堆（Heap）、二叉堆（Binary Heap）
Heap：可以迅速找到一堆数中最大值或最小值的数据结构。

根节点最大的堆为大顶堆或大根堆；根节点最小的堆叫小顶堆或小根堆。

堆是一种抽象的数据结构，有多种实现，比如二叉堆，Fibonacci 堆，Strict Fibonacci 堆等。二叉堆只是其中一种实现方式，而且是性能比较一般的实现方式。

二叉堆：

* 通过完全二叉树来实现
* 树中任意节点的值总是>=子节点的值

由于二叉堆这种完全二叉树的特性，所以可以使用数组来实现。这里需要掌握数组实现的方式。

假设根节点（第一个元素）在数组的位置为 0 的话，那么父节点和子节点的位置关系如下：

* 索引为 i 的左孩子的索引是 (2*i+1)
* 索引为 i 的右孩子的索引是 (2*i+2)
* 索引为 i 的父节点的索引是 floor((i-1)/2)

要掌握堆的插入/删除操作时的 Heapifyup/Heapifydown。

堆的主要应用：

* 优先级队列
* Top K 问题
* 求中位数/TP90
