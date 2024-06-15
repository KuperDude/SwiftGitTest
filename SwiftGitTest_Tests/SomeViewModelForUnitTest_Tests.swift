//
//  SomeViewModelForUnitTest_Tests.swift
//  SwiftGitTest_Tests
//
//  Created by MyBook on 15.06.2024.
//

import XCTest

@testable import SwiftGitTest

final class SomeViewModelForUnitTest_Tests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func test_SomeViewModelForUnitTest_isPremium_shouldBeTrue() {
        //Given
        let isPremium = true
        
        //When
        let vm = SomeViewModelForUnitTest(isPremium: isPremium)
        
        //Then
        XCTAssertTrue(vm.isPremium)
    }
    
    func test_SomeViewModelForUnitTest_isPremium_shouldBeFalse() {
        //Given
        let isPremium = false
        
        //When
        let vm = SomeViewModelForUnitTest(isPremium: isPremium)
        
        //Then
        XCTAssertFalse(vm.isPremium)
    }
    
    func test_SomeViewModelForUnitTest_isPremium_shouldBeEqual() {
        //Given
        let isPremium = Bool.random()
        
        //When
        let vm = SomeViewModelForUnitTest(isPremium: isPremium)
        
        //Then
        XCTAssertEqual(isPremium, vm.isPremium)
    }
    
    func test_SomeViewModelForUnitTest_isPremium_shouldBeEqual_stress() {
        for _ in 0..<100 {
            //Given
            let isPremium = Bool.random()
            
            //When
            let vm = SomeViewModelForUnitTest(isPremium: isPremium)
            
            //Then
            XCTAssertEqual(isPremium, vm.isPremium)
        }
    }

}
