//
//  TestUserService.swift
//  ios-navigation
//
//  Created by Игорь Викторов on 02.10.2022.
//

class TestUserService: UserServiceProtocol {
    
    private let userRepository: TestUserRepository
    
    init() {
        self.userRepository = TestUserRepository()
    }
    
    func getUserByLogin(login: String) -> User? {
        return self.userRepository.getUserByLogin(login: login)
    }
}
