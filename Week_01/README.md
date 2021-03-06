学习笔记

##如何高效学习
1. 摒弃之前的习惯，不要死磕
2. 刻意联系：五毒神掌，过遍数，敢于死记硬背代码
3. 要看高票答案和高质量题解

##数据结构与算法总览
学习的三要素：切碎知识点，刻意练习，反馈

切碎知识点就是梳理成知识树。把数据结构与算法的知识体系整理成脉络相连的脑图。

刻意练习。过遍数，五毒神掌。

反馈。主动反馈（职业选手第一视角，高手操作，别人写的很好的代码），被动反馈（高手指点，code review）。

单个题目的切题四件套：

* 反复沟通，理解题目
* 所有可能的解法，比较时空复杂度，从中找出最优解
* 写代码
* 测试 case

###五毒神掌：
第一遍

 * 5-15分钟读题+思考
 * 没有思路直接看解法：注意比较不同解法的优劣
 * 背诵、默写好的解法

 第二遍
 
 * 自己写代码，不要再看别人的了。写完后放到 LeetCode 上后提交。
 * 可以用多种解法，并优化
 
第三遍

* 过一天后，重新做前一天的题目
* 对不熟悉的题目，专项练习

第四遍

* 一周之后，再专项练习

第五遍

* 面试前1-2周，恢复性练习

##复杂度分析
常见的 7 种时间复杂度：

* O(1): Constant Complexity 常数复杂度
* O(log n): Logarithmic Complexity 对数复杂度
* O(n): Linear Complexity 线性时间复杂度
* O(n^2): N square Complexity 平方
* O(n^3): N cubic Complexity 立方
* O(2^n): Exponential Growth 指数
* O(n!): Factorial 阶乘

主定理及推导出来的一些常用算法的复杂度：

* 二分查找：O(log n)
* 二叉树遍历：O(n)
* 有序二维矩阵的二分查找：O(n)
* 归并排序：O(nlog n)

关于二叉树/图的遍历的时间复杂度，可以这么理解：每个节点会遍历一次，且只会遍历一次。同理，DFS/BFS 的时间复杂度也是 O(n) 的。

##数组与链表

###数组
关键词：连续存储，相同数据类型的元素（高级语言中有泛型的定义，不强制要求必须是同一个 Class）

数组的插入与删除操作比较低效，因为涉及到数据的搬移操作。平均时间复杂度为O(n)。

数组的优势在于随机访问，也就是通过下标查找元素的效率很高。而这正是得益于数组的连续内存存储的结构。我们可以通过下面的公式快速找到下标为 index 的数组元素，其中  base_address 为数组的起始地址：

```
a[index]_address = base_address + index * data_type_size
```

**注意：并不是说数组的查询效率更高，而是随机访问的效率更高。**

###链表
与数组正相反，链表的插入与删除操作很高效，为O(1)。注意，这里指的是已经知道要在哪个结点后做删除/添加操作。而如果要先查找结点，那链表的查询效率就没那么高了，是O(n)的时间复杂度。

我们平时在解题时经常用的是双向链表，尤其是 LRU cache 的实现就是一个很经典的例子。

链表的操作需要注意的就是指针的操作，不要让 next/prev 中断，再一个就是要留意边界条件。

###栈和队列
* 栈是 FILO 的数据结构，只能在一端操作
* 队列是 FIFO 的数据结构。普通队列在队头入队，队尾出队；当然也有双端队列，队头队尾都支持入队与出队操作。

