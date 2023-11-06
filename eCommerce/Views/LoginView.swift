//
//  LoginView.swift
//  eCommerce
//
//  Created by shafique dassu on 09/10/2023.
//

import SwiftUI
import FirebaseAuth

struct LoginView: View {
    @State var goToRegisterView = false
    @StateObject var viewModel = LoginViewModel()
    @EnvironmentObject var sessionService: SessionService
    
    var body: some View {
        VStack {
            Text("LogIn")
                .font(.title)
            TextField("Email", text: $viewModel.email)
            TextField("Password", text: $viewModel.password)
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
            }
            
            Button {
                goToRegisterView = true
            } label: {
                Text("Register")
            }


             Spacer()
        }
        .alert("Error", isPresented: $viewModel.showErrorAlert) {
            Button("OK", action: {})
        } message: {
            Text(viewModel.errorMessage)
        }
        .sheet(isPresented: $goToRegisterView) {
            RegisterView()
        }
    }
}


struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
