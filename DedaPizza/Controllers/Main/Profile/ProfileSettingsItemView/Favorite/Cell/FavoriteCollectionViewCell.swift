//
//  FavoriteCollectionViewCell.swift
//  ProfilePageCombine
//
//  Created by Павел Кай on 03.12.2022.
//

import UIKit

class FavoriteCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "FavoriteCollectionViewCell"
    
    private var isTapFavoriteIcon = false
    
    lazy var itemImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "pizz")
        image.contentMode = .scaleAspectFit
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    lazy var itemTitle: UILabel = {
        let label = UILabel()
        label.text = "Итальянская пицца"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var itemPrice: UILabel = {
        let label = UILabel()
        label.text = "92 руб."
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var horizontalDivier: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        return view
    }()
    
    lazy var itemFavoriteIcon: UIImageView = {
        let image = UIImageView()
        image.isUserInteractionEnabled = true
        image.image = UIImage(systemName: "heart.fill")?.withTintColor(.white, renderingMode: .alwaysOriginal)
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    lazy var contentStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [itemImage, priceStackView, horizontalDivier, itemFavoriteIcon])
        stackView.alignment = .center
        stackView.spacing = 10
        stackView.axis = .horizontal
        stackView.distribution = .fill
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    lazy var priceStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [itemTitle, itemPrice])
        stackView.alignment = .center
        stackView.spacing = 5
        stackView.axis = .vertical
        stackView.distribution = .fillProportionally
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.addSubview(contentStackView)
        
        contentView.layer.cornerRadius = 15
        contentView.backgroundColor = .systemGray6
        
        setTargets()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setTargets() {
        let favoriteIconGesture = UITapGestureRecognizer(target: self, action: #selector(didTapFavoriteIcon))
        itemFavoriteIcon.addGestureRecognizer(favoriteIconGesture)
    }
    
}

extension FavoriteCollectionViewCell {
    
    @objc func didTapFavoriteIcon() {
        isTapFavoriteIcon.toggle()
        itemFavoriteIcon.image = isTapFavoriteIcon ? .init(systemName: "heart")?.withTintColor(.white, renderingMode: .alwaysOriginal) : .init(systemName: "heart.fill")?.withTintColor(.white, renderingMode: .alwaysOriginal)
    }
    
}

extension FavoriteCollectionViewCell {
    func setConstraints() {
        NSLayoutConstraint.activate([
            contentStackView.topAnchor.constraint(equalTo: contentView.topAnchor),
            contentStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            contentStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            contentStackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            
            itemImage.heightAnchor.constraint(equalToConstant: 50),
            itemImage.widthAnchor.constraint(equalToConstant: 50),
            
            horizontalDivier.widthAnchor.constraint(equalToConstant: 1),
            horizontalDivier.heightAnchor.constraint(equalTo: contentView.heightAnchor, multiplier: 0.8),
            
            itemFavoriteIcon.heightAnchor.constraint(equalToConstant: 25),
            itemFavoriteIcon.widthAnchor.constraint(equalToConstant: 28),
            
        ])
    }
}
