//
//  FeedCoordinator.swift
//  ios-navigation
//
//  Created by Игорь Викторов on 21.10.2022.
//

import UIKit
import StorageService

class FeedCoordinator: CoordinatorProtocol {
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let feedVC = FeedViewController(coordinator: self)
        feedVC.view.backgroundColor = .white
        feedVC.tabBarItem = UITabBarItem(title: "Лента", image: UIImage(systemName: "newspaper"), tag: 0)
        
        navigationController.pushViewController(feedVC, animated: true)
    }
    
    func toPostViewController(send post: Post) {
        let postVC = PostViewController(post: post, nibName: nil, bundle: nil)
        postVC.post = post
        
        navigationController.pushViewController(postVC, animated: true)
    }
}
