//
//  PromoTableViewCell.swift
//  DedaPizza
//
//  Created by Павел Кай on 30.10.2022.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    
    static let identifier = "CollectionViewCell"
    
    private let promoBanner: UIImageView = {
        let image = UIImageView(image: UIImage(named: "banner"))
        image.contentMode = .scaleToFill
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private let promoTitle: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "AvenirNext-Medium", size: 18)
        label.text = "Пицца в подарок!"
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let promoSubtitle: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "AvenirNext-Regular", size: 12)
        label.text = "Купите две пиццы и получите третью в подарок!"
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.backgroundColor = UIColor(red: 0.183, green: 0.183, blue: 0.183, alpha: 1)
        
        contentView.addSubview(promoBanner)
        contentView.addSubview(promoTitle)
        contentView.addSubview(promoSubtitle)
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension CollectionViewCell {
    func setConstraints() {
        NSLayoutConstraint.activate([
            promoBanner.topAnchor.constraint(equalTo: contentView.topAnchor),
            promoBanner.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            promoBanner.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            promoBanner.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -50),
            
            promoTitle.topAnchor.constraint(equalTo: promoBanner.bottomAnchor, constant: 5),
            promoTitle.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15),
            promoTitle.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -15),
            
            promoSubtitle.topAnchor.constraint(equalTo: promoTitle.bottomAnchor),
            promoSubtitle.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15),
            promoSubtitle.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -15),
            
        ])
    }
}
