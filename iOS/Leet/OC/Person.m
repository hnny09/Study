//
//  Person.m
//  Study
//
//  Created by ukelink on 2021/1/8.
//

#import "Person.h"

@interface Person()
{
    NSString * _namea;
}

@end


@implementation Person

+ (void)start{
    Person *p = [[Person alloc] init];
    p.nameb = @"test";
    NSLog(@"Person:%@",p.nameb);
    
}

- (NSString *)name{
    return _namea;
}

- (void)setName:(NSString *)name{
    _namea = name;
}

@end
