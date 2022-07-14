//
//  Person.m
//  Monday
//
//  Created by 张海涛(ZhangHaiTao)-顺丰科技技术集团 on 2021/10/23.
//  Copyright © 2021 haitaozhang. All rights reserved.
//

#import "Person.h"

@implementation Person

+(void)load{
    [self sayHappy];
}

- (void)sayHello{
    NSLog(@"sayHello");
}

+ (void)sayHappy{
    NSLog(@"sayHappy");
}

@end
