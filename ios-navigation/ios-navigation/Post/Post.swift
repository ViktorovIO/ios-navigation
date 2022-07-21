//
//  Post.swift
//  Navigation
//
//  Created by Игорь Викторов on 15.05.2022.
//

import Foundation

struct Post {
    var author, description, image: String
    var likes, views: Int
    
    init(author: String, description: String, image: String, likes: Int, views: Int) {
        self.author = author
        self.description = description
        self.image = image
        self.likes = likes
        self.views = views
    }
}
