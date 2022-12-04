//
//  ProductItemViewController.swift
//  DedaPizza
//
//  Created by Павел Кай on 03.12.2022.
//

import UIKit

class ProductItemViewController: UIViewController {

    lazy var itemImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "pizza")
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    lazy var itemTitle: UILabel = {
        let label = UILabel()
        label.text = "Итальянская пицца"
        label.font = .systemFont(ofSize: 32, weight: .bold)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var itemDescription: UILabel = {
        let label = UILabel()
        label.text = "мука, дрожжи сухие, вода, масло подсолнечное, соль, сахар, сыр твёрдый, колбаса, помидоры, кетчуп, перец болгарский красный, масло сливочное, лук зелёный лол лол лол лол лол лол лол лол лол лол лол лоллол лол лоллол лол лоллол лол лоллол лол лоллол лол лоллол лол лол"
        label.textColor = .systemGray
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var itemPrice: UILabel = {
        let label = UILabel()
        label.text = "399 руб.\nза шт."
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 24, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var addToCartBtn: UIButton = {
        let btn = UIButton()
        btn.setTitle("Добавить в корзину", for: .normal)
        btn.backgroundColor = .systemGreen
        btn.layer.cornerRadius = 5
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    
    lazy var roundedBackgound: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .systemGray6
        view.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        view.layer.cornerRadius = 30
        return view
    }()

    lazy var mainStackView: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [itemTitle, itemDescription, priceAndBtnStackView])
        stack.distribution = .fill
        stack.axis = .vertical
        stack.alignment = .fill
        stack.spacing = 20
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    lazy var priceAndBtnStackView: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [itemPrice, addToCartBtn])
        stack.distribution = .fill
        stack.axis = .horizontal
        stack.alignment = .center
        stack.spacing = 5
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(itemImage)
        view.addSubview(roundedBackgound)
        roundedBackgound.addSubview(mainStackView)

        view.backgroundColor = .systemBackground
        setConstraints()
    }


}

extension ProductItemViewController {
    
    func setConstraints() {
        NSLayoutConstraint.activate([
            itemImage.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: -25),
            itemImage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            itemImage.heightAnchor.constraint(equalToConstant: 270),
            itemImage.widthAnchor.constraint(equalToConstant: 270),
            
            mainStackView.topAnchor.constraint(equalTo: roundedBackgound.topAnchor, constant: 18),
            mainStackView.leadingAnchor.constraint(equalTo: roundedBackgound.leadingAnchor, constant: 24),
            mainStackView.trailingAnchor.constraint(equalTo: roundedBackgound.trailingAnchor, constant: -24),
            
            addToCartBtn.widthAnchor.constraint(equalToConstant: 200),
            addToCartBtn.heightAnchor.constraint(equalToConstant: 44),
            
            roundedBackgound.topAnchor.constraint(equalTo: itemImage.bottomAnchor, constant: 25),
            roundedBackgound.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            roundedBackgound.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            roundedBackgound.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
        ])
    }
    
}
