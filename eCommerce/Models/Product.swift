//
//  Product.swift
//  eCommerce
//
//  Created by shafique dassu on 07/10/2023.
//

import Foundation
import SwiftUI

struct Product: Identifiable {
    let id = UUID()
    let title: String
    let description: String
    let price: Double
    let image: String
    var displayPrice: String {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .currency
        let price = numberFormatter.string(from: price as NSNumber)
        return price ?? "$0.00"
    }
}

extension Product: Hashable {
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}

extension Product {
    static let mockProducts: [Product] = [
        Product(title: "iMac", description: "Pricey & Spicey", price: 2000, image: "iMac"),
    Product(title: "iMac", description: "Pricey & Spicey", price: 2000, image: "iMac"),
    Product(title: "iMac", description: "Pricey & Spicey", price: 2000, image: "iMac")
    ]
}
