//
//  HomeService.swift
//  TQIHub
//
//  Created by Victor Alves de Freitas on 20/09/22.
//

import VFNetwork

class HomeService: RequestService<HomeAPI> {
    func fetchHome(_ completion: @escaping (Result<HomeModel, Error>) -> Void) {
        execute(.home, responseType: HomeModel.self, completion: completion)
    }
}
