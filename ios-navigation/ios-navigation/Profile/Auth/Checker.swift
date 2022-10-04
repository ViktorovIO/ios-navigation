//
//  Checker.swift
//  ios-navigation
//
//  Created by Игорь Викторов on 04.10.2022.
//

import UIKit

class Checker {
    static let shared = Checker()
    
    var user: User?
    
    private var login: String?
    private var password: String?
    
    private init() {}
    
    func check(login: String, password: String) -> Bool {
        return login == user!.login && password == user!.password
    }
    
}
