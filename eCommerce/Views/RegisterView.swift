//
//  RegisterView.swift
//  eCommerce
//
//  Created by shafique dassu on 03/11/2023.
//

import SwiftUI
import FirebaseAuth
import FirebaseFirestore

struct RegisterView: View {
    
    @StateObject var viewModel = RegisterViewModel()
    @EnvironmentObject var sessionService: SessionService
    
    var body: some View {
        VStack {
            Text("Register")
                .font(.title)
            TextField("Username", text: $viewModel.username)
                .frame(height: 45)
                .padding(.horizontal)
            TextField("Email", text: $viewModel.email)
                .frame(height: 45)
                .padding(.horizontal)
            SecureField("Password", text: $viewModel.password)
                .frame(height: 45)
                .padding(.horizontal)
            SecureField("Confirm Password", text: $viewModel.confirmPassword)
                .frame(height: 45)
                .padding(.horizontal)
            Button {
                Task {
                    let success = await viewModel.register() //success returns Bool
                    if success {
                        sessionService.sessionState = .loggedIn
                    }
                }
            } label: {
                Text("LogIn")
            }
            .buttonStyle(PrimaryButtonStyle())

             Spacer()
        }
    }
}

#Preview {
    RegisterView()
        .environmentObject(SessionService())
}
