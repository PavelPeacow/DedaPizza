//
//  AboutView.swift
//  DedaPizza
//
//  Created by Павел Кай on 03.12.2022.
//

import UIKit

class AboutView: UIView {

    lazy var tableView: UITableView = {
        let table = UITableView(frame: .zero, style: .grouped)
        table.isScrollEnabled = false
        
        table.separatorInset = UIEdgeInsets(top: 13, left: 13, bottom: 13, right: 13)
        table.rowHeight = 55
        table.separatorColor = .white
        
        table.layer.cornerRadius = 15
        table.layer.borderWidth = 2
        table.layer.borderColor = UIColor.white.cgColor
        
        table.register(AboutTableViewCell.self, forCellReuseIdentifier: AboutTableViewCell.identifier)
        table.translatesAutoresizingMaskIntoConstraints = false
        return table
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(tableView)
        backgroundColor = .systemBackground
        
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension AboutView {
    func setConstraints() {
        NSLayoutConstraint.activate([
            tableView.centerXAnchor.constraint(equalTo: centerXAnchor),
            tableView.centerYAnchor.constraint(equalTo: centerYAnchor),
            tableView.widthAnchor.constraint(equalToConstant: 305),
            tableView.heightAnchor.constraint(equalToConstant: tableView.rowHeight * 4),
        ])
    }
}
