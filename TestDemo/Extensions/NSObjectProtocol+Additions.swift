//
//  NSObjectProtocol+Additions.swift
//  TestDemo
//
//  Created by Fahad Attique on 11/08/2019.
//  Copyright © 2019 Fahid. All rights reserved.
//

import Foundation

extension NSObjectProtocol {
    
    static var identifier: String { return String(describing: self) }
}
