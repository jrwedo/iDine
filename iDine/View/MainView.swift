//
//  MainView.swift
//  iDine
//
//  Created by Pintween on 2023/09/04.
//

import SwiftUI

struct MainView: View {
    @StateObject var menuVM = MenuViewModel()
    
    var body: some View {
        TabView {
            ContentView(menuVM: self.menuVM)
                .tabItem {
                    Label("Menu", systemImage: "list.dash")
                }
            OrderView()
                .tabItem {
                    Label("Order", systemImage: "square.and.pencil")
                }
            FavoriteView(menuVM: self.menuVM)
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
