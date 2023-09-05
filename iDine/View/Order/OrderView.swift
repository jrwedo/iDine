//
//  OrderView.swift
//  iDine
//
//  Created by Pintween on 2023/09/04.
//

import SwiftUI

struct OrderView: View {
    @EnvironmentObject var order: Order
    
    var body: some View {
        NavigationStack {
            List {
                Section {
                    ForEach(order.items) { item in
                        HStack {
                            Text(item.name)
                            Spacer()
                            Text("$\(item.price)")
                        }
                    }
                    .onDelete(perform: deleteItems)
                }
                
                Section {
                    NavigationLink(destination: {
                        CheckoutView()
                    }, label: {
                        Text("Place Order")
                    })
                }
                .disabled(order.items.isEmpty)
            } //: List
            .navigationTitle("Order")
            .toolbar {
                EditButton()
                    .disabled(order.items.isEmpty)
            }
        } //: NavStack
    }
    
    func deleteItems(at offsets: IndexSet) {
        order.items.remove(atOffsets: offsets)
    }
}

#Preview {
    OrderView()
        .environmentObject(Order())
}
