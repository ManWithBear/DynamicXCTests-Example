//
//  ParametrizedTestCase.m
//  DynamicXCTests-ExampleTests
//
//  Created by Denis Bogomolov on 20/03/2019.
//  Copyright © 2019 BDK. All rights reserved.
//

#import "ParametrizedTestCase.h"

@interface _QuickSelectorWrapper ()
@property(nonatomic, assign) SEL selector;
@end

@implementation _QuickSelectorWrapper

- (instancetype)initWithSelector:(SEL)selector {
    self = [super init];
    _selector = selector;
    return self;
}

@end

@implementation ParametrizedTestCase
+ (NSArray<NSInvocation *> *)testInvocations {
    NSArray<_QuickSelectorWrapper *> *wrappers = [self _qck_testMethodSelectors];
    NSMutableArray<NSInvocation *> *invocations = [NSMutableArray arrayWithCapacity:wrappers.count];

    for (_QuickSelectorWrapper *wrapper in wrappers) {
        SEL selector = wrapper.selector;
        NSMethodSignature *signature = [self instanceMethodSignatureForSelector:selector];
        NSInvocation *invocation = [NSInvocation invocationWithMethodSignature:signature];
        invocation.selector = selector;

        [invocations addObject:invocation];
    }

    return invocations;
}

+ (NSArray<_QuickSelectorWrapper *> *)_qck_testMethodSelectors {
    return @[];
}
@end
