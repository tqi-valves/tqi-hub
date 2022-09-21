//
//  HomeTableView.swift
//  TQIHub
//
//  Created by Victor Alves de Freitas on 20/09/22.
//

import UIKit
import UICodeKit

class HomeTableView: BaseView {
    
    // MARK: Actions
    
    var itemTapped: ((HomeTableViewItem) -> Void)?
    
    // MARK: Properties
    
    var model: HomeTableViewModel
    
    // MARK: Views
    
    lazy var sectionLabel = UILabel() .. {
        $0.text = "Eventos"
        $0.font = .systemFont(ofSize: 18, weight: .bold)
        $0.textColor = .darkGray
        $0.backgroundColor = .white
    }
    
    // MARK: Initializer
    
    init(model: HomeTableViewModel) {
        self.model = model
        super.init()
    }
    
    // MARK: Views
    
    lazy var tableView = UITableView() .. {
        $0.register(cellClass: HomeTableViewCell.self)
        $0.separatorInset = .zero
        $0.delegate = self
        $0.dataSource = self
    }
    
    // MARK: Body
    
    override func body() -> UICodeView? {
        UIStack(axis: .vertical) {
            tableView
        }
    }
    
    // MARK: Functions
    
    func reload() {
        tableView.reloadData()
    }
}

// MARK: UITableViewDelegate

extension HomeTableView: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        UIStack(axis: .vertical) {
            sectionLabel
        }
        .padding(.horizontal(16), .vertical(8)) .. {
            $0.backgroundColor = .white
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return model.items?.count ?? 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return tableView.dequeueReusableCell(of: HomeTableViewCell.self, for: indexPath) { [weak self] cell in
            guard let self = self else { return }
            guard let item = self.model.items?[indexPath.row] else { return }
            cell.setup(model: item)
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let item = self.model.items?[indexPath.row] else { return }
        itemTapped?(item)
    }
}

