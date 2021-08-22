//
//  Node.h
//  Monday
//
//  Created by 张海涛 on 2019/9/17.
//  Copyright © 2019 haitaozhang. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface Node : NSObject
    
@property(nonatomic, strong)Node *next;
    
@property(nonatomic, assign)int value;

+ (Node *)NodeWithValue:(int)value next:(Node *)next;
    

@end
