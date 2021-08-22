//
//  SortValues.m
//  Monday
//
//  Created by 张海涛 on 2021/5/23.
//  Copyright © 2021 haitaozhang. All rights reserved.
//

#import "SortValues.h"

@implementation SortValues

+ (void)study{
    NSMutableArray *value = [self getValues];
    NSLog(@"value:%@",value);
//    [self quickSort:value start:0 end:value.count-1];
//    NSLog(@"quickSort:%@",value);
//    [self bubbleSort:value];
//    NSLog(@"bubbleSort:%@",value);

//    [self selectSort:value];
//    NSLog(@"selectSort:%@",value);
//        [self insetSort:value];
//        NSLog(@"insetSort:%@",value);
}

- (void)findValue:(NSMutableArray *)array{
    
}



+ (void)insetSort:(NSMutableArray *)array{

    for (int i = 1 ; i < array.count; i ++) {
        int temp = [array[i] intValue];
        for (int j = i -1 ; j >= 0 && [array[j] intValue] > temp; j -- ) {
            array[j + 1] = array[j];
            array[j] = @(temp);
        }
    }
    
}

+ (void)selectSort:(NSMutableArray *)array{
    for (int i = 0; i < array.count; i ++) {
        
        for (int j = i +1 ; j < array.count; j ++) {
            if ([array[i] intValue] > [array[j] intValue]) {
                [array exchangeObjectAtIndex:i withObjectAtIndex:j];
            }
        }
        
    }
}








+ (void)bubbleSort:(NSMutableArray *)array{
    
    for (int i = 0; i < array.count-1; i ++) {
        for (int j = 0 ; j <array.count-1-i; j ++) {
            if ([array[j] intValue] > [array[j+1] intValue]) {
                [array exchangeObjectAtIndex:j  withObjectAtIndex:j+1];
            }
        }
    }
    
}



+ (void)quickSort:(NSMutableArray *)array start:(int)start end:(long)end{
    if (start > end) {
        return;
    }
    int left = start;
    long right = end;
    int temp = [array[left] intValue];
    while (left < right) {
        while (left < right && temp <= [array[right] intValue]) {
            right --;
        }
        if (left < right) array[left] = array[right];
        while (left < right && [array[left] intValue] <= temp) {
            left ++;
        }
        if (left < right) array[right] = array[left];
        
    }
    array[left] = @(temp);
    [self quickSort:array start:start end:left-1];
    [self quickSort:array start:left+1 end:end];
}






//+ (void)quickSort:(NSMutableArray *)array start:(int)start end:(long)end{
//    if (start >= end) {
//        return;
//    }
//    int i = start;
//    long j = end;
//    int temp = [array[start] intValue];
//
//    while (i < j) {
//
//        while (j > i && temp <= [array[j] intValue]) {
//            j--;
//        }
//        if (i < j) array[i] = array[j];
//
//        while (j > i && temp >= [array[i] intValue]) {
//            i ++;
//        }
//        if (i < j) array[j] = array[i];
//
//    }
//    array[i] = @(temp);
//    [self quickSort:array start:start end:i -1];
//    [self quickSort:array start:i + 1 end:end];
//
//
//}

+ (NSMutableArray *)getValues{
    return @[@3,@13,@4,@5,@8,@21,@34,@11,@18,@23,@2,@32].mutableCopy;
}

@end
