//
//  RegistrationView.swift
//  LoginPageCombine
//
//  Created by Павел Кай on 11.11.2022.
//

import UIKit

final class RegistrationView: UIView {

    lazy var emailTextfield: CustomTextField = CustomTextField(placeholder: "Email", leftIcon: UIImage(named: "emailIcon")!, rightIcon: nil)
    
    lazy var passwordTextfield: CustomTextField = CustomTextField(placeholder: "Пароль", leftIcon: UIImage(named: "passwordIcon")!, rightIcon: nil)
    
    lazy var loginTextfield: CustomTextField = CustomTextField(placeholder: "Почта", leftIcon: UIImage(named: "loginIcon")!, rightIcon: nil)
    
    lazy var passwordRepeatTextfield: CustomTextField = CustomTextField(placeholder: "Повторите пароль", leftIcon: UIImage(named: "passwordIcon")!, rightIcon: nil)
    
    lazy var registrationButton: UIButton = {
        let button = UIButton(configuration: UIButton.Configuration.bordered())
        button.backgroundColor = .systemGray4
        button.setTitle("Зарегистрироваться", for: .normal)
        button.tintColor = .white
        button.layer.cornerRadius = 5
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    lazy var loginLabel: UILabel = {
        let label = UILabel()
        label.text = "Вход"
        label.textColor = .gray
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
        label.translatesAutoresizingMaskIntoConstraints = false
        label.isUserInteractionEnabled = true
        return label
    }()
    
    lazy var agreementLabel: UILabel = {
        let label = UILabel()
        label.text = "Я согласен(-на) с положениями Пользовательского соглашения и правилами проекта."
        label.numberOfLines = 0
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var inlineValidatioError: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textColor = .red
        label.textAlignment = .center
        label.isHidden = true
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var mainStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.spacing = 40
        stackView.distribution = .fill
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
        stackView.alignment = .fill
        stackView.spacing = 32
        stackView.distribution = .fill
        stackView.addArrangedSubview(loginTextfield)
        stackView.addArrangedSubview(emailTextfield)
        stackView.addArrangedSubview(passwordTextfield)
        stackView.addArrangedSubview(passwordRepeatTextfield)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    lazy var mainButtonVerticalStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.spacing = 25
        stackView.distribution = .fill
        stackView.addArrangedSubview(inlineValidatioError)
        stackView.addArrangedSubview(registrationButton)
        stackView.addArrangedSubview(agreementLabel)
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

extension RegistrationView {
    func setConstraints() {
        NSLayoutConstraint.activate([
            mainStackView.centerYAnchor.constraint(equalTo: centerYAnchor),
            mainStackView.centerXAnchor.constraint(equalTo: centerXAnchor),

            loginTextfield.widthAnchor.constraint(equalToConstant: 266),
            loginTextfield.heightAnchor.constraint(equalToConstant: 46),

            emailTextfield.widthAnchor.constraint(equalToConstant: 266),
            emailTextfield.heightAnchor.constraint(equalToConstant: 46),

            passwordTextfield.widthAnchor.constraint(equalToConstant: 266),
            passwordTextfield.heightAnchor.constraint(equalToConstant: 46),

            passwordRepeatTextfield.widthAnchor.constraint(equalToConstant: 266),
            passwordRepeatTextfield.heightAnchor.constraint(equalToConstant: 46),

            registrationButton.widthAnchor.constraint(equalToConstant: 226),
            registrationButton.heightAnchor.constraint(equalToConstant: 40),
        ])
    }
}

