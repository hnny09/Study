//
//  ViewController.m
//  Monday
//
//  Created by 张海涛 on 2019/9/17.
//  Copyright © 2019 haitaozhang. All rights reserved.
//

#import "ViewController.h"
#import "Node.h"
#import "StudyString.h"
#import "SortValues.h"
#import "StudyNode.h"

@interface ViewController ()
    
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    Node *header = [self getLink];
    [self print:header];
    Node *reverse = [self reverseList:header];
    [self print:reverse];
    Node *rotate = [self rotateList:[self getLink] index:2];
    [self print:rotate];
    
//    [StudyString study];
    [self textView];
    [SortValues study];
    [[StudyNode alloc] study];

}

- (void)textView{
    UIView *view1 = [[UIView alloc] initWithFrame:CGRectMake(100, 200, 100, 100)];
    view1.backgroundColor = UIColor.blueColor;
    [self.view addSubview:view1];
    
    UIView *view2 = [[UIView alloc] initWithFrame:CGRectMake(100, 100, 100, 100)];
    view2.backgroundColor = UIColor.redColor;
    [self.view addSubview:view2];
    
    UIView *view3 = [[UIView alloc] initWithFrame:CGRectMake(250, 100, 100, 100)];
    view3.backgroundColor = UIColor.greenColor;
    [self.view addSubview:view3];
    NSLog(@"position:%@",NSStringFromCGPoint(view3.layer.position));
    NSLog(@"frame:%@",NSStringFromCGRect(view3.frame));
    NSLog(@"anchorPoint:%@",NSStringFromCGPoint(view3.layer.anchorPoint));
    view3.layer.anchorPoint = CGPointMake(1, 1);
    NSLog(@"anchorPoint:%@",NSStringFromCGPoint(view3.layer.anchorPoint));
    NSLog(@"frame:%@",NSStringFromCGRect(view3.frame));
    NSLog(@"position:%@",NSStringFromCGPoint(view3.layer.position));
}
    
- (Node *)getLink{
    Node *link_1 = [Node new];
    link_1.value = 1;
    
    Node *link_2 = [Node new];
    link_2.value = 2;
    link_1.next = link_2;
    
    Node *link_3 = [Node new];
    link_3.value = 3;
    link_2.next = link_3;
    
    Node *link_4 = [Node new];
    link_4.value = 4;
    link_3.next = link_4;
    
    Node *link_5 = [Node new];
    link_5.value = 5;
    link_4.next = link_5;
    
    Node *link_6 = [Node new];
    link_6.value = 6;
    link_5.next = link_6;
    
    return link_1;
}
    
-(void)print:(Node *)link{
    Node *header = link;
    while (header) {
        if (header.next) {
            printf("%d->",header.value);
        } else {
            printf("%d",header.value);
        }
        header = header.next;
    }
    printf("\n");
}
    
-(Node *)reverseList:(Node *)node{
    Node *header = node;
    Node *pre,*next;
    while (header) {
        next = header.next;
        header.next = pre;
        pre = header;
        header = next;
    }
    return pre;
}
    
-(Node *)rotateList:(Node *)node index:(int)index{
    Node *fast = node;
    Node *slow = node;
    int last = 0;
    while (fast.next != nil) {
        fast = fast.next;
        last ++;
        if (last> index) {
            slow = slow.next;
        }
    }
    
    Node *pre = slow.next;
    fast.next = node;
    slow.next = nil;
    
    
    
    
    
    
    
    return pre;
}



@end
