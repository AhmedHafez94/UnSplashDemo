//
//  PhotosViewController.swift
//  Starter Project
//
//  Created by Ahmed Hafez on 3/30/23.
//

import UIKit

class PhotosViewController: UIViewController {

    @IBOutlet weak var photosCollectionView: UICollectionView!
    
    let viewModel = PhotosViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()
        fetchPhotos(firstPage: true)
    }
    
    func setupCollectionView() {
        photosCollectionView.dataSource = self
        photosCollectionView.delegate = self
        photosCollectionView.register(UINib(nibName: "PhotoCVC", bundle: nil), forCellWithReuseIdentifier: "PhotoCVC")
    }
    
    func fetchPhotos(firstPage: Bool) {
        viewModel.fetchPhotos(firstPage: firstPage) { (photos) in
            DispatchQueue.main.async {
                self.photosCollectionView.reloadData()
            }
        }
    }

}


//MARK: -> collection view methods

extension PhotosViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModel.allPhotos.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PhotoCVC", for: indexPath) as! PhotoCVC
        cell.configure(photo: viewModel.allPhotos[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (collectionView.frame.width) / 2, height: 250)
    }
    
    
}
