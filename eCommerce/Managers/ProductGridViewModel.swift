//
//  ProductGridViewManager.swift
//  eCommerce
//
//  Created by shafique dassu on 18/11/2023.
//

import Foundation
import SwiftUI

class ProductGridViewModel: ObservableObject {
    @Published var products = Product.mockProducts
}
