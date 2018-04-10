# JJRecordCrash
记录程序崩溃的小工具


## 使用方法
```
// 参数crashCount为崩溃次数达到多少次执行block
[[JJRecordCrash shareInstance] recordCrashWithCrashCount:3 handle:^{
        // 达到崩溃次数后调用，执行自己想执行的操作
    }];
```

## 更新

解决了app在后台被系统杀掉时也被统计为崩溃的问题。


