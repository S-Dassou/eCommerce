//
//  PrimaryTextFieldStyle.swift
//  eCommerce
//
//  Created by shafique dassu on 11/12/2023.
//

import Foundation
import SwiftUI

struct PrimaryTextFieldStyle: TextFieldStyle {
    func _body(configuration: TextField<Self._Label>) -> some View {
        configuration
            .frame(height: 45)
            .padding(.horizontal)
    }
}
