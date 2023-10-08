//
//  HomeViewModel.swift
//  eCommerce
//
//  Created by shafique dassu on 08/10/2023.
//

import Foundation
import SwiftUI
import Combine

class HomeViewModel: ObservableObject {
    @Published var products: [Product] = Product.mockProducts
}
