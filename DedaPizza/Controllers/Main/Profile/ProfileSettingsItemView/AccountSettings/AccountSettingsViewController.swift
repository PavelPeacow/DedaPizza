//
//  AccountSettingsViewController.swift
//  ProfilePageCombine
//
//  Created by Павел Кай on 14.11.2022.
//

import UIKit

class AccountSettingsViewController: UIViewController {
    
    lazy var loginTextfield: CustomTextField = {
        let textField =  CustomTextField(placeholder: "Логин", leftIcon: UIImage(named: "loginIcon")!, rightIcon: UIImage(named: "editIcon"))
        return textField
    }()
    
    lazy var emailTextfield: CustomTextField = {
        let textField = CustomTextField(placeholder: "Почта", leftIcon: UIImage(named: "emailIcon")!, rightIcon: UIImage(named: "editIcon"))
        return textField
    }()
    
    lazy var passwordTextfield: CustomTextField = {
        let textField = CustomTextField(placeholder: "Пароль", leftIcon: UIImage(named: "passwordIcon")!, rightIcon: UIImage(named: "editIcon"))
        return textField
    }()
    
    lazy var saveChangesBtn: UIButton = {
        let btn = UIButton()
        btn.setTitle("Сохранить изменения", for: .normal)
        btn.layer.cornerRadius = 5
        btn.layer.borderWidth = 1
        btn.layer.borderColor = UIColor.white.cgColor
        btn.backgroundColor = .systemGray6
        return btn
    }()
    
    lazy var cancelChangesBtn: UIButton = {
        let btn = UIButton()
        btn.setTitle("Отменить изменения", for: .normal)
        btn.layer.cornerRadius = 5
        btn.layer.borderWidth = 1
        btn.layer.borderColor = UIColor.white.cgColor
        btn.backgroundColor = .systemGray6
        return btn
    }()
    
    lazy var stackView: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [loginTextfield, emailTextfield, passwordTextfield, saveChangesBtn, cancelChangesBtn])
        stack.distribution = .fillEqually
        stack.alignment = .fill
        stack.spacing = 32
        stack.axis = .vertical
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(stackView)

        view.backgroundColor = .systemBackground
        
        addTargets()
        setConstraints()
    }
    
    private func addTargets() {
        let loginGesture = UITapGestureRecognizer(target: self, action: #selector(didTapLoginEditBtn))
        let emailGesture = UITapGestureRecognizer(target: self, action: #selector(didTapEmailEditBtn))
        let passwordGesture = UITapGestureRecognizer(target: self, action: #selector(didTapPasswordEditBtn))
        
        loginTextfield.rightView?.addGestureRecognizer(loginGesture)
        emailTextfield.rightView?.addGestureRecognizer(emailGesture)
        passwordTextfield.rightView?.addGestureRecognizer(passwordGesture)
    }
    
}

extension AccountSettingsViewController {
    
    @objc func didTapLoginEditBtn() {
        let ac = UIAlertController(title: "Изменить логин", message: nil, preferredStyle: .alert)
        
        ac.addTextField()
        
        let confirmAction = UIAlertAction(title: "Подвердить", style: .default)
        let cancelAction = UIAlertAction(title: "Отменить", style: .cancel)
        
        ac.addAction(confirmAction)
        ac.addAction(cancelAction)
        
        present(ac, animated: true)
    }
    
    @objc func didTapEmailEditBtn() {
        let ac = UIAlertController(title: "Изменить почту", message: nil, preferredStyle: .alert)
        
        ac.addTextField()
        
        let confirmAction = UIAlertAction(title: "Подвердить", style: .default)
        let cancelAction = UIAlertAction(title: "Отменить", style: .cancel)
        
        ac.addAction(confirmAction)
        ac.addAction(cancelAction)
        
        present(ac, animated: true)
    }
    
    @objc func didTapPasswordEditBtn() {
        let ac = UIAlertController(title: "Изменить пароль", message: nil, preferredStyle: .alert)
        
        ac.addTextField()
        
        let confirmAction = UIAlertAction(title: "Подвердить", style: .default)
        let cancelAction = UIAlertAction(title: "Отменить", style: .cancel)
        
        ac.addAction(confirmAction)
        ac.addAction(cancelAction)
        
        present(ac, animated: true)
    }
    
}

extension AccountSettingsViewController {
    func setConstraints() {
        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            stackView.widthAnchor.constraint(equalToConstant: 270),
            stackView.heightAnchor.constraint(equalToConstant: 350),
        ])
    }
}
