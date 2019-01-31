//
//  BinaryTree.m
//  DataStructDemo
//
//  Created by admin on 31/1/19.
//  Copyright © 2019年 Zhuoyu. All rights reserved.
//

#import "BinaryTree.h"

@interface Node : NSObject

/**
 节点元素
 */
@property (nonatomic, assign) NSInteger element;

/**
 左子树
 */
@property (nonatomic, strong) Node *leftChild;

/**
 右子树
 */
@property (nonatomic, strong) Node *rightChild;

@end


@implementation Node

- (instancetype)initWithItem:(NSInteger)item {
    self = [super init];
    if (self) {
        self.element = item;
    }
    
    return self;
}

@end


@interface BinaryTree()

@end


@implementation  BinaryTree

// 添加节点
- (void)add:(NSInteger)item {
    
    Node *node = [[Node alloc] initWithItem: item];
    
    if (self.root == nil)
    {
        self.root =  node;
        
        return;
    }
    
    NSMutableArray *queue = [NSMutableArray array];
    
    [queue addObject: self.root];
    
    while (queue.count) {
        
        Node *curNode = queue.firstObject;
        
        [queue removeObjectAtIndex: 0];
        
        if (curNode.leftChild == nil)
        {
            curNode.leftChild = node;
            return;
        }
        else {
            [queue addObject: curNode.leftChild];
        }
        
        if (curNode.rightChild == nil)
        {
            curNode.rightChild = node;
            return;
        }
        else {
            [queue addObject: curNode.rightChild];
        }
    }
}

// 广度遍历（就是添加顺序）
- (void)breadthTraversal {
    if (self.root == nil) return;
    
    NSMutableArray *queue = [NSMutableArray array];
    
    [queue addObject: self.root];
    
    while (queue.count) {
        
        Node *curNode = queue.firstObject;
        [queue removeObjectAtIndex: 0];
        
        NSLog(@"%ld", curNode.element);
        
        if (curNode.leftChild != nil) [queue addObject: curNode.leftChild];
        
        if (curNode.rightChild != nil) [queue addObject: curNode.rightChild];
    }
}

// 深度遍历分为三种：先序遍历、中序遍历、后序遍历。
// 前序遍历/先序遍历（根左右） 结果：0 1 3 7 8 4 9 2 5 6
- (void)preorderTraversal:(Node *)node {
    if (node == nil) return;
    NSLog(@"%ld", node.element);
    [self preorderTraversal: node.leftChild];
    [self preorderTraversal: node.rightChild];
}

// 中序遍历（左根右） 结果：7 3 8 1 9 4 0 5 2 6
- (void)inorderTraversal:(Node *)node {
    if (node == nil) return;
    [self inorderTraversal: node.leftChild];
    NSLog(@"%ld", node.element);
    [self inorderTraversal: node.rightChild];
}

// 后序遍历（左右根） 结果：7 8 3 9 4 1 5 6 2 0
- (void)postorderTraversal:(Node *)node {
    if (node == nil) return;
    [self postorderTraversal: node.leftChild];
    [self postorderTraversal: node.rightChild];
    NSLog(@"%ld", node.element);
}

@end

