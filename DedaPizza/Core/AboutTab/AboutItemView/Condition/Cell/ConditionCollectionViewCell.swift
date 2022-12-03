//
//  ConditionCollectionViewCell.swift
//  DedaPizza
//
//  Created by Павел Кай on 03.12.2022.
//

import UIKit

class ConditionCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "ConditionCollectionViewCell"
    
    lazy var contidionText: UILabel = {
        let label = UILabel()
        label.text = "Доставка осуществляется только в пределах города и в 10-ти километрах за его пределами."
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.addSubview(contidionText)
        
        contentView.layer.cornerRadius = 15
        contentView.layer.borderWidth = 1
        contentView.layer.borderColor = UIColor.white.cgColor
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension ConditionCollectionViewCell {
    func setConstraints() {
        NSLayoutConstraint.activate([
            contidionText.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            contidionText.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            contidionText.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            contidionText.widthAnchor.constraint(equalToConstant: 260),
        ])
    }
}
