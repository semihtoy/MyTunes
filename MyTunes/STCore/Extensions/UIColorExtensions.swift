//
//  UIColorExtensions.swift
//  STCore
//
//  Created by SEMİHT on 21.12.2022.
//

import UIKit

public extension UIColor {
    convenience init(red: Int, green: Int, blue: Int, colorAlpha: CGFloat = 1.0) {
        self.init(red: CGFloat(red) / 255.0,
                  green: CGFloat(green) / 255.0,
                  blue: CGFloat(blue) / 255.0,
                  alpha: colorAlpha)
    }

    convenience init(netHex: Int, colorAlpha: CGFloat = 1.0) {
        self.init(red: (netHex >> 16) & 0xff,
                  green: (netHex >> 8) & 0xff,
                  blue: netHex & 0xff,
                  colorAlpha: colorAlpha)
    }

    convenience init(hex: String, colorAlpha: CGFloat = 1.0) {
        var rgbHexInt: UInt64 = 0

        let scanner = Scanner(string: hex)
        scanner.scanLocation = 0
        scanner.scanHexInt64(&rgbHexInt)

        self.init(red: CGFloat((rgbHexInt & 0xff0000) >> 16) / 0xff,
                  green: CGFloat((rgbHexInt & 0xff00) >> 8) / 0xff,
                  blue: CGFloat(rgbHexInt & 0xff) / 0xff,
                  alpha: colorAlpha)
    }
}
