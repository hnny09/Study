//
//  Node.h
//  Study
//
//  Created by ukelink on 2020/12/1.
//

#import <Foundation/Foundation.h>

@interface Node : NSObject

@property(nonatomic, assign)int val;

@property(nonatomic, strong)Node *next;

+ (instancetype)nodeWithVal:(int)val;

@end


