//
//  ContentView.swift
//  iDine
//
//  Created by Pintween on 2023/09/04.
//

import SwiftUI

struct ContentView: View {
//    let menu = Bundle.main.decode([MenuSection].self, from: "menu.json")
    @ObservedObject var menuVM: MenuViewModel
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(menuVM.menu) { section in
                    Section(section.name) {
                        ForEach(section.items) { item in
                            NavigationLink(destination: {
                                ItemDetail(item: item, menuVM: self.menuVM)
                            }, label: {
                                ItemRow(item: item)
                            })
                        }
                    }
                }
            } //: List
            .listStyle(.grouped)
            .overlay {
                if menuVM.isLoadingMenu {
                    ProgressView()
                        .progressViewStyle(.circular)
                }
            }
            .navigationTitle("Menu")
        } //: NavigationStack
        .task {
            menuVM.getMenu()
        }
    }
}

#Preview {
    ContentView(menuVM: MenuViewModel())
        .environmentObject(Order())
}
