//
//  TabBarCoordinatorProtocol.swift
//  ios-navigation
//
//  Created by Игорь Викторов on 21.10.2022.
//

import UIKit

protocol TabBarCoordinatorProtocol: AnyObject {
    var tabBarController: UITabBarController { get set }
    
    func startApplication() -> UIViewController
}
