//
//  CartsManager.swift
//  eCommerce
//
//  Created by shafique dassu on 15/11/2023.
//

import Foundation
import SwiftUI

class CartManager: ObservableObject {
    
    @Published var productsInCart: [ProductInCart] = []
    
    func addToCart(product: Product) {
        if let indexOfProductInCart = productsInCart.firstIndex(where: { $0.id == product.id }) {
            let currentQuantity = productsInCart[indexOfProductInCart].quantity
            let newQuantity = currentQuantity + 1
            productsInCart[indexOfProductInCart] = ProductInCart(product: product, quantity: newQuantity)
        
        } else {
            productsInCart.append(ProductInCart(product: product, quantity: 1))
        }
    }
    
    func removeFromCart(product: Product) {
        if let indexOfProductInCart = productsInCart.firstIndex(where: { $0.id == product.id }) {
            let currentQuantity = productsInCart[indexOfProductInCart].quantity
            if currentQuantity > 1 {
                let newQuantity = currentQuantity - 1
                productsInCart[indexOfProductInCart] = ProductInCart(product: product, quantity: newQuantity)
            } else if currentQuantity == 1 {
                productsInCart.remove(at: indexOfProductInCart)
            }
        }
    }
    
    var displayTotalCartQuantity: Int {
        return productsInCart.reduce(0) { $0 + $1.quantity }
    }
    
    var displayTotalCartPrice: String {
        let totalPrice = productsInCart.reduce(0) { $0 + ($1.product.price * Double($1.quantity)) }
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        return formatter.string(from: totalPrice as NSNumber) ?? "£0.00"
        
    }
    
    var totalCartPrice: Double {
        let totalPrice = productsInCart.reduce(0) {
            $0 + ($1.product.price * Double($1.quantity)) }
            
            return totalPrice
        }
    }


