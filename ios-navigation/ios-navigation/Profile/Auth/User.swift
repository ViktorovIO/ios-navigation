//
//  User.swift
//  ios-navigation
//
//  Created by Игорь Викторов on 02.10.2022.
//

import UIKit

class User {
    let login: String
    let password: String
    let fullName: String
    let avatar: UIImage
    let status: String
    
    init(login: String, password: String, fullName: String, avatar: UIImage, status: String) {
        self.login = login
        self.password = password
        self.fullName = fullName
        self.avatar = avatar
        self.status = status
    }
}
