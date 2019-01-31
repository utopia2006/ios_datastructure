//
//  DoubleLinkList.m
//  DataStructDemo
//
//  Created by admin on 31/1/19.
//  Copyright © 2019年 Zhuoyu. All rights reserved.
//

#import "DoubleLinkList.h"

@interface DoubleLinkListNode : NSObject

/**
 节点元素值
 */
@property (nonatomic, assign) NSInteger element;

/**
 下一个节点
 */
@property (nonatomic, strong) DoubleLinkListNode *nextNode;

/**
 前一个节点
 */
@property (nonatomic, strong) DoubleLinkListNode *prevNode;

@end


@implementation DoubleLinkListNode

- (instancetype)initWithItem:(NSInteger)item {
    self = [super init];
    if (self) {
        self.element = item;
    }
    
    return self;
}

@end


@interface DoubleLinkList()

/**
 链表头节点
 */
@property (nonatomic, strong) DoubleLinkListNode *headNode;

@end

@implementation DoubleLinkList

- (instancetype)initWithNode:(DoubleLinkListNode *)node {
    
    self = [super init];
    if (self) {
        self.headNode = node;
    }
    return self;
}

- (BOOL)isEmpty {
    return self.headNode == nil;
}

- (NSInteger)length {
    
    DoubleLinkListNode *cur = self.headNode;
    NSInteger count = 0;
    while (cur) {
        count++;
        cur = cur.nextNode;
    }
    return count;
}

// 遍历链表
- (void)travel {
    // 空链表的情况
    if ([self isEmpty]) return;
    
    DoubleLinkListNode *cur = self.headNode;
    
    while (cur) {
        NSLog(@"%ld",cur.element);
        cur = cur.nextNode;
    }
}

// ==============以上与单向链表完全一致==============================

// 链表头部添加元素，头插法
- (void)insertNodeAtHeadWithItem:(NSInteger)item {
    DoubleLinkListNode *node = [[DoubleLinkListNode alloc] initWithItem: item];
    
    node.nextNode = self.headNode;
    
    // =====只加了这一句=====
    self.headNode.prevNode = node;
    
    self.headNode = node;
}

// 链表尾部添加元素，尾插法
- (void)appendNodeWithItem:(NSInteger)item {
    DoubleLinkListNode *node = [[DoubleLinkListNode alloc] initWithItem: item];
    
    if ([self isEmpty]) {
        self.headNode = node;
    }
    else {
        DoubleLinkListNode *cur = self.headNode;
        
        while (cur.nextNode) {
            cur = cur.nextNode;
        }
        
        cur.nextNode = node;
        
        // =====只加了这一句=====
        node.prevNode = cur;
    }
    
}

// 指定位置添加元素
- (void)insertNodeWithItem:(NSInteger)item atIndex:(NSInteger)index {
    if (index <= 0) {
        [self insertNodeAtHeadWithItem: item];
    }
    else if (index > ([self length] - 1)) {
        [self appendNodeWithItem: item];
    }
    else {
        
        DoubleLinkListNode *cur = self.headNode;
        
        for (int i = 0; i < index; i++) // i < index -1 改为 i < index
        {
            cur = cur.nextNode;
        }
        
        DoubleLinkListNode *node = [[DoubleLinkListNode alloc] initWithItem: item];
        
        node.nextNode = cur;
        node.prevNode = cur.prevNode;
        cur.prevNode.nextNode = node;
        cur.prevNode = node;
    }
}

// 删除节点
- (void)removeNodeWithItem:(NSInteger)item {
    DoubleLinkListNode *cur = self.headNode;
    
    while (cur != nil) {
        if (cur.element == item) {
            // 先判断此节点是不是头节点
            // 头节点
            if (cur == self.headNode) {
                // 如果链表只有一个节点那么cur.nextNode == nil
                self.headNode = cur.nextNode;
                // cur.nextNode不为空即表示链表不只有一个节点
                if (cur.nextNode) {
                    // 删除头节点后下一个节点的prev节点仍然储存着原头节点，所以要置空
                    cur.nextNode.prevNode = nil;
                }
            }
            else {
                // 删除普通节点
                // 一、让cur前一个节点的next连上cur后一个节点
                cur.prevNode.nextNode = cur.nextNode;
                
                // 二、如果cur的后一个节点存在，让cur后一个节点的prev连上cur前一个节点
                if (cur.nextNode) {
                    cur.nextNode.prevNode = cur.prevNode;
                }
                
                break;
            }
        }
        else {
            cur = cur.nextNode;
        }
    }
}

// 查找节点是否存在
- (BOOL)searchNodeWithItem:(NSInteger)item {
    DoubleLinkListNode *cur = self.headNode;
    
    while (cur != nil) {
        if (cur.element == item) {
            return YES;
        }
        else {
            cur = cur.nextNode;
        }
    }
    
    return NO;
}

@end
