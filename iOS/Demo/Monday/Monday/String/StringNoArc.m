//
//  StringNoArc.m
//  Monday
//
//  Created by 张海涛(ZhangHaiTao)-顺丰科技技术集团 on 2021/12/29.
//  Copyright © 2021 haitaozhang. All rights reserved.
//

#import "StringNoArc.h"

@implementation StringNoArc

+ (void)testString{
    //该代码是在MRC环境下测试用

    NSString *str1 = @"123456789--------";//用@""方法创建一个  固定长度为9的字符串
    NSString *str2 = @"1234567890";//用@""方法创建一个  固定长度为10的字符串
    
    
    NSString *str3 = [NSString stringWithFormat:@"234567890"];//用stringWithFormat方法创建一个  固定长度为9的字符串
    NSString *str4 = [NSString stringWithFormat:@"2345678901"];//用stringWithFormat方法创建一个  固定长度为10的字符串
    
    NSString *str5 = [[NSString alloc] initWithString:@"345678901"];//用initWithString方法创建一个  固定长度为9的字符串
    NSString *str6 = [[NSString alloc] initWithString:@"3456789012"];//用initWithString方法创建一个  固定长度为9的字符串
    
    NSString *str7 = [[NSString alloc] initWithFormat:@"456789012"];//用initWithFormat方法创建一个  固定长度为9的字符串
    NSString *str8 = [[NSString alloc] initWithFormat:@"4567890123"];//用initWithFormat方法创建一个  固定长度为9的字符串
    
    NSString *str9 = [NSString stringWithFormat:@"1234567890"];//用stringWithFormat方法创建一个  固定长度为10的字符串并与str2字符串一样的字符串
    
    NSString *str10 = [[NSString alloc] initWithString:@"1234567890"];//用initWithString方法创建一个  固定长度为10的字符串并与str2字符串一样的字符串
    NSString *str11 = [[NSString alloc]initWithFormat:@"123456789"];//用stringWithFormat方法创建一个  固定长度为10的字符串并与str2字符串一样的字符串
    NSString *str12 = [NSString stringWithString:@"1234567890"];
    
    NSLog(@"str1 用@"" 的retainCount为:%ld \n  对象内地地址:%p",[str1 retainCount],str1);
    NSLog(@"str2 用@"" 的retainCount为:%ld \n  对象内地地址:%p",[str2 retainCount],str2);
    NSLog(@"-----------------------------------------------------------------");
    NSLog(@"str3 用stringWithFormat 的retainCount为:%ld \n  对象内地地址:%p",[str3 retainCount],str3);
    NSLog(@"str4 用stringWithFormat 的retainCount为:%ld \n  对象内地地址:%p",[str4 retainCount],str4);
    NSLog(@"-----------------------------------------------------------------");
    NSLog(@"str5 用initWithString 的retainCount为:%ld \n  对象内地地址:%p",[str5 retainCount],str5);
    NSLog(@"str6 用initWithString 的retainCount为:%ld \n  对象内地地址:%p",[str6 retainCount],str6);
    NSLog(@"-----------------------------------------------------------------");
    NSLog(@"str7 用initWithFormat 的retainCount为:%ld \n  对象内地地址:%p",[str7 retainCount],str7);
    NSLog(@"str8 用initWithFormat 的retainCount为:%ld \n  对象内地地址:%p",[str8 retainCount],str8);
    NSLog(@"-----------------------------------------------------------------");
    NSLog(@"使用lu看一下 str1 的retainCount为:%lu \n  对象内地地址:%p",[str1 retainCount],str1);
    NSLog(@"使用lu看一下 str4 的retainCount为:%lu \n  对象内地地址:%p",[str4 retainCount],str4);
    NSLog(@"-----------------------------------------------------------------");
    NSLog(@"str9  字符串与str2一样 的retainCount为:%lu \n  对象内地地址:%p",[str9 retainCount],str9);
    NSLog(@"str10  字符串与str2一样 的retainCount为:%lu \n  对象内地地址:%p",[str10 retainCount],str10);
    NSLog(@"str11  字符串与str2一样 的retainCount为:%lu \n  对象内地地址:%p",[str11 retainCount],str11);
    NSLog(@"str12  字符串与str2一样 的retainCount为:%lu \n  对象内地地址:%p",[str12 retainCount],str12);


}

@end
