//
//  TypographyProtocol.swift
//  STCore
//
//  Created by SEMİHT on 21.12.2022.
//

import Foundation

public protocol TypographyProtocol {
    /// Return the font style for the given typographic scale argument.
    var fontFamily: String { get }
    /// Return the font style for the given typographic scale argument.
    func style(_ scale: Typography.Scale) -> Typography.StyleDescriptor
}

public extension TypographyProtocol {
    var fontFamily: String { Typography.Family.defaultName }
    
    func style(_ scale: Typography.Scale) -> Typography.StyleDescriptor {
        switch scale {
        case .headline:
            return Typography.StyleDescriptor(font: Typography.font(for: .primary(familyName: fontFamily,
                                                                                  weight: .bold,
                                                                                  size: 22.0)),
                                              lineHeight: 32.0)
        case .title1:
            return Typography.StyleDescriptor(font: Typography.font(for: .primary(familyName: fontFamily,
                                                                                  weight: .semiBold,
                                                                                  size: 18.0)),
                                              lineHeight: 26.0)
        case .title2:
            return Typography.StyleDescriptor(font: Typography.font(for: .primary(familyName: fontFamily,
                                                                                  weight: .bold,
                                                                                  size: 18.0)),
                                              lineHeight: 26.0)
        case .subheading:
            return Typography.StyleDescriptor(font: Typography.font(for: .primary(familyName: fontFamily,
                                                                                  weight: .bold,
                                                                                  size: 16.0)),
                                              lineHeight: 24.0)
        case .subheading1:
            return Typography.StyleDescriptor(font: Typography.font(for: .primary(familyName: fontFamily,
                                                                                  weight: .semiBold,
                                                                                  size: 16.0)),
                                              lineHeight: 22.0)
        case .subheading2:
            return Typography.StyleDescriptor(font: Typography.font(for: .primary(familyName: fontFamily,
                                                                                  weight: .regular,
                                                                                  size: 16.0)),
                                              lineHeight: 16.0)
        case .subheading3:
            return Typography.StyleDescriptor(font: Typography.font(for: .primary(familyName: fontFamily,
                                                                                  weight: .regular,
                                                                                  size: 16.0)),
                                              lineHeight: 22.0)
        case .normalText:
            return Typography.StyleDescriptor(font: Typography.font(for: .primary(familyName: fontFamily,
                                                                                  weight: .semiBold,
                                                                                  size: 14.0)),
                                              lineHeight: 22.0)
        case .normalText1:
            return Typography.StyleDescriptor(font: Typography.font(for: .primary(familyName: fontFamily,
                                                                                  weight: .semiBold,
                                                                                  size: 14.0)),
                                              lineHeight: 16.0)
        case .normalText2:
            return Typography.StyleDescriptor(font: Typography.font(for: .primary(familyName: fontFamily,
                                                                                  weight: .regular,
                                                                                  size: 14.0)),
                                              lineHeight: 22.0)
        case .normalText3:
            return Typography.StyleDescriptor(font: Typography.font(for: .primary(familyName: fontFamily,
                                                                                  weight: .regular,
                                                                                  size: 14.0)),
                                              lineHeight: 16.0)
        case .smallText:
            return Typography.StyleDescriptor(font: Typography.font(for: .primary(familyName: fontFamily,
                                                                                  weight: .regular,
                                                                                  size: 12.0)),
                                              lineHeight: 22.0)
        case .smallText1:
            return Typography.StyleDescriptor(font: Typography.font(for: .primary(familyName: fontFamily,
                                                                                  weight: .semiBold,
                                                                                  size: 12.0)),
                                              lineHeight: 22.0)
        case .smallText2:
            return Typography.StyleDescriptor(font: Typography.font(for: .primary(familyName: fontFamily,
                                                                                  weight: .regular,
                                                                                  size: 12.0)),
                                              lineHeight: 16.0)
        case .smallText3:
            return Typography.StyleDescriptor(font: Typography.font(for: .primary(familyName: fontFamily,
                                                                                  weight: .semiBold,
                                                                                  size: 12.0)),
                                              lineHeight: 16.0)

        case .extraSmallText:
            return Typography.StyleDescriptor(font: Typography.font(for: .primary(familyName: fontFamily,
                                                                                  weight: .semiBold,
                                                                                  size: 11.0)),
                                              lineHeight: 22.0)
        case .allCaps:
            return Typography.StyleDescriptor(font: Typography.font(for: .primary(familyName: fontFamily,
                                                                                  weight: .semiBold,
                                                                                  size: 12.0)),
                                              lineHeight: 22.0)
        }
    }
}
