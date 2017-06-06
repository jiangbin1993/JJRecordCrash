//
//  JJRecordCrash.h
//  bengkui
//
//  Created by 斌 on 2017/5/26.
//  Copyright © 2017年 斌. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JJRecordCrash : NSObject
// 单例
+ (instancetype)shareInstance;

// 参数crashCount ： 崩溃达到多少次执行handle block
- (void)recordCrashWithCrashCount:(NSInteger)crashCount handle:(void(^)())handle;

@end
