//
//  CheckoutView.swift
//  iDine
//
//  Created by Pintween on 2023/09/04.
//

import SwiftUI

struct CheckoutView: View {
    let paymentTypes = ["Cash", "Credit Card", "iDine Points"]
    @Environment(\.dismiss) var dismiss
    
    @EnvironmentObject var order: Order
    
    @State private var paymentType = "Cash"
    
    @State private var addLoyaltyDetails = false
    @State private var loyaltyNumber = ""
    
    let tipAmounts = [10, 15, 20, 25, 0]
    @State private var tipAmount = 15
    
    @State private var showingPaymentAlert = false
    
    var totalPrice: String {
        let total = Double(order.total)
        let tipValue = total / 100 * Double(tipAmount)
        return (total + tipValue).formatted(.currency(code: "USD"))
    }
    
    var body: some View {
        Form {
            Section {
                Picker("How do you want to pay?", selection: $paymentType) {
                    ForEach(paymentTypes, id: \.self) {
                        Text($0)
                    }
                }
                .pickerStyle(.automatic)
                
                Toggle("Add iDIne loyalty card", isOn: $addLoyaltyDetails.animation())
                if addLoyaltyDetails {
                    TextField("Enter your iDine ID", text: $loyaltyNumber)
                }
            } //: Section 1
            
            Section("Add a tip?") {
                Picker("Percentage:", selection: $tipAmount) {
                    ForEach(tipAmounts, id: \.self) {
                        Text("\($0)%")
                    }
                }
                .pickerStyle(.segmented)
            } //: Section 2
            
            Section("Total: \(totalPrice)") {
                Button("Confirm order") {
                    showingPaymentAlert.toggle()
                }
            } //: Section 3
            
        } //: Form
        .alert("Order confirmed", isPresented: $showingPaymentAlert, actions: {
            Button("OK") {
                order.removeAll()
                self.dismiss()
            }
        }, message: {
            Text("Your total was \(totalPrice) - thank you!")
        })
        .navigationTitle("Payment")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    CheckoutView()
        .environmentObject(Order())
}
