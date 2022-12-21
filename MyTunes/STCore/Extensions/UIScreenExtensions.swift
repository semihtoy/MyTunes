//
//  UIScreenExtensions.swift
//  STCore
//
//  Created by SEMİHT on 21.12.2022.
//

import UIKit

public extension UIScreen {
    static var isDarkMode: Bool {
        if #available(iOS 12.0, *) {
            switch UIScreen.main.traitCollection.userInterfaceStyle {
            case .dark: return true
            default: return false
            }
        }
        
        return false

    }
}
