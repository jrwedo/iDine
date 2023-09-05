//
//  ApiService.swift
//  iDine
//
//  Created by Pintween on 2023/09/05.
//

import Alamofire

class ApiService {
    
    init(environment: ApiEnvironment) {
        self.environment = environment
    }
    
    var environment: ApiEnvironment
    
    func get(at route: ApiRoute, headers: HTTPHeaders, params: Parameters = [:]) -> DataRequest {
        return request(at: route, method: .get, headers: headers, params: params, encoding: URLEncoding.default)
    }
    
    
    
    func request(at route: ApiRoute, method: HTTPMethod, headers: HTTPHeaders, params: Parameters = [:], encoding: ParameterEncoding) -> DataRequest {
        let url = route.url(for: environment)
        return AF
            .request(url, method: method, parameters: params, encoding: encoding, headers: headers)
            .validate()
    }
}
