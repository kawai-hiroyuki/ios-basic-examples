//
//  Invoker.m
//  NSInvocationSample
//
//  Created by obumin on 1/4/15.
//  Copyright (c) 2015 Kawai Hiroyuki. All rights reserved.
//

#import "Invoker.h"

@implementation Invoker

- (void)doWithText:(NSString *)text number:(NSNumber *)number
{
    NSLog(@"doWithText");
    NSLog(@"text:%@ number:%d", text, [number intValue]);
}

@end
