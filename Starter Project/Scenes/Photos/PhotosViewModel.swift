//
//  PhotosViewModel.swift
//  Starter Project
//
//  Created by Ahmed Hafez on 4/1/23.
//

import Foundation

class PhotosViewModel {
    var isFetchingPhotos = false
    var page = 1
    var allPhotos: [Photo] = []
    
    func fetchPhotos(firstPage: Bool, completion: @escaping (_ photos: [Photo]) -> Void) {
        isFetchingPhotos = true
        page = firstPage == true ? 1 : (page + 1)
        NetworkManager.fetchPhotos(for: page) { [weak self] photos in
            guard let self = self else {return}
            self.isFetchingPhotos = false
            self.allPhotos.append(contentsOf: photos)
            completion(photos)
        }
    }
}
