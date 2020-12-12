//
//  Leet.m
//  Study
//
//  Created by ukelink on 2020/11/23.
//

#import "Leet.h"

NSString *testString = @"dsefsdhadhfkdssdsfsdhadhdsfsdhadhfkddsfsdhadhfkdsahfksadhdsfsdhadhfkdsahfksadhfksddsfsdhadhfkdsahfksad1hfksdhfusdihfksjadfhksadjkdsahfdsjkhfksdhffhiawoeuruihweiyrtiuoncsdbfzmbfkhfioaewncfhskdsfsdhadhfiuoncsdbfzmbfkhfioaewncfhsksahfksadhfksdhfusdihfksjadfhksadjkdsahfdsjkhfksdhffhiawoeuruihweiyrtiuoncsdbfzmbfkhfioaewncfhskfkdsahfksadhfksdhfusdihfksjadfhksadjkdsahfdsjkhfksdhffhiawoeuruihweiyrtiuoncsdbfzmbfkhfioaewncfhskahfksadhfksdhfusdihfksjadfhksadjkdsahfdsjkhfksdhffhiawoeuruihweiyrtiuoncsdbfzmbfkhfioaewncfhsk";

static NSDictionary *dic;

static NSMutableArray *reslut;

@implementation Leet

+ (void)start{
    
    dic = @{
        @"0" : @"",
        @"1" : @"",
        @"2" : @"ABC",
        @"3" : @"DEF",
        @"4" : @"GHI",
        @"5" : @"JKL",
        @"6" : @"MNO",
        @"7" : @"PQRS",
        @"8" : @"TUV",
        @"9" : @"WXYZ"
    };
    
    
    int res = [self lengthOfLongestSubstring:testString];
    NSLog(@"lengthOfLongestSubstring:%d",res);
    
    [self singleValue];
    
    
    NSString *string1 =  [self longestPalindrome:testString];
    NSLog(@"string:%@",string1);
    
    
    int count = [self getMoneyCount:135];
    NSLog(@"count:%d",count);
    
    int number = [self numberReverse:1231098];
    NSLog(@"number:%d",number);
    
    int height[]  = {1,8,6,2,5,4,8,11,7};
    int maxValue = [self maxArea:height];
    NSLog(@"maxValue:%d",maxValue);
    
    int roman = 1994;
    NSLog(@"%d intToRoman:%@",roman,[self intToRoman:roman]);
    
    NSString *first = @"fawrwwctewxcfs232a",*seconder = @"fawrwwctewxcjygfs232a";
    
    NSLog(@"longestCommonPrefix:%@ & %@ result:%@",first,seconder,[self longestCommonPrefix:first seconder:seconder]);
    
    [self letterCombinations:@"2345"];
    
    
   
    
}


/*
 括号的生成
 */
+ (void)generateParenthesis:(int)num{
    
    
    
}


/*
 电话号码的字母组合
 */


+ (NSArray *)letterCombinations:(NSString *)number{
    
    if (number == NULL || number.length == 0) {
        return @[];
    }
    
    [reslut removeAllObjects];
    
    
    return @[];
    
}



+ (void)iterStr:(NSString *)str letter:(NSString *)letter index:(int)index{
    
}


+ (NSString *)get{
    return @"";
}


/*
 最长公共前缀
 */
+(NSString *)longestCommonPrefix:(NSString *)first seconder:(NSString *)seconder{
    
    
    return @"";
}


/*
 最接近的三数之和
 */
+(int)threeSumClosest{
    
    
    return 00;
}



/*
 整数转罗马数字
 */
