//
//  SomeViewModelForUnitTest_Tests.swift
//  SwiftGitTest_Tests
//
//  Created by MyBook on 15.06.2024.
//

import XCTest

@testable import SwiftGitTest

final class SomeViewModelForUnitTest_Tests: XCTestCase {
    
    var viewModel: SomeViewModelForUnitTest?

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        viewModel = SomeViewModelForUnitTest(isPremium: Bool.random())
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        viewModel = nil
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
    
    func test_SomeViewModelForUnitTest_isPremium_arrayData_onStartShouldBeEmpty() {
        //Given
        
        //When
        guard let vm = viewModel else {
            XCTFail()
            return
        }
        
        //Then
        XCTAssertEqual(vm.arrayData.count, 0)
    }
    
    func test_SomeViewModelForUnitTest_isPremium_addElement_CountShouldbeEqualArrayCount() {
        //Given
        guard let vm = viewModel else {
            XCTFail()
            return
        }
        
        //When
        vm.addElement(UUID().uuidString)
        
        //Then
        XCTAssertEqual(vm.arrayData.count, 1)
    }
    
    func test_SomeViewModelForUnitTest_isPremium_addElement_OnAddEmptyArrayShouldBeEmpty() {
        //Given
        guard let vm = viewModel else {
            XCTFail()
            return
        }
        
        //When
        vm.addElement("")
        
        //Then
        XCTAssertEqual(vm.arrayData.count, 0)
    }
    
    func test_SomeViewModelForUnitTest_isPremium_addElement_CountShouldbeEqualArrayCount_stress() {
        //Given
        let vm = SomeViewModelForUnitTest(isPremium: Bool.random())
        let loopCount = 100
        //When
        for _ in 0..<loopCount {
            vm.addElement(UUID().uuidString)
        }
        
        //Then
        XCTAssertEqual(vm.arrayData.count, loopCount)
    }
    
    func test_SomeViewModelForUnitTest_isPremium_selectElement_ShouldBeNilOnStart() {
        //Given
        
        //When
        let vm = SomeViewModelForUnitTest(isPremium: Bool.random())
        
        //Then
        XCTAssertNil(vm.selected)
    }
    
    func test_SomeViewModelForUnitTest_isPremium_selectElement_ShouldBeEqualElement() {
        //Given
        let vm = SomeViewModelForUnitTest(isPremium: Bool.random())
        
        let item = UUID().uuidString
        //When
        vm.addElement(item)
        vm.selectElement(item)
        
        //Then
        XCTAssertEqual(vm.selected, item)
    }
    
    func test_SomeViewModelForUnitTest_isPremium_selectElement_ShouldBeEqualNil() {
        //Given
        let vm = SomeViewModelForUnitTest(isPremium: Bool.random())
        let item = UUID().uuidString
        
        //When
        vm.addElement(item)
        vm.selectElement(item)
        vm.selectElement("")
        
        //Then
        XCTAssertNil(vm.selected)
    }
    
    func test_SomeViewModelForUnitTest_isPremium_saveElement_ShouldFail_doesntExist() {
        //Given
        let vm = SomeViewModelForUnitTest(isPremium: Bool.random())
        let item = UUID().uuidString
        
        //When
        XCTAssertThrowsError(try vm.saveElement(item))
        
        //Then
        XCTAssertThrowsError(try vm.saveElement(item), "Should doesntexist") { error in
            XCTAssertEqual(error as? SomeViewModelForUnitTest.CustomError, .doesntExist)
        }
        
        do {
            try vm.saveElement(item)
        } catch let error {
            XCTAssertEqual(error as? SomeViewModelForUnitTest.CustomError, .doesntExist)
        }
    }
    
    func test_SomeViewModelForUnitTest_isPremium_saveElement_ShouldFail_noData() {
        //Given
        let vm = SomeViewModelForUnitTest(isPremium: Bool.random())
        let item = ""
        
        //When
        vm.addElement(item)
        XCTAssertThrowsError(try vm.saveElement(item))
        
        //Then
        do {
            try vm.saveElement(item)
        } catch let error {
            XCTAssertEqual(error as? SomeViewModelForUnitTest.CustomError, .noData)
        }
    }
    
    func test_SomeViewModelForUnitTest_isPremium_saveElement_ShouldSaveData() {
        //Given
        let vm = SomeViewModelForUnitTest(isPremium: Bool.random())
        let item = UUID().uuidString
        
        //When
        vm.addElement(item)
        XCTAssertNoThrow(try vm.saveElement(item))
        
        //Then
        XCTAssertEqual(vm.arrayData.count, 1)
    }

}
