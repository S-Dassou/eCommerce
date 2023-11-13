//
//  FavouritesView.swift
//  eCommerce
//
//  Created by shafique dassu on 01/10/2023.
//

import SwiftUI

struct FavouritesView: View {
    
    
    @EnvironmentObject var favouritesManager: FavouritesManager
    
    fileprivate func FavouriteRow(favourite: Product) -> some View {
        HStack {
            Image(favourite.image)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 70, height: 70)
            VStack(alignment: .leading) {
                Text(favourite.title)
                    .font(.system(size: 15))
                    .padding(.bottom, 1)
                Text(favourite.description)
                    .font(.system(size: 15))
                    .padding(.bottom, 1)
            }
            Button(action: {
                removeFromFavourites(product: favourite)
            }, label: {
                Image(systemName: "heart.fill")
            })
        }
    }
    
    var body: some View {
        NavigationStack {
            VStack {
                List(favouritesManager.products) { favourite in
                    FavouriteRow(favourite: favourite)
                }
            }
            .overlay(content: {
                if favouritesManager.products.count == 0 {
                    Text("Nothing to see here")
                }
            })
            .navigationTitle("Favourites")
        }
    }
    
    func removeFromFavourites(product: Product) {
        favouritesManager.products.removeAll { $0.id == product.id }
    }
}

#Preview {
    FavouritesView()
        .environmentObject(FavouritesManager())
}
