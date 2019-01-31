//
//  ViewController.m
//  DataStructDemo
//
//  Created by admin on 31/1/19.
//  Copyright © 2019年 Zhuoyu. All rights reserved.
//

#import "ViewController.h"
#import "SingleLinkList.h"
#import "DoubleLinkList.h"
#import "BinaryTree.h"
#import "ZYStack.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    //[self singleLinkListDemo];
    //[self doubleLinkListDemo];
    [self stackDemo];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)singleLinkListDemo {
    SingleLinkList *lkList = [[SingleLinkList alloc] initWithNode: nil];
    
    NSLog(@"%d", [lkList isEmpty]); // 1
    NSLog(@"%ld", [lkList length]); // 0
    
    [lkList appendNodeWithItem: 1];
    NSLog(@"%d", [lkList isEmpty]); // 0
    NSLog(@"%ld", [lkList length]); // 0
    
    [lkList appendNodeWithItem: 2];
    [lkList insertNodeAtHeadWithItem: 8]; //9 8 2 3 4 5 6 200
    [lkList appendNodeWithItem: 3];
    [lkList appendNodeWithItem: 4];
    [lkList appendNodeWithItem: 5];
    
    [lkList appendNodeWithItem: 6];                 // 8 1 2 3 4 5 6
    [lkList insertNodeWithItem: 9   atIndex: -1];   // 9 8 1 2 3 4 5 6
    [lkList insertNodeWithItem: 100 atIndex: 3];    // 9 8 1 100 2 3 4 5 6
    [lkList insertNodeWithItem: 200 atIndex: 10];   // 9 8 1 100 2 3 4 5 6 200
    [lkList removeNodeWithItem: 100];               // 9 8 1 2 3 4 5 6 200
    
    NSLog(@"travel");
    [lkList travel];
    
    NSLog(@"result: %d", [lkList searchNodeWithItem:200]);
}

- (void)doubleLinkListDemo {
    DoubleLinkList *lkList = [[DoubleLinkList alloc] initWithNode: nil];
    
    NSLog(@"%d", [lkList isEmpty]); // 1
    NSLog(@"%ld", [lkList length]); // 0
    
    [lkList appendNodeWithItem: 1];
    NSLog(@"%d", [lkList isEmpty]); // 0
    NSLog(@"%ld", [lkList length]); // 0
    
    [lkList appendNodeWithItem: 2];
    [lkList insertNodeAtHeadWithItem: 8]; //9 8 2 3 4 5 6 200
    [lkList appendNodeWithItem: 3];
    [lkList appendNodeWithItem: 4];
    [lkList appendNodeWithItem: 5];
    
    [lkList appendNodeWithItem: 6];                 // 8 1 2 3 4 5 6
    [lkList insertNodeWithItem: 9   atIndex: -1];   // 9 8 1 2 3 4 5 6
    [lkList insertNodeWithItem: 100 atIndex: 3];    // 9 8 1 100 2 3 4 5 6
    [lkList insertNodeWithItem: 200 atIndex: 10];   // 9 8 1 100 2 3 4 5 6 200
    [lkList removeNodeWithItem: 100];               // 9 8 1 2 3 4 5 6 200
    
    NSLog(@"travel");
    [lkList travel];
    
    NSLog(@"result: %d", [lkList searchNodeWithItem:200]);
}

- (void)binaryTreeDemo {
    BinaryTree *tree = [[BinaryTree alloc] init];
    
    for (int i = 0; i < 10; ++i)
    {
        [tree add: i];
    }
    
    [tree breadthTraversal];              // 广度遍历：0 1 2 3 4 5 6 7 8 9
    
    [tree preorderTraversal: tree.root];  // 前序遍历：0 1 3 7 8 4 9 2 5 6
    
    [tree inorderTraversal: tree.root];   // 中序遍历：7 3 8 1 9 4 0 5 2 6
    
    [tree postorderTraversal: tree.root]; // 后序遍历：7 8 3 9 4 1 5 6 2 0
}

- (void)stackDemo {
    ZYStack *stack = [[ZYStack alloc] init];
    NSString *a = @"a";
    NSString *b = @"b";
    [stack push:a];
    [stack push:b];
    NSLog(@"stack length:%d", [stack isEmpty]);
    NSLog(@"topElememt:%@", [stack topElement]);
    [stack popTopElement];
    NSLog(@"topElement:%@", [stack topElement]);
}

@end
