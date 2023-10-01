//
//  eCommerceApp.swift
//  eCommerce
//
//  Created by shafique dassu on 01/10/2023.
//

import SwiftUI

@main
struct eCommerceApp: App {
    var body: some Scene {
        WindowGroup {
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
        }
    }
}
