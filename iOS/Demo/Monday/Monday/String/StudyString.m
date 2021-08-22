//
//  StudyString.m
//  Monday
//
//  Created by 张海涛 on 2021/5/13.
//  Copyright © 2021 haitaozhang. All rights reserved.
//

#import "StudyString.h"
#import <pthread/pthread.h>

@interface StudyString()

@property(nonatomic)NSString *myString;
@property(nonatomic)int myInt;
@property NSObject*myObject;
@property(nonatomic,assign) int value;

@end

@implementation StudyString

void (^block)(void);

+ (void)study{
    NSString * string = [[NSString alloc] initWithFormat:@"1"];
    
    NSString * string1 = [NSString stringWithFormat:@"1"];
    NSString * string2 = @"1";
    NSString * string3 = @"2";
    NSString * string5 = [[NSString alloc] initWithFormat:@"2"];
    NSLog(@"string:%p",string);
    NSLog(@"string1:%p",string1);
    NSLog(@"string2:%p",string2);
    NSLog(@"string3:%p",string3);
    NSLog(@"string5:%p",string5);
    
    NSObject *obj = [[NSObject alloc] init];
    int i = 1;
    block = ^(){
                    NSLog(@"TestObj对象地址:%@",obj);
                };
    NSLog(@"堆:%@",[block class]);
    NSLog(@"栈:%@",[^(){NSLog(@"TestObj对象地址:%d",i);} class]);
    NSLog(@"%ld",(long)CFGetRetainCount((__bridge CFTypeRef)(self)));
    
    StudyString *study = [[StudyString alloc] init];
//    [study testValue];
//    [study testValue2];
    [study testNumber];
}

- (void)testValue{
    self.value = 0;
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        
        for (int i = 0; i <1000 ; i++) {
            NSLog(@"1----start-%d",_value);
            self.value = self.value +1;
            NSLog(@"1----end-%d",_value);
        }
        
    });
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        
        for (int i = 0; i <1000 ; i++) {
            NSLog(@"2----start-%d",self->_value);
            self.value = self.value +1;
            NSLog(@"2----end-%d",_value);
        }
        
    });
    
}

pthread_rwlock_t lock;
NSMutableDictionary *dic;

- (void)testValue2{
    pthread_rwlock_init(&lock, NULL);
    dic = @{}.mutableCopy;
    dispatch_queue_t queue = dispatch_queue_create("aaa", DISPATCH_QUEUE_CONCURRENT);
    
    dispatch_async(queue, ^{
        
        for (int i = 0; i <100 ; i++) {
            NSString *key = [NSString stringWithFormat:@"%d",i];
            [self setDic:key value:key];
        }
        
    });
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        
        for (int i = 0; i <100 ; i++) {
            NSString *key = [NSString stringWithFormat:@"%d",i];
            [self setDic:key value:key];
        }
    });
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        
        for (int i = 0; i <100 ; i++) {
            NSString *key = [NSString stringWithFormat:@"%d",i];
            [self getDicValue:key];
        }
        
    });
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        
        for (int i = 0; i <100 ; i++) {
            NSString *key = [NSString stringWithFormat:@"%d",i];
            [self getDicValue:key];
        }
    });
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        
        for (int i = 0; i <100 ; i++) {
            NSString *key = [NSString stringWithFormat:@"%d",i];
            [self getDicValue:key];
        }
    });

    
}

NSMutableDictionary *threas;
- (void)testNumber{
    threas = @{}.mutableCopy;
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        for (int i = 0; i <100; i ++) {
            [self print];
        }
    });
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        for (int i = 0; i <100; i ++) {
            [self print];
        }
    });
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        for (int i = 0; i <100; i ++) {
            [self print];
        }
    });
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        for (int i = 0; i <100; i ++) {
            [self print];
        }
    });
}

- (void)print {
    NSThread *thred = [NSThread currentThread];
    NSLog(@"thred=%@",thred);
}

BOOL write1;

- (void)setDic:(NSString *)key value:(NSString *)value{
    
    pthread_rwlock_wrlock(&lock);
    NSLog(@"set-start-key=%@,value=%@",key,value);
    write1 = true;
    dic[key] = value;
    NSLog(@"set-end-key=%@,value=%@",key,value);
    if (!write1) {
        NSLog(@"------------------");
    }
    pthread_rwlock_unlock(&lock);
}

- (id)getDicValue:(NSString *)key{
    pthread_rwlock_rdlock(&lock);
    NSLog(@"get-start-key=%@",key);
    write1 = false;
    id value = dic[key];
    NSLog(@"get-end-key=%@",key);
    if (write1) {
        NSLog(@"--------------1----");
    }
    pthread_rwlock_unlock(&lock);
    return value;
}

@end
