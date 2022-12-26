//
//  SearchBarItem.swift
//  STEntities
//
//  Created by SEMİHT on 23.12.2022.
//

import Foundation
import STCore

public struct SearchBarItem {
    let isBorder: Bool?
    let isShadow: Bool?
    let isHiddenButton: Bool?
    let textStyle: Typography.StyleDescriptor?
    
    public init(isBorder: Bool? = false,
                isShadow: Bool? = false,
                isHiddenButton: Bool? = false,
                textStyle: Typography.StyleDescriptor? = Theme.typography.style(.normalText)) {
        self.isBorder = isBorder
        self.isShadow = isShadow
        self.isHiddenButton = isHiddenButton
        self.textStyle = textStyle
    }
}
