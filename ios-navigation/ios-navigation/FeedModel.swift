//
//  FeedModel.swift
//  ios-navigation
//
//  Created by Игорь Викторов on 09.10.2022.
//


class FeedModel {
    private let secret = "Test"
    
    func check(word: String) -> Bool {
        return word == self.secret
    }
}
