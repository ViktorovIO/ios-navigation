//
//  SceneDelegate.swift
//  ios-navigation
//
//  Created by Игорь Викторов on 02.06.2022.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    var coordinator: TabBarCoordinatorProtocol?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let scene = (scene as? UIWindowScene) else { return }
        
        let tabBarController = UITabBarController()
        coordinator = TabBarCoordinator(tabBarController: tabBarController)

        window = UIWindow(windowScene: scene)
        window?.makeKeyAndVisible()
        window?.rootViewController = coordinator?.startApplication()
    }
}

