//
//  ProductGridView.swift
//  eCommerce
//
//  Created by shafique dassu on 18/11/2023.
//

import SwiftUI

struct ProductGridView: View {
    
    @StateObject var viewModel = ProductGridViewModel()
    
    var columns = [
        GridItem(.flexible(), spacing: 0),
        GridItem(.flexible(), spacing: 0)
    ]
    var body: some View {
        VStack {
            ScrollView {
                LazyVGrid(columns: columns, content: {
                    ForEach(viewModel.products) { product in
                        ProductRowView(product: product)
                    }
                })
            }
        }
    }
}

#Preview {
    ProductGridView()
}
