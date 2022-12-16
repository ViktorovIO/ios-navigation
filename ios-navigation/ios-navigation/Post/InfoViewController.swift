//
//  InfoViewController.swift
//  Navigation
//
//  Created by Игорь Викторов on 14.05.2022.
//

import UIKit
import StorageService

class InfoViewController: UIViewController {
    
    let coordinator: FeedCoordinator
    
    var post: Post
    
    private lazy var peopleArray: [String] = []
    
    init(coordinator: FeedCoordinator, post: Post) {
        self.coordinator = coordinator
        self.post = post
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = self.post.author
        self.view.backgroundColor = .gray
        
        let postButton = CustomButton(customTitle: "Текст", backgroundColor: .brown, frame: nil)
        postButton.setTapClosure { self.showPostMessageAlert() }
        
        view.addSubview(postButton)
        
        setupSubviews()

        getTODOItem { todoItemTitle in
            guard let todoItemTitle else { return }
            DispatchQueue.main.async {
                self.task1Label.text = todoItemTitle
            }
        }

        getPlanetDayLength { planetItem in
            guard let planetItem else { return }
            DispatchQueue.main.async {
                self.task2Label.text = planetItem.dayLength
            }
        }

        getPlanetDayLength { planetItem in
            guard let planetItem else { return }

            planetItem.residents.forEach { url in
                getPlanetResidentName(peopleURL: url) { peopleName in
                    self.peopleArray.append(peopleName!.name)
                    DispatchQueue.main.async {
                        self.peopleTable.reloadData()
                    }
                }
            }
        }
    }
    
    @objc
    private func showPostMessageAlert() {
        let alertVC = UIAlertController(title: self.post.author, message: self.post.description, preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "OK", style: .default, handler: { _ in
            print("OK!")
        })
        alertVC.addAction(okAction)
        
        let helloWorldAcrion = UIAlertAction(title: "Hello, World!", style: .cancel, handler: { _ in
            print("Hello, World!")
        })
        alertVC.addAction(helloWorldAcrion)
        
        self.present(alertVC, animated: true, completion: nil)
    }

    private lazy var task1Label: UILabel = {
        let label = UILabel()
        label.text = "Task 1"
        label.textAlignment = .center
        label.numberOfLines = 0

        return label
    }()

    private lazy var task2Label: UILabel = {
        let label = UILabel()
        label.text = "Task 2"
        label.textAlignment = .center
        label.numberOfLines = 0

        return label
    }()

    private lazy var peopleTable: UITableView = {
        let tableView = UITableView(frame: .zero, style: .plain)
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.delegate = self
        tableView.dataSource = self

        return tableView
    }()

    private func setupSubviews() {
        view.backgroundColor = .systemBackground
        title = "InfoViewController"

        view.addSubview(task1Label)
        view.addSubview(task2Label)
        view.addSubview(peopleTable)

        NSLayoutConstraint.activate([
            task1Label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            task1Label.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 25),
            task1Label.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -50),

            task2Label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            task2Label.topAnchor.constraint(equalTo: task1Label.bottomAnchor, constant: 25),
            task2Label.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -50),

            peopleTable.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -50),
            peopleTable.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            peopleTable.topAnchor.constraint(equalTo: task2Label.bottomAnchor, constant: 10),
            peopleTable.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -10)
        ])
    }
}

extension InfoViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return peopleArray.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        var content = cell.defaultContentConfiguration()
        content.text = peopleArray[indexPath.row]
        cell.contentConfiguration = content
        return cell
    }
}
