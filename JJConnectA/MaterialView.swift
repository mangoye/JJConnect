//
//  MaterialView.swift
//  JJConnectA
//
//  Created by MangoyeSidney on 11/26/15.
//  Copyright © 2015 Sidney Mangoye. All rights reserved.
//

import UIKit

class MaterialView: UIView {

    override func awakeFromNib() {
        layer.cornerRadius = 2.0
        layer.shadowColor = UIColor(red:SHADOW_COLOR, green: SHADOW_COLOR, blue: SHADOW_COLOR, alpha: 0.3).CGColor
        layer.shadowOpacity = 0.5
        layer.shadowRadius = 4.0
        layer.shadowOffset = CGSizeMake (0.0, 0.0)
    }

}