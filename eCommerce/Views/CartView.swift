//
//  CartView.swift
//  eCommerce
//
//  Created by shafique dassu on 01/10/2023.
//

import SwiftUI

struct CartView: View {
    
    @EnvironmentObject var cartManager: CartManager
    @StateObject var viewModel = CartViewModel()
    let paymentService = PaymentService()
    
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
                Text(productInCart.product.displayPrice)
                    .font(.system(size: 15, weight: .bold))
                Stepper("Quantity \(productInCart.quantity)") {
                    cartManager.addToCart(product: productInCart.product)
                } onDecrement: {
                    cartManager.removeFromCart(product: productInCart.product)
                }
            }
        }
    }
    var body: some View {
        
        if cartManager.productsInCart.count == 0 {
            Text("Cart is empty")
                .font(.system(size: 16, weight: .semibold))
        } else {
            VStack {
                List {
                    ForEach(cartManager.productsInCart) { productInCart in CartRow(productInCart: productInCart)
                    }
                }
                VStack(spacing: 0) {
                    Divider()
                    HStack {
                        Text("Total: \(cartManager.displayTotalCartQuantity) items")
                            .font(.system(size: 16))
                        Spacer()
                        Text(cartManager.displayTotalCartPrice)
                            .font(.system(size: 16, weight: .bold))
                    }
                    .padding(.vertical, 30)
                    .padding(.horizontal)
                    PaymentButton(action: pay)
                        .frame(height: 40)
                        .padding(.horizontal)
                }
            }
        }
    }
    func pay() {
        guard cartManager.productsInCart.count > 0 else {
            return
        }
        paymentService.startPayment(productsInCart: cartManager.productsInCart, total: cartManager.totalCartPrice)
    }
}

struct CartView_Previews: PreviewProvider {
    static var previews: some View {
        CartView()
            .environmentObject(CartManager())
    }
}
