//
//  HistoryCollectionViewCell.swift
//  ProfilePageCombine
//
//  Created by Павел Кай on 29.11.2022.
//

import UIKit

class HistoryCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "HistoryCollectionViewCell"
    
    private lazy var horizontalDivier: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        return view
    }()
    
    private lazy var image: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "pizza")
        image.contentMode = .scaleAspectFit
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private lazy var title: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14)
        label.text = "Пицца мазурбек"
        label.numberOfLines = 1
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var date: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14, weight: .semibold)
        label.text = "21.11.2022 0:23"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var price: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 16, weight: .semibold)
        label.text = "299 руб."
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var nameAndDateStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [title, date])
        stackView.alignment = .fill
        stackView.spacing = 0
        stackView.axis = .vertical
        stackView.distribution = .fill
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    lazy var priceStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [horizontalDivier, price])
        stackView.alignment = .center
        stackView.spacing = 10
        stackView.axis = .horizontal
        stackView.distribution = .fillProportionally
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(image)
        
        contentView.addSubview(nameAndDateStackView)
        contentView.addSubview(priceStackView)
        
        contentView.backgroundColor = .systemGray6
        contentView.layer.cornerRadius = 15
        setConstraints()
    }
    
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension HistoryCollectionViewCell {
    func setConstraints() {
        NSLayoutConstraint.activate([
            image.widthAnchor.constraint(equalToConstant: 50),
            image.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -6),
            image.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 6),
            image.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12),
            
            nameAndDateStackView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            
            nameAndDateStackView.leadingAnchor.constraint(equalTo: image.trailingAnchor, constant: 10),
            nameAndDateStackView.trailingAnchor.constraint(equalTo: priceStackView.leadingAnchor, constant: -5),

            priceStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8),
            priceStackView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            
            horizontalDivier.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 15),
            horizontalDivier.widthAnchor.constraint(equalToConstant: 1),
            horizontalDivier.trailingAnchor.constraint(equalTo: price.leadingAnchor, constant: -10),
            
        ])
    }
}
