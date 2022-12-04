//
//  CartViewController.swift
//  DedaPizza
//
//  Created by Павел Кай on 28.10.2022.
//

import UIKit

class CartViewController: UIViewController {
    
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        
        layout.itemSize = CGSize(width: 350, height: 70)
        
        let collecion = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collecion.register(CartItemCollectionViewCell.self, forCellWithReuseIdentifier: CartItemCollectionViewCell.identifier)
        collecion.translatesAutoresizingMaskIntoConstraints = false
        return collecion
    }()
    
    lazy var horizontalDivider: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var allTitle: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 20, weight: .bold)
        label.text = "Всего:"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var allPrice: UILabel = {
        let label = UILabel()
        label.text = "1488 руб."
        label.textAlignment = .right
        label.font = .systemFont(ofSize: 20, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var goToPaymentBtn: UIButton = {
        let btn = UIButton()
        btn.setTitle("Перейти к оплате", for: .normal)
        btn.backgroundColor = .systemGreen
        btn.layer.cornerRadius = 5
        btn.addTarget(self, action: #selector(didTapPayBtn), for: .touchUpInside)
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    
    lazy var mainStackView: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [horizontalDivider, stackView, goToPaymentBtn])
        stack.distribution = .fill
        stack.alignment = .fill
        stack.axis = .vertical
        stack.spacing = 40
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    lazy var stackView: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [allTitle, allPrice])
        stack.distribution = .fill
        stack.alignment = .fill
        stack.axis = .horizontal
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(collectionView)
        view.addSubview(mainStackView)

        view.backgroundColor = .systemBackground
        setDelegates()
        setConstraints()
    }
    
    private func setDelegates() {
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
}

extension CartViewController {
    
    @objc func didTapPayBtn() {
        let vc = PayViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
}

extension CartViewController {
    
    func setConstraints() {
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 5),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: mainStackView.topAnchor, constant: -5),
            
            mainStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            mainStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15),
            mainStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -15),
            
            horizontalDivider.heightAnchor.constraint(equalToConstant: 1),
            
            goToPaymentBtn.heightAnchor.constraint(equalToConstant: 50),
        ])
    }
    
}

extension CartViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CartItemCollectionViewCell.identifier, for: indexPath) as? CartItemCollectionViewCell else { return UICollectionViewCell() }
        
        return cell
    }
}

extension CartViewController: UICollectionViewDelegate {
    
}
