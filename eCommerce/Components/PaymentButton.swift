//
//  PaymentButton.swift
//  eCommerce
//
//  Created by shafique dassu on 08/12/2023.
//

import Foundation
import PassKit
import SwiftUI

struct PaymentButton: UIViewRepresentable {
    
    let button = PKPaymentButton(paymentButtonType: .checkout, paymentButtonStyle: .automatic)
    var action: () -> Void
    func makeUIView(context: Context) -> some UIView {
        context.coordinator.button
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
        context.coordinator.action
    }
    
    func makeCoordinator() -> PaymentButtonCoordinator {
        PaymentButtonCoordinator(action: action)
    }
}

class PaymentButtonCoordinator: NSObject {
    
    var action: () -> Void
    var button = PKPaymentButton(paymentButtonType: .checkout, paymentButtonStyle: .automatic)
    
    init(action: @escaping () -> Void) {
        self.action = action
        super.init()
        button.addTarget(self, action: #selector(callback), for: .touchUpInside)
    }
    @objc func callback() {
        
    }
}



