//
//  Typography.swift
//  STCore
//
//  Created by SEMİHT on 21.12.2022.
//

import UIKit

public struct Typography {
    /// Represents the desired font weight.
    public enum FontWeight: String {
        case regular = "Regular"
        case medium = "Medium"
        case semiBold = "SemiBold"
        case bold = "Bold"
        
        /// Returns the associated *UIFontWeight* value.
        var systemFontWeight: UIFont.Weight {
            switch self {
            case .regular:
                return UIFont.Weight.regular
            case .medium:
                return UIFont.Weight.medium
            case .semiBold:
                return UIFont.Weight.semibold
            case .bold:
                return UIFont.Weight.bold
            }
        }
    }
    
    /// Target the desired font family.
    public enum Family {
        case primary(familyName: String, weight: FontWeight, size: CGFloat)
        case system(weight: UIFont.Weight, size: CGFloat)
        
        public var font: UIFont {
            switch self {
            case .primary(_, let weight, let size):
                return UIFont(name: fontName, size: size) ?? UIFont.systemFont(ofSize: size,
                                                                               weight: weight.systemFontWeight)
            case .system(let weight, let size):
                return UIFont.systemFont(ofSize: size, weight: weight)
            }
        }
        
        private var fontName: String {
            switch self {
            case .primary(let familyName, let weight, _):
                return familyName + "-" + weight.rawValue
            default: return ""
            }
        }
        
        public static var defaultName: String { "SourceSansPro" }
        public static var `default`: Self {
            .primary(familyName: defaultName, weight: .regular, size: 16.0)
        }
    }
    
    public static func font(for family: Family) -> UIFont { family.font }
    
    /// Typographic scale.
    public enum Scale: String {
        /// **Headline**: Weight: Bold, Size: 22, Line: 32
        case headline
        /// **Title1**: Weight: Semibold, Size: 18, Line: 26
        case title1
        /// **Title2**: Weight: Bold, Size: 18, Line: 26
        case title2
        /// **Subheading**: Weight: Bold, Size: 16, Line: 24
        case subheading
        /// **Subheading1**: Weight: Semibold, Size: 16, Line: 22
        case subheading1
        /// **Subheading2**: Weight: Regular, Size: 16, Line: 16
        case subheading2
        /// **Subheading3**: Weight: Regular, Size: 16, Line: 22
        case subheading3
        /// **NormalText**: Weight: Semibold, Size: 14, Line: 22
        case normalText
        /// **NormalText1**: Weight: Semibold, Size: 14, Line: 16
        case normalText1
        /// **NormalText2**: Weight: Regular, Size: 14, Line: 22
        case normalText2
        /// **NormalText3**: Weight: Regular, Size: 14, Line: 16
        case normalText3
        /// **SmallText**: Weight: Regular, Size: 12, Line: 22
        case smallText
        /// **SmallText1**: Weight: Semibold, Size: 12, Line: 22
        case smallText1
        /// **SmallText2**: Weight: Regular, Size: 12, Line: 16
        case smallText2
        /// **SmallText3**: Weight: Semibold, Size: 12, Line: 16
        case smallText3
        /// **ExtraSmallText**: Weight: Regular, Size: 11
        case extraSmallText
        /// **AllCaps**: Weight: SemiBold, Size: 12, Line: 16
        case allCaps
    }
    
    /// Fonts and its attributes.
    public struct StyleDescriptor: Equatable {
        /// The typeface.
        private let internalFont: UIFont
        /// The font letter spacing.
        private let kern: CGFloat
        /// The height, in points, of text lines
        private let lineHeight: CGFloat?
        /// The natural line height of the receiver is multiplied by this factor (if positive) before being constrained by minimum and maximum line height. The default value of this property is 0.0.
        private let lineHeightMultiple: CGFloat
        /// The mode for breaking lines in the paragraph.
        private let lineBreakMode: NSLineBreakMode
        /// Whether this typeface is meant to be used with uppercased text.
        private var uppercase: Bool
        /// Whether this font support dynamic font size.
        private var supportDynamicType: Bool
        /// The font color.
        public var color: UIColor
        /// The text alignment.
        public var alignment: NSTextAlignment
        /// The spacing between lines.
        public var lineSpacing: CGFloat
        /// Publicly exposed font (subject to font scaling if appliocable).
        public var font: UIFont {
            guard supportDynamicType else {
                return internalFont
            }
            if #available(iOS 11.0, *) {
                return UIFontMetrics.default.scaledFont(for: internalFont)
            } else {
                return internalFont
            }
        }
        
