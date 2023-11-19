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
    
    var displayCartQuantity: Int {
        return productsInCart.reduce(0) { $0 + $1.quantity }
    }
    
    var displayTotalCartPrice: String {
        let totalPrice = productsInCart.reduce(0) { $0 + ($1.product.price * Double($1.quantity)) }
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        return formatter.string(from: totalPrice as NSNumber) ?? "£0.00"
        
    }
}

