//
//  ProfileView.swift
//  ProfilePageCombine
//
//  Created by Павел Кай on 14.11.2022.
//

import UIKit

final class ProfileView: UIView {
    
    lazy var tableView: UITableView = {
        let table = UITableView(frame: .zero, style: .grouped)
        table.isScrollEnabled = false
        
        table.separatorInset = UIEdgeInsets(top: 13, left: 13, bottom: 13, right: 13)
        table.rowHeight = 55
        table.separatorColor = .white
        
        table.layer.cornerRadius = 15
        table.layer.borderWidth = 2
        table.layer.borderColor = UIColor.white.cgColor
        
        table.register(SettingsTableViewCell.self, forCellReuseIdentifier: SettingsTableViewCell.identifier)
        table.translatesAutoresizingMaskIntoConstraints = false
        return table
    }()
    
    lazy var profileIcon: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(systemName: "person.circle")
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()

    init() {
        super.init(frame: .zero)
        
        addSubview(profileIcon)
        addSubview(tableView)
        setConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

//MARK: Constraints
extension ProfileView {
    func setConstraints() {
        NSLayoutConstraint.activate([
            profileIcon.topAnchor.constraint(equalTo: topAnchor, constant: 68),
            profileIcon.centerXAnchor.constraint(equalTo: centerXAnchor),
            profileIcon.heightAnchor.constraint(equalToConstant: 105),
            profileIcon.widthAnchor.constraint(equalToConstant: 105),
            
            tableView.topAnchor.constraint(equalTo: profileIcon.bottomAnchor, constant: 66),
            tableView.centerXAnchor.constraint(equalTo: centerXAnchor),
            tableView.widthAnchor.constraint(equalToConstant: 305),
            tableView.heightAnchor.constraint(equalToConstant: 385),
        ])
    }
}
