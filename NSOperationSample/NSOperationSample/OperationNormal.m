//
//  OperationNormal.m
//  NSOperationSample
//
//  Created by obumin on 2015/01/04.
//  Copyright (c) 2015年 Kawai Hiroyuki. All rights reserved.
//

#import "OperationNormal.h"

@implementation OperationNormal

- (void)main {
    // メインスレッドで実行されているか
    NSLog(@"isMainThread:%d", [NSThread isMainThread]);
    // スレッドの内容をログ出力
    NSLog(@"Thread:%@", [NSThread currentThread]);
}

@end
