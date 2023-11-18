//
//  ProductView.swift
//  eCommerce
//
//  Created by shafique dassu on 18/11/2023.
//

import SwiftUI

struct ProductRowView: View {
    @EnvironmentObject var favouritesManager: FavouritesManager
    let product: Product
    
    var body: some View {
        NavigationLink {
            ProductDetailView(product: product)
        } label: {
            VStack(alignment: .leading, spacing: 3) {
                Image(product.image)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width:150, height: 150)
                    .clipped()
                Text(product.title)
                    .font(.system(size: 15))
                    .foregroundStyle(Color.primary)
                Text("\(product.displayPrice)")
                    .font(.system(size: 15))
                    .foregroundStyle(Color.primary)
                HStack {
                    Image(systemName: "star.fill")
                        .font(.system(size: 14))
                        .foregroundColor(Color.yellow)
                    Text("4.8")
                        .font(.system(size: 14))
                        .foregroundStyle(Color.primary)
                }
                Spacer()
            }
            .padding(10)
            .frame(height: 250)
            .overlay(alignment: .topTrailing) {
                Button {
                    if favouritesManager.products.contains(product) {
                        favouritesManager.products.removeAll { $0.id == product.id }
                    } else {
                        favouritesManager.products.append(product)
                    }
                } label: {
                    Image(systemName: favouritesManager.products.contains(product) ? "heart.fill" : "heart")
                }
            }
            .overlay {
                RoundedRectangle(cornerRadius: 9)
                    .stroke(Color(uiColor: .lightGray)).opacity(0.4)
            }
        }
    }
}

#Preview {
    ProductRowView(product: Product.mockProducts[0])
        .environmentObject(FavouritesManager())
}
