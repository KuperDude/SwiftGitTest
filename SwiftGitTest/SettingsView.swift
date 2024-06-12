//
//  SettingsView.swift
//  SwiftGitTest
//
//  Created by MyBook on 12.06.2024.
//

import SwiftUI

struct SettingsView: View {
    var body: some View {
        ZStack {
            Color.yellow
                .ignoresSafeArea()
            
            VStack {
                
                Text("Some settings")
                    .padding()
                    .background(.green)
                    .foregroundStyle(.white)
                    .cornerRadius(10)
            }
        }
        
    }
}

#Preview {
    SettingsView()
}
