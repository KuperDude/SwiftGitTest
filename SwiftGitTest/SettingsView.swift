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
            Color.purple
                .ignoresSafeArea()
            
            VStack {
                
                Text("Change language")
                    .padding()
                    .background(.green)
                    .foregroundStyle(.white)
                    .cornerRadius(10)
                
                Text("Change age")
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
