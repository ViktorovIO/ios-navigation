//
//  MockedPostsList.swift
//  ios-navigation
//
//  Created by Игорь Викторов on 09.08.2022.
//

class MockedPostsList {
    private var posts: [Post] = []
    
    public func getPosts() -> [Post] {
        self.posts.append(.init(
            author: "Igorilla",
            description: "Hello, world!",
            image: "dev",
            likes: 100500,
            views: 100501
        ))
        
        self.posts.append(.init(
            author: "Capybara-master",
            description: "Capy - is the most friendly pets))",
            image: "capybara",
            likes: 356,
            views: 356
        ))
        
        self.posts.append(.init(
            author: "Apple Music",
            description: "Listen music today!",
            image: "music",
            likes: 79,
            views: 673
        ))
        
        self.posts.append(.init(
            author: "Whats news?",
            description: "Are you reading newspaper?",
            image: "newspaper",
            likes: 14,
            views: 909
        ))
        
        return self.posts
    }
}
