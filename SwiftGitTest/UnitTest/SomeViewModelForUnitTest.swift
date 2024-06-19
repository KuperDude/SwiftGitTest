//
//  SomeViewModelForUnitTest.swift
//  SwiftGitTest
//
//  Created by MyBook on 15.06.2024.
//

import Foundation

class SomeViewModelForUnitTest: ObservableObject {
    @Published var isPremium: Bool
    @Published var selected: String? = nil
    @Published var arrayData: [String] = []
    
    init(isPremium: Bool) {
        self.isPremium = isPremium
    }
    
    enum CustomError: Error {
        case doesntExist
        case noData
    }
    
}

//MARK: - UserIntent(s)
extension SomeViewModelForUnitTest {
    
    func addElement(_ item: String) {
        guard !item.isEmpty else { return }
        
        arrayData.append(item)
    }
    
    func selectElement(_ item: String) {
        if let item = arrayData.first(where: { $0 == item }) {
            selected = item
        } else {
            selected = nil
        }
    }
    
    func saveElement(_ item: String) throws {
        
        if item == "" {
            throw CustomError.noData
        }
        
        guard let element = arrayData.first(where: { $0 == item }) else {
            throw CustomError.doesntExist
        }
        
        //code for save
    }
}
