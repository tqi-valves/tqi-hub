//
//  HomeTableViewCell.swift
//  TQIHub
//
//  Created by Victor Alves de Freitas on 20/09/22.
//

import UIKit
import UICodeKit

class HomeTableViewCell: BaseTableViewCell {
    let titleLabel = UILabel() .. {
        $0.text = "-"
        $0.font = .systemFont(ofSize: 18, weight: .bold)
        $0.textColor = .darkText
    }
    
    let descriptionLabel = UILabel() .. {
        $0.text = "-"
        $0.font = .systemFont(ofSize: 14)
        $0.textColor = .lightGray
        $0.numberOfLines = 2
    }
    
    func setup(model: HomeTableViewItem) {
        titleLabel.text = model.title
        descriptionLabel.text = model.description
    }
    
    override func body() -> UICodeView? {
        UIStack(axis: .vertical, spacing: 0) {
            titleLabel
            descriptionLabel
        }
        .padding(.vertical(16), .left(16), .right(24))
    }
    
    override func configureSubviews() {
        super.configureSubviews()
        accessoryType = .disclosureIndicator
        selectionStyle = .none
    }
}
