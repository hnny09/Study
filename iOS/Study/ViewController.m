//
//  ViewController.m
//  Study
//
//  Created by ukelink on 2020/11/23.
//

#import "ViewController.h"
#import "Leet.h"
#import "StudyNode.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    NSLog(@"=======================Leet=======================\n");
    [Leet start];
    NSLog(@"=======================Node=======================\n");
    [StudyNode study];
}

- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    NSLog(@"=======================viewDidAppear=======================");
}

@end
