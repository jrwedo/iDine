//
//  iDineApp.swift
//  iDine
//
//  Created by Pintween on 2023/09/04.
//

import SwiftUI

@main
struct iDineApp: App {
    @StateObject var order = Order()
    
    var body: some Scene {
        WindowGroup {
            MainView()
                .environmentObject(order)
        }
    }
}
