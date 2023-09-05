//
//  ApiEnvironment.swift
//  iDine
//
//  Created by Pintween on 2023/09/05.
//

import Foundation

enum ApiEnvironment: String {
    case production = "http://someUrl.com"
    
    var url: String {
        return rawValue
    }
}
