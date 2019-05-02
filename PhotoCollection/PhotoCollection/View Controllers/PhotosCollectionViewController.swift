//
//  PhotosCollectionViewController.swift
//  PhotoCollection
//
//  Created by Sameera Roussi on 5/2/19.
//  Copyright © 2019 Sameera Roussi. All rights reserved.
//

import UIKit

private let reuseIdentifier = "PhotoCell"

class PhotosCollectionViewController: UICollectionViewController {
    
    // MARK: - Properties
    
    let photoController = PhotoController()
    let themeHelper = ThemeHelper()
    
    // MARK: - View Loading Methods
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setTheme()
        collectionView?.reloadData()
        
    }

    // MARK: UICollectionViewDataSource

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photoController.photos.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as? PhotosCollectionViewCell else { return UICollectionViewCell() }
    
        let photo = photoController.photos[indexPath.item]
        cell.photoImageView.image = UIImage(data: photo.imageData)
        cell.photoLabel.text = photo.title
    
        return cell
    }
    
    // MARK: - ThemeHelper Methods
    
    func setTheme() {
        guard let themePreference = themeHelper.themePreference else { return }
        
        if themePreference == "Purple" {
            collectionView.backgroundColor = .purple
        } else {
            collectionView.backgroundColor = .darkGray
        }
    }
    
    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if let detailVC = segue.destination as? PhotoDetailViewController {
            detailVC.photoController = photoController
            detailVC.themeHelper = themeHelper
            
            if segue.identifier == "UpdateImage" {
                guard let index = collectionView?.indexPathsForSelectedItems?.first?.item else { return }
                let photo = photoController.photos[index]
                detailVC.photo = photo
            }
        }
        
        if let themeVC = segue.destination as? ThemeSelectionViewController {
            themeVC.themeHelper = themeHelper
        }
    }

}
