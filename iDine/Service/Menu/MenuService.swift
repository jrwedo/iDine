//
//  MenuService.swift
//  iDine
//
//  Created by Pintween on 2023/09/05.
//

import Foundation

typealias MenuResult = (_ menu: [MenuSection]?, _ error: Error?) -> ()

protocol MenuService: AnyObject {
    func getMenu(completion: @escaping MenuResult)
}
