//
//  HomeView.swift
//  TQIHub
//
//  Created by Victor Alves de Freitas on 19/09/22.
//

import UIKit
import UICodeKit

enum HomeComponentAction {
    case collection(HomeCollectionItem)
    case table(HomeTableViewItem)
}

class HomeView: BaseView {
    
    // MARK: Actions
    
    var componentTapped: ((HomeComponentAction) -> Void)?
    
    // MARK: Properties
    
    var model: HomeModel
    
    // MARK: Components
    
    var homeCollectionView: HomeCollectionView
    var homeTableView: HomeTableView
    
    // MARK: Initializer
    
    init(model: HomeModel = .init(components: .init(header: .init(), collection: .init(), table: .init()))) {
        self.model = model
        homeCollectionView = HomeCollectionView(model: model.components.collection)
        homeTableView = HomeTableView(model: model.components.table)
        super.init()
        registerComponentActions()
    }
    
    func registerComponentActions() {
        homeCollectionView.itemTapped = { [weak self] item in
            guard let self = self else { return }
            self.componentTapped?(.collection(item))
        }
        
        homeTableView.itemTapped = { [weak self] item in
            guard let self = self else { return }
            self.componentTapped?(.table(item))
        }
    }
    
    func reloadComponents(model: HomeModel) {
        self.model = model
        homeCollectionView.model = model.components.collection
        homeCollectionView.reload()
        
        homeTableView.model = model.components.table
        homeTableView.reload()
        
        titleLabel.text = model.components.header.title
        subtitleLabel.text = model.components.header.subtitle
    }
    
    // MARK: Header View
    
    lazy var titleLabel = UILabel() .. {
        $0.text = "-"
        $0.font = .systemFont(ofSize: 32, weight: .heavy)
        $0.textColor = .white
        $0.height(50)
    }
    
    lazy var subtitleLabel = UILabel() .. {
        $0.text = "-"
        $0.font = .systemFont(ofSize: 22, weight: .bold)
        $0.textColor = .white
        $0.height(30)
    }
    
    lazy var headerStack = UIStack(axis: .vertical, spacing: 4) {
        UIStack(axis: .vertical) {
            titleLabel
            subtitleLabel
        }
        
        UISpacer()
    }.padding(.top(16), .horizontal(24)) .. {
        $0.backgroundColor = .systemBlue
        $0.height(140)
    }
    
    lazy var collectionComponent = UIStack(axis: .horizontal) {
        homeCollectionView
    } .. {
        $0.height(100)
    }
    
    var indicator = UIActivityIndicatorView() .. {
        $0.style = .large
        $0.size(.init(width: 40, height: 40))
    }
    
    // MARK: Body
    
    override func body() -> UICodeView? {
        UIStack(axis: .vertical, spacing: 0) {
            headerStack
            UISeparator()
            collectionComponent
            UISeparator()
            homeTableView
        }
    }
}

//struct HomeView_Previews: PreviewProvider {
//    static var previews: some View {
//        HomeController().toPreview()
//    }
//}


