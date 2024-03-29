//
//  TabBarCoordinator.swift
//  ios-navigation
//
//  Created by Игорь Викторов on 21.10.2022.
//

import UIKit

class TabBarCoordinator: TabBarCoordinatorProtocol {
    var tabBarController: UITabBarController
    
    var coordinatorNavFeed: CoordinatorProtocol?
    var coordinatorNavProfile: CoordinatorProtocol?
    var loginCoordinator: CoordinatorProtocol?
    
    init(tabBarController: UITabBarController) {
        self.tabBarController = tabBarController
    }
    
    func startApplication() -> UIViewController {
        let navFeedController = UINavigationController()
        coordinatorNavFeed = FeedCoordinator(navigationController: navFeedController)
        coordinatorNavFeed?.start()
        let feed = coordinatorNavFeed!

        let navProfileController = UINavigationController()
        
        loginCoordinator = LoginCoordinator(navigationController: navProfileController)
        loginCoordinator?.start()
        let profile = loginCoordinator!
        
        tabBarController.viewControllers = [feed.navigationController, profile.navigationController]
        
        return self.tabBarController
    }
}
