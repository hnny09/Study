//
//  ViewController.m
//  MVVMDemo
//
//  Created by _MyComputer_ on 2019/1/19.
//  Copyright © 2019 ucloudlink. All rights reserved.
//

#import "ViewController.h"
#import <ReactiveCocoa/ReactiveCocoa.h>
//@import ReactiveCocoa;

@interface ViewController ()

@property (strong, nonatomic) UILabel *nameLabel;

@property (strong, nonatomic) NSString *name;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self addNameLabel];
    [self addKVO];
    
}

- (void)addNameLabel{
    _nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(100, 20, 100, 50)];
    _nameLabel.text = @"zhangsan";
    _nameLabel.textColor = UIColor.redColor;
    [self.view addSubview:_nameLabel];
}

- (void)addKVO{
    @weakify(self)
    [RACObserve(self, name) subscribeNext:^(id x) {
        @strongify(self)
        self.nameLabel.text = x;
    }];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    self.name = [NSString stringWithFormat:@"zhang %d",arc4random_uniform(100)];;
}


@end
