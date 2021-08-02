//
//  SVProgress.h
//  DynamicWithStatic
//
//  Created by 张海涛 on 2019/9/14.
//  Copyright © 2019 haitaozhang. All rights reserved.
//

typedef void(^SVProgresshud)();

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface SVProgress : NSObject
    
+ (SVProgresshud)getBlock;
    
    
+(void)mg_logMessage:(NSString *)msg;
    
    

@end

NS_ASSUME_NONNULL_END
