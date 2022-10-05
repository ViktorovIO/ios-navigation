//
//  LoginViewControllerDelegate.swift
//  ios-navigation
//
//  Created by Игорь Викторов on 04.10.2022.
//

protocol LoginViewControllerDelegateProtocol {
    func check(login: String, password: String) -> Bool
}
