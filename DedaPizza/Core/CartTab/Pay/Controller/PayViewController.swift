//
//  PayViewController.swift
//  DedaPizza
//
//  Created by Павел Кай on 04.12.2022.
//

import UIKit

class PayViewController: UIViewController {
    
    lazy var adressTextfield: CustomTextField = CustomTextField(placeholder: "Адресс", leftIcon: UIImage(systemName: "mappin.and.ellipse")!.withTintColor(.white, renderingMode: .alwaysOriginal), rightIcon: UIImage(systemName: "map.fill")?.withTintColor(.white, renderingMode: .alwaysOriginal))
    
    lazy var payTitle: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 20, weight: .bold)
        label.text = "Выберите метод оплаты"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var cardBackgound: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.borderColor = UIColor.white.cgColor
        view.layer.borderWidth = 1
        view.layer.cornerRadius = 15
        view.backgroundColor = .systemGray6
        return view
    }()
    
    lazy var cardIcon: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(systemName: "creditcard.fill")?.withTintColor(.white, renderingMode: .alwaysOriginal)
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    lazy var phoneBackgound: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.borderColor = UIColor.white.cgColor
        view.layer.borderWidth = 1
        view.layer.cornerRadius = 15
        view.backgroundColor = .systemGray6
        return view
    }()
    
    lazy var phoneIcon: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(systemName: "candybarphone")?.withTintColor(.white, renderingMode: .alwaysOriginal)
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    lazy var addBackgound: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.borderColor = UIColor.white.cgColor
        view.layer.borderWidth = 1
        view.layer.cornerRadius = 15
        view.backgroundColor = .systemGray6
        return view
    }()
    
    lazy var addIcon: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(systemName: "plus.circle")?.withTintColor(.white, renderingMode: .alwaysOriginal)
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    lazy var stackView: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [adressTextfield, payTitle, payStackView])
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.alignment = .fill
        stack.distribution = .fill
        stack.spacing = 35
        stack.axis = .vertical
        return stack
    }()
    
    lazy var payStackView: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [cardBackgound, phoneBackgound])
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.alignment = .center
        stack.distribution = .equalSpacing
        stack.spacing = 35
        stack.axis = .horizontal
        return stack
    }()
    
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        
        layout.itemSize = CGSize(width: 290, height: 115)
        layout.minimumLineSpacing = 20
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.register(PayItemCollectionViewCell.self, forCellWithReuseIdentifier: PayItemCollectionViewCell.identifier)
        collection.translatesAutoresizingMaskIntoConstraints = false
        return collection
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        cardBackgound.addSubview(cardIcon)
        phoneBackgound.addSubview(phoneIcon)
        addBackgound.addSubview(addIcon)
        
        view.addSubview(addBackgound)

        view.addSubview(stackView)
        view.addSubview(collectionView)
        view.backgroundColor = .systemBackground
        
        setDelegates()
        setConstraints()
    }
    
    private func setDelegates() {
        collectionView.delegate = self
        collectionView.dataSource = self
    }

}

extension PayViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        2
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PayItemCollectionViewCell.identifier, for: indexPath) as? PayItemCollectionViewCell else { return UICollectionViewCell() }
        
        return cell
    }
    
    
}

extension PayViewController: UICollectionViewDelegate {
    
}

extension PayViewController {
    
    func setConstraints() {
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            
            adressTextfield.heightAnchor.constraint(equalToConstant: 45),
            
            cardBackgound.heightAnchor.constraint(equalToConstant: 100),
            cardBackgound.widthAnchor.constraint(equalToConstant: 100),
            
            cardIcon.centerXAnchor.constraint(equalTo: cardBackgound.centerXAnchor),
            cardIcon.centerYAnchor.constraint(equalTo: cardBackgound.centerYAnchor),
            cardIcon.heightAnchor.constraint(equalToConstant: 50),
            cardIcon.widthAnchor.constraint(equalToConstant: 50),
            
            phoneBackgound.heightAnchor.constraint(equalToConstant: 100),
            phoneBackgound.widthAnchor.constraint(equalToConstant: 100),
            
            phoneIcon.centerXAnchor.constraint(equalTo: phoneBackgound.centerXAnchor),
            phoneIcon.centerYAnchor.constraint(equalTo: phoneBackgound.centerYAnchor),
            phoneIcon.heightAnchor.constraint(equalToConstant: 50),
            phoneIcon.widthAnchor.constraint(equalToConstant: 50),
            
            addBackgound.topAnchor.constraint(equalTo: payStackView.bottomAnchor),
            addBackgound.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            addBackgound.heightAnchor.constraint(equalToConstant: 50),
            addBackgound.widthAnchor.constraint(equalToConstant: 50),
            
            addIcon.centerXAnchor.constraint(equalTo: addBackgound.centerXAnchor),
            addIcon.centerYAnchor.constraint(equalTo: addBackgound.centerYAnchor),
            addIcon.heightAnchor.constraint(equalToConstant: 30),
            addIcon.widthAnchor.constraint(equalToConstant: 30),
            
            collectionView.topAnchor.constraint(equalTo: addBackgound.bottomAnchor, constant: 15),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
        ])
    }
    
}
