//
//  ContentView.swift
//  SwiftGitTest
//
//  Created by MyBook on 10.06.2024.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            
            Text("Hello, world!")
            
            Group {
                
                Button("Click me!") {
                    
                }
                .padding()
                
                Button("Click me2!") {
                    
                }
                .padding()
            }
            .background(.green)
            .foregroundStyle(.white)
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
