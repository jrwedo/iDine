//
//  FavoriteView.swift
//  iDine
//
//  Created by Pintween on 2023/09/05.
//

import SwiftUI

struct FavoriteView: View {
    @ObservedObject var menuVM: MenuViewModel
    
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(menuVM.favoriteMenu) { item in
                    Text(item.name)
                }
            }
            .listStyle(.grouped)
            .navigationTitle("Favorite")
        }
        .task {
            menuVM.getFavoriteMenuRealm()
        }
    }
    
}

#Preview {
    FavoriteView(menuVM: MenuViewModel())
}
