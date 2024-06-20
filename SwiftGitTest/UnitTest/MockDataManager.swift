//
//  MockDataManager.swift
//  SwiftGitTest
//
//  Created by MyBook on 20.06.2024.
//

import Foundation
import Combine

protocol Network {
    func dataFromEscaping(_ completionHandler: @escaping ([String]) -> Void)
    func dataFromCombine() -> AnyPublisher<[String], Error>
    func dataFromConcurrency() async -> [String]
}

class MockDataManager: Network {
    
    var dataArray: [String] = []
    
    init(dataArray: [String]?) {
        guard let data = dataArray else {
            self.dataArray = ["One", "Two", "Three"]
            return
        }
        self.dataArray = data
    }
    
    func dataFromEscaping(_ completionHandler: @escaping ([String]) -> Void) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            completionHandler(self.dataArray)
        }
    }
    
    func dataFromCombine() -> AnyPublisher<[String], Error> {
        Just(dataArray)
            .tryMap { array in
                if array.contains("") {
                    throw URLError(.badURL)
                }
                return array
            }
            .eraseToAnyPublisher()
    }
    
    func dataFromConcurrency() async -> [String] {
        try? await Task.sleep(nanoseconds: 3_000_000_000)
        
        return dataArray
    }
    
}
