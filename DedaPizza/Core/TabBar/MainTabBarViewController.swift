//
//  MainTabBarViewController.swift
//  DedaPizza
//
//  Created by Павел Кай on 28.10.2022.
//

import UIKit

class MainTabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let home = UINavigationController(rootViewController: HomeViewController())
        let promo = UINavigationController(rootViewController: PromoViewController())
        let cart = UINavigationController(rootViewController: CartViewController())
        let profile = UINavigationController(rootViewController: LoginViewController())
        let about = UINavigationController(rootViewController: AboutViewController())
        
        home.tabBarItem.title = "Главное"
        promo.tabBarItem.title = "Акции"
        cart.tabBarItem.title = "Корзина"
        profile.tabBarItem.title = "Профиль"
        about.tabBarItem.title = "Еще"
        
        home.tabBarItem.image = UIImage(named: "home")
        promo.tabBarItem.image = UIImage(named: "promo")
        cart.tabBarItem.image = UIImage(systemName: "cart.fill")
        profile.tabBarItem.image = UIImage(systemName: "person.fill")
        about.tabBarItem.image = UIImage(systemName: "line.3.horizontal")
        
        setViewControllers([home, promo, cart, profile, about], animated: true)
        selectedIndex = 2
    }
    
}
