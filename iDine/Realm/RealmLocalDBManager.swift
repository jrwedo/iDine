//
//  RealmLocalDBManager.swift
//  iDine
//
//  Created by Pintween on 2023/09/05.
//

import Foundation
import RealmSwift

class RealmLocalDBManager {
    let realm = try! Realm()
    
    func saveObject(obj: Object) {
        try! realm.write({
            realm.add(obj)
        })
    }
    
    func updateObject(obj: Object) {
        try! realm.write({
            realm.add(obj, update: .modified)
        })
    }
    
    func getObject(type: Object.Type, name: String) -> Results<Object>? {
        return realm.objects(type).filter("name = '\(name)'")
    }
    
    func getFavoriteMenu() -> [RealmFavoriteMenu] {
        return Array(realm.objects(RealmFavoriteMenu.self).filter("isFavorite = true"))
    }
}
