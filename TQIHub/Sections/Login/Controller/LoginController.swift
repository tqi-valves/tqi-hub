//
//  ViewController.swift
//  TQIHub
//
//  Created by Victor Alves de Freitas on 18/09/22.
//

import UIKit

class LoginController: UIViewController {

    // MARK: Base View
    
    let rootView = LoginView()
    override func loadView() {
        view = rootView
    }
    
    // MARK: Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerActions()
    }
    
    func registerActions() {
        rootView.loginTapped = {
            self.loginTapped()
        }
    }
    
    func loginTapped() {
        let model = HomeModel(components: .init(header: .init(), collection: .init(), table: .init()))
        let homeController = HomeController(viewModel: .init(model: model))
        navigationController?.pushViewController(homeController, animated: true)
    }
}

