//
//  HomeModel.swift
//  TQIHub
//
//  Created by Victor Alves de Freitas on 20/09/22.
//

import VFNetwork

struct HomeModel: VCodable {
    var components: HomeComponent
}

struct HomeComponent: Codable {
    var header: HomeHeaderComponent
    var collection: HomeCollectionModel
    var table: HomeTableViewModel
}

struct HomeHeaderComponent: Codable {
    var title: String?
    var username: String?
    var subtitle: String?
}
