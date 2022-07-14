//
//  CStudy.m
//  Monday
//
//  Created by 张海涛 on 2021/6/6.
//  Copyright © 2021 haitaozhang. All rights reserved.
//

#import "CStudy.h"

@implementation CStudy

+(void)load{
//    [self start];
    testArray();
    
}

+ (void)start:(int)numb,...{
    cTest();
}

void testArray(void){
    int i = 0;
    int arr[3] = {1,2,3};
//    printf("arr[3]:%d",arr[3]);
//    printf("i:%d",i);
    printf("\n------------------------------\n");
    for (; i <= 3; i ++) {
        arr[i] = 0;
        printf("hello world\n");
    }
}



@end

void cTest(void){
    
    char* buf1 = "this is a test";
    char buf2[] = "this is a test";
    printf("size of buf1: %lu\n", sizeof(buf1));
    printf("size of buf2: %lu\n", sizeof(buf2));
//    int a[6] = {0};
    
}



