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
    
    var body: some View {
        VStack {
            Text("LogIn")
                .font(.title)
            TextField("Email", text: $viewModel.email)
            TextField("Password", text: $viewModel.password)
            Button {
                viewModel.login() { success in
                    
                }
            } label: {
                Text("LogIn")
            }

             Spacer()
        }
        .alert("Error", isPresented: $viewModel.showErrorAlert) {
            Button("OK", action: {})
        } message: {
            Text(viewModel.errorMessage)
        }

    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
