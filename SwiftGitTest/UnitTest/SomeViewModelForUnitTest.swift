//
//  SomeViewModelForUnitTest.swift
//  SwiftGitTest
//
//  Created by MyBook on 15.06.2024.
//

import Foundation

class SomeViewModelForUnitTest: ObservableObject {
    @Published var isPremium: Bool
    
    init(isPremium: Bool) {
        self.isPremium = isPremium
    }
    
}
