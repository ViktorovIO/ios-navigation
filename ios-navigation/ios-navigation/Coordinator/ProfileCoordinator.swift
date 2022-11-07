//
//  ProfileCoordinator.swift
//  ios-navigation
//
//  Created by Игорь Викторов on 21.10.2022.
//

import UIKit

class ProfileCoordinator: CoordinatorProtocol {
    var navigationController: UINavigationController
    var user: User?
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let currentUserService = CurrentUserService()
        let photoCoordinator = PhotoCoordinator(navigationController: navigationController)
        let profileViewModel = ProfileViewModel(user: self.user!)

        let profileVC = ProfileViewController(
            profileViewModel: profileViewModel,
            photoCoordinator: photoCoordinator
        )

        navigationController.pushViewController(profileVC, animated: true)
    }
    
    func setUser(user: User) {
        self.user = user
    }
}
