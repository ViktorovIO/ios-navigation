//
//  UserRepository.swift
//  ios-navigation
//
//  Created by Игорь Викторов on 02.10.2022.
//

import UIKit

class UserRepository: UserRepositoryProtocol {
    private let user = User(
        login: "Igorilla",
        password: "password",
        fullName: "Игорь Викторов",
        avatar: UIImage(named: "avatar")!,
        status: "Shocked"
    )
    
    func getUserByLogin(login: String) -> User? {
        if login == user.login {
            return user
        }
        
        return nil
    }
}
