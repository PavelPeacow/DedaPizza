//
//  NotificationCollectionViewCell.swift
//  ProfilePageCombine
//
//  Created by Павел Кай on 28.11.2022.
//

import UIKit



class NotificationCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "NotificationCollectionViewCell"
    
    private lazy var horizontalDivier: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        return view
    }()
    
    private lazy var image: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "Icon")
        image.contentMode = .scaleAspectFit
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private lazy var title: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14)
        label.text = "Ваш заказ #HOMO1488 был принят в обработку!"
        label.numberOfLines = 2
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var date: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 12, weight: .semibold)
        label.textColor = .gray
        label.text = "21.11.2022 21:23"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var priceStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [horizontalDivier, date])
        stackView.alignment = .center
        stackView.spacing = 10
        stackView.axis = .horizontal
        stackView.distribution = .fillProportionally
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(image)
        
        contentView.addSubview(title)
        contentView.addSubview(priceStackView)
        
        contentView.backgroundColor = .systemGray6
        contentView.layer.cornerRadius = 15
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension NotificationCollectionViewCell {
    func setConstraints() {
        NSLayoutConstraint.activate([
            image.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            image.widthAnchor.constraint(equalToConstant: 30),
            image.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -12),
            image.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 12),
            
            title.leadingAnchor.constraint(equalTo: image.trailingAnchor, constant: 10),
            title.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            title.trailingAnchor.constraint(equalTo: horizontalDivier.leadingAnchor, constant: -10),
            
            priceStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8),
            priceStackView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            
            horizontalDivier.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 15),
            horizontalDivier.widthAnchor.constraint(equalToConstant: 1),
            horizontalDivier.trailingAnchor.constraint(equalTo: date.leadingAnchor, constant: -10),
            
        ])
    }
}
