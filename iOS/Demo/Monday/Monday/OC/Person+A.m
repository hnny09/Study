//
//  Person+A.m
//  Monday
//
//  Created by 张海涛(ZhangHaiTao)-顺丰科技技术集团 on 2022/1/14.
//  Copyright © 2022 haitaozhang. All rights reserved.
//

#import "Person+A.h"

@implementation Person (A)

+ (void)sayHappy{
    NSLog(@"sayHappy------1");
}


+(void)initialize{
    NSLog(@"initialize");
}

@end
