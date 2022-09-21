//
//  DetailController.swift
//  TQIHub
//
//  Created by Victor Alves de Freitas on 20/09/22.
//

import UIKit

class DetailController: UIViewController {
    
    // MARK: RootView
    
    let rootView = DetailView()
    override func loadView() {
        view = rootView
    }
    
    // MARK: Properties
    
    var viewModel: DetailViewModel
    
    // MARK: Initializer
    
    init(viewModel: DetailViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupData()
        registerActions()
    }
    
    func setupData() {
        rootView.titleLabel.text = viewModel.model.title
        rootView.descriptionLabel.text = viewModel.model.description
    }
    
    func registerActions() {
        rootView.backTapped = {
            self.backButtonTapped()
        }
    }
    
    // MARK: Actions
    
    func backButtonTapped() {
        navigationController?.popViewController(animated: true)
    }
}
