//
//  MainView.swift
//  iDine
//
//  Created by Pintween on 2023/09/04.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        TabView {
            ContentView()
                .tabItem {
                    Label("Menu", systemImage: "list.dash")
                }
            OrderView()
                .tabItem {
                    Label("Order", systemImage: "square.and.pencil")
                }
            FavoriteView()
                .tabItem {
                    Label("Favorite", systemImage: "star")
                }
        }
    }
}

#Preview {
    MainView()
        .environmentObject(Order())
}
