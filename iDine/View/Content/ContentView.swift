//
//  ContentView.swift
//  iDine
//
//  Created by Pintween on 2023/09/04.
//

import SwiftUI

struct ContentView: View {
//    let menu = Bundle.main.decode([MenuSection].self, from: "menu.json")
    let realmManager = RealmLocalDBManager()
    
    @State var isLoading = false
    @State var menu: [MenuSection] = []
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(menu) { section in
                    Section(section.name) {
                        ForEach(section.items) { item in
                            NavigationLink(destination: {
                                ItemDetail(item: item)
                            }, label: {
                                ItemRow(item: item)
                            })
                        }
                    }
                }
            } //: List
            .listStyle(.grouped)
            .overlay {
                if isLoading {
                    ProgressView()
                        .progressViewStyle(.circular)
                }
            }
            .navigationTitle("Menu")
        } //: NavigationStack
        .task {
            getMenu()
        }
    }
    
    func getMenu() {
        self.isLoading = true
        APIMenuService(environment: ApiEnvironment.production).getMenu { (menu, error) in
            defer {
                self.isLoading = false
            }
            
            if let error = error {
                print(error)
                return
            }
            
            guard let menu = menu else {
                print("menu guard error")
                return
            }
            
            self.menu = menu
//            initRealmData()
        }
    }
    
//    func initRealmData() {
//        for section in menu {
//            for item in section.items {
//                let favoriteMenu = RealmFavoriteMenu()
//                favoriteMenu.name = item.name
//                favoriteMenu.isFavorite = false
//                realmManager.saveObject(obj: favoriteMenu)
//            }
//        }
//    }
}

#Preview {
    ContentView()
        .environmentObject(Order())
}
