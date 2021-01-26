//
//  StudyNode.m
//  Study
//
//  Created by ukelink on 2020/12/2.
//

#import "StudyNode.h"
#import "Node.h"

@implementation StudyNode

+ (void)study{
    
    Node *first = [self getListWithNumber:@"1369"];
    Node *seconder = [self getListWithNumber:@"2458"];
    Node *node = [self mergeTwoLists:first seconder:seconder];
    [self printNode:node];
    
    Node *third = [self getListWithNumber:@"987654321"];
    [self printNode:third];
    Node *thiredRes = [self swapPairs:third];
    [self printNode:thiredRes];
    
    Node *fourth = [self getListWithNumber:@"1234567890"];
    [self printNode:fourth];
    Node *fourthRes = [self reverseKGroup:fourth k:4];
    [self printNode:fourthRes];
    
    
    Node *fifth = [self reverse:fourth];
    [self printNode:fifth];
    
    Node *sixth = [self getListWithNumber:@"1233344666789"];
    [self printNode:sixth];
    Node *sixthRes = [self deleteDuplicates:sixth];
    [self printNode:sixthRes];
}

//82. 删除排序链表中的重复元素
+ (Node *)deleteDuplicates:(Node *)header{
    
    
    
    return header;
}

/*
 k个一组翻转链表
 */
+ (Node *)reverseKGroup:(Node *)header k:(int)k{
    if (header == NULL || header.next == NULL) {
        return  header;
    }
    Node *dummy = [Node nodeWithVal:0];
    dummy.next = header;
    //初始化pre和end都指向dummy。pre指每次要翻转的链表的头结点的上一个节点。end指每次要翻转的链表的尾节点
    Node *pre = dummy,*end = dummy; 
    while (end.next != NULL) {
        for (int i = 0; i < k && end != NULL; i++) {
            end = end.next;
    }
    
        if (end == NULL) {
            break;
        }
        Node *next = end.next;
        end.next = nil;
        
        Node *start = pre.next;
        pre.next = nil;
        
        pre.next = [self reverse:start];
        
        start.next = next;
        
        pre = start;
        
        end = start;
    }
    
    return dummy.next;
}

//链表翻转
+ (Node *)reverse:(Node *)node{
    
    Node *pre;
    Node *current = node;
    while (current != NULL) {
        Node *next = current.next;
        current.next = pre;
        pre = current;
        current = next;
    }
    
    return pre;
}




/*
 算法：24. 两两交换链表中的节点
 */
+ (Node *)swapPairs:(Node *)head{
    if(head == NULL || head.next == NULL) return head;

    Node *next = head.next;
    head.next = [self swapPairs:next.next];
    next.next = head;
    return next;

}


+ (void)printNode:(Node *)node{
    printf("\n");
    if (node == NULL) {
        printf("node:\n");
    } else {
        NSString *reslut = @"";
        while (node != NULL) {
            reslut = [reslut stringByAppendingString:[NSString stringWithFormat:@"->%d",node.val]];
            node = node.next;
        }
        NSLog(@"node:%@\n",reslut);
    }
}

/*
合并单链表
 */
+ (Node *)mergeTwoLists:(Node *)first seconder:(Node *)seconder{
    
    if (first == NULL) {
        return seconder;
    } else if (seconder == NULL){
        return first;
    } else if (first.val < seconder.val){
        first.next = [self mergeTwoLists:first.next seconder:seconder];
        return first;
    } else {
        seconder.next = [self mergeTwoLists:first seconder:seconder.next];
        return seconder;
    }
}

+ (Node *)getListWithNumber:(NSString *)number{
    Node *headr,*node;
    for (int i = 0; i < number.length; i ++) {
        NSString *val = [number substringWithRange:NSMakeRange(i, 1)];
        Node *value = [Node nodeWithVal:val.intValue];
        if (headr == nil) {
            node = value;
            headr = node;
        } else {
            node.next = value;
            node = node.next;
        }
        
    }
    return headr;
    
}



@end
