//
//  FirstSpecTest.swift
//  iOSDemoTests
//
//  Created by Rafael Ferraz on 8/20/18.
//  Copyright © 2018 Rafael Ferraz. All rights reserved.
//

import Quick
import Nimble

class FirstSpecTest: QuickSpec {
    
    override func spec() {
        describe("First Simple Spec") {
            it("should be true") {
                expect(true).to(beTruthy())
            }
        }
    }
}
