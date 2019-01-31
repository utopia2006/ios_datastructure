//
//  BinaryTree.h
//  DataStructDemo
//
//  Created by admin on 31/1/19.
//  Copyright © 2019年 Zhuoyu. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Node;

@interface BinaryTree : NSObject

@property (nonatomic, strong) Node *root;

/**
 添加节点
 @param item 节点根元素
 */
- (void)add:(NSInteger)item;

/**
 广度遍历
 */
- (void)breadthTraversal;

/**
 前序遍历（先序遍历）
 @param node 遍历开始节点
 */
- (void)preorderTraversal:(Node *)node;

/**
 中序遍历
 @param node 遍历开始节点
 */
- (void)inorderTraversal:(Node *)node;

/**
 后序遍历
 @param node 遍历开始节点
 */
- (void)postorderTraversal:(Node *)node;

@end
