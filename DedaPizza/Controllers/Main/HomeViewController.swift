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

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemBackground
        view.addSubview(collectionView)
        
        setupNavigationBar()
        setupDelegates()
        
        setupTapGestures()
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
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        collectionView.frame = view.bounds
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

extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        6
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ProductCollectionViewCell.identifier, for: indexPath) as? ProductCollectionViewCell ?? UICollectionViewCell()
        
        
        
        return cell
    }
    
}
