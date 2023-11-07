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
    
    fileprivate func NavigationBarView() -> some View {
        HStack {
            Spacer()
            Text("E-Commerce App")
            Spacer()
        }
        .overlay(alignment: .trailing) {
            Button(action: {
                
            }, label: {
                ZStack {
                    Image(systemName: "cart.fill")
                        .foregroundStyle(Color.black)
                    ZStack {
                        Circle()
                        Text("1")
                            .font(.system(size: 14))
                            .foregroundStyle(Color.white)
                    }
                    .offset(CGSize(width: 10, height: -10))
                }
            })
            .padding(.trailing)
        }
    }
    
    fileprivate func ProductRow(product: Product) -> some View {
        VStack(alignment: .leading, spacing: 3) {
            Image(product.image)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(height: 140)
                .clipped()
            Text(product.title)
                .font(.system(size: 15))
            Text("\(product.displayPrice)")
                .font(.system(size: 15))
            HStack {
                Image(systemName: "star.fill")
                    .font(.system(size: 14))
                    .foregroundColor(Color.yellow)
                Text("4.8")
                    .font(.system(size: 14))
            }
            Spacer()
        }
        .frame(width: 150, height: 250)
    
    .overlay(alignment: .topTrailing) {
        Button {
            if favouritesManager.products.contains(where: { queryProduct in
                queryProduct.id == product.id
            }) {
                favouritesManager.products.removeAll { $0.id == product.id  }
                
//                favouritesManager.products.removeAll { queryProduct in
//                    queryProduct.id == product.id
//                }
            } else {
                favouritesManager.products.append(product)
            }
        } label: {
            Image(systemName: "heart")
        }
    }
    .overlay {
        RoundedRectangle(cornerRadius: 9)
            .stroke(Color(uiColor: .lightGray)).opacity(0.4)
        
    }
}
    var body: some View {
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
                Button {
                    
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
                             ProductRow(product: product)
                    }
                }
            }
            .padding(.horizontal, 5)
            Spacer()
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .environmentObject(FavouritesManager())
    }
}
