//
//  MyLoginFactory.swift
//  ios-navigation
//
//  Created by Игорь Викторов on 04.10.2022.
//

struct MyLoginFactory: LoginFactoryProtocol {
    
    func makeLoginInspector() -> LoginInspector {
        return LoginInspector()
    }
    
}
