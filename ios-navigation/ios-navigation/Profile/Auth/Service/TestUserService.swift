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
    
    func getUserByLogin(login: String, password: String) -> User? {
        let currentUser = self.userRepository.getUserByLogin(login: login)
        if currentUser == nil {
            return nil
        }
        
        if password == currentUser!.password {
            return currentUser
        }
        
        return nil
    }
}
