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
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        ZStack {
            VStack {
                Text("Register")
                    .font(.title)
                TextField("Username", text: $viewModel.username)
                    .textFieldStyle(PrimaryTextFieldStyle())
                    .textContentType(.username)
                    .textInputAutocapitalization(.never)
                TextField("Email", text: $viewModel.email)
                    .textFieldStyle(PrimaryTextFieldStyle())
                    .textInputAutocapitalization(.never)
                    .textContentType(.emailAddress)
                    .keyboardType(.emailAddress)
                SecureField("Password", text: $viewModel.password)
                    .textFieldStyle(PrimaryTextFieldStyle())
                SecureField("Confirm Password", text: $viewModel.confirmPassword)
                    .textFieldStyle(PrimaryTextFieldStyle())
                Button {
                    viewModel.isLoading = true
                    Task {
                        let success = await viewModel.register() //success returns Bool
                        viewModel.isLoading = false
                        if success {
                            sessionService.sessionState = .loggedIn
                        }
                    }
                } label: {
                    Text("LogIn")
                }
                .buttonStyle(PrimaryButtonStyle())
                
                Button {
                    dismiss()
                } label: {
                    Text("Register")
                        .font(.system(size: 15))
                }
                .padding(.top)
                Spacer()
            }
            .alert("Error", isPresented: $viewModel.showErrorAlert) {
                Button("OK") {
                    
                }
            } message: {
                Text(viewModel.errorMessage)
            }

            if viewModel.isLoading {
                Color.black.opacity(0.5)
                    .ignoresSafeArea()
                ProgressView()
                    .tint(Color.white)
            }
        }
    }
}

#Preview {
    RegisterView()
        .environmentObject(SessionService())
}
