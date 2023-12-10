//
//  PaymentService.swift
//  eCommerce
//
//  Created by shafique dassu on 09/12/2023.
//

import Foundation
import PassKit

class PaymentService: NSObject {
    
    private var paymentController: PKPaymentAuthorizationController?
    private var paymentSummaryItems: [PKPaymentSummaryItem] = []
    private var paymentStatus: PKPaymentAuthorizationStatus = PKPaymentAuthorizationStatus.failure
    var completionHandler: ((Bool) -> Void)?
    
    //PKShippingMethod - wraps around all items
    private func shippingMethodCalculator() -> [PKShippingMethod] {
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
    func startPayment(productsInCart: [ProductInCart], total: Double) {
        paymentSummaryItems.removeAll()
        
        productsInCart.forEach { productInCart in
            let item = PKPaymentSummaryItem(label: "\(productInCart.product.title) x \(productInCart.quantity)", amount: NSDecimalNumber(string: productInCart.displayTotalPrice), type: .final)
            paymentSummaryItems.append(item )
        }
        
        let total = PKPaymentSummaryItem(label: "Total", amount: NSDecimalNumber(value: total))
        paymentSummaryItems.append(total)
        
        let paymentRequest = PKPaymentRequest()
        paymentRequest.paymentSummaryItems = paymentSummaryItems
        paymentRequest.merchantIdentifier = "merchant.com.shafiquedassu.ecommerceapp"
        paymentRequest.merchantCapabilities = .threeDSecure
        paymentRequest.countryCode = "US" //GBR ISO code for UK
        paymentRequest.currencyCode = "USD"
        paymentRequest.supportedNetworks = [
            .visa,
            .masterCard
        ]
        paymentRequest.shippingType = .delivery
        paymentRequest.shippingMethods = shippingMethodCalculator()
        paymentRequest.requiredShippingContactFields = [.name, .postalAddress, .phoneNumber]
        
        paymentController = PKPaymentAuthorizationController(paymentRequest: paymentRequest)
        paymentController?.delegate = self
        paymentController?.present(completion: { presented in
            
        })
    }
}

extension PaymentService: PKPaymentAuthorizationControllerDelegate {
    
    func paymentAuthorizationController(_ controller: PKPaymentAuthorizationController, didAuthorizePayment payment: PKPayment, handler completion: @escaping (PKPaymentAuthorizationResult) -> Void) {
        paymentStatus = PKPaymentAuthorizationStatus.success
        completion(PKPaymentAuthorizationResult(status: paymentStatus, errors: [Error]()))
    }
    
    
    
    func paymentAuthorizationControllerDidFinish(_ controller: PKPaymentAuthorizationController) {
        controller.dismiss {
            if self.paymentStatus == .success {
                if let completionHandler = self.completionHandler {
                    completionHandler(true)
                }
            } else {
                if let completionHandler = self.completionHandler {
                            completionHandler(false)
                        }
                    }
                }
            }
        }

