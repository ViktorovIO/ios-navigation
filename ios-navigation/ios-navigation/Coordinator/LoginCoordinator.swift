//
//  LoginCoordinator.swift
//  ios-navigation
//
//  Created by Игорь Викторов on 06.11.2022.
//

import UIKit

class LoginCoordinator: CoordinatorProtocol {
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let profileCoordinator = ProfileCoordinator(navigationController: self.navigationController)
        
        let loginVC = LoginViewController(coordinator: profileCoordinator)
        loginVC.tabBarItem = UITabBarItem(title: "Профиль", image: UIImage(systemName: "person"), tag: 1)
        navigationController.pushViewController(loginVC, animated: true)
    }
}
