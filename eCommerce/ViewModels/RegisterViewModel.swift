//
//  RegisterViewModel.swift
//  eCommerce
//
//  Created by shafique dassu on 03/11/2023.
//

import Foundation
import SwiftUI
import FirebaseAuth
import FirebaseFirestore

class RegisterViewModel: ObservableObject {
    
    @Published var email = ""
    @Published var password = ""
    @Published var confirmPassword = ""
    @Published var showErrorAlert = false
    @Published var errorMessage = ""
    
    func register() async -> Bool {
        do {
            let result = try await Auth.auth().createUser(withEmail: email, password: password)
            let userId = result.user.uid
          //creating a user record - set data as 1st time
            //putting a "?" next to try - return a nil if failed - not an error
            try? await Firestore.firestore().collection("users").document(userId).setData(["email" : email])
            return true
        } catch let error {
            print(error.localizedDescription)
            var errorMessage = "invalid details"
            if let errorCode = AuthErrorCode.Code(rawValue: error._code) {
                switch errorCode {
                case .emailAlreadyInUse:
                    errorMessage = "this email is already in use"
                case .weakPassword:
                    errorMessage = "ensure password is strong"
                default:
                    break
                }
            }
            self.errorMessage = errorMessage
            showErrorAlert = true
            return false
        }
    }
}
