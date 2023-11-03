//
//  eCommerceApp.swift
//  eCommerce
//
//  Created by shafique dassu on 01/10/2023.
//

import SwiftUI

@main
struct eCommerceApp: App {
    @StateObject var sessionService = SessionService()
    
    var body: some Scene {
        WindowGroup {
            switch sessionService.sessionState {
            case .loggedIn:
                TabView() {
                    HomeView()
                        .tabItem {
                            Image(systemName: "house.fill")
                            Text("Home")
                        }
                    CartView()
                        .tabItem {
                            Image(systemName: "cart.fill")
                            Text("Cart")
                        }
                    FavouritesView()
                        .tabItem {
                            Image(systemName: "heart.fill")
                            Text("Favourites")
                        }
                    AccountView()
                        .tabItem {
                            Image(systemName: "person.fill")
                            Text("Account")
                        }
                }
                .environmentObject(sessionService)
                
            case .loggedOut:
                LoginView()
                    .environmentObject(sessionService)
            }
        }
    }
}
