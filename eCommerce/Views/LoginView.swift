//
//  LoginView.swift
//  eCommerce
//
//  Created by shafique dassu on 09/10/2023.
//

import SwiftUI
import FirebaseAuth

struct LoginView: View {
    
    @StateObject var viewModel = LoginViewModel()
    @EnvironmentObject var sessionService: SessionService
    
    var body: some View {
        VStack {
            Text("LogIn")
                .font(.title)
            TextField("Email", text: $viewModel.email)
                .textFieldStyle(PrimaryTextFieldStyle())
            TextField("Password", text: $viewModel.password)
                .textFieldStyle(PrimaryTextFieldStyle())
            Button {
                Task {
                    let success = await viewModel.login()
                    if success {
                        print("successful log in")
                        sessionService.sessionState = .loggedIn
                    }
                }
            } label: {
                Text("LogIn")
                    .font(.system(size: 15))
            }
            .buttonStyle(PrimaryButtonStyle())
            
            Button {
                viewModel.goToRegisterView = true
            } label: {
                Text("Register")
                    .font(.system(size: 15))
            }
            .padding(.top)


             Spacer()
        }
        .alert("Error", isPresented: $viewModel.showErrorAlert) {
            Button("OK", action: {})
        } message: {
            Text(viewModel.errorMessage)
        }
        .sheet(isPresented: $viewModel.goToRegisterView) {
            RegisterView()
        }
    }
}


struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
