//
//  Appearance.swift
//  TestDemo
//
//  Created by Fahad Attique on 11/08/2019.
//  Copyright © 2019 Fahid. All rights reserved.
//

import UIKit

class Appearance {
    
    static func configure() -> Void {
        
        UIButton.appearance().isExclusiveTouch = true
        UINavigationBar.appearance().tintColor = UIColor.orangish
        UINavigationBar.appearance().barTintColor = .white
    }
}
