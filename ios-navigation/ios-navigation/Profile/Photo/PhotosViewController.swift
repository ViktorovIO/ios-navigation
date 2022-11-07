//
//  PhotosViewController.swift
//  ios-navigation
//
//  Created by Игорь Викторов on 29.08.2022.
//

import UIKit
import iOSIntPackage

class PhotosViewController: UIViewController {
    
    let imageProcessor = ImageProcessor()
    private let imagePublisherFacade = ImagePublisherFacade()
    private var recievedImages: [UIImage] = []
    
    private enum Constants {
        static let itemCount: CGFloat = 3
    }

    private lazy var layout: UICollectionViewFlowLayout = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 8
        layout.minimumInteritemSpacing = 8
        return layout
    }()

    private lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: self.layout)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(PhotosCollectionViewCell.self, forCellWithReuseIdentifier: "PhotosCollectionViewCell")
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "DefaultCollectionCell")
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()

    private var collectionDataSource : [PhotosViewModel] = [
        PhotosViewModel(image: "1"),
        PhotosViewModel(image: "2"),
        PhotosViewModel(image: "3"),
        PhotosViewModel(image: "4"),
        PhotosViewModel(image: "5"),
        PhotosViewModel(image: "6"),
        PhotosViewModel(image: "7"),
        PhotosViewModel(image: "8"),
        PhotosViewModel(image: "9"),
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupView()
        self.title = "Photo Gallery"
        self.navigationItem.backButtonTitle = "Назад"
        self.navigationController?.navigationBar.isHidden = false
        
        var imageList: [UIImage] = []
        self.imagePublisherFacade.subscribe(self)
        
        collectionDataSource.forEach { photosViewModel in
            imageList.append(UIImage(named: photosViewModel.image)!)
        }
        
        let start = CFAbsoluteTimeGetCurrent()
        imageProcessor.processImagesOnThread(
            sourceImages: imageList,
            filter: .fade,
            qos: .utility
        ) { cgImage in
            let diff = CFAbsoluteTimeGetCurrent() - start
            print("Time is \(diff) seconds")
            
            cgImage.forEach {
                guard let image = $0 else {return }
                self.recievedImages.append(UIImage(cgImage: image))
            }
            
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
        }

//        Result:
//        .background = 3.5s
//        .default = 1.2s
//        .userInitiated = 1.4s
//        .userInteractive = 1.6s
//        .utility = 1.5s
        
//        self.imagePublisherFacade.addImagesWithTimer(time: 0.5, repeat: 15, userImages: imageList)
    }
    
//    override func viewDidDisappear(_ animated: Bool) {
//        self.imagePublisherFacade.removeSubscription(for: self)
//    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }

    private func setupView() {
        view.addSubview(self.collectionView)
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.topAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }

    private func itemSize(for width: CGFloat, with spacing: CGFloat) -> CGSize {
        let neededWidth = width - 4 * spacing
        let itemWidth = floor(neededWidth / Constants.itemCount)
        return CGSize(width: itemWidth, height: itemWidth)
    }
}

extension PhotosViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.recievedImages.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PhotosCollectionViewCell", for: indexPath) as? PhotosCollectionViewCell else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "DefaultCollectionCell", for: indexPath)
            cell.backgroundColor = .black
            return cell
        }
        
        cell.backgroundColor = .systemGray6
        let photos = self.recievedImages[indexPath.row]
        cell.photoImagesToGallery.image = photos
        cell.photoImagesToGallery.contentMode = .scaleAspectFill
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt: IndexPath) -> CGSize {
        let spacing = ( collectionView.collectionViewLayout as? UICollectionViewFlowLayout)?.minimumInteritemSpacing
        return self.itemSize(for: collectionView.frame.width, with: spacing ?? 0)
    }
}

extension PhotosViewController: ImageLibrarySubscriber {
    func receive(images: [UIImage]) {
        self.recievedImages = images
        collectionView.reloadData()
    }
}
