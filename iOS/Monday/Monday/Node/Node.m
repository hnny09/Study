//
//  Node.m
//  Monday
//
//  Created by 张海涛 on 2019/9/17.
//  Copyright © 2019 haitaozhang. All rights reserved.
//

#import "Node.h"

@implementation Node

+ (Node *)NodeWithValue:(int)value next:(Node *)next{
    Node *node = [[Node alloc] init];
    node.value = value;
    node.next = next;
    return node;
    
}

@end
