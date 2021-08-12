//
//  CStudy.m
//  MvvmDemo
//
//  Created by 张海涛 on 2020/5/16.
//  Copyright © 2020 haitaozhang. All rights reserved.
//

#import "CStudy.h"

#define MAX1 255
#define BIT3 (0x1<<3)

typedef NSString * inta;
#define dps NSString *
static int a;

@implementation CStudy

+ (void)start{
    
    NSLog(@"CStudy:start");
    
//    [self stutyFirst];
//    [self studyTest];
//    [self studyCopy];
    
    studyC();
}

void studyC(){
    char *a = NULL;
    char c = 'c';
    char *b = &c;
    a = b;
    printf("a:%p\n",a);
    printf("b:%p\n",b);
    
    NSString *string1 = @"aaaa";
    NSString *string2 = @"aaaa2";
    string1 = string2;
    printf("string1:%p\n",string1);
    printf("string2:%p\n",string2);
    
    
    
    
    return;
    
//    int aa = 0x01020304;
//    int *p = &aa;
//    NSLog(@"*p--value:0x%x",*p);
//
//    short *p1 = &aa;
//    NSLog(@"*p--value:0x%x",*p1);
//
//    char *p2 = &aa;
//    NSLog(@"*p--value:0x%x",*p2);
    
    int value = 9000;
    int *p3 = &value;
    char *p4 = &value;
    NSLog(@"p3:%p",p3);
    NSLog(@"p4:%p",p4);
    p3 ++;
    p4 ++;
    NSLog(@"p3+1:%p",p3);
    NSLog(@"p4+1:%p",p4);
}

+ (void)studyCopy{
    
    char * str = "1234tyh89";
    char str2[20];
    mystrcpy(str2, str);
    NSLog(@"str2:%s",str2);
    
}

char * mystrcpy(char * str1, const char * str2){
    int i = 0;
    while (str2[i] != '\0') {
        *(str1 + i) = * (str2 +i);
        i ++;
    }
    str1[i] = str2[i];
    return str1;
    
}


+ (void)studyTest{
    
    char string[10], str1[10];
    if( strlen( str1 ) <= 10 )
    {
        strcpy( string, str1 );
    }
    
    /*
     对试题3，if(strlen(str1) <= 10)应改为if(strlen(str1) < 10)，因为strlen的结果未统计’\0’所占用的1个字节。
     */
    
    
    
//    char string[10];
//    char* str1 = "0123456789";
//    strcpy(string, str1);
//    NSLog(@"string:%c",string[1]);
//    NSLog(@"string:%c",string[9]);
    
    /*
     试题1字符串str1需要11个字节才能存放下（包括末尾的’\0’），而string只有10个字节的空间，strcpy会导致数组越界；
     */
    
    
//    char string1[10], str2[10];
//    int i;
//    for(i=0; i<10; i++)
//    {
//        str2[i] = 'a';
//    }
////        str2[9] = '\0';
//
//    NSLog(@"str2:%s",str2);
//
//    strcpy( string1, str2 );
//
//    NSLog(@"string1:%s",string1);
    
    /*
     对试题2，如果面试者指出字符数组str1不能在数组内结束可以给3分；如果面试者指出strcpy(string, str1)调用使得从str1内存起复制到string内存起所复制的字节数具有不确定性可以给7分，在此基础上指出库函数strcpy工作方式的给10分；
     */
    
}

+ (void)stutyFirst{
    
    int a2 = 5, b2 = 7, c2;
    c2 = a2+++b2;
    NSLog(@"a2:%d",a2);
    NSLog(@"b2:%d",b2);
    NSLog(@"c2:%d",c2);
    
    
    int ee1 = 4;
    int ee2 = 4;
    
    NSLog(@"ee1++:%d",ee1 ++);
    NSLog(@"ee1:%d",ee1);
    NSLog(@"++ee2:%d",++ ee2);
    
    
    
    
//    int *ptr;
//    ptr = (int *)0x67a9;
//    NSLog(@"ptr-place:%p",ptr);
//    *ptr = (int)0xaa55;
//    NSLog(@"ptr-value:%d",*ptr);
//    NSLog(@"ptr-place:%p",ptr);
    
    
    // 死循坏➕数组越界
    /*
     unsigned char A[MAX1],i;//i被定义为unsigned char
     NSLog(@"i:%c",i);
     NSLog(@"i:%d",i);
     for (i=0;i<=MAX1;i++){
         A[i]=i;NSLog(@"i:%d",i);
     }
     */
    
    
    unsigned int a = 6;
    int b = -20;
    NSLog(@"a-value:%d",a);
    NSLog(@"b-value:%d",b);
    (a+b > 6) ? printf("> 6") : printf("<= 6");
    printf("\n");
    
    /*
     答案是输出是 ”>6”。
     原因是当表达式中存在有符号类型和无符号类型时所有的操作数都自动转换为无符号类型。因此-20变成了一个非常大的正整数，所以该表达式计算出的结果大于6。这一点对于应当频繁用到无符号数据类型的嵌入式系统来说是丰常重要的。
     */
   
    char *ptr;
    if ((ptr = (char *)malloc(0)) == NULL)
    printf("Got a null pointer");
    else
    printf("Got a valid pointer");
    
    printf("\n");
    
    inta bb,cc;
    bb = @"aaaa";
    cc = @"dddd";
    
//    dps dd,ee;
//    dd = @"ccc";
//    ee = @"ff";
    
}


+ (void)constStudy{
    int a1 = 4;
     int *b = &a1;
     a1 = 5;
     
     volatile int dd = 100;
     
     NSLog(@"b----value:%d",*b);
     
     const int *c = &a1;
     NSLog(@"c----value:%d",*c);
     
     NSLog(@"bit3:%d",BIT3);
}



int square(volatile int *ptr)
{
    return *ptr * *ptr;
}

void set_bit3(void)
{
    a |= BIT3;
}

void clear_bit3(void)
{
    a &= ~BIT3;
}

@end
