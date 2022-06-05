//
//  SceneDelegate.swift
//  ios-navigation
//
//  Created by Игорь Викторов on 02.06.2022.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let scene = (scene as? UIWindowScene) else { return }
                
        window = UIWindow(windowScene: scene)
        window?.makeKeyAndVisible()
        
        let tabBarController = UITabBarController()
        
        let feedVC = FeedViewController()
        feedVC.view.backgroundColor = .white
        feedVC.tabBarItem = UITabBarItem(title: "Лента", image: UIImage(systemName: "newspaper"), tag: 0)
        
        let profileVC = LogInViewController()
        profileVC.tabBarItem = UITabBarItem(title: "Профиль", image: UIImage(systemName: "person"), tag: 1)
        
        let feedNavigationController = UINavigationController(rootViewController: feedVC)
        let profileNavigationController = UINavigationController(rootViewController: profileVC)
        
        tabBarController.viewControllers = [feedNavigationController, profileNavigationController]
        
        window?.rootViewController = tabBarController
    }
}

