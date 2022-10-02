//
//  TestUserRepository.swift
//  ios-navigation
//
//  Created by Игорь Викторов on 02.10.2022.
//

import UIKit

class TestUserRepository: UserRepositoryProtocol {
    private let user = User(
        login: "test",
        password: "test",
        fullName: "Test Mocked",
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
