//
//  Person.h
//  Study
//
//  Created by ukelink on 2021/1/8.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Person : NSObject{
    
}

@property(nonatomic, getter=name, setter=setName:)NSString *nameb;

+ (void)start;

- (NSString *)name;

- (void)setName:(NSString *)name;

@end

NS_ASSUME_NONNULL_END
