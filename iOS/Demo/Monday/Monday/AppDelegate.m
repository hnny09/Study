//
//  AppDelegate.m
//  Monday
//
//  Created by 张海涛 on 2019/9/17.
//  Copyright © 2019 haitaozhang. All rights reserved.
//

#import "AppDelegate.h"
#import "WCCrashReportInfoUtil.h"

@interface AppDelegate ()




@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    NSArray *array = [[WCCrashReportInfoUtil sharedInstance] getBinaryImages];
    NSLog(@"%@",array);
    return YES;
}

void static __attribute__((constructor)) before_main() {
    NSLog(@"-----------before_main-----------------");
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    NSLog(@"applicationDidEnterBackground----0.------");
    [[UIScreen mainScreen] setBrightness:0.1];
}



- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
//    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0), ^{
        
//    });
     _backgroundUpdateTask = [application beginBackgroundTaskWithExpirationHandler:^{
        [[UIScreen mainScreen] setBrightness:0.1];
        
         [[UIApplication sharedApplication] endBackgroundTask:_backgroundUpdateTask];
         _backgroundUpdateTask = UIBackgroundTaskInvalid;
    }];
    
    dispatch_async(dispatch_get_main_queue(), ^{
        [[UIScreen mainScreen] setBrightness:0.1];
    });
    
    NSLog(@"applicationDidEnterBackground----0.1");
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    NSLog(@"applicationWillEnterForeground");
    [[UIScreen mainScreen] setBrightness:1];
    if (_backgroundUpdateTask != UIBackgroundTaskInvalid) {
        [[UIApplication sharedApplication] endBackgroundTask:_backgroundUpdateTask];
    }
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
