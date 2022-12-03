//
//  LoginView.swift
//  LoginPageCombine
//
//  Created by Павел Кай on 07.11.2022.
//

import UIKit

final class LoginView: UIView {
    
    lazy var emailTextfield: CustomTextField = CustomTextField(placeholder: "Email", leftIcon: UIImage(named: "emailIcon")!, rightIcon: nil)
    
    lazy var passwordTextfield: CustomTextField = CustomTextField(placeholder: "Пароль", leftIcon: UIImage(named: "passwordIcon")!, rightIcon: nil)
    
    lazy var loginButton: UIButton = {
        let button = UIButton(configuration: UIButton.Configuration.bordered())
        button.backgroundColor = .systemGray4
        button.setTitle("Войти", for: .normal)
        button.tintColor = .white
        button.layer.cornerRadius = 5
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    lazy var loginLabel: UILabel = {
        let label = UILabel()
        label.text = "Вход"
        label.font = .boldSystemFont(ofSize: 24)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.isUserInteractionEnabled = true
        return label
    }()
    
    lazy var dividerLabel: UILabel = {
        let label = UILabel()
        label.text = "|"
        label.font = .boldSystemFont(ofSize: 24)
        return label
    }()
    
    lazy var registrationLabel: UILabel = {
        let label = UILabel()
        label.text = "Регистрация"
        label.font = .boldSystemFont(ofSize: 24)
        label.textColor = .gray
        label.translatesAutoresizingMaskIntoConstraints = false
        label.isUserInteractionEnabled = true
        return label
    }()
    
    lazy var forgotLabel: UILabel = {
        let label = UILabel()
        label.text = "Забыли пароль?"
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    lazy var mainStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.spacing = 40
        stackView.distribution = .fillProportionally
        stackView.addArrangedSubview(mainHorizontalStackView)
        stackView.addArrangedSubview(mainVerticalStackView)
        stackView.addArrangedSubview(mainButtonVerticalStackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    lazy var mainHorizontalStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .fill
        stackView.spacing = 5
        stackView.distribution = .fill
        stackView.addArrangedSubview(loginLabel)
        stackView.addArrangedSubview(dividerLabel)
        stackView.addArrangedSubview(registrationLabel)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    lazy var mainVerticalStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.spacing = 32
        stackView.distribution = .fill
        stackView.addArrangedSubview(emailTextfield)
        stackView.addArrangedSubview(passwordTextfield)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    lazy var mainButtonVerticalStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.spacing = 25
        stackView.distribution = .fill
        stackView.addArrangedSubview(loginButton)
        stackView.addArrangedSubview(forgotLabel)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
        
    init() {
        super.init(frame: .zero)
        addSubview(mainStackView)
        
        backgroundColor = .systemBackground
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension LoginView {
    func setConstraints() {
        NSLayoutConstraint.activate([
            mainStackView.centerYAnchor.constraint(equalTo: centerYAnchor),
            mainStackView.centerXAnchor.constraint(equalTo: centerXAnchor),

            emailTextfield.widthAnchor.constraint(equalToConstant: 266),
            emailTextfield.heightAnchor.constraint(equalToConstant: 46),

            passwordTextfield.widthAnchor.constraint(equalToConstant: 266),
            passwordTextfield.heightAnchor.constraint(equalToConstant: 46),

            loginButton.widthAnchor.constraint(equalToConstant: 226),
            loginButton.heightAnchor.constraint(equalToConstant: 40),
        ])
    }
}
