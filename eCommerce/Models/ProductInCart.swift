//
//  ProductInCart.swift
//  eCommerce
//
//  Created by shafique dassu on 19/11/2023.
//

import Foundation

struct ProductInCart: Identifiable {
    let id = UUID()
    let product: Product
    var quantity: Int
}
