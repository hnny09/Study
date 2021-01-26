//
//  AppDelegate.m
//  Study
//
//  Created by ukelink on 2020/11/23.
//

#import "AppDelegate.h"

typedef struct {
    long bbb;
    int ccc;
} aaa;

@interface AppDelegate ()
{
    NSString *aa;
    char *th;
//    objc_class cc;
}
@property(nonatomic, strong)NSString *test;
@property(nonatomic, strong)NSString *testa;

@end

@implementation AppDelegate
@synthesize test = aa,testa,window;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
//    self->aa = @"aaaa";
//    NSLog(@"test:%@",self.test);
//    self.test = @"bbbbb";
//    NSLog(@"test:%@",self->aa);
//    self.testa = @"cccc";
//    NSLog(@"self.testa:%@",self->testa);
//    NSLog(@"self.testa:%@",self.testa);
//    char aa = 'c';
//    char *bb = &aa;
//    aaa *a1 = NULL;
//    aaa a2 = {.bbb=0,.ccc=4};
    
    
//    NSLog(@"%c",*th);
    NSLog(@"window:%@",window);
    
    return YES;
}


#pragma mark - UISceneSession lifecycle


- (UISceneConfiguration *)application:(UIApplication *)application configurationForConnectingSceneSession:(UISceneSession *)connectingSceneSession options:(UISceneConnectionOptions *)options {
    // Called when a new scene session is being created.
    // Use this method to select a configuration to create the new scene with.
    return [[UISceneConfiguration alloc] initWithName:@"Default Configuration" sessionRole:connectingSceneSession.role];
}


- (void)application:(UIApplication *)application didDiscardSceneSessions:(NSSet<UISceneSession *> *)sceneSessions {
    // Called when the user discards a scene session.
    // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
    // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
}


@end
