//
//  CustomTextField.swift
//  LoginPageCombine
//
//  Created by Павел Кай on 07.11.2022.
//

import UIKit

import UIKit

final class CustomTextField: UITextField {
    
    var textPadding = UIEdgeInsets(
        top: 0,
        left: 0,
        bottom: 0,
        right: 10
    )
    
    init(placeholder: String, leftIcon: UIImage, rightIcon: UIImage?) {
        super.init(frame: .zero)
        
        let iconContainer = UIView(frame: CGRect(x: 10, y: self.frame.height/2, width: 40, height: 26))
        let iconView = UIImageView(frame: CGRect(x: 10, y: self.frame.height/2, width: 26, height: 26))
        iconView.image = leftIcon
        iconContainer.addSubview(iconView)
        
        self.placeholder = placeholder
        leftView = iconContainer
        layer.cornerRadius = 5
        clipsToBounds = true
        leftViewMode = .always
        
        if let rightIcon = rightIcon {
            let iconContainer = UIView(frame: CGRect(x: 10, y: self.frame.height/2, width: 40, height: 26))
            let iconView = UIImageView(frame: CGRect(x: 10, y: self.frame.height/2, width: 26, height: 26))
            iconView.image = rightIcon
            iconContainer.addSubview(iconView)
            rightView = iconContainer
            rightViewMode = .always
        }
        
       
        layer.borderColor = UIColor.white.cgColor
        layer.borderWidth = 1
        translatesAutoresizingMaskIntoConstraints = false
    }


    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        let rect = super.textRect(forBounds: bounds)
        return rect.inset(by: textPadding)
    }

    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        let rect = super.editingRect(forBounds: bounds)
        return rect.inset(by: textPadding)
    }

}
