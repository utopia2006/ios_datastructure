//
//  SingleLinkList.m
//  DataStructDemo
//
//  Created by admin on 31/1/19.
//  Copyright © 2019年 Zhuoyu. All rights reserved.
//

#import "SingleLinkList.h"

@interface  SingleLinkListNode : NSObject
@property (nonatomic, assign) int element;
@property (nonatomic, strong) SingleLinkListNode *next;
- (id)initWithItem:(int)item;
@end

@implementation SingleLinkListNode

- (id)initWithItem:(int)item {
    self = [super init];
    if (self) {
        self.element = item;
    }
    return self;
}

@end

@implementation SingleLinkList

/**
 初始化一个单向链表
 
 @param node 链表的头节点
 @return 返回一个已初始化的单向链表
 */
- (instancetype)initWithNode:(SingleLinkListNode *)node {
    self = [super init];
    
    if (self) {
        self.headNode = node;
    }
    
    return self;
}

/**
 判断链表是否为空
 
 @return 为空返回YES，反之为NO
 */
- (BOOL)isEmpty {
    return self.headNode == nil;
}

/**
 获取链表拥有的总节点数
 
 @return 总节点数
 */
- (NSInteger)length {
    // cur游标(指针),用来移动遍历节点
    SingleLinkListNode *cur = self.headNode;
    
    // count记录数量
    NSInteger count = 0;
    
    while (cur) {
        count++;
        cur = cur.next;
    }
    
    return count;
}

/**
 遍历链表
 */
- (void)travel {
    // 空链表的情况
    if ([self isEmpty]) return;
    
    SingleLinkListNode *cur = self.headNode;
    
    while (cur) {
        NSLog(@"%ld",cur.element);
        cur = cur.next;
    }
}

/**
 头插法：在链表的头部插入节点
 
 @param item 插入的元素
 */
- (void)insertNodeAtHeadWithItem:(NSInteger)item {
    SingleLinkListNode *node = [[SingleLinkListNode alloc] initWithItem: item];
    
    node.next = self.headNode;
    self.headNode = node;
}

/**
 尾插法：在链表的尾部插入节点
 
 @param item 插入的元素
 */
- (void)appendNodeWithItem:(NSInteger)item {
    SingleLinkListNode *node = [[SingleLinkListNode alloc] initWithItem: item];
    
    if ([self isEmpty]) {
        self.headNode = node;
    }
    else {
        SingleLinkListNode *cur = self.headNode;
        
        while (cur.next) {
            cur = cur.next;
        }
        
        cur.next = node;
    }
}

/**
 指定位置插入节点
 
 @param item 插入的元素
 @param index 位置的索引
 */
- (void)insertNodeWithItem:(NSInteger)item atIndex:(NSInteger)index {
    
    if (index <= 0) {
        [self insertNodeAtHeadWithItem: item];
    }
    else if (index > ([self length] - 1)) {
        [self appendNodeWithItem: item];
    }
    else {
        SingleLinkListNode *pre = self.headNode;
        
        for (int i = 0; i < index - 1; i++) {
            pre = pre.next;
        }
        
        SingleLinkListNode *node = [[SingleLinkListNode alloc] initWithItem: item];
        
        node.next = pre.next;
        pre.next = node;
    }
}

/**
 删除节点
 
 @param item 删除的元素
 */
- (void)removeNodeWithItem:(NSInteger)item {
    SingleLinkListNode *cur = self.headNode;
    
    SingleLinkListNode *pre = [[SingleLinkListNode alloc] init];
    
    while (cur) {
        if (cur.element == item) {
            // 先判断此节点是否是头节点,如果是头节点
            if (cur == self.headNode) {
                self.headNode = cur.next;
            }
            else {
                pre.next = cur.next;
            }
            cur = nil;
            break;
        }
        else {
            pre = cur;
            cur = cur.next;
        }
    }
}

/**
 查询某个节点是否存在
 
 @param item 查询的元素
 @return 存在返回YES，反之为NO
 */
- (BOOL)searchNodeWithItem:(NSInteger)item {
    SingleLinkListNode *cur = self.headNode;
    
    while (cur) {
        if (cur.element == item) {
            return YES;
        }
        else {
            cur = cur.next;
        }
    }
    
    return NO;
}


@end
