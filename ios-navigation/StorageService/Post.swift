//
//  Post.swift
//  Navigation
//
//  Created by Игорь Викторов on 15.05.2022.
//

import Foundation

public struct Post {
    public var author, description, image: String
    public var likes, views: Int
    
    public init(author: String, description: String, image: String, likes: Int, views: Int) {
        self.author = author
        self.description = description
        self.image = image
        self.likes = likes
        self.views = views
    }
}
