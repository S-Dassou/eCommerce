//
//  FavouritesView.swift
//  eCommerce
//
//  Created by shafique dassu on 01/10/2023.
//

import SwiftUI

struct FavouritesView: View {
    
    @State var favourites: [Product] = Product.mockProducts
    
    var body: some View {
        NavigationStack {
            VStack {
                List(favourites) { favourite in
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
                    }
                }
            }
            .navigationTitle("Favourites")
        }
    }
}

struct FavouritesView_Previews: PreviewProvider {
    static var previews: some View {
        FavouritesView()
    }
}
