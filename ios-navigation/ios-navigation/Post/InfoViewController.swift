//
//  InfoViewController.swift
//  Navigation
//
//  Created by Игорь Викторов on 14.05.2022.
//

import UIKit
import StorageService

class InfoViewController: UIViewController {
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

        title = self.post.author
        self.view.backgroundColor = .gray
        
        let postButton = CustomButton(customTitle: "Текст", backgroundColor: .brown, frame: nil)
        postButton.setTapClosure { self.showPostMessageAlert() }
        
        view.addSubview(postButton)
    }
    
    @objc
    private func showPostMessageAlert() {
        let alertVC = UIAlertController(title: self.post.author, message: self.post.description, preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "OK", style: .default, handler: { _ in
            print("OK!")
        })
        alertVC.addAction(okAction)
        
        let helloWorldAcrion = UIAlertAction(title: "Hello, World!", style: .cancel, handler: { _ in
            print("Hello, World!")
        })
        alertVC.addAction(helloWorldAcrion)
        
        self.present(alertVC, animated: true, completion: nil)
    }
}
