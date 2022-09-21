//
//  DetailView.swift
//  TQIHub
//
//  Created by Victor Alves de Freitas on 20/09/22.
//

import UICodeKit

class DetailView: BaseView {
    
    // MARK: Actions
    
    var backTapped: (() -> Void)?
    
    // MARK: Views
    
    lazy var titleLabel = UILabel() .. {
        $0.text = "Titulo"
        $0.font = .systemFont(ofSize: 32, weight: .heavy)
        $0.textColor = .black
        $0.numberOfLines = 0
    }
    
    lazy var descriptionLabel = UILabel() .. {
        $0.text = "Descricao"
        $0.font = .systemFont(ofSize: 22, weight: .regular)
        $0.textColor = .black
        $0.numberOfLines = 0
    }
    
    lazy var subscribeButton = UIButton() .. {
        $0.setTitle("Inscrever-se", for: .normal)
        $0.backgroundColor = .systemBlue
        $0.height(48)
        $0.layer.cornerRadius = 24
    }
    
    lazy var backButton = UIButton() .. {
        $0.setTitle("Voltar", for: .normal)
        $0.backgroundColor = .systemGreen
        $0.height(48)
        $0.layer.cornerRadius = 24
        
        $0.addTarget(self, action: #selector(backButtonTapped), for: .touchUpInside)
    }
    
    override func body() -> UICodeView? {
        UIStack(axis: .vertical) {
            titleLabel
            descriptionLabel
            UISpacer()
            UISeparator()
            subscribeButton
            backButton
        }
        .padding(.horizontal(16))
    }
    
    @objc func backButtonTapped() {
        backTapped?()
    }
}
