//
//  ProductInCart.swift
//  eCommerce
//
//  Created by shafique dassu on 19/11/2023.
//

import Foundation

struct ProductInCart: Identifiable {
    var id: UUID {
        return product.id
    }
    let product: Product
    var quantity: Int
    var DisplayTotalPrice: String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        let total = Double(quantity) * product.price
        return formatter.string(from: total as NSNumber) ?? "£0.00"
         
    }
}
