//
//  ViewController.m
//  MvvmDemo
//
//  Created by 张海涛 on 2020/5/2.
//  Copyright © 2020 haitaozhang. All rights reserved.
//

#import "ViewController.h"
#import <ReactiveObjC/ReactiveObjC.h>
#import "CStudy.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UITextField *accountTextField;

@property (weak, nonatomic) IBOutlet UITextField *pwdTextField;

@property (weak, nonatomic) IBOutlet UIButton *loginButton;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    [[_loginButton rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(__kindof UIControl * _Nullable x) {
        NSLog(@"rac_signalForControlEvents");
    }];
    
    
    RAC(_loginButton,enabled) = [[RACSignal combineLatest:@[_accountTextField.rac_textSignal,_pwdTextField.rac_textSignal]] reduceEach:^id _Nonnull(NSString *account, NSString *pwd){
        return @(account.length && pwd.length);
    }];
    
    
    [CStudy start];
    
    NSLog(@"ViewController------------------------------------");
}


@end
