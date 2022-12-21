//
//  ColorPalette.swift
//  STCore
//
//  Created by SEMİHT on 21.12.2022.
//

import Foundation

public enum ColorPalette {
    public enum Primary: String, Colorable {
        case darkGray = "PrimaryDarkGray"
        case blue = "PrimaryBlue"
        case skyBlue = "PrimarySkyBlue"
        
        public var hexColor: (lightMode: String, darkMode: String) {
            switch self {
            case .darkGray:
                return (lightMode: "353f4A", darkMode: "353f4A")
            case .blue:
                return (lightMode: "0A79B8", darkMode: "0A79B8")
            case .skyBlue:
                return (lightMode: "0FAAEA", darkMode: "0FAAEA")
            }
        }
    }
    
    public enum Other: String, Colorable {
        case bg = "OtherBg"
        case bgLight = "OtherBgLight"
        case grayLight = "OtherGrayLight"
        case spaceGray = "OtherSpaceGray"
        case highWhite = "TabHighWhite"

        public var hexColor: (lightMode: String, darkMode: String) {
            switch self {
            case .bg:
                return (lightMode: "EBECF2", darkMode: "EBECF2")
            case .bgLight:
                return (lightMode: "F8F9FB", darkMode: "F8F9FB")
            case .grayLight:
                return (lightMode: "B4BFCB", darkMode: "B4BFCB")
            case .spaceGray:
                return (lightMode: "ECEEF1", darkMode: "ECEEF1")
            case .highWhite:
                return (lightMode: "FFFFFF", darkMode: "FFFFFF")
            }
        }
    }
}
