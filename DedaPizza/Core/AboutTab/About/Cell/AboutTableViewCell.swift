//
//  AboutTableViewCell.swift
//  DedaPizza
//
//  Created by Павел Кай on 03.12.2022.
//

import UIKit

final class AboutTableViewCell: UITableViewCell {
    
    static let identifier = "AboutTableViewCell"
    
    private lazy var text: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Hello world!"
        return label
    }()
    
    private lazy var icon: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.tintColor = .white
        image.image = UIImage(systemName: "gear.circle")
        return image
    }()
    
    private lazy var accessoryIcon: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.tintColor = .white
        image.image = UIImage(systemName: "chevron.right")
        return image
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.addSubview(icon)
        contentView.addSubview(text)
        contentView.addSubview(accessoryIcon)
       
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func configure(with model: String, image: UIImage) {
        text.text = model
        icon.image = image
    }
    
}

extension AboutTableViewCell {
    func setConstraints() {
        NSLayoutConstraint.activate([
            icon.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            icon.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            icon.heightAnchor.constraint(equalToConstant: 20),
            icon.widthAnchor.constraint(equalToConstant: 20),
            
            text.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            text.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            
            accessoryIcon.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            accessoryIcon.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            accessoryIcon.heightAnchor.constraint(equalToConstant: 20),
            accessoryIcon.widthAnchor.constraint(equalToConstant: 20),
        ])
    }
}

