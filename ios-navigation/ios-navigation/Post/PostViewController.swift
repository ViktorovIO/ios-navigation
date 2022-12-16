//
//  PostViewController.swift
//  Navigation
//
//  Created by Игорь Викторов on 14.05.2022.
//

import UIKit
import StorageService

class PostViewController: UIViewController {
    
    let coordinator: FeedCoordinator
    
    var post: Post
    
    init(coordinator: FeedCoordinator, post: Post) {
        self.coordinator = coordinator
        self.post = post
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = .white
        self.navigationItem.title = "Post"
        
        let barButtonItem = UIBarButtonItem(title: "Запись", style: .plain, target: self, action: #selector(showPostInfo))
        navigationItem.rightBarButtonItem = barButtonItem
    }
    
    @objc
    func showPostInfo() {
        print("test1")
        let infoVC = InfoViewController(coordinator: self.coordinator, post: self.post)
        infoVC.modalPresentationStyle = .formSheet
        infoVC.modalTransitionStyle = .coverVertical
        
        self.present(infoVC, animated: true, completion: nil)
        print("test2")
    }
}
