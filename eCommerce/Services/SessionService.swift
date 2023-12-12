//
//  SessionService.swift
//  eCommerce
//
//  Created by shafique dassu on 10/10/2023.
//

import Foundation
import SwiftUI
import FirebaseAuth
import FirebaseFirestore

class SessionService: ObservableObject {
    
    @Published var sessionState: SessionState
    var user: User?
    
    init() {
        sessionState = Auth.auth().currentUser != nil ? .loggedIn : .loggedOut
        Auth.auth().addStateDidChangeListener { _, user in
            guard let user = user else { return }
            if Auth.auth().currentUser != nil {
                Firestore.firestore().collection("users").document(user.uid).getDocument { snapshot, error in
                    guard let snapshot = snapshot,
                          let data = snapshot.data() else {
                        return
                    }
                    guard let username = data["username"] as? String else { return }
                    guard let email = data["email"] as? String else { return }
                    var avatarURL: URL?
                    if let avatar = data["avatarURL"] as? String,
                       let userAvatarURL = URL(string: avatar) {
                        avatarURL = userAvatarURL
                    }
                    self.user = User(username: username, email: email)
                }
            }
        }
    }
}