+(NSString *)intToRoman:(int)num{
    NSDictionary *dic = @{
        @"1":@"I",
        @"5":@"V",
        @"10":@"X",
        @"50":@"L",
        @"100":@"C",
        @"500":@"D",
        @"1000":@"M"
    };
    
    NSString *result = @"";
    
    int count = 0;
    int m = 1000;
    while (num > 0) {
        
        count = num / m;
        
        num -= count *m;
        
        if (count == 9) {
            
            result = [NSString stringWithFormat:@"%@%@",[dic objectForKey:[NSString stringWithFormat:@"%d",m]],[dic objectForKey:[NSString stringWithFormat:@"%d",m * 10]]];
            
        } else if (count >= 5){
            
            result = [NSString stringWithFormat:@"%@%@",result,[dic objectForKey:[NSString stringWithFormat:@"%d",5 * m]]];
            
            while (count-- > 5) {
                
                result = [NSString stringWithFormat:@"%@%@",result, [dic objectForKey:[NSString stringWithFormat:@"%d",m]]];
            }
        } else if (count == 4){
            result = [NSString stringWithFormat:@"%@%@%@",result, [dic objectForKey:[NSString stringWithFormat:@"%d",m]],[dic objectForKey:[NSString stringWithFormat:@"%d", 5 * m]]];
        } else {
            while (count -- > 0) {
                result = [NSString stringWithFormat:@"%@%@",result, [dic objectForKey:[NSString stringWithFormat:@"%d",m]]];
            }
        }
        
        m /= 10;
        
    }
    
    
    return result;
}



/*
 计算盛最多水的容器
 */
+ (int)maxArea:(int[])height{
    int count = sizeof(height);
    int first = 0,last = count;
    int max = (last - first) * MIN(height[first], height[last]);
    
    while (first < last) {
        int current = (last - first) * MIN(height[first], height[last]);
        max = MAX(max, current);
        if (height[first] < height[last]) {
            first ++;
        } else {
            last --;
        }
    }
    
    return max;
}

+ (int)numberReverse:(int)number{
    
    int i = 0;
    int t = number;
    
    while (t) {
        i = 10 *i + (t%10);
        t =t/10;
    }
    if (i < INT_MIN || i > INT_MAX) {
        return 0;
    }

    return i;
}

/*
 获取需要的最少金币数
 */
+ (int)getMoneyCount:(int)num{
    num ++;
    int money[] = {1,3,5};
    int min[1234] = {0};
    
    printf("money:sizeof=%lu\n",sizeof(money)/sizeof(int));
    
    for (int i = 1; i < num; i ++) {
        min[i] = min[i -1] + 1;
        for (int j = 0; j < sizeof(money)/sizeof(int);j ++) {
            if (money[j] > i) {
                break;
            }
            if (min[i - money[j]] <min[i - 1]) {
                min[i] = min[i - money[j]] + 1;
            }
        }
    }
    
    return min[num - 1];
}


/*
 获取最小回文子串
 */
+ (NSString *)longestPalindrome:(NSString *)value{
    if (value == NULL || value.length <3) {
        return value;
    }
    long length = value.length;
    bool dp[length][length];
    
    long left = 0,right = 0;
    int count = 0;
    
    for (long i = length -2; i >= 0; i --) {
        dp[i][i] = true;
        
        for (long j = i + 1; j < length ; j ++) {
            count ++;
            char ichar = [value characterAtIndex:i];
            char jchar = [value characterAtIndex:j];
            dp[i][j] = ichar == jchar && (j - i < 3 || dp[i+1][j-1]);
            if (dp[i][j] && right-left <j - 1) {
                left = i;
                right = j;
            }
        }
        
    }
    NSLog(@"count:%d",count);
    NSRange  rang = NSMakeRange(left, right-left+1);
    NSLog(@"left:%ld,right:%ld",left,right);
    return [value substringWithRange:rang];
    
}

+ (void)singleValue{
    int i = 98 & 1;
    NSLog(@"i value is %d",i);
}

/*
 寻找两个有序数组的中位数
 */

//+ (void)findMedianSortedArrays:()

/*
 给定一个字符串，找出不含有重复字符的 最长子串 的长度。
 */
+ (int)lengthOfLongestSubstring:(NSString *)string{
    int res = 0, left = 0;
    int m[256] = {0};
    for (int i = 0; i <string.length; i ++) {
        char cha = [string characterAtIndex:i];
        if (m[cha] == 0 || m[cha] <left) {
            res = MAX(res, i-left+1);
        } else {
            left = m[cha];
        }
        m[cha] = i + 1;
    }
    
    return res;
}


@end
