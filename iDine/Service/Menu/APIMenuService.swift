//
//  APIMenuService.swift
//  iDine
//
//  Created by Pintween on 2023/09/05.
//

import Foundation
import Alamofire

class APIMenuService: ApiService, MenuService {
    let headers: HTTPHeaders = [
        "Authorization": "Bearer " + "someToken",
    ]
    
    func getMenu(completion: @escaping MenuResult) {
//        get(at: .menu, headers: headers).responseData { response in
//            switch response.result {
//            case .success(let data):
//                do {
//                    let menu = try JSONDecoder().decode(MenuResponse.self, from: data)
//                    completion(menu.result, nil)
//                } catch {
//                    print("Decode error on getMenu: \(error.localizedDescription)")
//                    completion(nil, ApiError.decodingError)
//                }
//            case .failure(let error):
//                print("Error on getMenu: \(error.localizedDescription)")
//                completion(nil, ApiError.domainError)
//            }
//        }
        
        let menu = Bundle.main.decode([MenuSection].self, from: "menu.json")
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            completion(menu, nil)
        }
    }
    
    
}

//struct MenuResponse: Decodable {
//    var result: [MenuSection]
//}
