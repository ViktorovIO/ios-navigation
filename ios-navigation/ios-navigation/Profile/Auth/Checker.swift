//
//  Checker.swift
//  ios-navigation
//
//  Created by Игорь Викторов on 04.10.2022.
//

class Checker {
    static let shared = Checker()
    
    private var login: String = "test"
    private var password: String = "test"
    
    private init() {}
    
    func check(login: String, password: String) -> Bool {
        return login == self.login && password == self.password
    }
    
}
