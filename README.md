# JJRecordCrash
记录程序崩溃的小工具

支持cocoaPods导入  pod 'JJRecordCrash'

使用方法
```
// 参数crashCount为崩溃次数达到多少次执行block
[[JJRecordCrash shareInstance] recordCrashWithCrashCount:3 handle:^{
        // 达到崩溃次数后调用，执行自己想执行的操作
    }];
```


