//
//  ContentView.swift
//  iDine
//
//  Created by Pintween on 2023/09/04.
//

import SwiftUI

struct ContentView: View {
    let menu = Bundle.main.decode([MenuSection].self, from: "menu.json")
    
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
            .navigationTitle("Menu")
        } //: NavigationStack
    }
}

#Preview {
    ContentView()
        .environmentObject(Order())
}
