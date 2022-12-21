//
//  ImageConvertible.swift
//  STComponents
//
//  Created by SEMİHT on 21.12.2022.
//

import UIKit

public protocol ImageConvertible {
    var bundle: Bundle { get }
    var imageName: String { get }
    var image: UIImage { get }
    var accessibilityLabel: String? { get }
}

public extension ImageConvertible {
    var bundle: Bundle { UIComponentBundle.bundle }
    var imageName: String { "" }
    var image: UIImage { UIImage(image: self) ?? UIImage() }
    var accessibilityLabel: String? { nil }
}

extension UIImage {
    convenience init?(image: ImageConvertible) {
        self.init(named: image.imageName,
                  in: image.bundle,
                  compatibleWith: nil)
    }
}

public extension RawRepresentable where Self: ImageConvertible, RawValue == String {
    var imageName: String { rawValue }
}

extension String: ImageConvertible {
    public var imageName: String { self }
}

extension UIImage: ImageConvertible {
    public var image: UIImage { self }
}
