//
//  UITestingView.swift
//  SwiftGitTest
//
//  Created by MyBook on 23.06.2024.
//

import SwiftUI
//import SwiftfulUI

class UITestingViewModel: ObservableObject {
    
    @Published var text = ""
    @Published var isLogin: Bool
    
    init(isLogin: Bool) {
        self.isLogin = isLogin
    }
    
    func loginButtonAction() {
        guard !text.isEmpty else { return }
        
        isLogin = true
    }
}

struct UITestingView: View {
    
    @StateObject var vm: UITestingViewModel
    
    init(isUserLogin: Bool) {
        self._vm = StateObject(wrappedValue: UITestingViewModel(isLogin: isUserLogin))
    }
    
    
    var body: some View {
        
        ZStack {
            
            LinearGradient(colors: [.red, .black], startPoint: .topLeading, endPoint: .bottomTrailing)
                .ignoresSafeArea()
            
            if !vm.isLogin {
                VStack {
                    TextField("Enter your name", text: $vm.text)
                        .padding()
                        .background(.blue)
                        .foregroundStyle(Color.white)
                        .cornerRadius(10)
                        .padding()
                        .accessibilityIdentifier("TextFieldForLogin")
                    
                    Button {
                        withAnimation(.spring) {
                            vm.loginButtonAction()
                        }
                    } label: {
                        Text("Sign up")
                            .frame(maxWidth: .infinity)
                    }
                    .padding()
                    .background(.white)
                    .foregroundStyle(Color.blue)
                    .cornerRadius(10)
                    .padding(.horizontal)
                    .accessibilityIdentifier("SignUpButton")
                }
                .transition(.move(edge: .leading))
            }
            
            if vm.isLogin {
                UITestigHomeView()
                    .transition(.move(edge: .trailing))
            }
            
            
        }
    }
}

#Preview {
    UITestingView(isUserLogin: false)
}


struct UITestigHomeView: View {
    
    @State private var showAlert = false
    
    var body: some View {
        
        NavigationStack {
            VStack {
                
                Button {
                    showAlert = true
                } label: {
                    Text("Show Alert")
                        .frame(maxWidth: .infinity)
                }
                .padding()
                .background(.red)
                .foregroundStyle(Color.white)
                .cornerRadius(10)
                .padding()
                .alert(isPresented: $showAlert, content: {
                    return Alert(title: Text("Hello text!"))
                })
                .accessibilityIdentifier("ShowAlert")
                
                
                NavigationLink("Link") {
                    Text("Destanation")
                }
                .frame(maxWidth: .infinity)
                .padding()
                .background(.blue)
                .foregroundStyle(Color.white)
                .cornerRadius(10)
                .padding(.horizontal)
                .accessibilityIdentifier("Link")
                
            }
            .navigationTitle("Home View")
        }
    }
}
