//
//  CartsManager.swift
//  eCommerce
//
//  Created by shafique dassu on 15/11/2023.
//

import Foundation
import SwiftUI

class CartManager: ObservableObject {
    @Published var products: [Product] = []
}
