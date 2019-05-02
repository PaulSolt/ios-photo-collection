//
//  PhotosCollectionViewCell.swift
//  PhotoCollection
//
//  Created by Sameera Roussi on 5/2/19.
//  Copyright © 2019 Sameera Roussi. All rights reserved.
//

import UIKit

class PhotosCollectionViewCell: UICollectionViewCell {
    
    // MARK: - Properties and Outlets
    
    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var photoLabel: UILabel!
    
    var photo: Photo? {
        didSet {
            updateViews()
        }
    }
    
    // MARK: - View Loading Methods
    
    func updateViews() {
        guard let photo = photo else { return }
        
        photoLabel.text = photo.title
        photoImageView.image = UIImage(data: photo.imageData)
    }
}
