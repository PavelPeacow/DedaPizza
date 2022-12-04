//
//  PayItemCollectionViewCell.swift
//  DedaPizza
//
//  Created by Павел Кай on 04.12.2022.
//

import UIKit

class PayItemCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "PaymentCollectionViewCell"
    
    lazy var cardTitle: UILabel = {
        let label = UILabel()
        label.text = "Дебетовая карта"
        label.font = .systemFont(ofSize: 10, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var cardBalance: UILabel = {
        let label = UILabel()
        label.text = "$1488.50"
        label.font = .systemFont(ofSize: 16, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var cardNumber: UILabel = {
        let label = UILabel()
        label.text = "**** **** **** 3525"
        label.font = .systemFont(ofSize: 18, weight: .semibold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var cardExpiredDate: UILabel = {
        let label = UILabel()
        label.text = "02/28"
        label.font = .systemFont(ofSize: 12, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var cardIcon: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(systemName: "creditcard.fill")?.withTintColor(.white, renderingMode: .alwaysOriginal)
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    lazy var stackView: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [cardTitle, cardBalance, cardNumber, cardExpiredDate])
        stack.axis = .vertical
        stack.spacing = 10
        stack.alignment = .fill
        stack.distribution = .fill
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.layer.cornerRadius = 15
        contentView.layer.borderWidth = 1
        contentView.layer.borderColor = UIColor.white.cgColor
        contentView.backgroundColor = .systemGray6
        contentView.addSubview(stackView)
        contentView.addSubview(cardIcon)
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension PayItemCollectionViewCell {
    func setConstraints() {
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5),
            stackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            stackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -5),
            
            cardIcon.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            cardIcon.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
        ])
    }
}
