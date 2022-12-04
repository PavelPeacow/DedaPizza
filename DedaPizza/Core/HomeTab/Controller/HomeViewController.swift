//
//  HomeViewController.swift
//  DedaPizza
//
//  Created by Павел Кай on 28.10.2022.
//

import UIKit

class HomeViewController: UIViewController {
    
    private let pizzaLogo: UIImageView = {
        let image = UIImageView(image: UIImage(named: "logo"))
        image.contentMode = .scaleAspectFit
        image.isUserInteractionEnabled = true
        return image
    }()

    private let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 350, height: 180)
        layout.scrollDirection = .vertical
        
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.translatesAutoresizingMaskIntoConstraints = false
        collection.register(ProductCollectionViewCell.self, forCellWithReuseIdentifier: ProductCollectionViewCell.identifier)
        return collection
    }()
    
    private let productCategoryAllBtn: UIButton = {
        let btn = UIButton()
        btn.backgroundColor = .systemGray6
        btn.layer.cornerRadius = 5
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setTitle("Все", for: .normal)
        btn.setImage(UIImage(named: "allCategory"), for: .normal)
        return btn
    }()
    
    private let productCategoryPizzaBtn: UIButton = {
        let btn = UIButton()
        btn.backgroundColor = .systemGray6
        btn.layer.cornerRadius = 5
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setTitle("Пицца", for: .normal)
        btn.setImage(UIImage(named: "pizzaCategory"), for: .normal)
        return btn
    }()
    
    private let productCategoryBurgerBtn: UIButton = {
        let btn = UIButton()
        btn.backgroundColor = .systemGray6
        btn.layer.cornerRadius = 5
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setTitle("Бургеры", for: .normal)
        btn.setImage(UIImage(named: "pizzaCategory"), for: .normal)
        return btn
    }()
    
    private let productCategoryDesertBtn: UIButton = {
        let btn = UIButton()
        btn.backgroundColor = .systemGray6
        btn.layer.cornerRadius = 5
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setTitle("Десерты", for: .normal)
        btn.setImage(UIImage(named: "desertCategory"), for: .normal)
        return btn
    }()
        
    lazy var stackView: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [productCategoryAllBtn, productCategoryPizzaBtn, productCategoryBurgerBtn, productCategoryDesertBtn])
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.distribution = .fill
        stack.spacing = 15
        stack.alignment = .fill
        stack.axis = .horizontal
        return stack
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemBackground
        view.addSubview(stackView)
        view.addSubview(collectionView)
        
        setupNavigationBar()
        setupDelegates()
        
        setupTapGestures()
        setConstraints()
    }
    
    private func setupNavigationBar() {
        navigationItem.titleView = pizzaLogo
        
        title = "Главное"
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    private func setupDelegates() {
        collectionView.delegate = self
        collectionView.dataSource = self
    }
        
    private func setupTapGestures() {
        let gesture = UITapGestureRecognizer(target: self, action: #selector(logoTapped))
        pizzaLogo.addGestureRecognizer(gesture)
    }
    
    @objc private func logoTapped() {
        let alert = UIAlertController(title: "You loh", message: "why are you loh?", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK😔", style: .cancel))
        present(alert, animated: true)
    }
    
}

extension HomeViewController {
    
    func setConstraints() {
        NSLayoutConstraint.activate([
            
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            stackView.heightAnchor.constraint(equalToConstant: 22),
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 5),
            
            collectionView.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 22),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
        ])
    }
    
}

extension HomeViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        6
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ProductCollectionViewCell.identifier, for: indexPath) as? ProductCollectionViewCell ?? UICollectionViewCell()
        
        
        
        return cell
    }
    
}

extension HomeViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = ProductItemViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
}
