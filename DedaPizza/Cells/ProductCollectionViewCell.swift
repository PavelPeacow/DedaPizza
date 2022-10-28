//
//  ProductCollectionViewCell.swift
//  DedaPizza
//
//  Created by Павел Кай on 28.10.2022.
//

import UIKit

class ProductCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "ProductCollectionViewCell"
    
    private let productImage: UIImageView = {
        let image = UIImageView(image: UIImage(named: "pizza"))
        image.contentMode = .scaleToFill
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private let productTitle: UILabel = {
        let label = UILabel()
        label.numberOfLines = 1
        label.font = UIFont(name: "AvenirNext-DemiBoldItalic", size: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Итальянская пицца"
        return label
    }()
    
    private let productSubtitle: UILabel = {
         let label = UILabel()
        label.numberOfLines = 0
        label.font = UIFont(name: "AvenirNext-Regular", size: 14)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "мука, дрожжи сухие, вода, масло подсолнечное, соль, сахар, сыр твёрдый, колбаса, помидоры, кетчуп, перец болгарский красный, масло сливочное, лук зелёный"
        return label
    }()
    
    private let productPrice: UILabel = {
         let label = UILabel()
        label.numberOfLines = 0
        label.font = UIFont(name: "AvenirNext-Italic", size: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "399\nза шт."
        return label
    }()
    
    private let productAddBtn: UIButton = {
        var config = UIButton.Configuration.bordered()
        config.baseBackgroundColor = UIColor(red: 0.033, green: 0.567, blue: 0.054, alpha: 1)
        config.baseForegroundColor = .black
        
        let btn = UIButton(configuration: config)
        btn.layer.cornerRadius = 35
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setTitle("Добавить", for: .normal)
        return btn
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.backgroundColor = UIColor(red: 0.183, green: 0.183, blue: 0.183, alpha: 1)
        contentView.addSubview(productTitle)
        contentView.addSubview(productImage)
        contentView.addSubview(productSubtitle)
        contentView.addSubview(productPrice)
        contentView.addSubview(productAddBtn)
        
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension ProductCollectionViewCell {
    func setConstraints() {
        NSLayoutConstraint.activate([
            productTitle.topAnchor.constraint(equalTo: contentView.topAnchor),
            productTitle.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -14),
            productTitle.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 14),
            
            productImage.topAnchor.constraint(equalTo: productTitle.bottomAnchor, constant: 8),
            productImage.widthAnchor.constraint(equalToConstant: 120),
            productImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 14),
            productImage.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -15),
            
            productSubtitle.topAnchor.constraint(equalTo: productTitle.bottomAnchor, constant: 0),
            productSubtitle.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            productSubtitle.leadingAnchor.constraint(equalTo: productImage.trailingAnchor, constant: 20),
            productSubtitle.bottomAnchor.constraint(equalTo: productAddBtn.topAnchor, constant: -10),
            
            productPrice.trailingAnchor.constraint(equalTo: productAddBtn.leadingAnchor, constant: -7),
            productPrice.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -15),
            
            productAddBtn.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -15),
            productAddBtn.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -7),
            productAddBtn.widthAnchor.constraint(equalToConstant: 110),
            productAddBtn.heightAnchor.constraint(equalToConstant: 40),
            
        ])
    }
}

