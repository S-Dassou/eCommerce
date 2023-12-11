//
//  PrimaryButtonStyle.swift
//  eCommerce
//
//  Created by shafique dassu on 11/12/2023.
//

import Foundation
import SwiftUI

struct PrimaryButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration
            .label
            .foregroundStyle(Color.white)
            .frame(maxWidth: .infinity)
            .frame(height: 45)
            .background(Color.blue)
            .clipShape(RoundedRectangle(cornerRadius: 10))
            .padding(.horizontal)
    }
}
