//
//  ViewController.swift
//  LoginPageCombine
//
//  Created by Павел Кай on 07.11.2022.
//

import UIKit
import Combine

final class LoginViewController: UIViewController {
    
    //MARK: Properties
    private let loginView = LoginView()
    private let registrationView = RegistrationView()
    private let loginViewModel = LoginViewModel()
    
    private var cancellables = Set<AnyCancellable>()
    
    //MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(loginView)
        view.addSubview(registrationView)
        
        setUpDelegates()
        setUpTargets()
        setUpBindings()
        animateFormChange(isDidChangeFormAnimation: false)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        loginView.frame = view.bounds
        registrationView.frame = view.bounds
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
    //MARK: Bindings
    private func setUpBindings() {
        
        func bindViewToViewModel() {
            loginView.emailTextfield.textPublisher
                .assign(to: &loginViewModel.$email)
            
            loginView.passwordTextfield.textPublisher
                .assign(to: &loginViewModel.$password)
            
            
            registrationView.emailTextfield.textPublisher
                .assign(to: &loginViewModel.$email)
            
            registrationView.loginTextfield.textPublisher
                .assign(to: &loginViewModel.$username)
            
            registrationView.passwordTextfield.textPublisher
                .assign(to: &loginViewModel.$password)
            
            registrationView.passwordRepeatTextfield.textPublisher
                .assign(to: &loginViewModel.$repeatPassword)
        }
        
        func bindViewModelToView() {
            loginViewModel.$isValid
                .receive(on: RunLoop.main)
                .sink { [weak self] isValid in
                    if isValid {
                        self?.loginView.loginButton.isEnabled = true
                        self?.registrationView.registrationButton.isEnabled = true
                    } else {
                        self?.loginView.loginButton.isEnabled = false
                        self?.registrationView.registrationButton.isEnabled = false
                    }
                }
                .store(in: &cancellables)
            
//            loginViewModel.$isSwitchedToRegistrationForm
//                .receive(on: RunLoop.main)
//                .sink { [weak self] isSwitched in
//                    self?.animateFormChange(isDidChangeFormAnimation: isSwitched)
//                }
//                .store(in: &cancellables)
            
            loginViewModel.$inlineValidationError
                .receive(on: RunLoop.main)
                .sink { [weak self] validationStatus in
                    if let status = validationStatus {
                        self?.registrationView.inlineValidatioError.isHidden = false
                        self?.registrationView.inlineValidatioError.text = status
                    } else {
                        self?.registrationView.inlineValidatioError.isHidden = true
                    }
                    
                    UIView.animate(withDuration: 0.1) {
                        self?.registrationView.layoutIfNeeded()
                    }
                }
                .store(in: &cancellables)
        }
        
        bindViewToViewModel()
        bindViewModelToView()
    }
    
    //MARK: Logic
    private func setUpDelegates() {
        [loginView.emailTextfield, loginView.passwordTextfield]
            .forEach {
                $0.delegate = self
            }
        
        [registrationView.loginTextfield, registrationView.emailTextfield, registrationView.passwordTextfield, registrationView.passwordRepeatTextfield]
            .forEach {
                $0.delegate = self
            }
    }
    
    private func setUpTargets() {
        let tapLoginGesture = UITapGestureRecognizer(target: self, action: #selector(didTapLoginLabel))
        registrationView.loginLabel.addGestureRecognizer(tapLoginGesture)
        
        let tapRegistrationGesture = UITapGestureRecognizer(target: self, action: #selector(didTapRegistrationLabel))
        loginView.registrationLabel.addGestureRecognizer(tapRegistrationGesture)
        
        loginView.loginButton.addTarget(self, action: #selector(didTapLoginButton), for: .touchUpInside)
        registrationView.registrationButton.addTarget(self, action: #selector(didTapRegistrationButton), for: .touchUpInside)
    }
    
    private func animateFormChange(isDidChangeFormAnimation didChange: Bool) {
        [loginView.emailTextfield, loginView.passwordTextfield]
            .forEach {
                $0.text = ""
                $0.resignFirstResponder()
            }
        
        [registrationView.loginTextfield, registrationView.emailTextfield, registrationView.passwordTextfield, registrationView.passwordRepeatTextfield]
            .forEach {
                $0.text = ""
                $0.resignFirstResponder()
            }
        
        print(didChange)
        
        let fromView = didChange ? loginView : registrationView
        let toView = didChange ? registrationView : loginView
       
        UIView.transition(from: fromView, to: toView, duration: 0.3, options: [.transitionFlipFromLeft, .showHideTransitionViews])
    }
}

//MARK: Button Targets
extension LoginViewController {
    
    @objc func didTapLoginLabel() {
        guard loginViewModel.isSwitchedToRegistrationForm else { return }
        loginViewModel.isSwitchedToRegistrationForm = false
        animateFormChange(isDidChangeFormAnimation: false)
        print("tap")
    }
    
    @objc func didTapRegistrationLabel() {
        guard !loginViewModel.isSwitchedToRegistrationForm else { return }
        loginViewModel.isSwitchedToRegistrationForm = true
        animateFormChange(isDidChangeFormAnimation: true)
        print("tap register")
    }
    
    @objc func didTapLoginButton() {
        print("tap login")
        let vc = ProfileViewController()
        navigationController?.setViewControllers([vc], animated: true)
        loginViewModel.login()
    }
    
    @objc func didTapRegistrationButton() {
        print("tap registration")
        loginViewModel.registartion()
    }
}

extension LoginViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