        public init(
            font: UIFont! = nil,
            kern: CGFloat = 0.0,
            lineHeight: CGFloat? = nil,
            lineHeightMultiple: CGFloat = 0.0,
            lineBreakMode: NSLineBreakMode = .byTruncatingTail,
            uppercase: Bool = false,
            supportDynamicType: Bool = true,
            color: UIColor = Theme.palette.other(.highWhite),
            alignment: NSTextAlignment = .left,
            lineSpacing: CGFloat = 0.0) {
                self.internalFont = font ?? Typography.font(for: .default)
                self.kern = kern
                self.lineHeight = lineHeight
                self.lineHeightMultiple = lineHeightMultiple
                self.lineBreakMode = lineBreakMode
                self.uppercase = uppercase
                self.supportDynamicType = supportDynamicType
                self.color = color
                self.alignment = alignment
                self.lineSpacing = lineSpacing
            }
        
        public var paragraphStyle: NSParagraphStyle {
            let ps = NSMutableParagraphStyle()
            ps.lineSpacing = lineSpacing
            ps.lineHeightMultiple = lineHeightMultiple
            ps.alignment = alignment
            ps.lineBreakMode = .byTruncatingTail
            
            if let lineHeight = lineHeight {
                ps.minimumLineHeight = lineHeight
                ps.maximumLineHeight = lineHeight
            }
            
            return ps
        }
        
        /// Returns a dictionary of attributes for `NSAttributedString`.
        public var attributes: [NSAttributedString.Key: Any] {
            [
                NSAttributedString.Key.font: font,
                NSAttributedString.Key.foregroundColor: color,
                NSAttributedString.Key.kern: kern,
                NSAttributedString.Key.baselineOffset: baselineOffset,
                NSAttributedString.Key.paragraphStyle: paragraphStyle
            ]
        }
        
        /// Override the `NSForegroundColorAttributeName` attribute.
        public func withColor(_ override: UIColor) -> StyleDescriptor {
            StyleDescriptor(
                font: internalFont,
                kern: kern,
                lineBreakMode: lineBreakMode,
                uppercase: uppercase,
                supportDynamicType: supportDynamicType,
                color: override
            )
        }
        
        /// Override the `` attribute.
        public func withLineBreakMode(_ override: NSLineBreakMode) -> StyleDescriptor {
            StyleDescriptor(
                font: internalFont,
                kern: kern,
                lineBreakMode: override,
                uppercase: uppercase,
                supportDynamicType: supportDynamicType,
                color: color
            )
        }
        
        /// Returns an attributed string with the current font descriptor attributes.
        public func asAttributedString(_ string: String) -> NSAttributedString {
            let displayString = uppercase ? string.uppercased() : string
            return NSAttributedString(string: displayString, attributes: attributes)
        }
        
        /// Returns a mutable attributed string with the current font descriptor attributes.
        public func asMutableAttributedString(_ string: String) -> NSMutableAttributedString {
            let displayString = uppercase ? string.uppercased() : string
            return NSMutableAttributedString(string: displayString, attributes: attributes)
        }
        
        public static func == (lhs: Self, rhs: Self) -> Bool {
            lhs.internalFont == rhs.internalFont &&
            lhs.kern == rhs.kern &&
            lhs.lineHeightMultiple == rhs.lineHeightMultiple &&
            lhs.uppercase == rhs.uppercase &&
            lhs.supportDynamicType == rhs.supportDynamicType &&
            lhs.color == rhs.color
        }
    }
}

extension Typography.StyleDescriptor {
    /// https://gist.github.com/linjiansi/d3fac2cf89946e4232922c25bb439cf3
    var baselineOffset: CGFloat {
        guard let lineHeight = lineHeight else { return 0.0 }
        return (lineHeight - font.lineHeight) * (abs(font.descender) / font.pointSize)
    }
}
