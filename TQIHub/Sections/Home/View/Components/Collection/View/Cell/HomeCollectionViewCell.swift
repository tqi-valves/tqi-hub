//
//  HomeCollectionViewCell.swift
//  TQIHub
//
//  Created by Victor Alves de Freitas on 20/09/22.
//

import UIKit
import UICodeKit

class HomeCollectionViewCell: BaseCollectionViewCell {
    let label = UILabel() .. {
        $0.text  = "-"
        $0.backgroundColor = .systemIndigo
        $0.font = .systemFont(ofSize: 18, weight: .heavy)
        $0.textColor = .white
        $0.layer.cornerRadius = 22
        $0.layer.masksToBounds = true
        $0.textAlignment = .center
    }
    
    func setup(model: HomeCollectionItem) {
        label.text = model.title
    }
    
    override func body() -> UICodeView? {
        UIStack(axis: .vertical) {
            UIStack(axis: .vertical) {
                label
            }
            .padding(.vertical(8))
        }
    }
}

