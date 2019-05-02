//
//  ThemeHelper.swift
//  PhotoCollection
//
//  Created by Lisa Sampson on 5/2/19.
//  Copyright © 2019 Sameera Roussi. All rights reserved.
//

import Foundation

class ThemeHelper {
    
    // MARK: - Init Method
    
    init() {
        if themePreference == nil {
            setThemePreferenceToPurple()
        }
    }
    
    // MARK: - Properties
    
    let themePreferenceKey: String = "ThemePreferenceKey"
    var themePreference: String? {
        if let themePreference = UserDefaults.standard.string(forKey: themePreferenceKey) {
            return themePreference
        } else {
            return nil
        }
    }
    
    // MARK: - Theme Methods
    
    func setThemePreferenceToDark() {
        UserDefaults.standard.set("Dark", forKey: themePreferenceKey)
    }
    
    func setThemePreferenceToPurple() {
        UserDefaults.standard.set("Purple", forKey: themePreferenceKey)
    }
}
