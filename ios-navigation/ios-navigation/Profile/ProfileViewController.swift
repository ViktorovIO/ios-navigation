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

        self.addProfileHeaderSubview()

        self.navigationController?.navigationBar.isTranslucent = false
        self.navigationController?.navigationBar.backgroundColor = .white
        self.navigationController?.navigationBar.barTintColor = UIColor.white
        self.navigationController?.navigationBar.isHidden = false
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        view.subviews.first?.frame = CGRect(x: 0, y: 0, width: super.view.frame.width, height: super.view.frame.height)
    }
    
    private func addProfileHeaderSubview() {
        let profileHeaderView = ProfileHeaderView(frame: .zero)
        
        profileHeaderView.backgroundColor = .white
        view.addSubview(profileHeaderView)
    }
}
