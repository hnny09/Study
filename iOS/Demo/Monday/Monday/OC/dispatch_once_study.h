//
//  dispatch_once_study.h
//  Monday
//
//  Created by 张海涛(ZhangHaiTao)-顺丰科技技术集团 on 2021/8/28.
//  Copyright © 2021 haitaozhang. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface dispatch_once_study : NSObject

+ (instancetype)shareInstance;

@end

NS_ASSUME_NONNULL_END
