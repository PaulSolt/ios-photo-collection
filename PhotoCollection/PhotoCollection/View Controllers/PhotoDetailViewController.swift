//
//  PhotoDetailViewController.swift
//  PhotoCollection
//
//  Created by Sameera Roussi on 5/2/19.
//  Copyright © 2019 Sameera Roussi. All rights reserved.
//

import UIKit

class PhotoDetailViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    // MARK: - Properties and Outlets
    
    var photoController: PhotoController?
    var photo: Photo?
    var themeHelper: ThemeHelper?
    
    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var titleTextField: UITextField!
    
    // MARK: - View Loading Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateViews()
    }
    
    func updateViews() {
        setTheme()
        
        if let photo = photo {
            navigationItem.title = "Edit Photo"
            photoImageView.image = UIImage(data: photo.imageData)
            titleTextField.text = photo.title
        } else {
            navigationItem.title = "Save Photo"
        }
    }
    
    // MARK: - Action and Theme Methods
    
    @IBAction func addPhotoButtonTapped(_ sender: Any) {
        presentImagePickerController()
    }
    
    @IBAction func saveButtonTapped(_ sender: Any) {
        
        guard let title = titleTextField.text,
            let image = photoImageView.image,
            let imageData = image.pngData() else { return }
        
        if let photo = photo {
            photoController?.update(photo: photo, imageData: imageData, title: title)
        } else {
            photoController?.create(imageData: imageData, title: title)
        }
        navigationController?.popViewController(animated: true)
    }
    
    func setTheme() {
        guard let themePreference = themeHelper?.themePreference else { return }
        
        if themePreference == "Purple" {
            view.backgroundColor = .purple
        } else {
            view.backgroundColor = .darkGray
        }
    }
    
    // MARK: - UIImagePickerController Delegate Methods
    
    func presentImagePickerController() {
        
        let imagePickerController = UIImagePickerController()
        imagePickerController.sourceType = .photoLibrary
        imagePickerController.delegate = self
        
        present(imagePickerController, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        picker.dismiss(animated: true, completion: nil)
        
        guard let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage else { return }
        photoImageView.image = image
    }
}
