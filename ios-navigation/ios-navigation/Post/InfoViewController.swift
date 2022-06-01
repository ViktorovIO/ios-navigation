//
//  InfoViewController.swift
//  Navigation
//
//  Created by Игорь Викторов on 14.05.2022.
//

import UIKit

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

        title = self.post.title
        self.view.backgroundColor = .gray
        
        let postButton = UIButton(frame: CGRect(x: 100, y: 100, width: 200, height: 50))
        postButton.setTitle("Текст", for: .normal)
        postButton.backgroundColor = .brown
        postButton.addTarget(self, action: #selector(showPostMessageAlert), for: .touchUpInside)
        
        view.addSubview(postButton)
    }
    
    @objc func showPostMessageAlert() {
        let alertVC = UIAlertController(title: self.post.title, message: self.post.message, preferredStyle: .alert)
        
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
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
