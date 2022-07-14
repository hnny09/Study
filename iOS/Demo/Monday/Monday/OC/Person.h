//
//  Person.h
//  Monday
//
//  Created by 张海涛(ZhangHaiTao)-顺丰科技技术集团 on 2021/10/23.
//  Copyright © 2021 haitaozhang. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Person : NSObject{
    NSString *body;
}
@property(nonatomic, strong)NSString *nickName;

- (void)sayHello;
+ (void)sayHappy;

@end

NS_ASSUME_NONNULL_END
