//
//  SessionService.swift
//  eCommerce
//
//  Created by shafique dassu on 10/10/2023.
//

import Foundation
import SwiftUI
import FirebaseAuth

class SessionService: ObservableObject {
    
    @Published var sessionState: SessionState
    
    init() {
        
        sessionState = Auth.auth().currentUser != nil ? .loggedIn : .loggedOut
    }
}
