//
//  ApiRoute.swift
//  iDine
//
//  Created by Pintween on 2023/09/05.
//

import Foundation


enum ApiRoute { case
    menu
    
    var path: String {
        switch self {
        case .menu: return "menu"
        }
    }
    
    func url(for environment: ApiEnvironment) -> String {
        return "\(environment.url)/\(path)"
    }
}
