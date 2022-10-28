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

        let recipe = UINavigationController(rootViewController: RecipeViewController())
        let promo = UINavigationController(rootViewController: PromoViewController())
        let home = UINavigationController(rootViewController: HomeViewController())
        let cart = UINavigationController(rootViewController: CartViewController())
        let profile = UINavigationController(rootViewController: ProfileViewController())
        
        recipe.tabBarItem.title = "Рецепты"
        promo.tabBarItem.title = "Акции"
        home.tabBarItem.title = "Главное"
        cart.tabBarItem.title = "Корзина"
        profile.tabBarItem.title = "Профиль"
        
        recipe.tabBarItem.image = UIImage(named: "recipe")
        promo.tabBarItem.image = UIImage(named: "promo")
        home.tabBarItem.image = UIImage(named: "home")
        cart.tabBarItem.image = UIImage(named: "cart")
        profile.tabBarItem.image = UIImage(named: "profile")
        
        setViewControllers([recipe, promo, home, cart, profile], animated: true)
        selectedIndex = 2
    }
    
}
