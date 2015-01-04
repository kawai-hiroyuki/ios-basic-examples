//
//  ViewController.m
//  NSInvocationSample
//
//  Created by obumin on 1/4/15.
//  Copyright (c) 2015 Kawai Hiroyuki. All rights reserved.
//
//  Objective-C - NSInvocation を使ってクラスメソッドを呼ぶ - Qiita
//  http://qiita.com/hal_sk/items/947b1cdaae17e29ce082

#import "ViewController.h"
#import "Invoker.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    Invoker *invoker = [[Invoker alloc] init];
    
    // define selector
    SEL selector = @selector(doWithText:number:);
    // get method signeture
    // 既にインスタンスされている場合はmethodSignatureForSelectorを使う
    NSMethodSignature* signature = [invoker methodSignatureForSelector:selector];
    // クラスメソッドとして使う場合にはinstanceMethodSignatureForSelectorを使う
//    NSMethodSignature* signature = [[Invoker class] instanceMethodSignatureForSelector:selector];
    // make NSInvocation instance
    NSInvocation* invocation = [NSInvocation invocationWithMethodSignature:signature];
    [invocation setSelector:selector];
    [invocation setTarget:invoker];
    NSString *str = @"こんにちは";
    [invocation setArgument:&str atIndex:2];
    NSNumber *num = [NSNumber numberWithInt:3];
    [invocation setArgument:&num atIndex:3];
    [invocation invoke];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
