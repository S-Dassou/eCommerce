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
        NavigationStack {
            List {
                Section("Account Settings") {
                    VStack {
                        NavigationLink {
                            ChangeEmailView()
                        } label: {
                            HStack {
                                Text("Change Email")
                                    .font(.system(size: 15))
                                Spacer()
                                Text(sessionService.user?.email ?? "No Email")
                                    .font(.system(size: 14))
                            }
                        }

                    }
                    VStack {
                        NavigationLink {
                            ChangePasswordView()
                        } label: {
                            HStack {
                                Text("Change Password")
                                    .font(.system(size: 15))
                                Spacer()
                                Text("*******")
                                    .font(.system(size: 14))
                                    .foregroundStyle(Color.gray)
                            }
                        }
                    }
                    VStack {
                        Button {
                            do {
                                try Auth.auth().signOut()
                                sessionService.sessionState = .loggedOut
                            }
                            catch {
                                print(error.localizedDescription)
                            }
                        } label: {
                            Text("Sign Out")
                                .foregroundStyle(Color.red)
                        }
                    }
                }
                
            }
        }
    }
}

struct AccountView_Previews: PreviewProvider {
    static var previews: some View {
        AccountView()
            .environmentObject(SessionService())
    }
}
