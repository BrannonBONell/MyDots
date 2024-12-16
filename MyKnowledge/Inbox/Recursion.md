---
tags: programming algorithms recursion iteration loops 
date: 10-18-2024
---

# Recursion

Recursion is the process where a function calls itself directly or indirectly, and the corresponding function is called a **recursive** function.

Using a recursive algorithm, specific problems can be solved fairly easily. For example:
- Towers of Hanoi (TOH)
- Inorder/Preorder/Postorder Tree Traversals
- DFS of Graph
Can all be solved easily with a recursive algorithm.

Recursive functions solve particular problems by calling a copy of itself to solve smaller subproblems than the original problem.

As many recursive calls can be used to solve the problem just avoid an infinite loop.

Have to provide a certain case in order to terminate the recursion process and prevent the infinite loop.

In summary every time the function calls itself with a simpler version of the original problem

## Need of Recursion

Can use recursion to reduce the length of code and make it easier to read and write.

There are certain advantages of recursion over __iteration__. 

If a task can be defined with a similar subtask recursion is one of the best methods for it.

For Example; The Factorial Number.

## Properties of Recursion

- Performing the same operations multiple times with different inputs
- In every step, try smaller inputs to make the problem smaller
- Base condition is needed to stop recursion and the infinite loop.

### Algorithm: Steps
![[Pasted image 20241018155235.png]]

## Mathematical Interpretation

Determine the sum of first n natural numbers.

__Recursive addition__
```
f(n) = 1                n=1
f(n) = n + f(n-1)       n>1
```

The function f() is being called inside the function, this is called recursion, and the function containing recursion is called a recursive function.

## Recursive functions stored in memory

Recursion uses more memory, the recursive function adds to the stack with each call and keeps the values there until the call is finished.
Recursive functions use LIFO (Last In First Out) structure, just like in stack data structure.

## Base Condition in recursion

Solution to the base case is provided and the solution to the bigger problem is shown in terms of smaller problems:

![[Pasted image 20241018160012.png]]

In above example, base case for n < = 1 is defined and the larger value of a number can be solved by converting to a smaller one till the base case is reached.

## Solving a problem with recursion

Represent a problem in terms of one or more smaller problems, and add one or more base conditions that stop the recursion.

  - Example: Compute factorial n if we know the factorial of (n-1). The base case for factorial would be n=0. Return 1 when n=0.