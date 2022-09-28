//
//  PostViewController.swift
//  Navigation
//
//  Created by Игорь Викторов on 14.05.2022.
//

import UIKit
import StorageService

class PostViewController: UIViewController {
    var post: Post
    
    init(post: Post, nibName: String?, bundle: Bundle?) {
        self.post = post
        
        super.init(nibName: nibName, bundle: bundle)
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
        let infoVC = InfoViewController(post: self.post, nibName: nil, bundle: nil)
        infoVC.modalPresentationStyle = .formSheet
        infoVC.modalTransitionStyle = .coverVertical
        
        self.present(infoVC, animated: true, completion: nil)
        print("test2")
    }
}
