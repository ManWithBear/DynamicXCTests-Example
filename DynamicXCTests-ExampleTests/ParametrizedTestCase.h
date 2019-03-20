//
//  ParametrizedTestCase.h
//  DynamicXCTests-ExampleTests
//
//  Created by Denis Bogomolov on 20/03/2019.
//  Copyright © 2019 BDK. All rights reserved.
//

#import <XCTest/XCTest.h>

NS_ASSUME_NONNULL_BEGIN
@interface _QuickSelectorWrapper : NSObject
- (instancetype)initWithSelector:(SEL)selector;
@end

@interface ParametrizedTestCase : XCTestCase
+ (NSArray<_QuickSelectorWrapper *> *)_qck_testMethodSelectors;
@end

@interface PlainTestCase : XCTestCase
@end

NS_ASSUME_NONNULL_END
