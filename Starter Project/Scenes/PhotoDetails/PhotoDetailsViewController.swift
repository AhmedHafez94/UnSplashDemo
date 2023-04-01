//
//  PhotoDetailsViewController.swift
//  Starter Project
//
//  Created by Ahmed Hafez on 4/1/23.
//

import UIKit

class PhotoDetailsViewController: UIViewController {

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var displayedImage: UIImageView!
    
    var photo: Photo?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupScrollView()
        setupImageDetails()
        
    }
    
    private func setupScrollView() {
        scrollView.delegate = self
        scrollView.minimumZoomScale = 1.0
        scrollView.maximumZoomScale = 6.0
    }
    
    private func setupImageDetails() {
        displayedImage.sd_setImage(with: URL(string: photo?.urls?.regular ?? ""), placeholderImage: UIImage(systemName: "arrow.up.doc"))
    }
    
    
    @IBAction func closeButtonPressed(_ sender: UIButton) {
        dismiss(animated: true)
    }
    
    


}

//MARK: -> UIScrollViewDelegate

extension PhotoDetailsViewController: UIScrollViewDelegate {
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        
        return displayedImage
    }
}
