//
//  CartView.swift
//  eCommerce
//
//  Created by shafique dassu on 01/10/2023.
//

import SwiftUI

struct CartView: View {
    
    @EnvironmentObject var cartManager: CartManager
    
    fileprivate func CartRow(productInCart: ProductInCart) -> some View {
        HStack {
            Image(productInCart.product.image)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 70, height: 70)
            VStack(alignment: .leading) {
                Text(productInCart.product.title)
                    .font(.system(size: 15))
                    .padding(.bottom, 1)
            }
        }
    }
    var body: some View {
        VStack {
//            List((cartManager.productsInCart)) { product in
//                CartRow(productInCart: ProductInCart)
//            }
            List {
                ForEach(cartManager.productsInCart) { productInCart in CartRow(productInCart: productInCart)}
            }
        }
    }
}

struct CartView_Previews: PreviewProvider {
    static var previews: some View {
        CartView()
            .environmentObject(CartManager())
    }
}
