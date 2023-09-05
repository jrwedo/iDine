//
//  ItemDetail.swift
//  iDine
//
//  Created by Pintween on 2023/09/04.
//

import SwiftUI

struct ItemDetail: View {
    var item: MenuItem
    @Environment(\.dismiss) var dismiss
    
    @EnvironmentObject var order: Order
    
    @State private var orderingCount = 1
    @State private var showingOrderCompleteAlert = false
    
    var body: some View {
        VStack {
            ZStack(alignment: .bottomTrailing) {
                Image(item.mainImage)
                    .resizable()
                    .scaledToFit()
                
                Text("Photo: \(item.photoCredit)")
                    .padding(4)
                    .background(Color.black)
                    .font(.caption)
                    .foregroundStyle(.white)
                    .offset(x: -5, y: -5)
            }
            
            Text(item.description)
                .padding()
            
            Stepper(
                label: {
                    Text("Count: \(orderingCount)")
                        .padding()
                }, onIncrement: {
                    if orderingCount < 9 {
                        orderingCount += 1
                    }
                }, onDecrement: {
                    if orderingCount > 1 {
                        orderingCount -= 1
                    }
                })
            .fixedSize()
            
            Button("Order This") {
                for _ in 0..<orderingCount {
                    order.add(item: item)
                }
                showingOrderCompleteAlert.toggle()
            }
            .buttonStyle(.borderedProminent)
            
            Spacer()
        }
        .alert("Added to order list", isPresented: $showingOrderCompleteAlert, actions: {
            Button("OK") {
                self.dismiss()
            }
        })
        
        .navigationTitle(item.name)
        .navigationBarTitleDisplayMode(.inline)
    }
    
    
}

#Preview {
    NavigationStack {
        ItemDetail(item: MenuItem.example)
            .environmentObject(Order())
    }
}
