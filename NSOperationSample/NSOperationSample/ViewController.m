//
//  ViewController.m
//  NSOperationSample
//
//  Created by obumin on 2015/01/04.
//  Copyright (c) 2015年 Kawai Hiroyuki. All rights reserved.
//
//  NSOperationQueue スレッドと処理の関係 - A Day In The Life
//  http://d.hatena.ne.jp/glass-_-onion/20110527/1306499056

#import "ViewController.h"
#import "OperationNormal.h"
#import "OperationWait.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    NSOperationQueue *queue = [[NSOperationQueue alloc] init];
    OperationNormal *op1 = [[OperationNormal alloc] init];
    OperationNormal *op2 = [[OperationNormal alloc] init];
    OperationNormal *op3 = [[OperationNormal alloc] init];
    OperationWait *opw = [[OperationWait alloc] init];
    [queue addOperation:op1];
    [queue addOperation:opw];
    [queue addOperation:op2];
    [queue addOperation:op3];
    
    // 全てのスレッドが終わるまで、次を実行しない
    [queue waitUntilAllOperationsAreFinished];
    NSLog(@"finish");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
