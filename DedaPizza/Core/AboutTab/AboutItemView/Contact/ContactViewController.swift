//
//  ContactViewController.swift
//  DedaPizza
//
//  Created by Павел Кай on 03.12.2022.
//

import UIKit

class ContactViewController: UIViewController {
    
    lazy var emailTextField: CustomTextField = CustomTextField(placeholder: "Почта", leftIcon: .init(named: "emailIcon")!, rightIcon: nil)
    
    lazy var contactTextView: UITextView = {
        let textView = UITextView()
        textView.returnKeyType = .done
        textView.layer.borderColor = UIColor.white.cgColor
        textView.layer.borderWidth = 1
        textView.text = "Введите ваше сообщение"
        textView.textColor = .systemGray3
        textView.font = .systemFont(ofSize: 20)
        textView.translatesAutoresizingMaskIntoConstraints = false
        return textView
    }()
    
    lazy var submitBtn: UIButton = {
        let btn = UIButton()
        btn.setTitle("Отправить", for: .normal)
        btn.backgroundColor = .systemGray6
        btn.layer.cornerRadius = 5
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground

        view.addSubview(emailTextField)
        view.addSubview(contactTextView)
        view.addSubview(submitBtn)
        
        setDelegates()
        setConstraints()
    }
    
    private func setDelegates() {
        contactTextView.delegate = self
    }
    
}

extension ContactViewController: UITextViewDelegate {
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        if textView.text == "Введите ваше сообщение" {
            textView.text = ""
            textView.textColor = .white
            textView.font = .systemFont(ofSize: 16)
        }
    }
    
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        if text == "\n" {
            textView.resignFirstResponder()
        }
        return true
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        if textView.text == "" {
            textView.text = "Введите ваше сообщение"
            textView.textColor = .systemGray3
            textView.font = .systemFont(ofSize: 20)
        }
    }
    
}

extension ContactViewController {
    func setConstraints() {
        NSLayoutConstraint.activate([
            emailTextField.widthAnchor.constraint(equalToConstant: 260),
            emailTextField.heightAnchor.constraint(equalToConstant: 40),
            emailTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            emailTextField.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50),
            
            contactTextView.heightAnchor.constraint(equalToConstant: 260),
            contactTextView.widthAnchor.constraint(equalToConstant: 260),
            contactTextView.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 38),
            contactTextView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            submitBtn.widthAnchor.constraint(equalToConstant: 120),
            submitBtn.heightAnchor.constraint(equalToConstant: 35),
            submitBtn.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            submitBtn.topAnchor.constraint(equalTo: contactTextView.bottomAnchor, constant: 18),
        ])
    }
}
