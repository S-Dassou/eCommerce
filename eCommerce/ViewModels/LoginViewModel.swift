//
//  LoginViewModel.swift
//  eCommerce
//
//  Created by shafique dassu on 09/10/2023.
//

import Foundation
import SwiftUI
import FirebaseAuth

class LoginViewModel: ObservableObject {
    
    @Published var email = ""
    @Published var password = ""
    @Published var showErrorAlert = false
    @Published var errorMessage = ""
    @Published var goToRegisterView = false
    @Published var isLoading = false
    
    func login() async -> Bool {
        do {
            let result = try await
            Auth.auth().signIn(withEmail: email, password: password)
            return true
        } catch let error {
            print(error.localizedDescription)
            var errorMessage = "invalid details"
            if let errorCode = AuthErrorCode.Code(rawValue: error._code) {
                switch errorCode {
                case .wrongPassword:
                    errorMessage = "wrong password"
                case .invalidEmail:
                    errorMessage = "check email"
                default:
                    break
                }
            }
            self.errorMessage = errorMessage
            showErrorAlert = true
            return false
        }
        
        
//        Auth.auth().signIn(withEmail: email, password: password) { result, error in
//            if let error = error {
//                print(error.localizedDescription)
//                var errorMessage = "Check email/password"
//                if let errorCode = AuthErrorCode.Code(rawValue: error._code) {
//                    switch errorCode {
//                    case .wrongPassword:
//                        errorMessage = "wrong password"
//                    case .invalidEmail:
//                        errorMessage = "check email"
//                    default:
//                        break
//                    }
//                }
//                self.errorMessage = errorMessage
//                self.showErrorAlert = true
//                completion(false)
//                return
//            }
//            guard let result = result else { return }
//            completion(true)
//        }
    }
}
