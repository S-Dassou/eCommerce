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
    @StateObject var cartManager = CartManager()
    @State var selectedTab = 0
    
    var body: some Scene {
        WindowGroup {
            switch sessionService.sessionState {
            case .loggedIn:
                TabView(selection: $selectedTab) {
                    HomeView()
                        .tabItem {
                            Image(systemName: "house.fill")
                            Text("Home")
                        }
                        .tag(0)
                    CartView()
                        .tabItem {
                            Image(systemName: "cart.fill")
                            Text("Cart")
                        }
                        .tag(1)
                    FavouritesView()
                        .tabItem {
                            Image(systemName: "heart.fill")
                            Text("Favourites")
                        }
                        .tag(2)
                    AccountView()
                        .tabItem {
                            Image(systemName: "person.fill")
                            Text("Account")
                        }
                        .tag(3)
                }
                .environmentObject(sessionService)
                .environmentObject(favouritesManager)
                .environmentObject(cartManager)
                
            case .loggedOut:
                LoginView()
                    .environmentObject(sessionService)
            }
        }
    }
}
