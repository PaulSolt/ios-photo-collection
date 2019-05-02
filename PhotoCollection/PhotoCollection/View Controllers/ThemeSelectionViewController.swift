//
//  ThemeSelectionViewController.swift
//  PhotoCollection
//
//  Created by Sameera Roussi on 5/2/19.
//  Copyright © 2019 Sameera Roussi. All rights reserved.
//

import UIKit

class ThemeSelectionViewController: UIViewController {
    
    // MARK: - Properties
    
    var themeHelper: ThemeHelper?
    
    // MARK: - Theme Action Methods
    
    @IBAction func selectDarkThemeButtonTapped(_ sender: Any) {
        themeHelper?.setThemePreferenceToDark()
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func selectPurpleThemeButtonTapped(_ sender: Any) {
        themeHelper?.setThemePreferenceToPurple()
        dismiss(animated: true, completion: nil)
    }
}
