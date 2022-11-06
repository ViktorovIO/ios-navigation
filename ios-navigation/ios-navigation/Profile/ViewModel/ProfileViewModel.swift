//
//  ProfileViewModel.swift
//  ios-navigation
//
//  Created by Игорь Викторов on 23.10.2022.
//

import UIKit
import StorageService

class ProfileViewModel {

    let profileHeaderView = ProfileHeaderView()
    var postsData: [Post] = []
    var user: User
    
    
    init(user: User) {
        self.user = user

        self.setUser()
        self.setPosts()
    }

    func setUser() {
        self.profileHeaderView.setUser(avatarImage: user.avatar, fullName: user.fullName, status: user.status)
    }

    func setPosts() {
        postsData = MockedPostsList().getPosts()

    }
}
