//
//  HomeCollectionModel.swift
//  TQIHub
//
//  Created by Victor Alves de Freitas on 20/09/22.
//

import Foundation

struct HomeCollectionModel: Codable {
    var items: [HomeCollectionItem]?
}

struct HomeCollectionItem: Codable {
    var title: String?
    var description: String?
    var rating: String?
}
