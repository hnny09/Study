//
//  SVProgress.m
//  DynamicWithStatic
//
//  Created by 张海涛 on 2019/9/14.
//  Copyright © 2019 haitaozhang. All rights reserved.
//

#import "SVProgress.h"
#import "SVProgressHUD.h"
#import "AFNetworking.h"

@implementation SVProgress
    
+(SVProgresshud)getBlock{
    return ^(){
        [SVProgressHUD showSuccessWithStatus:@"成功！"];
    };
}
    
+(void)mg_logMessage:(NSString *)msg {
    NSLog(@"%s- %@", __func__, msg);
    AFHTTPSessionManager *session = [AFHTTPSessionManager manager];
    [session GET:@"https://www.baidu.com" parameters:nil success:^(NSURLSessionDataTask *task, id responseObject) {
        NSLog(@"成功");
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        NSLog(@"失败%@", error.description);
    }];
}

@end
