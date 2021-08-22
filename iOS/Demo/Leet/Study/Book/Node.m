//
//  Node.m
//  Study
//
//  Created by ukelink on 2020/12/1.
//

#import "Node.h"

@implementation Node

+(instancetype)nodeWithVal:(int)val{
    Node *node = [[Node alloc] init];
    node.val = val;
    return node;
}

@end
