//
//  RuntimeTests.swift
//  DynamicXCTests-ExampleTests
//
//  Created by Denis Bogomolov on 20/03/2019.
//  Copyright © 2019 BDK. All rights reserved.
//

import Foundation
import XCTest

class RuntimeTests: ParametrizedTestCase {

    func p(_ s: String) {
        print("Magic: \(s)")
    }

    override class func _qck_testMethodSelectors() -> [_QuickSelectorWrapper] {
        return ["a", "b", "c"].map { parameter in
            let block: @convention(block) (RuntimeTests) -> Void = { $0.p(parameter) }
            let implementation = imp_implementationWithBlock(block)
            let selectorName = "test_\(parameter)"
            let selector = NSSelectorFromString(selectorName)
            class_addMethod(self, selector, implementation, "v@:")
            return _QuickSelectorWrapper(selector: selector)
        }
    }
}
