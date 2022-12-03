//
//  UITextField+Publisher.swift
//  LoginPageCombine
//
//  Created by Павел Кай on 07.11.2022.
//

import Foundation
import UIKit
import Combine

extension UITextField {

    var textPublisher: AnyPublisher<String, Never> {
        NotificationCenter.default.publisher(
            for: UITextField.textDidChangeNotification,
            object: self
        )
        .compactMap { $0.object as? UITextField }
        .compactMap(\.text)
        .eraseToAnyPublisher()
    }

}
