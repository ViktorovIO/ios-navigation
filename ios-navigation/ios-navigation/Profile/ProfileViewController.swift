//
//  ProfileViewController.swift
//  Navigation
//
//  Created by Игорь Викторов on 27.05.2022.
//

import UIKit

class ProfileViewController: UIViewController {

    private var posts: [Post] = []
    
    private lazy var profileHeaderView: UIView = {
        let profileHeaderView = ProfileHeaderView(frame: .zero)
        profileHeaderView.backgroundColor = .white
        profileHeaderView.heightAnchor.constraint(equalToConstant: 300).isActive = true
        
        return profileHeaderView
    }()
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 44
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "DefaultCell")
        tableView.register(PostTableViewCell.self, forCellReuseIdentifier: "ArticleCell")
        tableView.backgroundColor = .white
        tableView.layer.borderColor = UIColor.gray.cgColor
        tableView.layer.borderWidth = 0.5
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    private func setupNavigationBar() {
        self.navigationController?.navigationBar.isTranslucent = false
        self.navigationController?.navigationBar.backgroundColor = .white
        self.navigationController?.navigationBar.barTintColor = UIColor.white
        self.navigationController?.navigationBar.isHidden = false
        
        self.navigationController?.navigationBar.prefersLargeTitles = true

        let navBarAppearance = UINavigationBarAppearance()
        navBarAppearance.configureWithOpaqueBackground()
        navBarAppearance.titleTextAttributes = [.foregroundColor: UIColor.white]
        navBarAppearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
        navBarAppearance.backgroundColor = UIColor.white
        navBarAppearance.shadowImage = nil
        navBarAppearance.shadowColor = nil
        self.navigationController?.navigationBar.standardAppearance = navBarAppearance
        self.navigationController?.navigationBar.scrollEdgeAppearance = navBarAppearance
    }
    
    private func setupViewTableView() {
        self.view.backgroundColor = .white
        self.view.addSubview(self.tableView)

        let topConstraint = self.tableView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor)
        let leadingConstraint = self.tableView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor)
        let trailingConstraint = self.tableView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor)
        let bottomConstraint = self.tableView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor)


        NSLayoutConstraint.activate([
            topConstraint, leadingConstraint, trailingConstraint, bottomConstraint
        ])
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Profile"
        view.backgroundColor = .white

        self.setupViewTableView()
        self.setupNavigationBar()
        self.addPosts()
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        view.subviews.first?.frame = CGRect(x: 0, y: 0, width: super.view.frame.width, height: super.view.frame.height)
    }
    
    private func addPosts() {
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
    }
}

extension ProfileViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.posts.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: "ArticleCell",
            for: indexPath
        ) as? PostTableViewCell
        else { let cell = tableView.dequeueReusableCell(withIdentifier: "DefaultCell", for: indexPath)
            
        return cell
    }
        
        let article = self.posts[indexPath.row]
        let viewModel = PostTableViewCell.ViewModel(
            author: article.author,
            description: article.description,
            image: article.image,
            likes: article.likes,
            views: article.views
        )
        
        cell.setup(with: viewModel)
        
        return cell
    }

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return self.profileHeaderView
    }

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return  300
    }
}
