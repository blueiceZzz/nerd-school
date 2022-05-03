## 0. TODOs

- review the Bmp class from lecture
- class def: do an exercise
- sorting: done
- matrix: https://leetcode.com/problems/sort-the-matrix-diagonally/: it's no more than a std::vector<std::vector<double>>
- three types of casts: done
- single / double linked lists (C++ lecture): viewed
- template syntax: done
- a little graph

- SVS interiew: 
	- solve a few problems on your own
	- understand the code given and try to locate the error
	- more of an open atmosphere for discussion, and solving a problem

## 1.  Generals:

- go bottom-up when learning: understand the basic underlying concepts first before tackling the problems
- algoExpert: 99$: https://www.algoexpert.io/product
- leetCode: Explore: https://leetcode.com/explore/interview/card/top-interview-questions-easy/ 
	All problems: https://leetcode.com/problemset/all/ 
	- use leetCode: https://www.youtube.com/watch?v=CltYi33y0ls, start with doing 20 easy problems and stick with medium ones. Don't stick with one problem for too long, see the solution and learn from it. You will get into the similar problems. 
- Crack the coding interview: https://www.crackingthecodinginterview.com/contents.html
- hackerrank: https://www.hackerrank.com/dashboard
- coding interview: 
	- https://www.youtube.com/watch?v=LQFsEwcCO1E you always also have to convince the interviewers with personality, cause its all human. Communication, leadership, collaboration, friendliness, ability to tackle complexity, ambiguity, time efficiency, enthusiasm, charm the interviewers, passion for learning! It's not about memorizing the solution, but about analyzing the problem and how you reach the answer, teamwork, collaboration, the process is far more important. 
	- junior developer is not primarily evaluated for their past experience, but rather their future potential, ability to execute on the PROJECT.
	- so leetcode is more for the syntax and algo knowledge, there is surely more to the interview
- do-while loop syntax: 
	do{    
		//code to be executed    
	}while(condition);  

## 2. Important / Possible topics: 

- Complexity of code / different algos, don't write too complex codes
- Memory management, freeing memory, different std::pointers
- bit manipulation: kinda done
- Std container libs (array, vectors, linked list and so on) -> kinda done
- Graph / tree / matrix traversal (depth / breabth first search): keep track of visited nodes, O(n), n: number of nodes
	- tree traversals explanation: https://www.tutorialspoint.com/data_structures_algorithms/tree_traversal.htm
		- tree ('=': new level): 1=2-3=4-5-null-null
		- Depth First Traversals: 
			(a) Inorder (Left, Root, Right) : 4 2 5 1 3 
			(b) Preorder (Root, Left, Right) : 1 2 4 5 3 
			(c) Postorder (Left, Right, Root) : 4 5 2 3 1
		- inorder traversal: one of the depth-first-traversal
			Until all nodes are traversed −
			Step 1 − Recursively traverse left subtree.
			Step 2 − Visit root node.
			Step 3 − Recursively traverse right subtree.
		- breadth-first-traversal: https://www.geeksforgeeks.org/level-order-tree-traversal/
- Build a binary tree, invert a binary tree , reverse a linked list
- Suffix tree
- Binary search: done. mid calculation: mid = l + (l + r) / 2; not mid = (l + r) / 2; to avoid possible overflow, when l, r have big values (near to 2^31 - 1)
- Pointer arithmetic. Sliding window method: manipulating two pointers at the same time
- Recursion: shows a good logic capability and solves many problems elegantly
- Data structures: heap, stack
- Dynamic programming: divide a problem into little trivial parts and solve them
- Sorting: quick sort, merge sort https://www.geeksforgeeks.org/sorting-algorithms/: bubble sort and merge sort: done
	- selection sort: O(n): The selection sort algorithm sorts an array by repeatedly finding the minimum element (considering ascending order) from unsorted part and putting it at the beginning. https://www.geeksforgeeks.org/selection-sort/
	- bubble sort: Bubble Sort is the simplest sorting algorithm that works by repeatedly swapping the adjacent elements if they are in wrong order. stop algo if no swap happens in an iteration. O(n^2) for worst case (when array is reversed sorted), O(n) if array already sorted. https://www.geeksforgeeks.org/bubble-sort/
	- merge sort: Like QuickSort, Merge Sort is a Divide and Conquer algorithm. It divides the input array into two halves, calls itself for the two halves, and then merges the two sorted halves. It recursively divides array into the primary elements, make comparison there, and recursively merges the smaller sorted subarrays (this is the advantage, cause the subarray is already sorted, you can go index++) into a big one at the end. https://www.geeksforgeeks.org/merge-sort/
		- Time complexity of Merge Sort is  θ(nLogn) in all 3 cases (worst, average and best) as merge sort always divides the array into two halves and takes linear time to merge two halves. Auxiliary (helping) space: O(n)
		- MergeSort(arr[], l,  r)
		If r > l
			1. Find the middle point to divide the array into two halves:  
					middle m = l+ (r-l)/2
			2. Call mergeSort for first half:   
					Call mergeSort(arr, l, m)
			3. Call mergeSort for second half:
					Call mergeSort(arr, m+1, r)
			4. Merge the two halves sorted in step 2 and 3:
					Call merge(arr, l, m, r)
	- quick sort (recursive): Like Merge Sort, QuickSort is a Divide and Conquer algorithm. It picks an element as pivot and partitions (e.g. with swapping elements with pivot when in the wrong partition) the given array around the picked pivot. https://www.geeksforgeeks.org/quick-sort/
		- There are many different versions of quickSort that pick pivot in different ways. 
		Always pick first element as pivot.
		Always pick last element as pivot (implemented below)
		Pick a random element as pivot.
		Pick median as pivot.
		- /* low  --> Starting index,  high  --> Ending index */
		quickSort(arr[], low, high)
		{
			if (low < high)
			{
				/* pi is partitioning index, arr[pi] is now
				at right place */
				pi = partition(arr, low, high);

				quickSort(arr, low, pi - 1);  // Before pi
				quickSort(arr, pi + 1, high); // After pi
			}
		- The key process in quickSort is partition(). Target of partitions is, given an array and an element x of array as pivot, put x at its correct position in sorted array and put all smaller elements (smaller than x) before x, and put all greater elements (greater than x) after x. All this should be done in linear time.
		- Solution of above recurrence is also O(nLogn). Although the worst case (always picking the smallest / biggest element of arrays) time complexity of QuickSort is O(n2) which is more than many other sorting algorithms like Merge Sort and Heap Sort, QuickSort is faster in practice, because its inner loop can be efficiently implemented on most architectures, and in most real-world data.  QuickSort can be implemented in different ways by changing the choice of pivot, so that the worst case rarely occurs for a given type of data. However, merge sort is generally considered better when data is huge and stored in external storage. 
- Class definition: five kinds of constructor, rule of zero / three / five, destructor
- Class inheritance: how to define it, function overloading
- Error check: check if (input) variables are none, empty, the wrong type and stuff, mostly at the beginning of a program/funciton
- Software tests
- Embedded systems
- OpenGL and 3D visualization
- whiteboarding: bring backup resumes, markers, paper and pen