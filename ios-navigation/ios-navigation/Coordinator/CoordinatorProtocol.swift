//
//  CoordinatorProtocol.swift
//  ios-navigation
//
//  Created by Игорь Викторов on 21.10.2022.
//

import UIKit

protocol CoordinatorProtocol: AnyObject {
    var navigationController: UINavigationController { get set }
    
    func start()
}
