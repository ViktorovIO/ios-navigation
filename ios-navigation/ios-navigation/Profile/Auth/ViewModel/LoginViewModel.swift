//
//  LoginView.swift
//  ios-navigation
//
//  Created by Игорь Викторов on 21.10.2022.
//

import UIKit

class LoginViewModel {
    static var loginFactoryDelegate: LoginFactory?

    var loginFactory: LoginFactory
    var loginedUser: User? {
        didSet {
            self.isLaunched?(self)
        }
    }

    var isLaunched: ((LoginViewModel) -> ())?

    init(model: LoginFactory) {
        self.loginFactory = model
    }

    func check(login: String, password: String) -> Bool {
        return loginFactory.makeLoginInspector().check(login: login, password: password)
    }
}
