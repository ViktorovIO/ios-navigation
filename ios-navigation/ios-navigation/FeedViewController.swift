//
//  FeedViewController.swift
//  Navigation
//
//  Created by Игорь Викторов on 14.05.2022.
//

import UIKit
import StorageService

class FeedViewController: UIViewController {
    
    let coordinator: FeedCoordinator
    
    init(coordinator: FeedCoordinator) {
        self.coordinator = coordinator
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private lazy var post = Post(
        author: "Igorilla",
        description: "Hello, world!",
        image: "avatar",
        likes: 100500,
        views: 1001
    )
    
    private var checkGuessTextField: UITextField = {
        let textField = UITextField()
        textField.layer.borderColor = UIColor.black.cgColor
        textField.layer.borderWidth = 1
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: textField.frame.height))
        textField.leftViewMode = .always
        textField.returnKeyType = .done
        textField.autocapitalizationType = .words
        textField.frame = CGRect(x: 100, y: 200, width: 200, height: 50)
        
        return textField
    }()

    private var checkGuessLabel: UILabel = {
        let label = UILabel()
        label.text = "Wait, please"
        label.textAlignment = .center
        label.frame = CGRect(x: 100, y: 400, width: 200, height: 50)
        
        return label
    }()

    private lazy var checkGuessButton: UIButton = {
        let button = CustomButton(
            customTitle: "Check guess",
            backgroundColor: .systemBlue,
            frame: CGRect(x: 100, y: 300, width: 200, height: 50)
        )
        
        button.setTapClosure {
            self.setCheckGuessButtonPressed()
        }
        
        return button
    }()
    
    private lazy var infoButton: CustomButton = {
        let button = CustomButton(
            customTitle: "Info",
            backgroundColor: .systemCyan,
            frame: CGRect(x: 100, y: 400, width: 200, height: 50)
        )
        
        button.setTapClosure {
            self.tabInfoButton()
        }
        
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Лента"

        self.addPostButtonSubview()
    }
    
    private func addPostButtonSubview() {
        let postButton = CustomButton(
            customTitle: "Читать",
            backgroundColor: .systemBlue,
            frame: CGRect(x: 100, y: 100, width: 200, height: 50)
        )
        
        postButton.setTapClosure {
            self.showPost()
        }
        
        view.addSubview(postButton)
        view.addSubview(checkGuessLabel)
        view.addSubview(checkGuessTextField)
        view.addSubview(checkGuessButton)
        view.addSubview(infoButton)
        
        NetworkService.request(for: appConfiguration!)
    }
    
    private func tabInfoButton() {
        coordinator.toInfoViewController(send: self.post)
    }
    
    @objc
    private func showPost() {
        coordinator.toPostViewController(send: self.post)
    }
    
    @objc
    private func setCheckGuessButtonPressed() {
        let checkedSecret = self.checkGuessTextField.text ?? nil

        if checkedSecret != nil {
            if FeedModel().check(word: checkedSecret!) {
                self.checkGuessLabel.text = "Right password"
                self.checkGuessLabel.textColor = .green
            } else {
                self.checkGuessLabel.textColor = .red
                self.checkGuessLabel.text = "Wrong password"
            }
        } else {
            print("Empty String")
        }
    }
}
