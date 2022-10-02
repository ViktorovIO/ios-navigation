//
//  UserRepositoryProtocol.swift
//  ios-navigation
//
//  Created by Игорь Викторов on 02.10.2022.
//

protocol UserRepositoryProtocol {
    func getUserByLogin(login: String) -> User?
}
