//
//  ProfileViewController.swift
//  Navigation
//
//  Created by Игорь Викторов on 27.05.2022.
//

import UIKit

class ProfileViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Profile"
        view.backgroundColor = .lightGray

        // ProfileHeaderView
        let profileHeaderView = ProfileHeaderView(frame: .zero)
        profileHeaderView.backgroundColor = .white
        view.addSubview(profileHeaderView)

        let barButtonItem = UIBarButtonItem(title: "Запись", style: .plain, target: self, action: #selector(showPostInfo))
        navigationItem.rightBarButtonItem = barButtonItem

        navigationController?.navigationBar.isTranslucent = false
        navigationController?.navigationBar.backgroundColor = .white
        navigationController?.navigationBar.barTintColor = UIColor.white
    }
    
    @objc func showPostInfo() {
        
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        view.subviews.first?.frame = CGRect(x: 0, y: 0, width: super.view.frame.width, height: super.view.frame.height)
    }
}
