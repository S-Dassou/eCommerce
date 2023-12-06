//
//  ProductDetailView.swift
//  eCommerce
//
//  Created by shafique dassu on 15/11/2023.
//

import SwiftUI

struct ProductDetailView: View {
    let product: Product
    @State var addToCartAlert = false
    @EnvironmentObject var cartManager: CartManager
    var body: some View {
        
        VStack(alignment: .leading) {
            Image(product.image)
                .resizable()
                .scaledToFit()
                .frame(maxWidth: .infinity)
                .frame(height: 200)
                .clipped()
            Text(product.title)
                .font(.system(size: 20, weight: .medium))
                .padding(.bottom, 5)
            Text(product.description)
                .font(.system(size: 15))
                .padding(.bottom, 10)
            Button(action: {
                $cartManager.products.append(product)
                addToCartAlert = true
            }, label: {
                Text("Add to cart")
                    .font(.system(size: 15, weight: .bold))
                    .foregroundStyle(Color.white)
                    .frame(maxWidth: .infinity)
                    .frame(height: 45)
                    .background(Color.blue)
                    .clipShape(RoundedRectangle(cornerRadius: 6))
                    
                    
            })
            Spacer()
        }
        .alert("Added to cart", isPresented: $addToCartAlert, actions: {
            Button(role: .none) {
                 
            } label: {
                Text("Okay")
            }

        }, message: {
            Text("You have added \(product.title) to your cart")
        })
        .padding(.horizontal)
    }
}

#Preview {
    ProductDetailView(product: Product.mockProducts[0])
        .environmentObject(CartManager())
}
