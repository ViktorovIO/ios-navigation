//
//  ProfileViewController.swift
//  Navigation
//
//  Created by Игорь Викторов on 27.05.2022.
//

import UIKit
import StorageService

class ProfileViewController: UIViewController {
    
    let profileViewModel: ProfileViewModel
    let photoCoordinator: PhotoCoordinator
    
    init(profileViewModel: ProfileViewModel, photoCoordinator: PhotoCoordinator) {
        self.profileViewModel = profileViewModel
        self.photoCoordinator = photoCoordinator
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var user: User? = nil

    private var posts: [Post] = []
    
    private lazy var profileHeaderView: ProfileHeaderView = {
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
        tableView.register(PhotosTableViewCell.self, forCellReuseIdentifier: "PhotosTableViewCell")
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
        self.navigationController?.navigationBar.isHidden = true
        
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
        
        #if DEBUG
            view.backgroundColor = .systemGray
        #else
            view.backgroundColor = .white
        #endif

        self.setupViewTableView()
        self.setupNavigationBar()
        
        let mockedPostsList = MockedPostsList()
        self.posts = mockedPostsList.getPosts()
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        view.subviews.first?.frame = CGRect(x: 0, y: 0, width: super.view.frame.width, height: super.view.frame.height)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
}

extension ProfileViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.posts.count + 1
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "PhotosTableViewCell", for: indexPath)
            return cell
        } else {
            guard let cell = tableView.dequeueReusableCell(
                withIdentifier: "ArticleCell",
                for: indexPath
            ) as? PostTableViewCell
            else { let cell = tableView.dequeueReusableCell(withIdentifier: "DefaultCell", for: indexPath)
                
                return cell
            }
            
            let article = self.posts[indexPath.row - 1]
            let viewModel = ViewModel(
                author: article.author,
                description: article.description,
                image: article.image,
                likes: article.likes,
                views: article.views
            )
            
            cell.setup(with: viewModel)
            
            return cell
        }
    }

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return self.profileViewModel.profileHeaderView
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 0 {
            self.navigationController?.pushViewController(PhotosViewController(), animated: true)
            self.navigationItem.backButtonTitle = "Назад"
            title = "Photo"
        } else { return }
    }
}
