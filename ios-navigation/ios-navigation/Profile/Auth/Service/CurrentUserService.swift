//
//  CurrentUserService.swift
//  ios-navigation
//
//  Created by Игорь Викторов on 02.10.2022.
//

class CurrentUserService: UserServiceProtocol {
    
    private let userRepository: UserRepository
    
    init() {
        self.userRepository = UserRepository()
    }
    
    func getUserByLogin(login: String) -> User? {
        return self.userRepository.getUserByLogin(login: login)
    }
}
