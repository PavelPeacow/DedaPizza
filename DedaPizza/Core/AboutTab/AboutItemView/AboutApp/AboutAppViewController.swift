//
//  AboutAppViewController.swift
//  DedaPizza
//
//  Created by Павел Кай on 03.12.2022.
//

import UIKit

class AboutAppViewController: UIViewController {
    
    lazy var appIcon: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "logo")
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    lazy var appTitle: UILabel = {
        let label = UILabel()
        label.text = "Дедушкина Пицца!"
        label.font = .systemFont(ofSize: 22, weight: .heavy)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var appVersion: UILabel = {
        let label = UILabel()
        label.text = "Версия 2.2.8"
        label.textColor = .systemGray2
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var descriptionContainer: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .systemGray6
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor.white.cgColor
        view.layer.cornerRadius = 15
        return view
    }()
    
    lazy var appDescription: UILabel = {
        let label = UILabel()
        label.text = "Мы делаем пиццу Глада Валакаса поулярной. Наша пицца максимально вкусная и доступная"
        label.numberOfLines = 0
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var stackView: UIStackView = {
        descriptionContainer.addSubview(appDescription)
        let stack = UIStackView(arrangedSubviews: [appIcon, appTitle, appVersion, descriptionContainer])
        stack.distribution = .fill
        stack.alignment = .center
        stack.axis = .vertical
        stack.spacing = 10
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        
        view.addSubview(stackView)
        setConstraints()
    }
    
}

extension AboutAppViewController {
    func setConstraints() {
        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            
            appDescription.widthAnchor.constraint(equalToConstant: 260),
            appDescription.centerXAnchor.constraint(equalTo: descriptionContainer.centerXAnchor),
            
            descriptionContainer.widthAnchor.constraint(equalToConstant: 290),
            descriptionContainer.topAnchor.constraint(equalTo: appDescription.topAnchor, constant: -5),
            descriptionContainer.bottomAnchor.constraint(equalTo: appDescription.bottomAnchor, constant: 5),
        ])
    }
}
