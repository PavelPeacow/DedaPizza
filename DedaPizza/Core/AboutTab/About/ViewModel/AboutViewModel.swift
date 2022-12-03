//
//  AboutViewModel.swift
//  DedaPizza
//
//  Created by Павел Кай on 03.12.2022.
//

import UIKit

enum AboutItems: CaseIterable {
    case conditions
    case restorants
    case contact
    case about
    
    func settingsIcon() -> UIImage? {
        switch self {
        case .conditions:
            return .init(systemName: "questionmark.square")
        case .restorants:
            return .init(systemName: "questionmark.square")
        case .contact:
            return .init(systemName: "questionmark.square")
        case .about:
            return .init(systemName: "questionmark.square")
        }
    }
    
    func settingName() -> String {
        switch self {
        case .conditions:
            return "Условия доставки"
        case .restorants:
            return "Рестораны"
        case .contact:
            return "Связаться с нами"
        case .about:
            return "О приложении"
        }
    }
    
    func selectedScreen() -> UIViewController {
        switch self {
        case .conditions:
            return ConditionViewController()
        case .restorants:
            return RestorantsViewController()
        case .contact:
            return ContactViewController()
        case .about:
            return AboutAppViewController()
        }
    }
}

final class AboutViewModel {
    
}
