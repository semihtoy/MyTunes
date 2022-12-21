//
//  Colorable.swift
//  STCore
//
//  Created by SEMİHT on 21.12.2022.
//

import UIKit

public protocol Colorable {
    var color: UIColor { get }
    
    /// Variable to support prior iOS 11
    var hexColor: (lightMode: String, darkMode: String) { get }
}

public extension Colorable {
    var currentHexColor: String {
        guard UIScreen.isDarkMode else {return hexColor.lightMode}
        return hexColor.darkMode
    }
}

public extension Colorable where Self: RawRepresentable, Self.RawValue == String {
    var color: UIColor {
        if #available(iOS 11.0, *) {
            return UIColor(named: self.rawValue, in: STCoreBundle.bundle, compatibleWith: nil)!
        } else {
            return UIColor(hex: currentHexColor)
        }
    }
}
