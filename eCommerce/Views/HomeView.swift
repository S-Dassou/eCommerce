//
//  HomeView.swift
//  eCommerce
//
//  Created by shafique dassu on 02/10/2023.
//

import SwiftUI

struct HomeView: View {
    
    @StateObject var viewModel = HomeViewModel()
    @EnvironmentObject var favouritesManager: FavouritesManager
    @EnvironmentObject var cartManager: CartManager
    @EnvironmentObject var tabManager: TabManager
    fileprivate func NavigationBarView() -> some View {
        HStack {
            Spacer()
            Text("E-Commerce App")
            Spacer()
        }
        .overlay(alignment: .trailing) {
            Button(action: {
                tabManager.selectedTab = 1
            }, label: {
                ZStack {
                    Image(systemName: "cart.fill")
                        .foregroundStyle(Color.black)
                    if cartManager.products.count > 0 {
                        ZStack {
                            Circle()
                            Text("\(cartManager.products.count)")
                                .font(.system(size: 14))
                                .foregroundStyle(Color.white)
                        }
                        .offset(CGSize(width: 10, height: -10))
                    }
                }
            })
            .padding(.trailing)
        }
    }
    var body: some View {
        NavigationStack {
            VStack {
                NavigationBarView()
                Image("banner")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(height: 200)
                    .frame(width: .infinity)
                    .clipped()
                HStack {
                    Text("Featured")
                        .font(.system(size: 15))
                        .padding(.leading, 10)
                    Spacer()
                        NavigationLink {
                             ProductGridView()
                        } label: {
                            Text("View All")
                                .font(.system(size: 15, weight: .semibold))
                        }
                        .padding(.trailing, 10)
                }
                .padding(.top, 10)
                ScrollView(.horizontal, showsIndicators: false ) {
                    HStack {
                        ForEach(viewModel.products) { product in
                            ProductRowView(product: product)
                        }
                    }
                }
                .padding(.horizontal, 5)
                Spacer()
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .environmentObject(FavouritesManager())
            .environmentObject(CartManager())
            .environmentObject(TabManager())
    }
}
