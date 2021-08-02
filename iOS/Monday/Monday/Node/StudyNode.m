//
//  StudyNode.m
//  Monday
//
//  Created by 张海涛 on 2021/5/23.
//  Copyright © 2021 haitaozhang. All rights reserved.
//

#import "StudyNode.h"
#import "Node.h"

@implementation StudyNode

- (void)study{
    Node *node = [self getNodes];
    [self print:node];
    node = [self reverserNode:node];
    [self print:node];
}

- (Node *)reverserNode:(Node *)node{
    
    Node *pre;
    Node *cur =node;
    Node *next;
    while (cur != nil) {
        next = cur.next;
        cur.next = pre;
        pre = cur;
        cur = next;
    }
    
    return  pre;
}

- (Node *)getNodes{
    Node *node1 = [Node NodeWithValue:3 next:nil];
    Node *node2 = [Node NodeWithValue:8 next:node1];
    Node *node3 = [Node NodeWithValue:4 next:node2];
    Node *node4 = [Node NodeWithValue:5 next:node3];
    Node *node5 = [Node NodeWithValue:7 next:node4];
    Node *node6 = [Node NodeWithValue:1 next:node5];
    
    return node6;
    
}

- (void)print:(Node *)node{
    NSString *string = @"node:";
    Node *header = node;
    while (header != nil) {
        string = [NSString stringWithFormat:@"%@%d-",string,header.value];
        header = header.next;
    }
    NSLog(@"%@",string);
}

@end
