//
//  FeedViewController.swift
//  Navigation
//
//  Created by Игорь Викторов on 14.05.2022.
//

import UIKit

class FeedViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Лента"

        self.addPostButtonSubview()
    }
    
    @objc
    func showPost() {
        let post = Post(title: "Запись #1", message: "Тестовое сообщение к записи")
        let postVC = PostViewController(post: post, nibName: nil, bundle: nil)
        
        navigationController?.pushViewController(postVC, animated: true)
    }
    
    private func addPostButtonSubview() {
        let postButton = UIButton(frame: CGRect(x: 100, y: 100, width: 200, height: 50))
        postButton.setTitle("Читать", for: .normal)
        postButton.backgroundColor = .systemBlue
        postButton.addTarget(self, action: #selector(showPost), for: .touchUpInside)
        
        view.addSubview(postButton)
    }
}
