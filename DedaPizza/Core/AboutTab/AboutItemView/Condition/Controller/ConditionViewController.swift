//
//  ConditionViewController.swift
//  DedaPizza
//
//  Created by Павел Кай on 03.12.2022.
//

import UIKit

class ConditionViewController: UIViewController {
    
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        
        layout.estimatedItemSize = CGSize(width: 290, height: 115)
        
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.register(ConditionCollectionViewCell.self, forCellWithReuseIdentifier: ConditionCollectionViewCell.identifier)
        return collection
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        
        view.addSubview(collectionView)
        setDelegates()
    }
    
    override func viewDidLayoutSubviews() {
        collectionView.frame = view.bounds
    }
    
    private func setDelegates() {
        collectionView.delegate = self
        collectionView.dataSource = self
    }

}

extension ConditionViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ConditionCollectionViewCell.identifier, for: indexPath) as? ConditionCollectionViewCell else { return UICollectionViewCell() }
        
        return cell
    }
    
    
}

extension ConditionViewController: UICollectionViewDelegate {
    
}
