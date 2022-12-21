//
//  ColorPaletteProtocol.swift
//  STCore
//
//  Created by SEMİHT on 21.12.2022.
//

import UIKit

public protocol ColorPaletteProtocol {
    func primary(_ style: ColorPalette.Primary) -> UIColor
    func other(_ style: ColorPalette.Other) -> UIColor
}

public extension ColorPaletteProtocol {
    func primary(_ style: ColorPalette.Primary) -> UIColor {
        return style.color
    }
    
    func other(_ style: ColorPalette.Other) -> UIColor {
        return style.color
    }
}

