//
//  PhotoCoordinator.swift
//  ios-navigation
//
//  Created by Игорь Викторов on 23.10.2022.
//

import UIKit

class PhotoCoordinator {

    let navigationController: UINavigationController

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func startView() {
        let photoViewController = PhotosViewController()
        photoViewController.title = "Photo Gallery"

        navigationController.pushViewController(photoViewController, animated: true)
    }
}
