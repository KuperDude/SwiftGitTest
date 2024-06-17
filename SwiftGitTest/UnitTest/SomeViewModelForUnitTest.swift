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
}
