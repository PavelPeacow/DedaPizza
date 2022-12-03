//
//  ProfileViewModel.swift
//  ProfilePageCombine
//
//  Created by Павел Кай on 14.11.2022.
//

import Foundation
import UIKit

enum SettingItems: String, CaseIterable {
    case notification = "Уведомления"
    case history = "История заказов"
    case adress = "Адрес доставки"
    case payment = "Метод оплаты"
    case favorite = "Избранное"
    case accountSettings = "Настройки аккаунта"
    case exit = "Выйти из аккаунта"
    
    func settingsIcon() -> UIImage? {
        switch self {
        case .notification:
            return .init(named: "Уведомления")
        case .history:
            return .init(named: "История заказов")
        case .adress:
            return .init(named: "Адрес доставки")
        case .payment:
            return .init(named: "Метод оплаты")
        case .favorite:
            return .init(named: "Избранное")
        case .accountSettings:
            return .init(named: "Настройки аккаунта")
        case .exit:
            return .init(named: "Выйти из аккаунта")
        }
    }
    
    func settingName() -> String {
        switch self {
        case .notification:
            return "Уведомления"
        case .history:
            return "История заказов"
        case .adress:
            return "Адрес доставки"
        case .payment:
            return "Метод оплаты"
        case .favorite:
            return "Избранное"
        case .accountSettings:
            return "Настройки аккаунта"
        case .exit:
            return "Выйти из аккаунта"
        }
    }
    
    func selectedScreen() -> UIViewController? {
        switch self {
        case .notification:
            return NotificationViewController()
        case .history:
            return HistoryViewController()
        case .adress:
            return AdressViewController()
        case .payment:
            return PaymentViewController()
        case .favorite:
            return FavoriteViewController()
        case .accountSettings:
            return AccountSettingsViewController()
        case .exit:
           return nil
        }
    }
}

final class ProfileViewModel {

    func exitFromAccount() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            print("exit")
        }
    }
    
}
