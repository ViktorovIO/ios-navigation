//
//  ProfileTableHederView.swift
//  ios-navigation
//
//  Created by Игорь Викторов on 17.07.2022.
//

import UIKit

class ProfileHeaderView: UIView {
    
    var avatarImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "avatar"))
        imageView.layer.cornerRadius = 75
        imageView.clipsToBounds = true
        imageView.layer.borderWidth = 3
        imageView.layer.borderColor = UIColor.white.cgColor
        imageView.isUserInteractionEnabled = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        return imageView
    }()

    private lazy var fullNameLabel: UILabel = {
        let label = UILabel()
        label.text = "Igor Viktorov"
        label.font = .systemFont(ofSize: 18, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false

        return label
    }()

    private lazy var statusLabel: UILabel = {
        let label = UILabel()
        label.text = "Profile status"
        label.font = .systemFont(ofSize: 14, weight: .regular)
        label.textColor = .black
        label.numberOfLines = 1
        label.translatesAutoresizingMaskIntoConstraints = false
        label.isUserInteractionEnabled = true

        return label
    }()

    private lazy var setStatusButton: UIButton = {
        let button = UIButton()
        button.setTitle("Установить статус", for: .normal)
        button.layer.cornerRadius = 10
        button.clipsToBounds = true
        button.addTarget(self, action: #selector(self.setStatusButtonPressed), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = UIColor.systemBlue
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOffset = CGSize(width: 4, height: 4)
        button.layer.shadowOpacity = 0.7
        button.layer.shadowRadius = 4.0
        button.layer.masksToBounds = false
        
        return button
    }()
    
    private lazy var statusTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Type your status here"
        textField.returnKeyType = .done
        textField.autocapitalizationType = .words
        textField.font = .systemFont(ofSize: 15)
        textField.textColor = .systemGray2
        textField.backgroundColor = .systemGray4
        textField.borderStyle = .roundedRect
        textField.returnKeyType = .next
        textField.keyboardType = .default
        textField.clearButtonMode = .always
        textField.translatesAutoresizingMaskIntoConstraints = false
        
        return textField
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.drawSelf()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func drawSelf() {
        frame.origin.x = safeAreaInsets.left
        frame.origin.y = safeAreaInsets.top
        frame.size.width = bounds.width - safeAreaInsets.left - safeAreaInsets.right
        frame.size.height = 220
        
        addSubview(avatarImageView)
        addSubview(fullNameLabel)
        addSubview(statusLabel)
        addSubview(setStatusButton)
        addSubview(statusTextField)

        NSLayoutConstraint.activate([
            self.heightAnchor.constraint(equalToConstant: 220),
            avatarImageView.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            avatarImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            avatarImageView.widthAnchor.constraint(equalToConstant: 150),
            avatarImageView.heightAnchor.constraint(equalToConstant: 150),
            
            fullNameLabel.topAnchor.constraint(equalTo: topAnchor, constant: 27),
            fullNameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 182),
            fullNameLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            
            setStatusButton.topAnchor.constraint(equalTo: avatarImageView.bottomAnchor, constant: 16),
            setStatusButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            setStatusButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            setStatusButton.heightAnchor.constraint(equalToConstant: 50),
            setStatusButton.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            
            statusLabel.bottomAnchor.constraint(equalTo: statusTextField.topAnchor, constant: -16),
            statusLabel.leadingAnchor.constraint(equalTo: fullNameLabel.leadingAnchor),
            statusLabel.trailingAnchor.constraint(equalTo: fullNameLabel.trailingAnchor),
            
            statusTextField.bottomAnchor.constraint(equalTo: setStatusButton.topAnchor, constant: -16),
            statusTextField.leadingAnchor.constraint(equalTo: statusLabel.leadingAnchor),
            statusTextField.trailingAnchor.constraint(equalTo: statusLabel.trailingAnchor),
            statusTextField.heightAnchor.constraint(equalToConstant: 34)
        ])
    }
    
    @objc private func setStatusButtonPressed() {
        statusLabel.text = statusTextField.text
        statusTextField.text = ""
        print(statusLabel)
    }
}
