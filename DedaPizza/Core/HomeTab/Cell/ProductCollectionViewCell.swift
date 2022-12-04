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
        image.contentMode = .scaleAspectFit
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private let productTitle: UILabel = {
        let label = UILabel()
        label.numberOfLines = 1
        label.font = .systemFont(ofSize: 16, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Итальянская пицца"
        return label
    }()
    
    private let productSubtitle: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 12)
        label.textColor = .systemGray
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "мука, дрожжи сухие, вода, масло подсолнечное, соль, сахар, сыр твёрдый, колбаса, помидоры, кетчуп, перец болгарский красный, масло сливочное, лук зелёный"
        return label
    }()
    
    private let productPrice: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 14, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "399 руб.\nза шт."
        return label
    }()
    
    private let productAddBtn: UIButton = {
        let btn = UIButton()
        btn.backgroundColor = .systemGreen
        btn.layer.cornerRadius = 5
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setTitle("Добавить", for: .normal)
        return btn
    }()
        
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.layer.cornerRadius = 15
        
        contentView.backgroundColor = .systemGray6
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
            productTitle.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5),
            productTitle.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -14),
            productTitle.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 14),
            
            productImage.topAnchor.constraint(equalTo: productTitle.bottomAnchor, constant: 5),
            productImage.widthAnchor.constraint(equalToConstant: 140),
            productImage.heightAnchor.constraint(equalToConstant: 140),
            productImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 5),
            
            
            productSubtitle.topAnchor.constraint(equalTo: productTitle.bottomAnchor, constant: 0),
            productSubtitle.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            productSubtitle.leadingAnchor.constraint(equalTo: productImage.trailingAnchor, constant: 20),
            productSubtitle.bottomAnchor.constraint(equalTo: productAddBtn.topAnchor, constant: -10),
            
            productPrice.leadingAnchor.constraint(equalTo: productImage.trailingAnchor, constant: 20),
            productPrice.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -15),
            
            productAddBtn.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -15),
            productAddBtn.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -7),
            productAddBtn.widthAnchor.constraint(equalToConstant: 110),
            productAddBtn.heightAnchor.constraint(equalToConstant: 40),
            
        ])
    }
}

