//
//  HomeCollectionView.swift
//  TQIHub
//
//  Created by Victor Alves de Freitas on 20/09/22.
//

import Foundation
import UICodeKit

class HomeCollectionView: BaseView {
    
    // MARK: Actions
    
    var itemTapped: ((HomeCollectionItem) -> Void)?
    
    // MARK: Properties
    
    var model: HomeCollectionModel
    
    // MARK: Initializer
    
    init(model: HomeCollectionModel) {
        self.model = model
        super.init()
    }
    
    // MARK: Properties
    
    private let layout = UICollectionViewFlowLayout() .. {
        $0.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        $0.itemSize = CGSize(width: 100, height: 60)
        $0.scrollDirection = .horizontal
    }
    
    lazy var collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout) .. {
        $0.register(cellClass: HomeCollectionViewCell.self)
        $0.delegate = self
        $0.dataSource = self
        $0.showsHorizontalScrollIndicator = false
    }
    
    lazy var headerLabel = UILabel() .. {
        $0.text = "Cursos"
        $0.font = .systemFont(ofSize: 18, weight: .bold)
        $0.textAlignment = .left
        $0.textColor = .darkGray
        $0.backgroundColor = .white
    }
        
    // MARK: Body
    
    override func body() -> UICodeView? {
        UIStack(axis: .vertical, spacing: 0) {
            UIStack(axis: .vertical) {
                headerLabel
            }
            .padding(.horizontal(16), .top(8))
            
            collectionView
        }
    }
    
    // MARK: Functions
    
    func reload() {
        collectionView.reloadData()
    }
}

// MARK: UICollectionView Delegate

extension HomeCollectionView: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        model.items?.count ?? 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        return collectionView.dequeueReusableCell(of: HomeCollectionViewCell.self, for: indexPath) { [weak self] cell in
            guard let self = self else { return }
            guard let item = self.model.items?[indexPath.row] else { return }
            cell.setup(model: item)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let item = model.items?[indexPath.row] else { return }
        itemTapped?(item)
    }
}
