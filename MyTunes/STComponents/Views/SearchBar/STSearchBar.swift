//
//  STSearchBar.swift
//  STComponents
//
//  Created by SEMİHT on 23.12.2022.
//

import Foundation
import UIKit
import STEntities

public final class STSearchBar: UIView {
    
    @IBOutlet weak var searchTextField: UITextField!
    @IBOutlet weak var searchButton: UIButton!
    override public init(frame: CGRect) {
        super.init(frame: frame)
    }

    public required init?(coder: NSCoder) {
        super.init(coder: coder)
  
    }
    
    public func configureSearchBar(_ item: SearchBarItem) {
        
    }
}
