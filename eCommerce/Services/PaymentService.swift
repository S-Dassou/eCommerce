//
//  PaymentService.swift
//  eCommerce
//
//  Created by shafique dassu on 09/12/2023.
//

import Foundation
import PassKit

class PaymentService: NSObject {
    
    static let supportedNetworks: [PKPaymentNetwork] = [
        .visa,
        .masterCard
    ]
    
    var paymentSummaryItems: [PKPaymentSummaryItem] = []
    
    //PKShippingMethod - wraps around all items
    func shippingMethodCalculator() -> [PKShippingMethod] {
        let today = Date()
        let calendar = Calendar.current
        
        let shippingStart = calendar.date(byAdding: .day, value: 5, to: today)
        let shippingEnd = calendar.date(byAdding: .day, value: 10, to: today)
        
        guard let shippingStart = shippingStart,
              let shippingEnd = shippingEnd else {
            return []
        }
        
        let startComponent = calendar.dateComponents([.calendar, .year, .month, .day], from: shippingStart)
        let endComponent = calendar.dateComponents([.calendar, .year, .month, .day], from: shippingEnd)
        
        let shippingDelivery = PKShippingMethod(label: "Delivery Fee", amount: NSDecimalNumber(value: 0))
        shippingDelivery.dateComponentsRange = PKDateComponentsRange(start: startComponent, end: endComponent)
        shippingDelivery.detail = "Electronic items sent to your address"
        shippingDelivery.identifier = "DELIVERY"
        
        return [shippingDelivery]
    }
    //total = total number of items
    func startPayment(productsInCart: [ProductInCart], total: Int) {
        paymentSummaryItems.removeAll()
        
        productsInCart.forEach { productInCart in
            let item = PKPaymentSummaryItem(label: "\(productInCart.product.title) x \(productInCart.quantity)", amount: NSDecimalNumber(string: productInCart.displayTotalPrice), type: .final)
            paymentSummaryItems.append(item )
        }
    }
}
