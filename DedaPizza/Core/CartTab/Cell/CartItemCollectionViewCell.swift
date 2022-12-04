//
//  CartItemCollectionViewCell.swift
//  DedaPizza
//
//  Created by Павел Кай on 04.12.2022.
//

import UIKit

class CartItemCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "CartItemCollectionViewCell"
    
    lazy var itemImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "pizza")
        image.contentMode = .scaleAspectFit
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    lazy var itemTitle: UILabel = {
        let label = UILabel()
        label.text = "Итальнская пицца"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var itemDescription: UILabel = {
        let label = UILabel()
        label.text = "мука, дрожжи сухие, вода, масло подсолнечное, соль, сахар, сыр твёрдый, колбаса, помидоры, кетчуп, перец болгарский красный, масло сливочное, лук зелёный"
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 10)
        label.textColor = .systemGray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var itemPrice: UILabel = {
        let label = UILabel()
        label.text = "92 руб."
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var mainBackgound: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .systemGray6
        view.layer.cornerRadius = 15
        return view
    }()
    
    lazy var switchBackgound: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .systemGray6
        view.layer.cornerRadius = 15
        return view
    }()
    
    lazy var itemQuantity: UILabel = {
        let label = UILabel()
        label.text = "1"
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 20, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var plusBtn: UIButton = {
        let btn = UIButton()
        btn.setImage(UIImage(systemName: "plus.circle")?.withTintColor(.white, renderingMode: .alwaysOriginal), for: .normal)
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    
    lazy var minusBtn: UIButton = {
        let btn = UIButton()
        btn.setImage(UIImage(systemName: "minus.circle")?.withTintColor(.white, renderingMode: .alwaysOriginal), for: .normal)
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    
    lazy var mainStackView: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [itemImage, stackView, itemPrice])
        stack.distribution = .fill
        stack.alignment = .center
        stack.axis = .horizontal
        stack.spacing = 15
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    lazy var stackView: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [itemTitle, itemDescription])
        stack.distribution = .fill
        stack.alignment = .fill
        stack.axis = .vertical
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    lazy var switchStackView: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [plusBtn, itemQuantity, minusBtn])
        stack.distribution = .fill
        stack.alignment = .fill
        stack.spacing = 1
        stack.axis = .vertical
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    lazy var closeBtn: UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setImage(UIImage(systemName: "xmark.circle")?.withTintColor(.white, renderingMode: .alwaysOriginal), for: .normal)
        return btn
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        mainBackgound.addSubview(mainStackView)
        contentView.addSubview(mainBackgound)
        
        mainBackgound.addSubview(closeBtn)
        
        switchBackgound.addSubview(switchStackView)
        contentView.addSubview(switchBackgound)
                
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension CartItemCollectionViewCell {
    
    func setConstraints() {
        NSLayoutConstraint.activate([
            mainStackView.topAnchor.constraint(equalTo: mainBackgound.topAnchor, constant: 5),
            mainStackView.leadingAnchor.constraint(equalTo: mainBackgound.leadingAnchor, constant: 12),
            mainStackView.bottomAnchor.constraint(equalTo: mainBackgound.bottomAnchor, constant: -5),
            mainStackView.trailingAnchor.constraint(equalTo: switchStackView.leadingAnchor, constant: -12),
            
            switchStackView.topAnchor.constraint(equalTo: switchBackgound.topAnchor, constant: 3),
            switchStackView.centerXAnchor.constraint(equalTo: switchBackgound.centerXAnchor),
            switchStackView.bottomAnchor.constraint(equalTo: switchBackgound.bottomAnchor, constant: -3),
            
            mainBackgound.topAnchor.constraint(equalTo: contentView.topAnchor),
            mainBackgound.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            mainBackgound.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            mainBackgound.trailingAnchor.constraint(equalTo: switchBackgound.leadingAnchor, constant: -5),
            
            switchBackgound.topAnchor.constraint(equalTo: contentView.topAnchor),
            switchBackgound.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            switchBackgound.widthAnchor.constraint(equalToConstant: 40),
            switchBackgound.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            
            itemImage.widthAnchor.constraint(equalToConstant: 45),
            itemImage.heightAnchor.constraint(equalToConstant: 45),
            
            closeBtn.topAnchor.constraint(equalTo: mainBackgound.topAnchor, constant: 3),
            closeBtn.trailingAnchor.constraint(equalTo: mainBackgound.trailingAnchor, constant: -3),
            closeBtn.widthAnchor.constraint(equalToConstant: 20),
            closeBtn.heightAnchor.constraint(equalToConstant: 20),
        ])
    }
    
}
