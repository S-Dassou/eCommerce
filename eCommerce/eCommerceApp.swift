//
//  eCommerceApp.swift
//  eCommerce
//
//  Created by shafique dassu on 01/10/2023.
//

import SwiftUI
import FirebaseCore

class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    FirebaseApp.configure()
    return true
  }
}

@main
struct eCommerceApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    @StateObject var sessionService = SessionService()
    @StateObject var favouritesManager = FavouritesManager()
    
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
                .environmentObject(favouritesManager)
                
            case .loggedOut:
                LoginView()
                    .environmentObject(sessionService)
            }
        }
    }
}
