//
//  LoginInspector.swift
//  ios-navigation
//
//  Created by Игорь Викторов on 04.10.2022.
//

struct LoginInspector: LoginViewControllerDelegateProtocol {
    func check(login: String, password: String) -> Bool {
       return Checker.shared.check(login: login, password: password)
    }
}
