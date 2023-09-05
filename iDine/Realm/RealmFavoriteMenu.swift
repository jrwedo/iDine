//
//  RealmFavoriteMenu.swift
//  iDine
//
//  Created by Pintween on 2023/09/05.
//

import Foundation
import RealmSwift

class RealmFavoriteMenu: Object, Identifiable {
    @objc dynamic var name = ""
    @objc dynamic var isFavorite = false
    
    override class func primaryKey() -> String? {
        return "name"
    }
}
