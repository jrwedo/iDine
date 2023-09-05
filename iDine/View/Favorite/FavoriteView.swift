//
//  FavoriteView.swift
//  iDine
//
//  Created by Pintween on 2023/09/05.
//

import SwiftUI

struct FavoriteView: View {
    let realmManager = RealmLocalDBManager()
    @State var menu: [RealmFavoriteMenu] = []
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(menu) { item in
                    Text(item.name)
                }
            }
            .listStyle(.grouped)
            .navigationTitle("Favorite")
        }
        .task {
            getFavoriteMenuRealm()
        }
    }
    
    func getFavoriteMenuRealm() {
        self.menu = realmManager.getFavoriteMenu()
    }
}

#Preview {
    FavoriteView()
}
