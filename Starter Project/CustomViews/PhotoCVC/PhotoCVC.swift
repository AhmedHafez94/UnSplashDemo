//
//  PhotoCVC.swift
//  Starter Project
//
//  Created by Ahmed Hafez on 3/30/23.
//

import UIKit
import SDWebImage

class PhotoCVC: UICollectionViewCell {

    @IBOutlet weak var likesLabelCount: UILabel!
    @IBOutlet weak var photoImageView: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    func configure(photo: Photo) {
        photoImageView.sd_setImage(with: URL(string: photo.urls?.thumb ?? ""))
        likesLabelCount.text = "\(photo.likes ?? 0)"
    }

}
