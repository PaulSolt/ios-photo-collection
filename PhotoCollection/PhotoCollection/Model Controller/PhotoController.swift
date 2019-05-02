//
//  PhotoController.swift
//  PhotoCollection
//
//  Created by Sameera Roussi on 5/2/19.
//  Copyright © 2019 Sameera Roussi. All rights reserved.
//

import Foundation

class PhotoController {
    
    // MARK: - Properties
    
    var photos: [Photo] = []
    
    // MARK: - CRUD Methods
    
    func create(imageData: Data, title: String) {
        let photo = Photo(imageData: imageData, title: title)
        
        photos.append(photo)
    }
    
    func update(photo: Photo, imageData: Data, title: String) {
        guard let index = photos.firstIndex(of: photo) else { return }
        
        var scratch = photo
        scratch.imageData = imageData
        scratch.title = title
        
        photos.remove(at: index)
        photos.insert(scratch, at: index)
    }
    
}
