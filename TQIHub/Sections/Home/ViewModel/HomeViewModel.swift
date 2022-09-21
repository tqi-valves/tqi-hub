//
//  HomeViewModel.swift
//  TQIHub
//
//  Created by Victor Alves de Freitas on 20/09/22.
//

import Foundation

protocol HomeViewModelDelegate: AnyObject {
    func homeViewModelSuccess(_ viewModel: HomeViewModel)
    func homeViewModelFailure(_ viewModel: HomeViewModel)
}

class HomeViewModel {
    
    // MARK: Properties
    
    var model: HomeModel
    var service: HomeService
    weak var delegate: HomeViewModelDelegate?
    
    // MARK: Initializer
    
    init(model: HomeModel) {
        self.model = model
        self.service = .init()
    }
    
    // MARK: Functions
    
    func fetchHome() {
        service.fetchHome { result in
            switch result {
            case let .success(model):
                self.model = model
                self.delegate?.homeViewModelSuccess(self)
            case let .failure(error):
                print(error)
                self.delegate?.homeViewModelFailure(self)
            }
        }
    }
}
