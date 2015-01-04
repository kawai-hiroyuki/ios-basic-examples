//
//  OperationWait.m
//  NSOperationSample
//
//  Created by obumin on 2015/01/04.
//  Copyright (c) 2015年 Kawai Hiroyuki. All rights reserved.
//

#import "OperationWait.h"

@implementation OperationWait

- (void)main {
    // メインスレッドで実行されているか
    NSLog(@"isMainThread:%d", [NSThread isMainThread]);
    
    // 10秒待つ
    [NSThread sleepForTimeInterval:10];
    
    // スレッドの内容をログ出力
    NSLog(@"Thread:%@", [NSThread currentThread]);
}

@end
