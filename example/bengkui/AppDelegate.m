//
//  AppDelegate.m
//  bengkui
//
//  Created by 斌 on 2017/5/26.
//  Copyright © 2017年 斌. All rights reserved.
//

#import "AppDelegate.h"
#import "JJRecordCrash.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    [[JJRecordCrash shareInstance] recordCrashWithCrashCount:3 handle:^{
        // 3秒后执行弹窗警告操作
        [self performSelector:@selector(showAlertAction)withObject:nil afterDelay:3];
    }];
    
    return YES;
}


// 弹出升级警告提示框
- (void)showAlertAction{
    
    UIAlertController*alert = [UIAlertController alertControllerWithTitle:@"警告"message:@"检测到软件多次异常退出，建议您尽快更新到最新版本！"preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction*sure = [UIAlertAction actionWithTitle:@"确定"style:UIAlertActionStyleDefault handler:nil];
    
    [alert addAction:sure];
    
    [self.window.rootViewController  presentViewController:alert animated:YES completion:nil];
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    
}



@end
