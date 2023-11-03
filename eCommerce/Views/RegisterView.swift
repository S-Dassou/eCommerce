//
//  RegisterView.swift
//  eCommerce
//
//  Created by shafique dassu on 03/11/2023.
//

import SwiftUI

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
