//
//  MenuViewModel.swift
//  iDine
//
//  Created by Pintween on 2023/09/05.
//

import Foundation
import SwiftUI

class MenuViewModel: ObservableObject {
    let realmManager = RealmLocalDBManager()
    @Published var isLoadingMenu = false
    @Published var menu: [MenuSection] = []
    
    @Published var favoriteMenu: [RealmFavoriteMenu] = []
    
    func getMenu() {
        self.isLoadingMenu = true
        APIMenuService(environment: ApiEnvironment.production).getMenu { (menu, error) in
            defer {
                self.isLoadingMenu = false
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
        }
    }
    
    func getFavoriteStatusRealm(name: String) -> Bool {
        let fetchResult = realmManager.getObject(type: RealmFavoriteMenu.self, name: name)
        guard let menu = fetchResult?.first as? RealmFavoriteMenu else {
            print("no data in realm")
            return false
        }
        
        return menu.isFavorite
    }
    
    func changeFavoriteStatusRealm(name: String, isFavorite: Bool) {
        let menu = RealmFavoriteMenu()
        menu.isFavorite = isFavorite
        menu.name = name
        realmManager.updateObject(obj: menu)
    }

    func getFavoriteMenuRealm() {
        self.favoriteMenu = realmManager.getFavoriteMenu()
    }
    
    
}
