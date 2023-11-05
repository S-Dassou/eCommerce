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
            Text("LogIn")
                .font(.title)
            TextField("Register", text: $viewModel.email)
            SecureField("Password", text: $viewModel.password)
            SecureField("Confirm Password", text: $viewModel.confirmPassword)
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

             Spacer()
        }
    }
}

#Preview {
    RegisterView()
        .environmentObject(SessionService())
}
