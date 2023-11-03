//
//  RegisterViewModel.swift
//  eCommerce
//
//  Created by shafique dassu on 03/11/2023.
//

import Foundation
import SwiftUI

class RegisterViewModel: ObservableObject {
    
    @Published var email = ""
    @Published var password = ""
    @Published var confirmPassword = ""
    @Published var showErrorAlert = false
    @Published var errorMessage = ""
}
