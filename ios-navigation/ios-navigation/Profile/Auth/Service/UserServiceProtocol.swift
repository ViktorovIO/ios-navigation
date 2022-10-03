//
//  UserServiceProtocol.swift
//  ios-navigation
//
//  Created by Игорь Викторов on 02.10.2022.
//

protocol UserServiceProtocol {
    
    func getUserByLogin(login: String, password: String) -> User?
    
}
