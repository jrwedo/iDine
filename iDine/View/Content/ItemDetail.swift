//
//  ItemDetail.swift
//  iDine
//
//  Created by Pintween on 2023/09/04.
//

import SwiftUI

struct ItemDetail: View {
    var item: MenuItem
    let realmManager = RealmLocalDBManager()
    @Environment(\.dismiss) var dismiss
    
    @EnvironmentObject var order: Order
    
    @State private var orderingCount = 1
    @State private var showingOrderCompleteAlert = false
    @State private var isFavorite = false
    
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
        .toolbar {
            Button(action: {
                isFavorite.toggle()
                changeFavoriteStatusRealm()
            }, label: {
                Image(systemName: isFavorite ? "star.fill": "star")
                    .tint(.yellow)
            })
        }
        .task {
            getFavoriteStatusRealm()
        }
        
        .navigationTitle(item.name)
        .navigationBarTitleDisplayMode(.inline)
    }
    
    func getFavoriteStatusRealm() {
        let fetchResult = realmManager.getObject(type: RealmFavoriteMenu.self, name: item.name)
        guard let menu = fetchResult?.first as? RealmFavoriteMenu else {
            print("error in guard")
            return
        }
        
        self.isFavorite = menu.isFavorite
    }
    
    func changeFavoriteStatusRealm() {
        let menu = RealmFavoriteMenu()
        menu.isFavorite = isFavorite
        menu.name = item.name
        realmManager.updateObject(obj: menu)
    }
    
    
}

#Preview {
    NavigationStack {
        ItemDetail(item: MenuItem.example)
            .environmentObject(Order())
    }
}
