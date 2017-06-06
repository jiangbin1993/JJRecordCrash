//
//  JJRecordCrash.m
//  bengkui
//
//  Created by 斌 on 2017/5/26.
//  Copyright © 2017年 斌. All rights reserved.
//

#import "JJRecordCrash.h"
#import <UIKit/UIKit.h>

static  JJRecordCrash *instance = nil;
@implementation JJRecordCrash

+ (instancetype)shareInstance{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[JJRecordCrash alloc] init];
    });
    return instance;
}

- (void)recordCrashWithCrashCount:(NSInteger)crashCount handle:(void (^)())handle{
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(terminate) name:UIApplicationWillTerminateNotification object:nil];
    
    
    BOOL isCrash = [[[NSUserDefaults standardUserDefaults] valueForKey:@"JJ_isCrash"] boolValue];
    
    [[NSUserDefaults standardUserDefaults] setObject:@(YES) forKey:@"JJ_isCrash"];
    
    if (isCrash == YES) {
        
        //获取到本地存储的崩溃次数
        NSNumber *crashNum = [[NSUserDefaults standardUserDefaults] valueForKey:@"JJ_crashCount"];
        
        NSInteger count =0;
        
        if (crashNum != nil) {
            
            count = [crashNum integerValue];
            
        }
        
        count++;
        
        //判断崩溃次数达到多少次时执行操作
        
        if (count >= crashCount) {
            
            NSLog(@"多次崩溃");
            
            //将本地文件崩溃次数重新置为0
            [[NSUserDefaults standardUserDefaults] setObject:@0 forKey:@"JJ_crashCount"];
            
            // 执行block
            handle();
            return;
        }
        
        //崩溃次数未达到3次则向本地存储崩溃次数
        crashNum = [NSNumber numberWithInteger:count];
        [[NSUserDefaults standardUserDefaults] setObject:crashNum forKey:@"JJ_crashCount"];
    }
}


- (void)terminate{
    
    [[NSUserDefaults standardUserDefaults] setObject:@(NO) forKey:@"JJ_isCrash"];
    [[NSUserDefaults standardUserDefaults] synchronize];
}


@end
