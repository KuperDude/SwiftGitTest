//
//  HomeView.swift
//  SwiftGitTest
//
//  Created by MyBook on 11.06.2024.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        ZStack {
            Color.blue
                .ignoresSafeArea()
            
            VStack(spacing: 20) {
                Text("LOL!!!")
                    .padding()
                    .background(.orange)
                    .cornerRadius(9)
                    .shadow(radius: 10)
                
                Text("LOL!!!")
                    .padding()
                    .background(.orange)
                    .cornerRadius(9)
                    .shadow(radius: 10)
            }
        }
    }
}

#Preview {
    HomeView()
}
