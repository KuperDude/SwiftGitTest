//
//  MockDataManager_Tests.swift
//  SwiftGitTest_Tests
//
//  Created by MyBook on 20.06.2024.
//

import XCTest
import Combine
@testable import SwiftGitTest

final class MockDataManager_Tests: XCTestCase {
    
    var cancellables = Set<AnyCancellable>()

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        cancellables.removeAll()
    }
    
    func test_MockDataManager_dataFromEscaping_ShouldSetValue() {
        // Given
        let manager = MockDataManager(dataArray: nil)
        var result: [String] = []
        
        let expectation = XCTestExpectation(description: "Should return value after 5 sec")
        //When
        manager.dataFromEscaping { array in
            expectation.fulfill()
            result = array
        }
        
        wait(for: [expectation], timeout: 5)
        //Then
        XCTAssertEqual(result.count, manager.dataArray.count)
    }
    
    func test_MockDataManager_dataFromCombine_ShouldSetValue() {
        // Given
        let manager = MockDataManager(dataArray: nil)
        var result: [String] = []
        
        let expectation = XCTestExpectation(description: "Should return value after 3 sec")
        //When
        manager.dataFromCombine()
            .sink { result in
                switch result {
                case .finished: break
                case .failure(_): XCTFail()
                }
            } receiveValue: { array in
                expectation.fulfill()
                result = array
            }
            .store(in: &cancellables)

        
        wait(for: [expectation], timeout: 3)
        //Then
        XCTAssertEqual(result.count, manager.dataArray.count)
    }
    
    func test_MockDataManager_dataFromCombine_ShouldFail() {
        // Given
        let manager = MockDataManager(dataArray: ["", "abv", "123"])
        var result: [String] = []
        
        let expectation = XCTestExpectation(description: "Should return value after 3 sec")
        //When
        manager.dataFromCombine()
            .sink { result in
                switch result {
                case .finished: 
                    XCTFail()
                    return
                case .failure(_):
                    expectation.fulfill()
                }
            } receiveValue: { array in
                result = array
            }
            .store(in: &cancellables)

        
        wait(for: [expectation], timeout: 3)
        //Then
        XCTAssertEqual(result.count, 0)
    }
    
    func test_MockDataManager_dataFromConcurrency_ShouldSetValue() {
        // Given
        let manager = MockDataManager(dataArray: nil)
        
        let expectation = XCTestExpectation(description: "Should return value after 5 sec")
        //When
        Task {
            let result = await manager.dataFromConcurrency()
            expectation.fulfill()
            XCTAssertEqual(result.count, manager.dataArray.count)
        }

        wait(for: [expectation], timeout: 5)
        //Then
    }

}
