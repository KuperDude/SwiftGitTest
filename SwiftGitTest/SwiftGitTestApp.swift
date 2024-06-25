//
//  SwiftGitTestApp.swift
//  SwiftGitTest
//
//  Created by MyBook on 10.06.2024.
//

import SwiftUI

@main
struct SwiftGitTestApp: App {
    
    let userSignUp: Bool
    
    init() {
        
        self.userSignUp = ProcessInfo.processInfo.arguments.contains("-UITest_UserSignUp")
    }
    
    var body: some Scene {
        WindowGroup {
            UITestingView(isUserLogin: userSignUp)
        }
    }
}
