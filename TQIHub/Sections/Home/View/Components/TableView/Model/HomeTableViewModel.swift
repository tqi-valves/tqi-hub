//
//  HomeTableViewModel.swift
//  TQIHub
//
//  Created by Victor Alves de Freitas on 20/09/22.
//

import Foundation

struct HomeTableViewModel: Codable {
    var items: [HomeTableViewItem]?
}

struct HomeTableViewItem: Codable {
    var title: String?
    var description: String?
    var rating: String?
}
