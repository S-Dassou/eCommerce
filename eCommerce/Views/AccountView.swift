//
//  AccountView.swift
//  eCommerce
//
//  Created by shafique dassu on 01/10/2023.
//

import SwiftUI
import FirebaseAuth
import FirebaseFirestore

struct AccountView: View {
    @State var goToLogin = false
    @EnvironmentObject var sessionService: SessionService
    
    var body: some View {
        Button {
            do {
                try Auth.auth().signOut()
                sessionService.sessionState = .loggedOut
            }
            catch {
                print(error.localizedDescription)
            }
        } label: {
            Text("SignOut")
        }

        
    }
}

struct AccountView_Previews: PreviewProvider {
    static var previews: some View {
        AccountView()
    }
}
