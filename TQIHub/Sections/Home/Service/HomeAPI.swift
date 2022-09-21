//
//  HomeAPI.swift
//  TQIHub
//
//  Created by Victor Alves de Freitas on 20/09/22.
//

import VFNetwork

enum HomeAPI {
    case home
}

extension HomeAPI: APIBuilder {
    var path: URLPath {
        switch self {
        case .home:
            return .plain("home")
        }
    }
    
    var httpMethod: HTTPMethods {
        .get
    }
    
    var headers: HTTPHeader {
        .empty
    }
    
    var task: HTTPTask {
        .request
    }
}
