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

        let postButton = UIButton(frame: CGRect(x: 100, y: 100, width: 200, height: 50))
        postButton.setTitle("Читать", for: .normal)
        postButton.backgroundColor = .systemBlue
        postButton.addTarget(self, action: #selector(showPost), for: .touchUpInside)
        
        view.addSubview(postButton)
    }
    
    @objc func showPost() {
        let post = Post(title: "Запись #1", message: "Тестовое сообщение к записи")
        let postVC = PostViewController(post: post, nibName: nil, bundle: nil)
        
        navigationController?.pushViewController(postVC, animated: true)
//        self.present(postVC, animated: true, completion: nil)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
