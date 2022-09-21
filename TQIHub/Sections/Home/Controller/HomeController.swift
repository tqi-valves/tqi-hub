//
//  HomeController.swift
//  TQIHub
//
//  Created by Victor Alves de Freitas on 19/09/22.
//

import Foundation
import UIKit

class HomeController: UIViewController {
    
    // MARK: RootView
    
    let rootView = HomeView()
    override func loadView() {
        view = rootView
    }
    
    // MARK: Properties
    
    var viewModel: HomeViewModel
    
    // MARK: Intitializer
    
    init(viewModel: HomeViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
        self.viewModel.delegate = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Seu HUB"
        registerActions()
        fetchHome()
    }
    
    // MARK: Actions
    
    func registerActions() {
        rootView.componentTapped = {
            self.componentTapped($0)
        }
    }
    
    func componentTapped(_ component: HomeComponentAction) {
        var detail = DetailModel()
        
        switch component {
        case let .collection(homeCollectionItem):
            detail.title = homeCollectionItem.title
            detail.description = homeCollectionItem.description
        case let .table(homeTableItem):
            detail.title = homeTableItem.title
            detail.description = homeTableItem.description
        }
        
        let detailController = DetailController(viewModel: .init(model: detail))
        navigationController?.pushViewController(detailController, animated: true)
    }
    
    func fetchHome() {
        viewModel.fetchHome()
    }
}

extension HomeController: HomeViewModelDelegate {
    func homeViewModelSuccess(_ viewModel: HomeViewModel) {
        rootView.model = viewModel.model
        rootView.reloadComponents(model: viewModel.model)
    }
    
    func homeViewModelFailure(_ viewModel: HomeViewModel) {}
}
