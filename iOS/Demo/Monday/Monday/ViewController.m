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
#import "dispatch_once_study.h"
#import "Person.h"
#import <objc/runtime.h>
#import "CStudy.h"
#import "CStudy+test.h"
#import "StringNoArc.h"
#import <ContactsUI/ContactsUI.h>
#import <malloc/malloc.h>

typedef void (malloc_logger_t)(uint32_t type, uintptr_t arg1, uintptr_t arg2, uintptr_t arg3, uintptr_t result, uint32_t num_hot_frames_to_skip);
//定义函数bba_malloc_stack_logger
void bba_malloc_stack_logger(uint32_t type, uintptr_t arg1, uintptr_t arg2, uintptr_t arg3, uintptr_t result, uint32_t backtrace_to_skip);
// 保存malloc_logger到临时变量origin_malloc_logger
//orgin_malloc_logger = malloc_logger;

//malloc_logger = (malloc_logger_t *)bba_malloc_stack_logger;

void bba_malloc_stack_logger(uint32_t type, uintptr_t arg1, uintptr_t arg2, uintptr_t arg3, uintptr_t result, uint32_t backtrace_to_skip)
{
//    if (orgin_malloc_logger != NULL) {
//        orgin_malloc_logger(type, arg1, arg2, arg3, result, backtrace_to_skip);
//    }
    //大块内存监控
}


@interface ViewController ()<CNContactPickerDelegate>
    
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
    NSArray *array = [NSThread callStackSymbols];
    NSLog(@"array:%@",array);
//    dyld_get_image_name();
    
    cTest();
    
//    [StudyString study];
    [self textView];
    [SortValues study];
    [[StudyNode alloc] study];
    [dispatch_once_study shareInstance];
    [dispatch_once_study shareInstance];
    [self studyLLDB];
    [self studyPerson];
    NSLog(@"checkCPU:%d",checkCPU());
    NSString *value = @"ddddd";
    NSLog(@"name指针地址:%p,name指针指向的对象内存地址:%p",&value,value);
    [self log:value];
    
    [self testCopy];
    [StringNoArc testString];
    
}



- (void)testCopy{
    NSObject *obj1 = [NSObject new];
    
    NSArray *array1 = @[obj1];
    
    NSArray *array1c = [array1 copy];
    NSLog(@"array1:%p",array1);
    NSLog(@"array1c:%p",array1c);
    NSLog(@"obj1:%p",obj1);
    NSLog(@"obj1c:%p",array1c.firstObject);
    
}

- (void)log:(NSString *)value{
    NSLog(@"2--name指针地址:%p,name指针指向的对象内存地址:%p",&value,value);
}

int checkCPU()
{
    union w
    {
        int a;//在ios中，4 Byte
        char b;//在ios中，1 Byte
    } c;
    c.a = 1;
    return(c.b ==1);//如果c.b == 1，表示第一位是0x01，那就是小端，如果返回0，就是大端
}

- (void)studyPerson{
    Person *person = [Person alloc];
    Class pClass     = object_getClass(person);
    NSLog(@"%@ - %p",person,pClass);
}


-(void)studyLLDB{
//    NSString * str = @"First";
//    [self printString:str];
//    (lldb) watchpoint set variable str
//    (lldb) image lookup -a 0x0000000106280098
//    Address: LLDBTest[0x0000000100003098] (LLDBTest.__DATA.__cfstring + 32)
//    Summary: @"Second"
//    str = @"Second";
    
//    [self printString:str];
    
    NSString * str1 = [NSString stringWithFormat:@"First"];
    NSString * str2 = [NSString stringWithFormat:@"Second"];
    NSString * str3 = [NSString stringWithString:@"Second".mutableCopy];
    
    [self printString:str1];
    [self printString:str2];
    [self printString:str3];

}

- (void)printString:(NSString *)str
{
    NSLog(@"---------------------");
    NSLog(@"%@",str);
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
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(250, 200, 100, 100);
    button.backgroundColor = UIColor.grayColor;
    [self.view addSubview:button];
    [button setTitle:@"test" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(responseToButton:) forControlEvents:UIControlEventTouchUpInside];
    
    if ([self isEvenNumber:2])
        {
            NSLog(@"First------1");
        }
        else
        {
            NSLog(@"Second------1");
        }
}

static CNContactPickerViewController *contactVc;

- (void)responseToButton:(UIButton *)button{
//    button.backgroundColor = UIColor.blueColor;
      
//    Class
    NSString *stirng = @"aaaa";
    NSUInteger leng = stirng.length;
    
//    NSArray *array = @[@"a", @"bb", @"ccc", @"dddd", @"eeeee", @"ffffff", @"ggggggg", @"hh hh", @"ii  ii"];
    NSArray *array = @[[[CNPhoneNumber alloc] initWithStringValue:@"ffffff"]];
            NSPredicate *predicate = [NSPredicate predicateWithFormat:@"stringValue.length >= 4"];
            array = [array filteredArrayUsingPredicate:predicate];
        
        NSLog(@"array:%@", array);
    
    contactVc = [[CNContactPickerViewController alloc] init];
            contactVc.delegate = self;
            contactVc.displayedPropertyKeys = @[CNContactPhoneNumbersKey];
            contactVc.predicateForEnablingContact = [NSPredicate predicateWithFormat:@"phoneNumbers.@count > 0"];
            contactVc.predicateForSelectionOfContact = [NSPredicate predicateWithFormat:@"phoneNumbers.@count < 2"];
            contactVc.predicateForSelectionOfProperty = [NSPredicate predicateWithFormat:@"(key == 'phoneNumbers') AND (value.@stringValue.@length == 4)"];
            [self presentViewController:contactVc animated:YES completion:nil];
    
}


- (void)contactPickerDidCancel:(CNContactPickerViewController *)picker {
    
}

- (void)contactPicker:(CNContactPickerViewController *)picker didSelectContact:(CNContact *)contact {
//    SYTContactModel *temp = [self formatContact:contact];
//    NSArray *array = [NSArray arrayWithObject:[temp mj_keyValues]];
//    [[RootViewController shareInstance] dismissViewControllerAnimated:YES completion:^{
//     self.resolveBlock([array copy]);
//    }];
}

- (void)contactPicker:(CNContactPickerViewController *)picker didSelectContactProperty:(CNContactProperty *)contactProperty {
    
}


- (BOOL)isEvenNumber:(NSInteger)num
{
    if (num % 2 == 0)
    {
        return YES;
    }
    else
    {
        return NO;
    }
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

- (void)dealloc{
//    [super dealloc];
}


@end
